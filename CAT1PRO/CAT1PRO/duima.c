#include "duima.h"

// 全局变量
SYS_MODE current_mode = MODE_NORMAL;
unsigned int local_paired_id = 0;  // 当前生效的ID（2字节）

//==============================================================================
// 定时器初始化：配置 TIM4 为 1ms 中断
// 移植自 FT61FC4X_TIM4.prj 例程（CLAUDE.md 第6部分）
//==============================================================================
void Duima_Timer_Init(void)
{
    g_timer_ms = 0;

    // 1. 使能 TIM4 模块时钟
    PCKEN |= 0B00001000;        // Enable TIM4 module clock (bit3)

    // 2. 配置控制寄存器 CR1
    // Bit[5:4]=00 (系统时钟), Bit3=0 (连续模式), Bit0=1 (计数器使能)
    TIM4CR1 = 0B00000101;

    // 3. 开启更新中断
    TIM4IER = 0B00000001;       // Enable update interrupt

    // 4. 清除状态和事件
    TIM4SR  = 0;
    TIM4EGR = 0;

    // 5. 配置计数器
    TIM4CNTR = 0;

    // 6. 配置预分频和自动重装载
    // 目标: 1ms 中断 (1kHz)
    // Fsys = 16MHz
    // 设定预分频 = 2^6 = 64
    // 计数频率 = 16MHz / 64 = 250kHz (每4us跳一次)
    // ARR = 250 - 1 = 249
    // 结果: 250kHz / 250 = 1000Hz = 1ms ✓
    TIM4PSCR = 6;              // Prescaler = 2^6 = 64
    TIM4ARR = 249;             // Auto-reload = 250 (8-bit only)

    // 注意：不在这里开GIE，应该在 main 函数最后统一开启
}


//==============================================================================
// 初始化：上电恢复之前的配置
//==============================================================================
void Duima_Init(void)
{
    Duima_Timer_Init();

    // 1. 读取 EEPROM 中保存的 ID
    local_paired_id = Duima_EEPROM_ReadID(EEPROM_PAIRED_ID_ADDR);

    // 如果是新芯片(全FF)或者错误的ID，默认设为广播或者一个初始值
    if(local_paired_id == 0xFFFFFFFF) {
        local_paired_id = DUIMA_BROADCAST_ID; // 默认设为广播，方便测试
    }

    // 2. 唤醒模块并配置
    DUIMA_WAKEUP_433;
    DelayMs(100); // 等待模块启动

    // 3. 写入地址 (这是正常工作模式，只接收这个ID的数据)
    Duima_Configure433Address(local_paired_id);
}

//==============================================================================
// 启动对码：改为广播模式 (AT+ADR=65535)
//==============================================================================
void Duima_StartPairing(void)
{
    // 防止重复进入
    if(current_mode == MODE_PAIRING) return;

    current_mode = MODE_PAIRING;
    LED_ON; // 亮灯提示

    // 1. 必须先唤醒 433 才能发 AT 指令
    DUIMA_WAKEUP_433;
    DelayMs(20);

    // 2. 发送 AT+ADR=65535
    // 关键点：此时我们变成了"顺风耳"，谁发数据(目标地址是65535)我们都能收到
    Duima_Configure433Address(DUIMA_BROADCAST_ID);

    // 3. 清空串口接收计数，准备接数据
    mmm = 0;

    // 4. 重置对码超时计时器
    g_timer_ms = 0;
}

