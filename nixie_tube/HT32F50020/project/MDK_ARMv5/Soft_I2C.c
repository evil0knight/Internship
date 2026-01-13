/************************************************************************************************************
 * @file    Soft_I2C.c
 * @brief   Software I2C implementation using GPIO
 ************************************************************************************************************/
#include "Soft_I2C.h"

//-----------------------------------------------------------------------------
// ??????(????)
//-----------------------------------------------------------------------------
static void I2C_Delay_us(u32 us)
{
    u32 i;
    // ??????20MHz,????
    // ????????????
    for(i = 0; i < us * 2; i++)
    {
        __NOP();
    }
}

//-----------------------------------------------------------------------------
// SDA ?????(????)
//-----------------------------------------------------------------------------
static void SDA_Input(void)
{
    GPIO_DirectionConfig(SOFT_SDA_GPIO_PORT, SOFT_SDA_GPIO_PIN, GPIO_DIR_IN);
}

//-----------------------------------------------------------------------------
// SDA ?????(????)
//-----------------------------------------------------------------------------
static void SDA_Output(void)
{
    GPIO_DirectionConfig(SOFT_SDA_GPIO_PORT, SOFT_SDA_GPIO_PIN, GPIO_DIR_OUT);
}

//-----------------------------------------------------------------------------
// ?? SDA ??
//-----------------------------------------------------------------------------
static u8 SDA_Read(void)
{
    return (SOFT_SDA_STATE != 0) ? 1 : 0;
}

//-----------------------------------------------------------------------------
// I2C ???
//-----------------------------------------------------------------------------
void Soft_I2C_Init(void)
{
    // GPIO ?? GPIO_Configuration() ???
    // ??????????
    SOFT_SCL_HIGH;
    SOFT_SDA_HIGH;
    I2C_Delay_us(10);
}

//-----------------------------------------------------------------------------
// I2C ????
// SCL ???,SDA ????
//-----------------------------------------------------------------------------
void Soft_I2C_Start(void)
{
    SDA_Output();
    SOFT_SDA_HIGH;
    SOFT_SCL_HIGH;
    I2C_Delay_us(I2C_DELAY_US);
    
    SOFT_SDA_LOW;
    I2C_Delay_us(I2C_DELAY_US);
    
    SOFT_SCL_LOW;
    I2C_Delay_us(I2C_DELAY_US);
}

//-----------------------------------------------------------------------------
// I2C ????
// SCL ???,SDA ????
//-----------------------------------------------------------------------------
void Soft_I2C_Stop(void)
{
    SDA_Output();
    SOFT_SCL_LOW;
    SOFT_SDA_LOW;
    I2C_Delay_us(I2C_DELAY_US);
    
    SOFT_SCL_HIGH;
    I2C_Delay_us(I2C_DELAY_US);
    
    SOFT_SDA_HIGH;
    I2C_Delay_us(I2C_DELAY_US);
}

//-----------------------------------------------------------------------------
// ??????
// ??: 0=??ACK, 1=??NACK???
//-----------------------------------------------------------------------------
u8 Soft_I2C_WaitAck(void)
{
    u8 timeout = 0;
    
    SDA_Input();
    SOFT_SCL_LOW;
    I2C_Delay_us(I2C_DELAY_US);
    
    SOFT_SCL_HIGH;
    I2C_Delay_us(I2C_DELAY_US);
    
    while(SDA_Read())
    {
        timeout++;
        if(timeout > 250)
        {
            Soft_I2C_Stop();
            return 1;
        }
    }
    
    SOFT_SCL_LOW;
    I2C_Delay_us(I2C_DELAY_US);
    
    return 0;
}

//-----------------------------------------------------------------------------
// ?? ACK
//-----------------------------------------------------------------------------
void Soft_I2C_Ack(void)
{
    SDA_Output();
    SOFT_SCL_LOW;
    SOFT_SDA_LOW;
    I2C_Delay_us(I2C_DELAY_US);
    
    SOFT_SCL_HIGH;
    I2C_Delay_us(I2C_DELAY_US);
    
    SOFT_SCL_LOW;
    I2C_Delay_us(I2C_DELAY_US);
}

