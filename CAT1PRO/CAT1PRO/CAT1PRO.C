// Project:  FT61FC4X_UART.prj
// Device:   FT61FC4X
// Memory:   PROM=4Kx14, SRAM=0.5KB, EEPROM=128
// Description: UART communication with CAT1 module

// RELEASE HISTORY
// VERSION DATE     DESCRIPTION
// 1.1     24-2-2   Modified file header
//OPENP-----PB2
//OPENS----PB1
//CLOSEP----PB0
//CLOSES----PA0
//LED----PA4
//RX----PA7
//TX----PA6
//*********************************************************
#include "SYSCFG.h"
#include "duima.h"
//***********************Macro Definitions****************************
#define  unchar     unsigned char

#define OPENP       PORTBbits.PB2
#define OPENS       PORTBbits.PB1
#define CLOSEP       PORTBbits.PB0
#define CLOSES       PORTBbits.PB0

#define DATA_TRANS   PORTAbits.PA4

#define KEY          PORTBbits.PB7



#define LED_OFF     PORTAbits.PA1 = 0
#define LED_ON      PORTAbits.PA1 = 1
#define LED_TOGGLE  PORTAbits.PA1 = (PORTAbits.PA1 == 1 ? 0 : 1)

#define WAKE_UP     PORTCbits.PC1 = 0
#define SLEEP_DN    PORTCbits.PC1 = 1

//***********************Global Variables****************************
// 定时器计数器（用于按键扫描）- 由TIM4中断每1ms递增
volatile unsigned int g_timer_ms = 0;

//const char Freq[]={0x41, 0x54, 0x2B, 0x46, 0x45, 0x51, 0x3D, 0x34, 0x33, 0x34, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x0D, 0x0A, 0x00};
volatile  unchar	receivedata[20]={0x00,0x0a,0x00,0x0a,0x00,0x0a,0x00,0x0a};
volatile  unchar	senddat[20]={'A','T',0x0d,0x0a};
//volatile  string	senddata;
volatile  unchar    toSend[20]={'A','T','+','P','W','R','=','2','9',0x0d,0x0a};
volatile  unchar    toSendA[20]={'A','T',0x0d,0x0a};

volatile  unchar    toSenda[20]={'A','T','+','U','A','R','T','=','3',',','0',0x0d,0x0a,0x55,0x66,0x77,0x88,0x99,0xaa};
unchar    i=0;
unchar    mmm=0;
const  	char*   abc="ABCD\r\n";
//int last_toggle_time=0;

/*-------------------------------------------------
* Function: interrupt ISR
* Purpose:  Interrupt handler
* Input:    None
* Output:   None
 --------------------------------------------------*/
void interrupt ISR(void)
{
	if(URRXNE && RXNEF)       // Receive interrupt
	{
        //LED_TOGGLE;
    	receivedata[mmm++] =URDATAL;

        if(mmm>=20)
        {
        	mmm=0;
        }
        NOP();
	}

    // TIM4定时器中断（1ms）- 用于按键扫描时间基准
    if(T4UIE && T4UIF)
    {
        T4UIF = 1;              // 写1清除中断标志
        g_timer_ms++;           // 毫秒计数器递增（允许溢出）
        
    }

    //----------------------------
  /*  if(TCEN && TCF)          // Transmit interrupt
    {
        TCF=1;       // Write 1 to clear 0

    	if(i<5)
        {
    		URDATAL =toSend[i++];
        }
        else
        {
          i=0;
        }
		NOP();
     }  */

}
/*-------------------------------------------------
* Function: POWER_INITIAL
* Purpose:  Power-on system initialization
* Input:    None
* Output:   None
 --------------------------------------------------*/
void POWER_INITIAL (void)
{
	OSCCON = 0B01110001;	//16MHz 1:1
	INTCON = 0B00000000;  	// Disable peripheral interrupt

    //输入引脚设置
	PORTA = 0B00000000;
	TRISA = 0B10010000;		// PA7,PA4
	PORTB = 0B00000000;
	TRISB = 0B10000101;		// PB7,PB2,PB0
	PORTC = 0B00000000;
	TRISC = 0B00000000;		//

    //上拉引脚设置
	WPUA = 0B00010000;     	// PA4
	WPUB = 0B10000101;     	// PB7,PB2,PB0
	WPUC = 0B00000000;     	// 

    //下拉引脚设置
    WPDA = 0B00000000;     	// 
	WPDB = 0B00000000;     	//
	WPDC = 0B00000000;     	//

    //源电流大小设置
    PSRC0 = 0B11111111;  	// PORTA source current drive 0=small 1=large
    PSRC1 = 0B11111111;     // PORTB source current drive 0=small 1=large
    PSRC2 = 0B11111111;		// PORTC source current drive 00=small 11=large

    //灌电流大小设置
    PSINK0 = 0B11111111;  	// PORTA sink current drive 0=small 1=large
    PSINK1 = 0B11111111; 	// PORTB sink current drive 0=small 1=large
    PSINK2 = 0B11111111;	// PORTC sink current drive 0=small 1=large

    ANSELA = 0B00000000;    // All digital I/O pins
}
/*-------------------------------------------------
* Function: IO_INT_INITIAL
* Purpose:  Dual External Interrupt Initialization
*           - PA4: 433 module wakeup signal (EINT0)
*           - PB7: Pairing button wakeup (EINT1)
* Input:    None
* Output:   None
 --------------------------------------------------*/
