// uart_wifi.c - WiFi模块 UART 收发
#include "uart_wifi.h"

volatile uint8_t rx_buf[UART_RX_BUF_SIZE] = {0};
volatile uint8_t rx_len  = 0;
volatile uint8_t rx_flag = 0;

static uint8_t  tx_buf[UART_TX_BUF_SIZE] = {0};
static uint8_t  tx_total = 0;
static uint8_t  tx_idx   = 0;

void UART_WiFi_Init(void)
{
    PCKEN |= 0B00100000;    // 使能 UART 时钟
    URIER  = 0B00100001;    // 使能发送/接收中断
    URLCR  = 0B00000001;    // 8位数据，1停止位，无校验
    URMCR  = 0B00011000;
    URDLL  = 52;            // 9600 baud @ 8MHz
    URDLH  = 0;
    TCF    = 1;
    INTCON = 0B11000000;
}

void UART_WiFi_Send(uint8_t *data, uint8_t len)
{
    uint8_t k;
    if (!len || len > UART_TX_BUF_SIZE) return;
    for (k = 0; k < len; k++) tx_buf[k] = data[k];
    tx_total = len;
    tx_idx   = 1;           // 第0字节手动触发，后续中断驱动
    if (TXEF) URDATAL = tx_buf[0];
}

void UART_WiFi_ISR(void)
{
    // 接收中断
    if (URRXNE && RXNEF) {
        uint8_t byte = URDATAL;
        if (rx_len < UART_RX_BUF_SIZE) {
            rx_buf[rx_len++] = byte;
        }
        // 以 '\n' 作为帧结束符
        if (byte == '\n' || rx_len >= UART_RX_BUF_SIZE) {
            rx_flag = 1;
        }
    }
    // 发送中断
    if (TCEN && TCF) {
        TCF = 1;    // 写1清0
        if (tx_idx < tx_total) {
            URDATAL = tx_buf[tx_idx++];
        }
    }
}
