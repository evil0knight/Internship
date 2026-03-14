// Project: FT60E21X_PA_INT.prj
// Device:  FT60E21X
// Memory:  PROM=1KX14, SRAM=64B, EEPROM=128
// Description: 程序中DemoPortOut(PA3)输出100帧50HZ的占空比为50%的方波后,MCU进入睡眠,等待中断的发生;
// 		   		当每次PA2电平变化中断触发后，重复以上流程;

// RELEASE HISTORY
// VERSION     DATE         DESCRIPTION
// 1.3        25-7-8        修改系统时钟为8MHz，使能LVR
//*********************************************************
#include	"SYSCFG.h";
#include 	"FT60F21X.h";
//***********************宏定义****************************
#define	unchar		unsigned char    
#define g_my_addr		0x12345
#define is_leaking 		0x02
#define duima 			0x01
#define led_on			PA3=1
#define led_off			PA3=0
#define led_tuggle		PA3 = (PA3 == 1 ? 0 : 1)
#define key				PA5
#define DATAOUT_HIGH	PA4=1
#define DATAOUT_LOW		PA4=0
typedef unsigned char      uint8_t;
typedef unsigned int       uint16_t;
typedef unsigned long      uint32_t;
 

typedef enum {
    STATE_WAKEUP,  // 唤醒计时状态
    STATE_PAIRING, // 对码广播状态
    STATE_SLEEP    // 发送并准备休眠状态
} SystemState_t;

unchar  FCount;
unchar  ReadAPin;
volatile SystemState_t g_state = STATE_WAKEUP;
volatile uint16_t g_timer_5s = 0;
volatile uint16_t g_timer_2s = 0;
/*-------------------------------------------------
 * 函数名：interrupt ISR
 * 功能：  中断处理函数
 * 输入：  无
 * 输出：  无
 --------------------------------------------------*/
void interrupt ISR(void)	
{ 
	if(INTCON & 0x04)			//Timer0中断标记 Bit[2]:T0IF
    {
		if (g_state == STATE_WAKEUP) {
    	    // --- 1. 5秒倒计时：到时进入休眠流程 ---
    	    g_timer_5s++;
    	    if (g_timer_5s >= 500) { 
    	        g_state = STATE_SLEEP; 
    	        g_timer_5s = 0;
    	    }

    	    // --- 2. 2秒长按：到时进入对码流程 ---
    	    if (key == 0) {
    	        g_timer_2s++;
    	        if (g_timer_2s >= 200) { 
    	 	           g_state = STATE_PAIRING; // 切换到对码
    	            g_timer_5s = 0;          // 对码前清零5s计时
    	            g_timer_2s = 0;
    	        }
    	    } else {
    	        g_timer_2s = 0; 
    	    }
    	}
		INTCON &= ~(1<<2);		//T0IF = 0;	
        TMR0 =100;				//计数初值 每个指令周期++	最大255，后溢出
	}
} 
/*-------------------------------------------------
 * 函数名：POWER_INITIAL
 * 功能：  上电系统初始化
 * 输入：  无
 * 输出：  无
 --------------------------------------------------*/	