void IO_INT_INITIAL(void)
{
    EPS0 = 0B00000000;//ESP0没用到

    // EPS1 选择 PA4(ENT4),PB7(ENT7)
    EPS1 = 0B01000000;

    ITYPE0 = 0B00000000;//没用到

    ITYPE1 = 0B10000000;    // PB7,PA4 边沿

    EPIE0  = 0B10010000;    //ent7,ent4外设中段使能
    
    INTCON = 0B11000000; //GIE,PEIE使能
}

/*-------------------------------------------------
* Function: DelayUs
* Purpose:  Microsecond delay - 16MHz 2T mode - about 1% error
* Input:    Time - delay time in microseconds
* Output:   None
 -------------------------------------------------*/
void DelayUs(unsigned char Time)
{
	unsigned char a;
	for(a=0;a<Time;a++)
	{
		NOP();
	}
}
/*-------------------------------------------------
* Function: DelayMs
* Purpose:  Millisecond delay - about 1% error
* Input:    Time - delay time in milliseconds
* Output:   None
 -------------------------------------------------*/
void DelayMs(unsigned char Time)
{
	unsigned char a,b;
	for(a=0;a<Time;a++)
	{
		for(b=0;b<5;b++)
		{
		 	DelayUs(197);
		}
	}
}
/*-------------------------------------------------
* Function: UART_INITIAL
* Purpose:  UART initialization
* Input:    None
* Output:   None
 --------------------------------------------------*/
void UART_INITIAL(void)
{
	PCKEN |=0B00100000;	// Enable UART clock

    URIER =0B00000001;  // Enable TX/RX interrupt
    URLCR =0B00000001;  // 8-bit data, 1 stop bit, no parity
    URMCR =0B00011000;

    URDLL =104;         // 9600 baud rate = Fosc/16*[URDLH:URDLL]
    URDLH =0;
    TCF=1;
    AFP1=0;
    ODCON0=0B00000000;
}
/*-------------------------------------------------
* Function: SendByte
* Purpose:  Send a single byte via UART
* Input:    data - byte to send
* Output:   None
 --------------------------------------------------*/
void SendByte(unchar data)
{
    TXEF = 0;
    URDATAL = data;
    while(!TCF)
    {
    }
}
/*-------------------------------------------------
* Function: SendString
* Purpose:  Send a string via UART (without \r\n)
* Input:    str - string to send
* Output:   None
 --------------------------------------------------*/
void SendString(const char* str)
{
    unchar j = 0;
    while(str[j] != '\0')
    {
        SendByte(str[j]);
        j++;
    }
}
/*-------------------------------------------------
* Function: SendATCommand
* Purpose:  Send AT command and automatically append \r\n
* Input:    cmd - AT command string
*           Example1: AT+PWR=29
*           Example2: ATW
* Output:   None
* Note:     Automatically appends \r\n at the end
 --------------------------------------------------*/
void SendATCommand(const char* cmd)
{
    unchar j = 0;

    // Send command string characters
    while(cmd[j] != '\0')
    {
        SendByte(cmd[j]);
        j++;
    }

    // Send \r (0x0D)
    SendByte(0x0D);

    // Send \n (0x0A)
    SendByte(0x0A);
}

/*-------------------------------------------------
* Function: CAT1_Init这个是一直唤醒模式的配置，后续要用周期睡眠模式
* Purpose:  CAT1 433MHz module initialization with AT commands
* Input:    None
* Output:   None
* Note:     Configure power, baud rate, frequency, address, SF, BW, PB
 --------------------------------------------------*/