//==============================================================================
// 处理接收数据：提取ID并锁定（2字节大端模式，无帧头）
//==============================================================================
void Duima_ProcessReceivedData(unsigned char *data, unsigned char len)
{
    // ============================================================
    // 场景 A: 正常工作模式 (Normal)
    // ============================================================
    if(current_mode == MODE_NORMAL)
    {
        // 因为硬件 AT+ADR 已经过滤了，能唤醒MCU并进来的数据，
        // 肯定是对面配对好的设备发来的。
        // 直接处理控制指令即可
        if(len > 0)
        {
            // 处理完可以闪一下灯表示收到
            LED_TOGGLE; DelayMs(50); LED_TOGGLE;
        }
        return;
    }

    // ============================================================
    // 场景 B: 对码模式 (Pairing) - 解析对方发来的ID
    // 格式：2字节大端模式 data[0]=高位, data[1]=低位
    // ============================================================
    if(current_mode == MODE_PAIRING)
    {
        // 只要收到的数据大于等于2个字节，我们就认为它是ID
        if(len >= 2)
        {
            unsigned int new_id = 0;

            // 大端模式：data[0] 是高位，data[1] 是低位
            // 例如接收 0x12, 0x34，ID就是 0x1234
            new_id = data[0] * 256 + data[1];

            // 过滤掉广播地址本身（防止把自己设成65535）
            if(new_id == 65535) return;

            // 1. 保存到 EEPROM
            Duima_EEPROM_WriteID(new_id, EEPROM_PAIRED_ID_ADDR);
            local_paired_id = new_id;

            // 2. 立即锁定地址
            Duima_Configure433Address(local_paired_id);

            // 3. 恢复正常模式
            current_mode = MODE_NORMAL;

            // 4. 成功提示（快闪3下）
            for(unsigned char k=0; k<6; k++) {
                LED_TOGGLE; DelayMs(10);
            }
            LED_OFF;
        }
    }
}

//==============================================================================
// 配置 433 地址 (AT+ADR=xxxx)
//==============================================================================
void Duima_Configure433Address(unsigned int addr)
{
    unsigned char cmd_buffer[32];
    unsigned char i;
    unsigned char digit_count = 0;
    unsigned long temp = addr;
    unsigned char digits[10];

    // 1. 手动构建字符串 "AT+ADR="
    cmd_buffer[0]='A'; cmd_buffer[1]='T'; cmd_buffer[2]='+';
    cmd_buffer[3]='A'; cmd_buffer[4]='D'; cmd_buffer[5]='R'; cmd_buffer[6]='=';

    // 2. 整数转字符串 (Itoa)
    if(temp == 0) {
        digits[0] = 0; digit_count = 1;
    } else {
        while(temp > 0) {
            digits[digit_count++] = temp % 10;
            temp /= 10;
        }
    }

    // 3. 填充数字
    for(i = 0; i < digit_count; i++) {
        cmd_buffer[7 + i] = '0' + digits[digit_count - 1 - i];
    }

    // 4. 结束符
    cmd_buffer[7 + digit_count] = '\0';

    // 5. 发送并等待模块处理
    SendATCommand((const char*)cmd_buffer);
    DelayMs(100); // 433模块保存参数需要时间
}

//==============================================================================
// 对码模式主循环：处理按键，触发对码
// 改为：非阻塞状态机模式 (Non-blocking State Machine)
//==============================================================================
void Duima_MainLoop(void)
{
    // 静态变量：用于记录按键状态，函数退出后数值会保留
    static unsigned char key_state = 0;      // 0:未按下, 1:按下计时中, 2:已触发(等待释放)
    static unsigned int press_start_time = 0;// 按下时的时刻

    // 只在正常模式下检测按键
    if(current_mode == MODE_NORMAL)
    {
        // ---------------------------------------------------------
        // 检测按键按下 (假设 PB7 低电平有效)
        // ---------------------------------------------------------
        if(DUIMA_KEY_PIN == 0) 
        {
            // 状态0：刚检测到按下
            if(key_state == 0)
            {
                key_state = 1;              // 进入计时状态
                press_start_time = g_timer_ms; // 记下当前时间(比如 1000ms)
            }
            // 状态1：持续按下中，检查时间差
            else if(key_state == 1)
            {
                // 计算按下的时长 (当前时间 - 开始时间)
                // 利用 unsigned int 溢出特性，即使时间翻转也能正确计算
                if((g_timer_ms - press_start_time) >= 2000) // 2000ms = 2秒
                {
                    // === 时间到！触发对码 ===
                    Duima_StartPairing();
                    
                    // 状态变成2，表示"这次长按已经处理过了"，
                    // 防止手没松开就一直重复触发
                    key_state = 2; 
                }
            }
            // 状态2：按键还按着，但已经触发过了，啥也不做，等松手
        }
        // ---------------------------------------------------------
        // 检测按键松开
        // ---------------------------------------------------------
        else 
        {
            // 只要松手，状态立刻复位，准备下一次检测
            key_state = 0;
        }
    }
}


