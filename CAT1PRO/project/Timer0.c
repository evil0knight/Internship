#include "HT67F2362A.h"
#include "LCD.h"
#include "UART0_433MHZ.h"

void Timer0_Init(void)           //5ms进一次中断             
{
	/*STM0C0*/
	/*时钟选择位*/               //fH64分频=0.25MHz
	_st0ck0 = 1;
	_st0ck1 = 1;
	_st0ck2 = 0;


	/*STM0C1*/
	/*STM0模式选择*/             //计数器模式
	_st0m1 = 1;
	_st0m0 = 1;

	/*STM0计数器清零条件位*/
	_st0cclr = 1;

	_stm0al = 0xe2;
	_stm0ah = 0x4;
	
	/*使能中断*/
	_emi	= 1;
	_stm0ae	= 1;
	_mf0e	= 1;
	
	/*使能timer*/
	_st0on = 1;
        
}

/*服务于按键检测函数，10ms执行一次按键检测函数*/
volatile unsigned char Key_Check_Running_Flag=0;
void Key_Timer(void)
{
	static unsigned char Key_Count=0;
    Key_Count++;
    if(Key_Count>=2)
    {
       Key_Count=0;	
       Key_Check_Running_Flag=1;	                       
    }
}

/*服务于绑定LOGO闪烁函数，1s执行一次绑定logo检测函数*/
volatile unsigned char LCD_Bind_Check_Running_Flag=0;
unsigned char LCD_Bind_Check_Count=0;
void LCD_Bind_Check_Timer(void)
{
	 LCD_Bind_Check_Count++;
	 if(LCD_Bind_Check_Count>=200)
	 {
	 	LCD_Bind_Check_Count=0;
	    LCD_Bind_Check_Running_Flag=1;	
	 }
}

/*服务于绑定WIFI闪烁函数，1s执行一次绑定WIFI检测函数*/
volatile unsigned char LCD_WIFI_Check_Running_Flag=0;
unsigned char LCD_WIFI_Check_Count=0;
void LCD_WIFI_Check_Timer(void)
{
	 LCD_WIFI_Check_Count++;
	 if(LCD_WIFI_Check_Count>=200)
	 {
	 	LCD_WIFI_Check_Count=0;
	 	LCD_WIFI_Check_Running_Flag=1;
	 }
}

/*服务于电量显示函数，1s执行一次电量检测函数*/
volatile unsigned char LCD_Power_Check_Running_Flag=0;
unsigned char LCD_Power_Check_Count=0;
void LCD_Power_Check_Timer(void)
{
	 LCD_Power_Check_Count++;
	 if(LCD_Power_Check_Count>=200)
	 {
	 	LCD_Power_Check_Count=0;
	 	LCD_Power_Check_Running_Flag=1;
	 }
}

/*服务于对码函数，50ms执行一次*/
volatile unsigned char UART0_433MHz_Pairing_Code_Running_Flag=0; 
unsigned char UART0_433MHz_Pairing_Code_Count=0;     
void UART0_433MHz_Pairing_Code_Timer(void)
{
     UART0_433MHz_Pairing_Code_Count++;
     if(UART0_433MHz_Pairing_Code_Count>=10)
     {
        UART0_433MHz_Pairing_Code_Count=0;
        UART0_433MHz_Pairing_Code_Running_Flag=1;	
     }		
}    

/*5ms时基*/
DEFINE_ISR(Interrupt_TIM0, 0x14)   
{                       
	
	_stm0af = 0;                   //清除中断标志位

    Key_Timer();
    LCD_Bind_Check_Timer();
    LCD_WIFI_Check_Timer();
    LCD_Power_Check_Timer();
    UART0_433MHz_Pairing_Code_Timer();
    
	
	
	_emi = 1;                      //恢复全局中断
}



