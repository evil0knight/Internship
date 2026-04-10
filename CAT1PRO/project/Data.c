#include "HT67F2362A.h"
#include "Data.h"
#include "EEPROM.h"
#include "UART0_433MHZ.h"

struct Data data={0}; 

void Data_Init(void)                                    //通信传输数据初始化
{                          
    data.Remaining_Power=3;
    data.Bind_State=0;
    data.WIFI_State=0;
    data.Remaining_time=0;
    data.Motor_State=0; 
    data.Master_Address=EEPROM_Read_Master_Address();   //上电自动读取主面板地址
}
 
void Send_Time(void)                                    //发送剩余时间
{
     #ifdef MASTER_PANEL
	 UART0_Transmit_Data(0xAA,0x02,data.Remaining_time);
	 #endif
		
	 #ifdef SLAVE_PANEL
	 UART0_Transmit_Data(0xAB,0x02,data.Remaining_time);
	 #endif	
} 
 
void Send_Motor(void)                                   //发送阀门状态
{
     #ifdef MASTER_PANEL
	 UART0_Transmit_Data(0xAA,0x02,data.Motor_State);
	 #endif
		
	 #ifdef SLAVE_PANEL
	 
	 #endif		
} 
 
void Handle_ADD(void)                                   //按钮加事件处理函数
{
	unsigned int min;
	min = data.Remaining_time;
	if(min < 1380)									    //限制定时时长最多24h
	{
		min = min + 60;
		data.Remaining_time = min;		                //按键增加1小时    
		Send_Time();
	}
}

void Handle_MIN(void)                                   //按钮减事件处理函数
{
	unsigned int min;
	min   = data.Remaining_time;
	if(min >= 60)
	{
		min = min - 60;
		data.Remaining_time = min;		                //按键减少1小时
		Send_Time();
	}	
}

void Handle_EC11_ADD(void)                              //处理旋钮增加分钟事件
{
	unsigned int min;
	min   = data.Remaining_time;
	if(data.Remaining_time < 1440)						//限制定时时长最多24h
	{
		min = min + 1;
		data.Remaining_time = min;		                //旋钮增加1分钟
		Send_Time();
	}
}

void Handle_EC11_MIN(void)                              //处理旋钮减少分钟事件
{
	unsigned int min;
	min   = data.Remaining_time;
	if(data.Remaining_time >= 1)
	{
		min = min - 1;
		data.Remaining_time = min;		                //旋钮减少1分钟
		Send_Time();
		
		if(min == 0)
		{
			data.Motor_State = Motor_CLOSE;             //剩余时间为0，更新阀门状态为关闭
			Send_Motor();                               //下发阀体开关
		}
	}
}
