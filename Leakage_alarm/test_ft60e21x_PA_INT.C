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
#define	DemoPortOut	PA3   
 
unchar	FCount;
unchar	ReadAPin;
/*-------------------------------------------------
 * 函数名：interrupt ISR
 * 功能：  中断处理函数
 * 输入：  无
 * 输出：  无
 --------------------------------------------------*/
void interrupt ISR(void)	
{ 

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
	TRISA = 0B00000100;			//PA输入输出 0-输出 1-输入  
	WPUA = 0B00000100;     		//PA端口上拉控制 1-开上拉 0-关上拉

	OPTION = 0B00001000;		//Bit3=1 WDT MODE,PS=000=1:1 WDT RATE
	MSCON = 0B00000000;		                             
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
void PA2_Level_Change_INITIAL(void)
{
	TRISA2 = 1; 			     	//设置 PA2 输入
	ReadAPin = PORTA;	     		//清PA电平变化中断
	PAIF = 0;   			     	//清PA INT中断标志位
    IOCA2 = 1;  			     	//使能PA2电平变化中断
	PAIE = 1;   			     	//使能PA INT中断
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
 
	while(1)
	{
		for(FCount=0;FCount<100;FCount++)//输出100次波形	
		{
			DemoPortOut = 1; 				
			DelayMs(10);  					
			DemoPortOut = 0;
			DelayMs(10); 
		}
		PA2_Level_Change_INITIAL();		//初始化PA电平变化中断
		GIE = 0;					     	//关闭全局中断
        NOP();
        NOP();
		SLEEP(); 					     	//睡眠
        NOP();
        NOP(); 
		PAIF = 0;  							//清PAIF标志位
		PAIE = 0;  							//暂先禁止PA2中断
		IOCA2 =0;  							//禁止PA2电平变化中断   
	}
}