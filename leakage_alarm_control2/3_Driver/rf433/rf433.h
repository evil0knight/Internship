// rf433.h - 433MHz 编码接收解码
// 基于英芯泰算法，使用 TIM1 90us 中断采样 PB7
// TIM1 时钟 = HIRC = 32MHz (非系统时钟8MHz), ARR=2879 → 90us
#ifndef RF433_H
#define RF433_H

#include "SYSCFG.h"

typedef unsigned char  uint8_t;
typedef unsigned int   uint16_t;

// 解码结果 (24位 = 3字节)
extern volatile uint8_t rf_data[3];
extern volatile uint8_t rf_data_ready;

void RF433_Init(void);          // 初始化 TIM1 中断 (90us)
void RF433_ISR(void);           // 放在 ISR 里调用 (TIM1 更新中断，90us周期)

#endif