void CAT1_Init(void)
{
    // Set power
    SendATCommand("AT+PWR=20");
    DelayMs(50);

    // Set UART baud rate 9600
    SendATCommand("AT+UART=3,0");
    DelayMs(50);

    // Set frequency 434MHz
    SendATCommand("AT+FEQ=434000000");
    DelayMs(50);

    // Set address
    SendATCommand("AT+ADR=0");
    DelayMs(50);

    // Set spreading factor (7-12, higher=longer range)
    SendATCommand("AT+SF=7");
    DelayMs(50);

    // Set bandwidth (6-9, lower=longer range)
    SendATCommand("AT+BW=9");
    DelayMs(50);

    // Set preamble length (0-6)
    SendATCommand("AT+PB=3");
    DelayMs(50);

    SendATCommand("AT+MODE=1"); // 开启周期休眠
    DelayMs(50);

    SendATCommand("AT+WT=2");   // 唤醒周期2秒 (发送方的前导码PB必须>2秒)
    DelayMs(50);

    // Initialize pairing module (EEPROM, GPIO, timer, interrupt)
    Duima_Init();

    // Save all settings
    SendATCommand("ATW");
    DelayMs(50);

    SLEEP_DN;//唤醒433
}
/*-------------------------------------------------
* Function: main
* Purpose:  Main function
* Input:    None
* Output:   None
 --------------------------------------------------*/
// 定义系统状态
typedef enum {
    STATE_WAKE_INIT,    // 状态0: 唤醒初始化
    STATE_WORKING,      // 状态1: 正常工作 (5秒窗口)
    STATE_GO_SLEEP      // 状态2: 准备休眠
} MAIN_STATE;
//==============================================================================
// 系统进入休眠模式 
//==============================================================================
void Sys_EnterSleep(void)
{
    // 1. 关外设，准备睡觉
    LED_OFF;
    SLEEP_DN;
    DelayMs(50); // 防抖

    // 2. 备份现场
    //unsigned char backup_INTCON = INTCON;

    IO_INT_INITIAL();
    EPIF0 = 0x90;
    //TIM4IER=0;
    GIE = 0;

    // 8. 睡觉
    NOP(); NOP();NOP();NOP();
    SLEEP();
    NOP(); NOP();NOP();NOP();

    // 9. 醒来后
    EPIF0 = 0x90;   
    INTCON = 0B11000000; //GIE,PEIE使能
    //TIM4IER=1;
    DelayMs(50);
    // 10. 恢复现场
    //INTCON = backup_INTCON;
}
void main(void)
{
    // --- 硬件初始化 ---
    POWER_INITIAL();
    UART_INITIAL();
    DelayMs(50);
    CAT1_Init();
    
    // 统一开启中断
    INTCON = 0B11000000;
    DelayMs(50);

    // 状态机变量
    MAIN_STATE sys_state = STATE_WAKE_INIT;

    while(1)
    {
        switch(sys_state)
        {
            // ============================================================
            // 状态 0: 刚醒来，做准备工作
            // ============================================================
            case STATE_WAKE_INIT:
                LED_ON;
                g_timer_ms = 0;         // 重置计时器
                mmm = 0;                // 清空串口缓冲
                WAKE_UP;                // 唤醒 433 模块 (PC1=0)
                sys_state = STATE_WORKING; // 马上进入工作状态
                //sys_state=STATE_GO_SLEEP;//测试模式，直接进入休眠
                break;

            // ============================================================
            // 状态 1: 工作中 (5秒窗口)
            // ============================================================
            case STATE_WORKING:
                // 1. 核心业务
                Duima_MainLoop();       // 检测按键

                // 2. 处理串口数据
                if(mmm >= 2) {
                    Duima_ProcessReceivedData((unsigned char*)receivedata, mmm);
                    mmm = 0; 
                }

                // 3. 检查是否该睡觉了
                if(current_mode == MODE_PAIRING)
                {
                    // 对码模式：超时 10秒 退出
                    if(g_timer_ms >= 10000) {
                        Duima_Configure433Address(local_paired_id); // 恢复ID
                        current_mode = MODE_NORMAL;
                        LED_OFF;
                        sys_state = STATE_GO_SLEEP; // 去睡觉
                    }
                }
                else
                {
                    // 正常模式：超时 5秒 睡觉
                    if(g_timer_ms >= 5000) {
                        sys_state = STATE_GO_SLEEP; // 去睡觉
                    }
                }
                break;

            // ============================================================
            // 状态 2: 执行休眠
            // ============================================================
            case STATE_GO_SLEEP:
            for(unsigned char k=0; k<6; k++) 
                {
                    LED_TOGGLE;     // 翻转灯的状态
                    DelayMs(100);    // 延时 (慢闪)
                }
                Sys_EnterSleep();       // 调用封装好的休眠函数 (程序会停在这里睡觉)
                
                // 醒来后，流程继续往下走
                sys_state = STATE_WAKE_INIT; // 醒来后，回到初始化状态
                break;
        }
    }
}