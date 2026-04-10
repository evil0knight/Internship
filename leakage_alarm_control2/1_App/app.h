/******************************************************************************
 * Copyright (C) 2024 EternalChip, Inc.(Gmbh) or its affiliates.
 *
 * All Rights Reserved.
 *
 * @file app.h
 *
 * @author YA眼膏
 *
 * @brief 应用层状态机接口：状态/事件枚举、公开函数声明。
 *
 * @version V1.0 2026-4-1
 *
 *****************************************************************************/
#ifndef APP_H
#define APP_H

typedef enum {
    STATE_IDLE = 0,
    STATE_RUNNING,      /** 正常待机 **/
    STATE_ERROR,        /** 故障状态 **/
    STATE_MOTOR_RUN,    /** 电机运动中 **/
    STATE_433_DUIMA     /** 对码等待中 **/
} SystemState_t;

typedef enum {
    EV_NONE = 0,
    EV_START,           /** 系统启动 **/
    EV_WIFI_OPEN,       /** WiFi指令：开阀 **/
    EV_WIFI_CLOSE,      /** WiFi指令：关阀 **/
    EV_WIFI_RESET,      /** WiFi指令：强制复位 **/
    EV_433_LEAK,        /** 433收到漏水信号 **/
    EV_CUTOFF,          /** 断电信号 **/
    EV_MOTOR_OVER,      /** 电机到位 **/
    EV_LONG_KEY,        /** 按键长按 (>2s) **/
    EV_SHORT_KEY,       /** 按键短按 **/
    EV_433_DUIMA,       /** 收到对码帧 **/
    EV_TIM_5S_OVER,     /** 5秒超时 **/
    EV_TIM_10S_OVER     /** 10秒超时 **/
} SystemEvent_t;

extern volatile SystemEvent_t g_event;
extern SystemState_t g_state;
extern bit g_power_cut;

/**
 * @brief 初始化硬件对象与状态机。
 * @param[in]  :None
 * @param[Out] :None
 * @return None
 */
void App_Init(void);

/**
 * @brief 主循环轮询：帧解析 + 状态机推进。
 * @param[in]  :None
 * @param[Out] :None
 * @return None
 */
void App_Run(void);

#endif /* APP_H */