//-----------------------------------------------------------------------------
// ?? NACK
//-----------------------------------------------------------------------------
void Soft_I2C_NAck(void)
{
    SDA_Output();
    SOFT_SCL_LOW;
    SOFT_SDA_HIGH;
    I2C_Delay_us(I2C_DELAY_US);
    
    SOFT_SCL_HIGH;
    I2C_Delay_us(I2C_DELAY_US);
    
    SOFT_SCL_LOW;
    I2C_Delay_us(I2C_DELAY_US);
}

//-----------------------------------------------------------------------------
// ?????
// ??: 0=??, 1=??
//-----------------------------------------------------------------------------
u8 Soft_I2C_WriteByte(u8 data)
{
    u8 i;
    
    SDA_Output();
    SOFT_SCL_LOW;
    
    for(i = 0; i < 8; i++)
    {
        if(data & 0x80)
            SOFT_SDA_HIGH;
        else
            SOFT_SDA_LOW;
        
        data <<= 1;
        I2C_Delay_us(I2C_DELAY_US);
        
        SOFT_SCL_HIGH;
        I2C_Delay_us(I2C_DELAY_US);
        
        SOFT_SCL_LOW;
        I2C_Delay_us(I2C_DELAY_US);
    }
    
    return Soft_I2C_WaitAck();
}

//-----------------------------------------------------------------------------
// ?????
// ack: 1=??ACK, 0=??NACK
//-----------------------------------------------------------------------------
u8 Soft_I2C_ReadByte(u8 ack)
{
    u8 i, data = 0;
    
    SDA_Input();
    
    for(i = 0; i < 8; i++)
    {
        SOFT_SCL_LOW;
        I2C_Delay_us(I2C_DELAY_US);
        
        SOFT_SCL_HIGH;
        I2C_Delay_us(I2C_DELAY_US);
        
        data <<= 1;
        if(SDA_Read())
            data |= 0x01;
    }
    
    if(ack)
        Soft_I2C_Ack();
    else
        Soft_I2C_NAck();
    
    return data;
}

//-----------------------------------------------------------------------------
// ??????
// devAddr: ????(7?,?????)
// regAddr: ?????
// data: ??????
// ??: I2C_OK ? I2C_ERROR
//-----------------------------------------------------------------------------
u8 Soft_I2C_WriteReg(u8 devAddr, u8 regAddr, u8 data)
{
    Soft_I2C_Start();
    
    if(Soft_I2C_WriteByte((devAddr << 1) | 0))  // ???
        return I2C_ERROR;
    
    if(Soft_I2C_WriteByte(regAddr))
        return I2C_ERROR;
    
    if(Soft_I2C_WriteByte(data))
        return I2C_ERROR;
    
    Soft_I2C_Stop();
    
    return I2C_OK;
}

//-----------------------------------------------------------------------------
// ??????
// devAddr: ????(7?,?????)
// regAddr: ?????
// data: ???????
// ??: I2C_OK ? I2C_ERROR
//-----------------------------------------------------------------------------
u8 Soft_I2C_ReadReg(u8 devAddr, u8 regAddr, u8 *data)
{
    Soft_I2C_Start();
    
    if(Soft_I2C_WriteByte((devAddr << 1) | 0))  // ???
        return I2C_ERROR;
    
    if(Soft_I2C_WriteByte(regAddr))
        return I2C_ERROR;
    
    Soft_I2C_Start();  // ????
    
    if(Soft_I2C_WriteByte((devAddr << 1) | 1))  // ???
        return I2C_ERROR;
    
    *data = Soft_I2C_ReadByte(0);  // ????,??NACK
    
    Soft_I2C_Stop();
    
    return I2C_OK;
}

//-----------------------------------------------------------------------------
// ???????
// devAddr: ????(7?)
// regAddr: ???????
// data: ?????
// len: ????
//-----------------------------------------------------------------------------
u8 Soft_I2C_WriteMulti(u8 devAddr, u8 regAddr, u8 *data, u16 len)
{
    u16 i;
    
    Soft_I2C_Start();
    
    if(Soft_I2C_WriteByte((devAddr << 1) | 0))
        return I2C_ERROR;
    
    if(Soft_I2C_WriteByte(regAddr))
        return I2C_ERROR;
    
    for(i = 0; i < len; i++)
    {
        if(Soft_I2C_WriteByte(data[i]))
            return I2C_ERROR;
    }
    
    Soft_I2C_Stop();
    
    return I2C_OK;
}

