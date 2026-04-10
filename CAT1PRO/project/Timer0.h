#include "HT67F2362A.h"

#ifndef _TIMER0_H_
#define _TIMER0_H_

void Timer0_Init(void);   //时钟初始化(16MHz)

extern volatile unsigned char Key_Check_Running_Flag;                     //按键检测函数允许运行标志位
extern volatile unsigned char LCD_Bind_Check_Running_Flag;                //LCD绑定logo检测函数允许运行标志位
extern volatile unsigned char UART0_433MHz_Pairing_Code_Running_Flag;     //对码函数允许运行标志位
extern volatile unsigned char LCD_WIFI_Check_Running_Flag;                //LCD绑定WIFI检测函数允许运行标志位
extern volatile unsigned char LCD_Power_Check_Running_Flag;               //电量检测函数允许运行标志位

#endif

