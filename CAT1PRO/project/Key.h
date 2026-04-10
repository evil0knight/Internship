#include "HT67F2362A.h"

#ifndef _KEY_H_
#define _KEY_H_

 	/* 2022-09-15
 	 * S5 _pd2  CODE_KEY
 	 * S4 _pd3	SMART_CONFIG_KEY
 	 * S3 _pc2	MIN_KEY
 	 * S2 _pc1	ADD_KEY
 	 * S1 _pe5	POWER_KEY
 	 * S0 _pe6  旋转编码器按键，未使用
 	 */

#define KEY_NUM 5                          //总共5个按键

#define ADD_KEY  		 1                 //加按键
#define MIN_KEY	 		 2                 //减按键
#define WIFI_CONFIG_KEY  3                 //配网按键
#define PAIR_CODE_KEY    4                 //对码按键
#define CONFIRM_KEY   	 5                 //确认按键

#define PRESS		0                      //按键按下
#define RELEASE		1                      //按键松开

#define SHORT_PRESS_REPORT         0       //短按,上报一次事件
#define LONG_PRESS_SINGLE_REPORT   1	   //长按,上报一次事件
#define LONG_PRESS_INTERVAL_REPORT 2	   //长按,每隔固定时间上报一次事件

void Key_Init(void);
void Key_Check(void);
void Key_Handle(void);



#endif