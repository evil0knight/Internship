/******************************************************************************
 * Copyright (C) 2024 EternalChip, Inc.(Gmbh) or its affiliates.
 *
 * All Rights Reserved.
 *
 * @file app.c
 *
 * @author YA眼膏
 *
 * @brief 应用层：全局硬件对象定义、帧解析、表驱状态机。
 *
 * @version V1.0 2026-4-1
 *
 *****************************************************************************/
#include "app.h"
#include "../config/sys_config.h"
#include "../3_Driver/motor/motor_driver.h"
#include "../3_Driver/led/led_driver.h"
#include "../3_Driver/uart/uart_wifi.h"
#include "../3_Driver/rf433/rf433.h"
#include "../4_HAL/hal.h"
#include "../4_HAL/hal_gpio.h"
#include "../4_HAL/hal_eeprom.h"

/* ---- 全局硬件对象 ---- */
Motor_Obj_t g_motor;
LED_Obj_t   g_led1;
LED_Obj_t   g_led2;

/* ---- 全局状态/事件 ---- */
volatile SystemEvent_t g_event = EV_NONE;
SystemState_t          g_state = STATE_IDLE;
bit g_power_cut = 0;

/** 对码存储的 433 地址 **/
static unsigned char g_pairedCode[3] = {0};

/** 本机地址，上电从 EEPROM 读取 **/
static unsigned char g_my_addr[3] = {0};

/* ---- 动作函数 ---- */

static void act_start_running(void)     { LED_Off(&g_led1);LED_Off(&g_led2);Motor_Stop_And_Clear(&g_motor); }
static void act_motor_open(void)        { Motor_Open(&g_motor);LED_On(&g_led1); }
static void act_motor_close(void)       { Motor_Close(&g_motor); LED_On(&g_led1);}
static void act_motor_stop(void)        { Motor_Stop_And_Clear(&g_motor);LED_StartBlink(&g_led1,5000, 50); }

static void act_error_recover(void)     { g_power_cut = 0; LED_Off(&g_led1);LED_StartBlink(&g_led2,5000, 50); }
static void act_duima_start(void)       { LED_Off(&g_led1);LED_StartBlink(&g_led2,2000, 50); }
static void act_duima_error(void)       { LED_Off(&g_led1);LED_StartBlink(&g_led2,2000, 500); }

static void act_motor_toggle(void)
{
    if (g_motor.current_state == MOTOR_ST_OPENED ||
        g_motor.current_state == MOTOR_ST_OPENING||
        g_motor.current_state == MOTOR_ST_UNKNOWN ) {
        Motor_Close(&g_motor);
    } else {
        Motor_Open(&g_motor);
    }
    LED_On(&g_led1);
}

static void act_save_duima(void)
{
    g_pairedCode[0] = rf_data[0];
    g_pairedCode[1] = rf_data[1];
    g_pairedCode[2] = rf_data[2];
    hal_eeprom_write(EE_ADDR_PAIRED_CODE,      g_pairedCode[0]);
    hal_eeprom_write(EE_ADDR_PAIRED_CODE + 1U, g_pairedCode[1]);
    hal_eeprom_write(EE_ADDR_PAIRED_CODE + 2U, g_pairedCode[2]);
    hal_eeprom_write(EE_ADDR_PAIRED_FLAG,      EE_PAIRED_FLAG_VALID);
    LED_StartBlink(&g_led2, 5000, 100);
}

static void on_motor_jammed(void)
{
    /** 卡阀：快闪报警并强制结束运动 **/
    LED_StartBlink(&g_led1, 0xFFFF, 100);
    g_event = EV_TIM_5S_OVER;
}

static void on_motor_arrived(void) { g_event = EV_MOTOR_OVER; }

/* ---- 状态转移表 ---- */

typedef struct {
    SystemState_t current;
    SystemEvent_t event;
    SystemState_t next;
    void (*action)(void);
} Transition_t;

static const Transition_t transitions[] = {
    /** 启动 **/
    {STATE_IDLE,      EV_START,        STATE_RUNNING,   act_start_running},

    /** 正常待机 **/
    {STATE_RUNNING,   EV_WIFI_OPEN,    STATE_MOTOR_RUN, act_motor_open},
    {STATE_RUNNING,   EV_WIFI_CLOSE,   STATE_MOTOR_RUN, act_motor_close},
    {STATE_RUNNING,   EV_433_LEAK,     STATE_MOTOR_RUN, act_motor_close},
    {STATE_RUNNING,   EV_CUTOFF,       STATE_MOTOR_RUN, act_motor_close},
    {STATE_RUNNING,   EV_LONG_KEY,     STATE_433_DUIMA, act_duima_start},
    {STATE_RUNNING,   EV_SHORT_KEY,    STATE_MOTOR_RUN, act_motor_toggle},

    /** 电机运动中 **/
    {STATE_MOTOR_RUN, EV_MOTOR_OVER,   STATE_RUNNING,   act_motor_stop},
    {STATE_MOTOR_RUN, EV_TIM_5S_OVER,  STATE_ERROR,     act_motor_stop},
    {STATE_MOTOR_RUN, EV_CUTOFF,       STATE_MOTOR_RUN, act_motor_close},
    {STATE_MOTOR_RUN, EV_433_LEAK,     STATE_MOTOR_RUN, act_motor_close},

    /** 对码等待 **/
    {STATE_433_DUIMA, EV_TIM_10S_OVER, STATE_RUNNING,   act_duima_error},
    {STATE_433_DUIMA, EV_433_DUIMA,    STATE_RUNNING,   act_save_duima},

    /** 错误恢复 **/
    {STATE_ERROR,     EV_SHORT_KEY,    STATE_RUNNING,   act_error_recover},
    {STATE_ERROR,     EV_WIFI_RESET,   STATE_RUNNING,   act_error_recover},
};