void POWER_INITIAL (void) 
{
	OSCCON = 0B01100000;		//系统时钟选择为内部振荡器8MHz
	INTCON = 0;  				//暂禁止所有中断

	PORTA = 0B00000000;				
	TRISA = 0B00100100;			//PA输入输出 0-输出 1-输入  
	WPUA = 0B00100100;     		//PA端口上拉控制 1-开上拉 0-关上拉

	MSCON = 0B00000000;		                             
}
/*----------------------------------------------------
 * 函数名：TIMER0_INITIAL
 * 功能：  初始化设置定时器
 * 设置TMR0定时时长=(1/系统时钟频率)*指令周期*预分频值*TMR0
 * 				   =(1/8000000)*4*128*156 = 10ms
 ----------------------------------------------------*/
 void TIMER0_INITIAL (void)  
 {
	T0ON = 0;
	TMR0 = 100; 					//计数初值 每个指令周期++ 最大255，后溢出
	T0CON0 = 0B00000000;		//Bit3 定时器0使能位 Bit[1:0]定时器时钟源选择位	00:指令周期	01:HIRC
	OPTION = 0B00000110;	
	//Bit5: T0CS Timer0时钟源选择 
	//1-外部引脚电平变化T0CKI 0-内部时钟(FOSC/2)
	//Bit4: T0CKI引脚触发方式 1-下降沿 0-上升沿
	//Bit3: PSA 预分频器分配位 0-Timer0 1-WDT 
	//Bit[2:0]: PS 8个预分频比 110 - 1:128,101 - 1:64
    
	T0ON = 1;
}
/*-------------------------------------------------
 * 函数名：Delay10Us
 * 功能：  短延时函数
 * 输入：  Time延时时间长度 延时时长Time Us
 * 输出：  无
 --------------------------------------------------*/
void Delay10Us(void)
{
	for(unsigned char i=0;i<2;i++)
	{
		NOP();                                                                                      
	}
}   
/*
下面的延时函数是从例程里考出来的，延时的真实时间不对
但是和接收端是配套的
我就不乱改了
*/
void delay_us(uint16_t us)
{
	uint16_t j;
	us = us * 3;
	for(j=0;j<us;j++)
	{
		NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();
	}
}

/*-------------------------------------------------
 * 函数名：DelayMs
 * 功能：  短延时函数
 * 输入：  Time延时时间长度 延时时长Time ms
 * 输出：  无
 --------------------------------------------------*/
 void DelayMs(unsigned char Time)
 {
	for(unsigned int a=0;a<Time;a++)
	{
		for(unsigned char b=0;b<83;b++)
		{
		 	Delay10Us(); 	
		}
	}
 }
/*------------------------------------------------- 
 * 函数名称：DelayS
 * 功能：    短延时函数
 * 输入参数：Time 延时时间长度 延时时长Time S
 * 返回参数：无 
 -------------------------------------------------*/
void DelayS(unsigned char Time)
{
	unsigned char a,b;
	for(a=0;a<Time;a++)
	{
		for(b=0;b<10;b++)
		{
		 	DelayMs(100); 	
		}
	}
}
/*-------------------------------------------------
 * 函数名: PA2_Level_Change_INITIAL
 * 功能：  PA端口(PA2)电平变化中断初始化
 * 输入：  无
 * 输出：  无
--------------------------------------------------*/
void Wakeup_INITIAL(void)
{
    TRISA2 = 1;             // 确保 PA2 是输入模式
    TRISA5 = 1;             // 确保 PA5（按钮）是输入模式
    
    // 关键操作：读取 PORTA 的当前值。
    // 手册规定必须读取端口以清除内部的电平匹配状态，
    // 这样下次电平跳变（按下按钮）时才能触发中断。
    ReadAPin = PORTA;       
    
    PAIF = 0;               // 清除 PA 端口中断标志位
    
    IOCA2 = 1;              // 使能 PA2 的电平变化中断（漏水唤醒）
    IOCA5 = 1;              // 使能 PA5 的电平变化中断（按钮唤醒）
    
    PAIE = 1;               // 使能总的 PA 端口中断允许位
}
  //1527编码中的同步码
void coding_syn_1527(void)
{
  DATAOUT_HIGH; 
  delay_us(4);
  DATAOUT_LOW;
  delay_us(124);
 }
 //1527编码中的0码
void coding_L_1527(void)
{
  DATAOUT_HIGH; 
  delay_us(4);
  DATAOUT_LOW;
  delay_us(12);
 } 
  //1527编码中的1码
void coding_H_1527(void)
{ 
  DATAOUT_HIGH; 
  delay_us(12);  
  DATAOUT_LOW;
  delay_us(4);
}