//==============================================================================
// EEPROM 读写函数
//==============================================================================

//==============================================================================
// EEPROM 读取单字节
// 根据FT61FC4X官方例程（CLAUDE.md EEPROMread）
//==============================================================================
unsigned char Duima_EEPROM_ReadByte(unsigned char addr)
{
    unsigned char data;

    while(GIE) {                // 等待GIE为0
        GIE = 0;                // 读数据必须关闭中断
        NOP();
        NOP();
    }

    EEADRL = addr;              // 设置 EEPROM 地址
    CFGS = 0;                   // 访问 EEPROM 而非 Flash
    EEPGD = 0;                  // 选择 EEPROM
    RD = 1;                     // 开始读取操作
    NOP();
    NOP();
    NOP();
    NOP();
    data = EEDATL;              // 读取数据

    return data;
}
void Unlock_Flash()
{
#asm
    MOVLW	0x03
    MOVWF	_BSREG
    MOVLW	0x55
    MOVWF	_EECON2 & 0x7F
    MOVLW	0xAA
    MOVWF	_EECON2 & 0x7F
    BSF		_EECON1& 0x7F,1  		//WR=1;
    NOP
    NOP
#endasm
}

//==============================================================================
// EEPROM 写入单字节
// 根据FT61FC4X官方例程（CLAUDE.md EEPROMwrite）
//==============================================================================
void Duima_EEPROM_WriteByte(unsigned char data, unsigned char addr)
{
    unsigned char PEIE_1=PEIE;
    while(GIE|PEIE) {                // 等待GIE为0
        GIE = 0;PEIE=0;                // 写数据必须关闭中断
        NOP();
        NOP();
    }

    EEADRL = addr;              // EEPROM 地址
    EEDATL = data;              // 要写入的数据
    CFGS = 0;                   // 访问 EEPROM
    EEPGD = 0;                  // 选择 EEPROM
    EEIF = 0;                   // 清除中断标志
    WREN = 1;                   // 启用写入

    // 执行解锁序列并启动写入
    Unlock_Flash();
    NOP();
    NOP();
    NOP();
    NOP();

    // 等待写入完成
    while(WR) ;

    WREN = 0;                   // 禁用写入
    GIE = 1;PEIE=PEIE_1;                    // 恢复中断
}

//==============================================================================
// 读取设备ID (2字节，从指定EEPROM地址)
//==============================================================================
unsigned int Duima_EEPROM_ReadID(unsigned char addr)
{
    unsigned long id = 0;

    // 读取2字节ID（大端模式）
    id = Duima_EEPROM_ReadByte(addr);      // 高位
    id = (id << 8) | Duima_EEPROM_ReadByte(addr+1);  // 低位

    return id;
}

//==============================================================================
// 写入设备ID (2字节，到指定EEPROM地址)
//==============================================================================
void Duima_EEPROM_WriteID(unsigned int id, unsigned char addr)
{
    // 写入2字节ID（大端模式）
    
    Duima_EEPROM_WriteByte((unsigned char)(id >> 8), addr);      // 高位
    Duima_EEPROM_WriteByte((unsigned char)(id), addr+1);         // 低位
}