#define TRANS_COUNT (sizeof(transitions) / sizeof(Transition_t))

/* ---- WiFi 帧解析 ---- */

/**
 * @brief 解析 WiFi 帧，将命令字节转换为系统事件。
 *        协议：rx_buf[0] = 0x01 开阀 / 0x02 关阀 / 0xFF 复位。
 * @param[in]  :None
 * @param[Out] :None
 * @return None
 */
static void parse_wifi_frame(void)
{
    if (rx_len < 1) return;

    switch (rx_buf[0]) {
        case 0x01: g_event = EV_WIFI_OPEN;  break;
        case 0x02: g_event = EV_WIFI_CLOSE; break;
        case 0xFF: g_event = EV_WIFI_RESET; break;
        default:   break;
    }

    /** 关中断保护，清缓冲 **/
    URIER  &= 0xFE;
    rx_len  = 0;
    rx_flag = 0;
    URIER  |= 0x01;
}

/* ---- 433 数据处理 ---- */

/**
 * @brief 处理 433 接收帧，区分对码帧与漏水报警帧。
 * @param[in]  :None
 * @param[Out] :None
 * @return None
 */
static void parse_rf433(void)
{
    unsigned char cmd = rf_data[2] & 0x0FU;   /** 低4位：数据位 **/

    /** 对码状态：收到对码帧且地址匹配则完成对码 **/
    if (g_state == STATE_433_DUIMA) {
        if (cmd == RF433_CMD_DUIMA) {
            g_event = EV_433_DUIMA;
        }
    } else {
        /** 正常状态：地址匹配且为漏水帧才触发报警 **/
        if (rf_data[0] == g_pairedCode[0] &&
            rf_data[1] == g_pairedCode[1] &&
            (rf_data[2] & 0xF0U) == (g_pairedCode[2] & 0xF0U) &&
            cmd == RF433_CMD_LEAKING) {                                                                                                                                
            g_event = EV_433_LEAK;
        }
    }
    rf_data_ready = 0;
}

/* ---- 公开接口 ---- */

/**
 * @brief 初始化硬件对象与状态机。
 * @param[in]  :None
 * @param[Out] :None
 * @return None
 */
void App_Init(void)
{
    LED_Init(&g_led1, hal_led1_on, hal_led1_off, hal_led1_tog);
    LED_Init(&g_led2, hal_led2_on, hal_led2_off, hal_led2_tog);
    Motor_Init(&g_motor, hal_motor_open, hal_motor_close, hal_motor_stop,
               on_motor_jammed, on_motor_arrived);

    if (hal_eeprom_read(EE_ADDR_PAIRED_FLAG) == EE_PAIRED_FLAG_VALID) {
        g_pairedCode[0] = hal_eeprom_read(EE_ADDR_PAIRED_CODE);
        g_pairedCode[1] = hal_eeprom_read(EE_ADDR_PAIRED_CODE + 1U);
        g_pairedCode[2] = hal_eeprom_read(EE_ADDR_PAIRED_CODE + 2U);
    }

    g_state = STATE_IDLE;
    g_event = EV_START;
}

/**
 * @brief 主循环轮询：帧解析 + 状态机推进。
 * @param[in]  :None
 * @param[Out] :None
 * @return None
 */
void App_Run(void)
{
    unsigned char i;
    SystemEvent_t ev;

    /** 处理 WiFi 帧 **/
    if (rx_flag) {
        LED_On(&g_led1);
        parse_wifi_frame();
    }

    /** 处理 433 帧 **/
    if (rf_data_ready) {
        //LED_On(&g_led1);
        parse_rf433();
    }

    /** 状态机推进 **/
    if (g_event == EV_NONE) return;

    ev      = g_event;
    g_event = EV_NONE;

    for (i = 0; i < TRANS_COUNT; i++) {
        if (transitions[i].current == g_state && transitions[i].event == ev) {
            g_state = transitions[i].next;
            if (transitions[i].action) transitions[i].action();
            return;
        }
    }
}
