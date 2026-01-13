/************************************************************************************************************
 * @attention
 *
 * Firmware Disclaimer Information
 *
 * 1. The customer hereby acknowledges and agrees that the program technical documentation, including the
 *    code, which is supplied by Holtek Semiconductor Inc., (hereinafter referred to as "HOLTEK") is the
 *    proprietary and confidential intellectual property of HOLTEK, and is protected by copyright law and
 *    other intellectual property laws.
 *
 * 2. The customer hereby acknowledges and agrees that the program technical documentation, including the
 *    code, is confidential information belonging to HOLTEK, and must not be disclosed to any third parties
 *    other than HOLTEK and the customer.
 *
 * 3. The program technical documentation, including the code, is provided "as is" and for customer reference
 *    only. After delivery by HOLTEK, the customer shall use the program technical documentation, including
 *    the code, at their own risk. HOLTEK disclaims any expressed, implied or statutory warranties, including
 *    the warranties of merchantability, satisfactory quality and fitness for a particular purpose.
 *
 * <h2><center>Copyright (C) Holtek Semiconductor Inc. All rights reserved</center></h2>
 ************************************************************************************************************/
//-----------------------------------------------------------------------------
#ifndef __KEY_H
#define __KEY_H

#include "ht32.h"

//-----------------------------------------------------------------------------
// 按键编号定义
//-----------------------------------------------------------------------------
#define KEY_NUM             5       // 按键数量

#define KEY0                0       // PB0按键
#define KEY1                1       // PB1按键
#define KEY2                2       // PB2按键
#define KEY3                3       // PB3按键
#define KEY4                4       // PB4按键

//-----------------------------------------------------------------------------
// 按键状态定义
//-----------------------------------------------------------------------------
#define KEY_STATE_IDLE      0       // 空闲状态
#define KEY_STATE_PRESS     1       // 按下状态
#define KEY_STATE_RELEASE   2       // 释放状态

//-----------------------------------------------------------------------------
// 按键事件定义
//-----------------------------------------------------------------------------
#define KEY_EVENT_NONE      0       // 无事件
#define KEY_EVENT_PRESS     1       // 按键按下事件
#define KEY_EVENT_RELEASE   2       // 按键释放事件
#define KEY_EVENT_LONG      3       // 长按事件

//-----------------------------------------------------------------------------
// 消抖参数配置
//-----------------------------------------------------------------------------
#define KEY_DEBOUNCE_TIME   20      // 消抖时间（ms）
#define KEY_LONG_PRESS_TIME 1000    // 长按时间（ms）

//-----------------------------------------------------------------------------
// 按键结构体
//-----------------------------------------------------------------------------
typedef struct
{
    u8 state;           // 当前状态
    u8 event;           // 按键事件
    u8 press_flag;      // 按下标志
    u8 release_flag;    // 释放标志
    u8 long_flag;       // 长按标志
    u16 press_time;     // 按下时间计数
    u16 debounce_cnt;   // 消抖计数器
} Key_TypeDef;

//-----------------------------------------------------------------------------
// 全局变量声明
//-----------------------------------------------------------------------------
extern Key_TypeDef Key[KEY_NUM];

//-----------------------------------------------------------------------------
// 函数声明
//-----------------------------------------------------------------------------
void Key_Configuration(void);
void Key_Scan(void);
u8 Key_GetState(u8 key_num);
u8 Key_GetEvent(u8 key_num);
void Key_ClearEvent(u8 key_num);

//-----------------------------------------------------------------------------
#endif
