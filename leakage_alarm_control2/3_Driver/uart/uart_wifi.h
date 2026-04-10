// uart_wifi.h - WiFi模块 UART 收发 (中断驱动，无DMA)
#ifndef UART_WIFI_H
#define UART_WIFI_H

#include "SYSCFG.h"

#define UART_RX_BUF_SIZE  10
#define UART_TX_BUF_SIZE  11

typedef unsigned char uint8_t;

extern volatile uint8_t rx_buf[UART_RX_BUF_SIZE];
extern volatile uint8_t rx_len;     // 当前已收字节数
extern volatile uint8_t rx_flag;    // 1=收到完整帧

void UART_WiFi_Init(void);
void UART_WiFi_Send(uint8_t *data, uint8_t len);  // 触发第一字节，后续由中断驱动
void UART_WiFi_ISR(void);   // 放在 user_isr() 里调用

#endif
