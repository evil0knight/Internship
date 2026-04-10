#include "HT67F2362A.h"
#include "UART0_433MHZ.h"
#include "mcu_api.h"

void UART1_Init(void)
{
	_pfc6  = 1;
	_rx1ps = 1;
 
	//无奇偶校验位
	_pren1 = 0;
	//8位数据
	_bno1  = 0;
	
	//uncr2
	//发送器一位停止位
	_stops1 = 0;
	//接收中断使能
	_rie1   = 1;
	
	//控制UARTn位时间内的采样点
	_brds1  = 0;
	
	_brdl1  = 0x8a;
	_brdh1  = 0x00;
	_umod10 = 1;
	_umod11 = 1;
	_umod12 = 1;
	
	//接收器FIFO 触发等级(字节数)
	_rxftr10 = 1;				//接收器FIFO 中有2 个以上字节
	_rxftr11 = 0;
	
	//使能中断
	_mf5e = 1;
	_emi  = 1;
	_ur1e = 1;	
	
	//PF7引脚共用功能选择-TX1
	_pfs17 = 1;
	_pfs16 = 0;
	
	//PF6引脚共用功能选择-RX1
	_pfs14 = 1;
	_pfs15 = 0;
	
	//uncr0
	_uarten1 = 1;	//UART1使能，TX1和RX1脚作为UART1功能引脚
	
	//使能uart
	_txen1  = 1;
	_rxen1  = 1;
			
}

void UART0_Init(void)                         //433MHz采用UART0通信(9600)
{
	_pdc4=1;                                  //输入引脚
	_rx0ps=1;                                 //RX0输入源选择
	
	_pdc5=0;                                  //输出引脚
	_pdpu5=0;
	
	_pds13=0;                                 //PD5复用为TX0
	_pds12=1;
	
	_pds11=1;                                 //PD4复用为RX0
	_pds10=0;
	
	_uarten0=1;                               //UART0使能，TX0和RX0引脚作为UART0功能引脚
    _bno0=0;                                  //8位传输
    _pren0=0;                                 //奇偶校验除能
     
    _txen0=1;                                 //开启发送接收，有一位停止位,中断使能
    _rxen0=1;
    _stops0=0;  
    _rie0=1;                          
    
    _brds0=0;                                 //控制UARTn位时间内的采样点
    	
    _brdl0=0x82;                              //波特率9600
	_brdh0=0x06;
	_umod02=1;
	_umod01=0;
	_umod00=1;
	
    _rxftr00=1;                               //接收器FIFO中有1个以上字节触发中断
	_rxftr01=0;
	
	_ur0e=1;                                  //UART0 传输中断使能
	_mf5e=1;                                  //多功能中断5使能
	_emi=1;                                   //总中断使能
	
	_pdc0=0;                                  //sleep设置为输出引脚
	_pd0=0;
}

//接收中断服务函数
DEFINE_ISR(Interrupt_UART, 0x3c)
{  
//UART1中断                     
	unsigned char data = 0;
	_emi  = 0;
	_ur1f = 0;				//清除UART1传输中断请求标志位
	while(_rxif1 == 1)
	{
		data = _txr_rxr1;	// 管理发送和接收数据的数据寄存器TXR_RXRn，发送和接收都是共用
		uart_receive_input(data);
	}	
	
	
//UART0中断	
	if(_ur0f==1)
	{
		_ur0f = 0;				             //清除UART0传输中断请求标志位
		_rxif0=0;
		
        unsigned char data0 = 0;
		data0 = _txr_rxr0;	                 //管理发送和接收数据的数据寄存器TXR_RXRn，发送和接收都是共用
		UART0_Receive_Data(data0); 
	}  
	
																	
	_emi=1;					//总中断使能位
}