//完整的1527编码
//输入参数：uint32_t addr   20位地址码
//          uint8_t data    4数据码
void coding_1527(uint32_t Addr_1527, uint8_t Data)
{
  uint8_t i,k;
  uint32_t j;
  if((Addr_1527 > 0xfffff) || Data >15) //非法值
    return;
    
	GIE = 0;
  //同步码
  coding_syn_1527(); 
  //地址码
	for(i=0;i<20;i++)
  {
   j = (0x80000 & Addr_1527);
   Addr_1527 = (Addr_1527 << 1);
  if(j != 0)
    coding_H_1527();
  else
    coding_L_1527();
  }
  //数据码
  for(i=0;i<4;i++)
  {  
   k = (0x08 & Data);
   Data = (Data << 1);
  if(k != 0)
    coding_H_1527();
  else
    coding_L_1527();
  }
  GIE = 1;
}


void Enter_Deep_Sleep()
{
	Wakeup_INITIAL();		//初始化PA电平变化中断
	GIE = 0;					     	//关闭全局中断
    NOP();
    NOP();
	SLEEP(); 					     	//睡眠
	NOP();
    NOP();
}
void System_Reinit()
{
	PAIF = 0;  							//清PAIF标志位
	PAIE = 0;  							//暂先禁止PA2中断
	IOCA2 =0;  							//禁止PA2电平变化中断
	T0IE = 1; 
    GIE = 1; 
}
void LED_Flickering3()
{
	for(int i=0;i<6;i++)
	{
		led_tuggle;
		DelayMs(50);
	}
}
void LED_Flickering1()
{
	for(int i=0;i<3;i++)
	{
		led_tuggle;
		DelayMs(10);
	}
}
/*-------------------------------------------------
 * 函数名: main 
 * 功能：  主函数
 * 输入：  无
 * 输出：  无
--------------------------------------------------*/
void main()
{
	POWER_INITIAL();					//系统初始化
	TIMER0_INITIAL();					//定时器初始化
	GIE = 1; 							//开中断
	T0IE = 1;							//开定时器/计数器0中断
	while(1)
	{
		//这里执行程序，用一个状态机，分为对码，唤醒，睡眠，3个模式
		//唤醒有两种方式，一种是漏水唤醒，一种是按钮唤醒
		//从睡眠中唤醒，进入唤醒模式，然后计时器开始计时，如果5S到了，就发送此时是否漏水，然后睡眠
		//如果期间检测到2S的长按按钮，就清零计时进入对码模式
		//对码模式先把地址设置成广播地址，用广播地址发送一下自己的地址，以后发送数据就是用这个地址
		//然后从对码模式退出，进入唤醒模式，等待唤醒模式的计时器清零
    	switch (g_state) {
    	    case STATE_PAIRING:
				// 连续发送多次，确保接收端处于“爆闪”学习状态时能抓到
    		for(uint8_t i=0; i<3; i++)
    		{
     		   // --- 对码动作：用广播地址告诉别人“我是谁” ---
    	        coding_1527(g_my_addr, duima); 
			
    		    // 闪烁一下自己的 LED 表示正在对码
    		    LED_Flickering1();
    		}
				LED_Flickering3();//对码完成
    	        g_state = STATE_WAKEUP;         // 回到唤醒模式，重新开始5s倒计时
    	        break;
    	    case STATE_SLEEP:
    	        // --- 休眠前动作：用自己的地址发数据 ---
    	        coding_1527(g_my_addr, is_leaking); // 发送漏水状态
				led_off;
    	        // --- 彻底躺平 ---
    	        Enter_Deep_Sleep(); 
		
    	        // --- 醒来后的第一现场 ---
    	        System_Reinit();
    	        g_state = STATE_WAKEUP;
    	        g_timer_5s = 0;
    	        break;
    	    case STATE_WAKEUP:
    	        // 这里可以处理一些不紧急的UI，比如呼吸灯
				led_on;
    	        break;
   	 	}
	}  
}