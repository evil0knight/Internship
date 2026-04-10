#include "HT67F2362A.h"

#ifndef _UART0_433MHZ_H_
#define _UART0_433MHZ_H_

#define MASTER_PANEL 1                                       //用于对码时区分主面板，副面板(这里是主面板)
//#define SLAVE_PANEL 1                                        //用于对码时区分主面板，副面板(这里是副面板)

extern unsigned char UART0_Receive_BUF[];                    //UART0接收缓存数
extern unsigned char UART0_Receive_Finish_Flag;              //UART0接收完成标志位  帧头检测到为0xFE，接收完成

extern unsigned char UART0_433MHz_Pairing_Code_Flag;         //对码启动标志位(1---启动对码  0---关闭对码)
#define MASTER_SEND_TOTAL_TIMES       3                      //主面板对码过程中发送主面板地址的最大次数(进行3次)

#ifdef MASTER_PANEL
extern unsigned char MASTER_SEND_CNT;                        //主面板对码过程中已经发送主面板地址的次数
extern unsigned char MASTER_SEND_FLAG;                       //主面板发送主面板地址标志位  1---允许发送  0---不能发送
extern unsigned int Master_Send_Interval_CNT;                //主面板3次发送主面板地址每次间隔2s，本参数用于在定时器5ms中断进行2s计时
#endif

#ifdef SLAVE_PANEL
extern unsigned char Slave_Recv_ADR_Flag;                    //1=已收到主面板地址
extern unsigned char Slave_Recv_CNT;                         //接收字节计数
#endif


void UART0_433MHz_Init(unsigned int Address);                //433模块初始化
void UART0_Transmit_Data(unsigned char ADR_Code,unsigned char Func_Code,unsigned int Data);
void UART0_433MHz_Pairing_Code(void);                        //对码函数
void UART0_Receive_Data(unsigned char data);                 //用于433MHz通讯模块接收数据
void UART0_433MHz_Receive_Process(void);                     //处理接收数据

#endif