//-----------------------------------------------------------------------------
// ???????
// devAddr: ????(7?)
// regAddr: ???????
// data: ?????
// len: ????
//-----------------------------------------------------------------------------
u8 Soft_I2C_ReadMulti(u8 devAddr, u8 regAddr, u8 *data, u16 len)
{
    u16 i;
    
    Soft_I2C_Start();
    
    if(Soft_I2C_WriteByte((devAddr << 1) | 0))
        return I2C_ERROR;
    
    if(Soft_I2C_WriteByte(regAddr))
        return I2C_ERROR;
    
    Soft_I2C_Start();  // ????
    
    if(Soft_I2C_WriteByte((devAddr << 1) | 1))
        return I2C_ERROR;
    
    for(i = 0; i < len; i++)
    {
        if(i == len - 1)
            data[i] = Soft_I2C_ReadByte(0);  // ????????NACK
        else
            data[i] = Soft_I2C_ReadByte(1);  // ??ACK????
    }
    
    Soft_I2C_Stop();
    
    return I2C_OK;
}
//=============================================================================
// TM1640 ?��?? (�`��I2C��Start/Stop�M��?)
//=============================================================================

//-----------------------------------------------------------------------------
// 0-9 ?�r�q?�� (�@?��)
//-----------------------------------------------------------------------------
const u8 TM1640_DigitCode[10] = {
    0x3F,  // 0
    0x06,  // 1
    0x5B,  // 2
    0x4F,  // 3
    0x66,  // 4
    0x6D,  // 5
    0x7D,  // 6
    0x07,  // 7
    0x7F,  // 8
    0x6F   // 9
};

//-----------------------------------------------------------------------------
// TM1640 ?�@?�r? (LSB��?�A?ACK)
// ??�_I2C: �C��b�e�A?��?��
//-----------------------------------------------------------------------------
void TM1640_WriteByte(u8 data)
{
    u8 i;
    
    SDA_Output();
    SOFT_SCL_LOW;
    
    for(i = 0; i < 8; i++)
    {
        SOFT_SCL_LOW;
        I2C_Delay_us(I2C_DELAY_US);
        
        // ?�e�̧C�� (LSB��?)
        if(data & 0x01)
            SOFT_SDA_HIGH;
        else
            SOFT_SDA_LOW;
        
        data >>= 1;  // �k���A��?�U�@��
        I2C_Delay_us(I2C_DELAY_US);
        
        SOFT_SCL_HIGH;  // �W�ɪu?�s?�u
        I2C_Delay_us(I2C_DELAY_US);
    }
    
    SOFT_SCL_LOW;
    // TM1640 ?�� ACK�A������^
}

//-----------------------------------------------------------------------------
// TM1640 ?�R�O
//-----------------------------------------------------------------------------
void TM1640_WriteCmd(u8 cmd)
{
    Soft_I2C_Start();      // �`��I2C��Start
    TM1640_WriteByte(cmd);
    Soft_I2C_Stop();       // �`��I2C��Stop
}

//-----------------------------------------------------------------------------
// TM1640 ��l��
//-----------------------------------------------------------------------------
void TM1640_Init(void)
{
    // GPIO�w�bGPIO_Configuration()���t�m
    SOFT_SCL_LOW;
    SOFT_SDA_LOW;
    I2C_Delay_us(10);
    
    TM1640_Clear();
    TM1640_SetBrightness(brightness);  // 设置想要的亮度（1-8）
// 删除或注释掉下面这行，因为SetBrightness已经包含了开启显示的功能
// TM1640_WriteCmd(TM1640_DISP_ON);
}

//-----------------------------------------------------------------------------
// TM1640 �M��
//-----------------------------------------------------------------------------
void TM1640_Clear(void)
{
    u8 i;
    
    TM1640_WriteCmd(TM1640_CMD_DATA_AUTO);  // ��?�[1�Ҧ�
    
    Soft_I2C_Start();
    TM1640_WriteByte(TM1640_ADDR_START);    // �_�l�a�}
    
    for(i = 0; i < 16; i++)
    {
        TM1640_WriteByte(0x00);              // �M��16?��m
    }
    
    Soft_I2C_Stop();
}

