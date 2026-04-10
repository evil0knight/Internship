// hal.h - 硬件抽象层引脚定义
// Device: FT61FC4X
// 漏水报警控制项目

#ifndef HAL_H
#define HAL_H

#include "SYSCFG.h"

// ---- LED ----
#define LED1        PA2     // LED1
#define LED2        PB6     // LED2

#define LED1_ON()   (PA2 = 1)
#define LED1_OFF()  (PA2 = 0)
#define LED1_TOG()  (PA2 ^= 1)

#define LED2_ON()   (PB6 = 1)
#define LED2_OFF()  (PB6 = 0)
#define LED2_TOG()  (PB6 ^= 1)

// ---- 按键 ----
#define KEY_PIN     PA1     // 按键 (active low)
#define KEY_PRESSED (PA1 == 0)

// ---- 电机 ----
#define OPENS       PB2     // 开阀
#define CLOSES      PB1     // 关阀
#define OPENP       PB0     // 开到位检测 (低电平=到位)
#define CLOSEP      PA0     // 关到位检测 (低电平=到位)

// ---- UART (WiFi模块) ----
// PA6=TX, PA7=RX, PC1=EN
#define EN         PC1

// ---- 433接收 ----
#define RF433_PIN   PB7     // 433信号输入

// ----电源检测-----
#define Power_PIN   PA4     //电源检测引脚,0为电池没电了,但是此时会换超级电容供电

#endif // HAL_H
