/******************************************************************************
 * Copyright (C) 2024 EternalChip, Inc.(Gmbh) or its affiliates.
 *
 * All Rights Reserved.
 *
 * @file app_input.c
 *
 * @author YA眼膏
 *
 * @brief 按键消抖与对码超时实现。
 *
 * @version V1.0 2026-4-1
 *
 *****************************************************************************/
#include "app_input.h"
#include "app.h"
#include "../4_HAL/hal.h"
#include "../config/sys_config.h"

/** 按键持续按下计数 (ms) **/
static unsigned int s_keyHoldMs = 0;

/** 上一次按键状态 (1=未按) **/
static unsigned char s_keyLast = 1;

/** 对码超时计数 (ms) **/
static unsigned int s_duimaTimer = 0;

/**
 * @brief 1ms 周期任务：按键消抖 + 对码超时检测。
 * @param[in]  :None
 * @param[Out] :None
 * @return None
 */
void App_Input_1ms(void)
{
    /** 按键消抖：长按触发 EV_LONG_KEY，短按触发 EV_SHORT_KEY **/
    if (KEY_PRESSED) {
        s_keyHoldMs++;
        if (s_keyHoldMs == KEY_LONG_PRESS_MS && s_keyLast == 1) {
            g_event  = EV_LONG_KEY;
            s_keyLast = 0;
        }
    } else {
        if (s_keyHoldMs > KEY_SHORT_PRESS_MS &&
            s_keyHoldMs < KEY_LONG_PRESS_MS  &&
            s_keyLast == 1) {
            g_event = EV_SHORT_KEY;
        }
        s_keyHoldMs = 0;
        s_keyLast   = 1;
    }

    /** 对码超时：仅在 STATE_433_DUIMA 状态下计时 **/
    if (g_state == STATE_433_DUIMA) {
        s_duimaTimer++;
        if (s_duimaTimer >= DUIMA_TIMEOUT_MS) {
            s_duimaTimer = 0;
            g_event      = EV_TIM_10S_OVER;
        }
    } else {
        s_duimaTimer = 0;
    }

    /*如果电池不供电了,会有一个下降沿,然后换电容供电,此时要关电机*/
    if (Power_PIN == 0 && !g_power_cut) {
      g_power_cut = 1;                                                                                                                                                           
      g_event = EV_CUTOFF;                                                                                                                                                       
  }          
}