//-----------------------------------------------------------------------------
// TM1640 设置亮度
// 功能: 调整数码管的显示亮度
// 参数: brightness - 亮度等级，范围 1-8 (1最暗，8最亮)
// 说明: 如果传入的值超出范围，会自动限制在有效范围内
//-----------------------------------------------------------------------------
void TM1640_SetBrightness(u8 level)  // 改成 level 避免和全局变量 brightness 冲突
{
    // 限制亮度范围在 1-8 之间
    if(level < 1) level = 1;
    if(level > 8) level = 8;

    // 发送亮度控制命令 (0x88 + level - 1)
    TM1640_WriteCmd(TM1640_BRIGHT_1 + level - 1);
}

//-----------------------------------------------------------------------------
// TM1640 显示数字
// 功能: 在数码管上显示一个整数
// 参数:
//   num - 要显示的数字 (例如: 12345678)
//   digit_count - 显示位数 (1-16位)，决定显示多少位数码管
//
// 显示规则:
//   - 数字从右往左显示 (个位在最右边)
//   - 例如: DisplayNumber(1234, 8) 会显示 "00001234"
//   - 如果 num > 显示范围，会只显示低位部分
//   - 如果 num < 显示位数，高位自动补0
//-----------------------------------------------------------------------------
void TM1640_DisplayNumber(u32 num, u8 digit_count)
{
    u8 i;
    u8 data[16] = {0};  // 缓冲区，存储每位数字的段码

    // 限制显示位数不超过16位 (TM1640最多支持16位)
    if(digit_count > 16) digit_count = 16;

    // 从低位到高位提取每一位数字，转换成七段码
    // 例如: num=1234 -> data[0]=4的段码, data[1]=3的段码, data[2]=2的段码, data[3]=1的段码
    for(i = 0; i < digit_count; i++)
    {
        data[i] = TM1640_DigitCode[num % 10];  // 取个位数字，查表得到段码
        num /= 10;  // 去掉个位，准备处理下一位
    }

    // 设置为自动地址递增模式
    TM1640_WriteCmd(TM1640_CMD_DATA_AUTO);

    // 开始传输数据
    Soft_I2C_Start();
    TM1640_WriteByte(TM1640_ADDR_START);  // 设置起始地址为0xC0

    // 依次写入每位数字的段码
    for(i = 0; i < digit_count; i++)
    {
        TM1640_WriteByte(data[i]);
    }

    Soft_I2C_Stop();  // 结束传输
}

