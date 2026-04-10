#include "UART.h"
#include "HT67F2362A.h"

unsigned char UART1_WIFI_Config_Flag=0;                 //WIFI配网标志位

void UART1_WIFI_SendByte(unsigned char Data)                             //发送字符
{
	_txr_rxr1=Data;
	while(_txif1==0);	                                                   //发送数据寄存器TXR_RXR1 状态位（1-数据已从缓冲器加载到移位寄存器中）
	while(_tidle1==0);	                                                   //数据发送完成标志位（1-发送完成）
}


