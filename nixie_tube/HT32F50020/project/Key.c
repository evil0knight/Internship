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
#include "Key.h"
#include "GPIO.h"

//-----------------------------------------------------------------------------
// 全局变量
//-----------------------------------------------------------------------------

Key_TypeDef Key[KEY_NUM] = {0};

//-----------------------------------------------------------------------------
// 函数名称: Key_Configuration
// 函数功能: 按键初始化（配置GPIO中断）
// 输入参数: 无
// 返回值:   无
//-----------------------------------------------------------------------------
void Key_Configuration(void)
{
    u8 i;

    // 初始化按键状态
    for(i = 0; i < KEY_NUM; i++)
    {
        Key[i].state = KEY_STATE_IDLE;
        Key[i].event = KEY_EVENT_NONE;
        Key[i].press_flag = 0;
        Key[i].release_flag = 0;
        Key[i].long_flag = 0;
        Key[i].press_time = 0;
        Key[i].debounce_cnt = 0;
    }

}


//-----------------------------------------------------------------------------
// 函数名称: Key_ReadPin
// 函数功能: 读取按键引脚电平
// 输入参数: key_num - 按键编号
// 返回值:   按键电平状态（0-按下，1-释放）
//-----------------------------------------------------------------------------
static u8 Key_ReadPin(u8 key_num)
{
    switch(key_num)
    {
        case KEY0: return IN_PB0_STATE;
        case KEY1: return IN_PB1_STATE;
        case KEY2: return IN_PB2_STATE;
        case KEY3: return IN_PB3_STATE;
        case KEY4: return IN_PB4_STATE;
        default:   return 1;
    }
}


//-----------------------------------------------------------------------------
// 函数名称: Key_Scan
// 函数功能: 按键扫描（带消抖，需在定时器中断中调用，建议1ms周期）
// 输入参数: 无
// 返回值:   无
//-----------------------------------------------------------------------------
void Key_Scan(void)
{
    u8 i;
    u8 pin_state;

    for(i = 0; i < KEY_NUM; i++)
    {
        pin_state = Key_ReadPin(i);  // 读取引脚电平（0=按下，1=释放）

        switch(Key[i].state)
        {
            case KEY_STATE_IDLE:  // 空闲状态
                if(pin_state == 0)  // 检测到按下
                {
                    Key[i].debounce_cnt++;
                    if(Key[i].debounce_cnt >= KEY_DEBOUNCE_TIME)
                    {
                        // 消抖完成，确认按下
                        Key[i].state = KEY_STATE_PRESS;
                        Key[i].event = KEY_EVENT_PRESS;
                        Key[i].press_flag = 1;
                        Key[i].press_time = 0;
                        Key[i].debounce_cnt = 0;
                    }
                }
                else
                {
                    Key[i].debounce_cnt = 0;
                }
                break;

            case KEY_STATE_PRESS:  // 按下状态
                if(pin_state == 0)  // 持续按下
                {
                    Key[i].press_time++;

                    // 检测长按
                    if(Key[i].press_time >= KEY_LONG_PRESS_TIME && !Key[i].long_flag)
                    {
                        Key[i].event = KEY_EVENT_LONG;
                        Key[i].long_flag = 1;
                    }
                }
                else  // 检测到释放
                {
                    Key[i].debounce_cnt++;
                    if(Key[i].debounce_cnt >= KEY_DEBOUNCE_TIME)
                    {
                        // 消抖完成，确认释放
                        Key[i].state = KEY_STATE_IDLE;
                        Key[i].event = KEY_EVENT_RELEASE;
                        Key[i].release_flag = 1;
                        Key[i].press_flag = 0;
                        Key[i].long_flag = 0;
                        Key[i].press_time = 0;
                        Key[i].debounce_cnt = 0;
                    }
                }
                break;

            default:
                Key[i].state = KEY_STATE_IDLE;
                break;
        }
    }
}

//-----------------------------------------------------------------------------
// 函数名称: Key_GetState
// 函数功能: 获取按键当前状态
// 输入参数: key_num - 按键编号
// 返回值:   按键状态
//-----------------------------------------------------------------------------
u8 Key_GetState(u8 key_num)
{
    if(key_num >= KEY_NUM) return KEY_STATE_IDLE;
    return Key[key_num].state;
}

//-----------------------------------------------------------------------------
// 函数名称: Key_GetEvent
// 函数功能: 获取按键事件
// 输入参数: key_num - 按键编号
// 返回值:   按键事件
//-----------------------------------------------------------------------------
u8 Key_GetEvent(u8 key_num)
{
    if(key_num >= KEY_NUM) return KEY_EVENT_NONE;
    return Key[key_num].event;
}

//-----------------------------------------------------------------------------
// 函数名称: Key_ClearEvent
// 函数功能: 清除按键事件
// 输入参数: key_num - 按键编号
// 返回值:   无
//-----------------------------------------------------------------------------
void Key_ClearEvent(u8 key_num)
{
    if(key_num >= KEY_NUM) return;
    Key[key_num].event = KEY_EVENT_NONE;
}

//-----------------------------------------------------------------------------