//-----------------------------------------------------------------------------
// TM1640 显示多组数据 (11位数码管显示4组数据，每组都有小数点)
// 功能: 在11位数码管上显示4组测量数据
// 参数:
//   power     - 功率 (0-999, 显示格式: xx.x, 如123表示12.3)
//   time_min  - 时间/分钟 (0-99, 显示格式: xx)
//   env_temp  - 环境温度 (0-999, 显示格式: xx.x, 如256表示25.6°C)
//   self_temp - 自身温度 (0-999, 显示格式: xx.x, 如378表示37.8°C)
//
// 显示布局 (从低位到高位，即从右往左):
//   位0-2 (3位): 功率 xx.x (小数点在位1)
//   位3-4 (2位): 时间 xx (小数点在位4)
//   位5-7 (3位): 环境温度 xx.x (小数点在位6)
//   位8-10 (3位): 自身温度 xx.x (小数点在位9)
//
// 例如: power=123, time_min=45, env_temp=256, self_temp=378
// 显示: 37.8  25.6  45  12.3
//-----------------------------------------------------------------------------
void TM1640_DisplayMultiData(float power, float time_min, float env_temp, float self_temp)
{
    u8 i;
    u8 data[11] = {0};  // 11位数码管缓冲区

    // 限制数据范围
    if(power > 999.9) power = 999.9;
    if(time_min > 99.9) time_min = 99.9;
    if(env_temp > 999.9) env_temp = 999.9;
    if(self_temp > 999.9) self_temp = 999.9;

    // 位0-2: 功率 (3位数码管，始终显示整数)
    u16 power_int = (u16)power;  // 转换为整数
    if(power_int >= 100) {
        // >= 100: 显示 xxx (如 123)
        data[0] = TM1640_DigitCode[power_int / 100 % 10];      // 百位
        data[1] = TM1640_DigitCode[power_int / 10 % 10];       // 十位
        data[2] = TM1640_DigitCode[power_int % 10];            // 个位
    } else if(power_int >= 10) {
        // 10-99: 显示 _xx (前导空格，如 _12)
        data[0] = 0x00;                                         // 空白
        data[1] = TM1640_DigitCode[power_int / 10 % 10];       // 十位
        data[2] = TM1640_DigitCode[power_int % 10];            // 个位
    } else {
        // 0-9: 显示 __x (两个前导空格，如 __5)
        data[0] = 0x00;                                         // 空白
        data[1] = 0x00;                                         // 空白
        data[2] = TM1640_DigitCode[power_int % 10];            // 个位
    }

    // 位3-4: 时间 (2位数码管，始终显示整数)
    u16 time_int = (u16)time_min;  // 转换为整数
    if(time_int >= 10) {
        // >= 10: 显示 xx (如 12)
        data[3] = TM1640_DigitCode[time_int / 10 % 10];        // 十位
        data[4] = TM1640_DigitCode[time_int % 10];             // 个位
    } else {
        // 0-9: 显示 _x (前导空格，如 _5)
        data[3] = 0x00;                                         // 空白
        data[4] = TM1640_DigitCode[time_int % 10];             // 个位
    }

    // 位5-7: 环境温度 (3位数码管，智能显示小数点)
    if(env_temp >= 100) {
        // >= 100: 显示 xxx (无小数点，如 123)
        data[5] = TM1640_DigitCode[(int)(env_temp / 100) % 10];   // 百位
        data[6] = TM1640_DigitCode[(int)(env_temp / 10) % 10];    // 十位
        data[7] = TM1640_DigitCode[(int)env_temp % 10];           // 个位
    } else if(env_temp >= 10) {
        // 10-99.9: 显示 xx.x (如 12.3)
        data[5] = TM1640_DigitCode[(int)(env_temp / 10) % 10];    // 十位
        data[6] = TM1640_DigitCode[(int)env_temp % 10] | 0x80;    // 个位 + 小数点
        data[7] = TM1640_DigitCode[(int)(env_temp * 10) % 10];    // 十分位
    } else {
        // < 10: 显示 x.xx (如 1.23)
        data[5] = TM1640_DigitCode[(int)env_temp % 10] | 0x80;    // 个位 + 小数点
        data[6] = TM1640_DigitCode[(int)(env_temp * 10) % 10];    // 十分位
        data[7] = TM1640_DigitCode[(int)(env_temp * 100) % 10];   // 百分位
    }

    // 位8-10: 自身温度 (3位数码管，智能显示小数点)
    if(self_temp >= 100) {
        // >= 100: 显示 xxx (无小数点，如 123)
        data[8] = TM1640_DigitCode[(int)(self_temp / 100) % 10];  // 百位
        data[9] = TM1640_DigitCode[(int)(self_temp / 10) % 10];   // 十位
        data[10] = TM1640_DigitCode[(int)self_temp % 10];         // 个位
    } else if(self_temp >= 10) {
        // 10-99.9: 显示 xx.x (如 12.3)
        data[8] = TM1640_DigitCode[(int)(self_temp / 10) % 10];   // 十位
        data[9] = TM1640_DigitCode[(int)self_temp % 10] | 0x80;   // 个位 + 小数点
        data[10] = TM1640_DigitCode[(int)(self_temp * 10) % 10];  // 十分位
    } else {
        // < 10: 显示 x.xx (如 1.23)
        data[8] = TM1640_DigitCode[(int)self_temp % 10] | 0x80;   // 个位 + 小数点
        data[9] = TM1640_DigitCode[(int)(self_temp * 10) % 10];   // 十分位
        data[10] = TM1640_DigitCode[(int)(self_temp * 100) % 10]; // 百分位
    }

    // 设置为自动地址递增模式
    TM1640_WriteCmd(TM1640_CMD_DATA_AUTO);

    // 开始传输数据
    Soft_I2C_Start();
    TM1640_WriteByte(TM1640_ADDR_START);  // 设置起始地址

    // 依次写入11位数据
    for(i = 0; i < 11; i++)
    {
        TM1640_WriteByte(data[i]);
    }

    Soft_I2C_Stop();  // 结束传输
}


