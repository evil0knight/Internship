#include "HT67F2362A.h"

#ifndef _DATA_H_
#define _DATA_H_

/*对码绑定状态*/
#define BIND_STATE_DISCONNECTED 0       //未绑定
#define BIND_STATE_CONNECTED    1       //已绑定
#define BIND_STATE_BINDING      2       //绑定中
/*WIFI绑定状态*/
#define WIFI_STATE_DISCONNECTED 0       //WIFI未连接
#define WIFI_STATE_CONNECTED    1       //WIFI已连接
#define WIFI_STATE_BINDING		2       //WIFI连接中
/*阀门状态*/
#define Motor_OPEN   1                  //阀门打开
#define Motor_CLOSE  0                  //阀门关闭

#define POWER_0     0                   //没电
#define POWER_1     1                   //一格电
#define POWER_2     2                   //两格电
#define POWER_3     3                   //满电

struct Data
{	
	unsigned char Remaining_Power;      //剩余电量
	unsigned char Bind_State;           //绑定状态
	unsigned char WIFI_State;           //WiFi状态
	unsigned int  Remaining_time;       //剩余时间
	unsigned int  Motor_State;			//阀体状态
	unsigned int  Master_Address;       //主面板地址        
};

extern struct Data data; 

void Data_Init(void);
void Handle_ADD(void);
void Handle_MIN(void);
void Handle_EC11_ADD(void);
void Handle_EC11_MIN(void);


#endif