#include "HT67F2362A.h"
#include "System_Clock.h"
#include "Timer0.h"
#include "LCD.h"
#include "UART.h"
#include "UART0_433MHZ.h"
#include "Data.h"
#include "EC11.h"
#include "EEPROM.h"
#include "Key.h"
#include "UART1_WIFI.h"

unsigned char a[2]={0x54,0xfe};

void main()
{
     System_Clock_Init();                      //时钟初始化16MHz
     EEPROM_WriteBytes(0x00, a, 2);
     Data_Init();                              //数据初始化(主面板读取EEPROM内唯一433MHz通讯地址)
     UART0_Init();                             //UART0初始化(用于433模块)
     UART1_Init();                             //UART1初始化(用于WIFI模块)
     Timer0_Init();                            //定时器TIMER0初始化(5ms进一次中断)
     Key_Init();                               //按键初始化
     EC11_Init();                              //旋转编码器初始化
     LCD_Init();                               //屏幕初始化
     while(1)
     {
     	LCD_Show_Angle(data.Remaining_time);   //LCD圆盘显示函数
     	LCD_Show_Time(data.Remaining_time);      //LCD时间显示函数
     	EC11_Handle();                         //旋转编码器检测
     	if(Key_Check_Running_Flag==1){ Key_Check(); Key_Check_Running_Flag=0;}//按键检测函数(10ms进入一次) 
     	Key_Handle();                          //按键上报事件处理函数
     	if(LCD_Bind_Check_Running_Flag==1){LCD_Bind_Check();LCD_Bind_Check_Running_Flag=0;}//LCD绑定logo检测函数(1s进入一次)
     	if(LCD_WIFI_Check_Running_Flag==1){LCD_WIFI_Check();LCD_WIFI_Check_Running_Flag=0;}//LCD绑定WIFI检测函数(1s进入一次)
     	if(UART0_433MHz_Pairing_Code_Running_Flag==1&&UART0_433MHz_Pairing_Code_Flag==1){UART0_433MHz_Pairing_Code(); UART0_433MHz_Pairing_Code_Running_Flag=0;}//对码函数(50ms进入一次)
      if(LCD_Power_Check_Running_Flag==1){LCD_Power_Check();LCD_Power_Check_Running_Flag=0;}//LCD电量检测函数(1s进入一次)
     	UART0_433MHz_Receive_Process();        //433模块接收数据处理函数
     }
}










