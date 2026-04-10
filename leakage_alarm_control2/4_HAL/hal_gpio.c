/******************************************************************************
 * Copyright (C) 2024 EternalChip, Inc.(Gmbh) or its affiliates.
 *
 * All Rights Reserved.
 *
 * @file hal_gpio.c
 *
 * @author YA眼膏
 *
 * @brief HAL 层实现：GPIO/时钟初始化、TIM4、ISR 入口及硬件绑定。
 *
 * @version V1.0 2026-4-1
 *
 *****************************************************************************/
#include "hal_gpio.h"
#include "../3_Driver/uart/uart_wifi.h"
#include "../3_Driver/rf433/rf433.h"
#include "../3_Driver/led/led_driver.h"
#include "../3_Driver/motor/motor_driver.h"
#include "../1_App/app_input.h"
#include "../3_Driver/led/led_driver.h"
extern LED_Obj_t g_led1;
extern LED_Obj_t g_led2;
extern Motor_Obj_t g_motor;

/** 系统全局 1ms 计数器，供上层读取 **/
volatile unsigned int g_timer_ms = 0;

/** 系统占用，不可删除 **/
volatile char W_TMP   @ 0x70;
volatile char BSR_TMP @ 0x71;

/**
 * @brief GPIO、时钟、中断初始化。
 * @param[in]  :None
 * @param[Out] :None
 * @return None
 */
void hal_gpio_init(void)
{
    OSCCON = 0B01100001;    /** 内部 8MHz **/

    INTCON = 0;

    PORTA  = 0B00000000;
    TRISA  = 0B10010011;    /** PA0=CLOSEP输入, PA1=KEY输入, PA4=电源检测输入, PA7=RX输入 **/
    PORTB  = 0B00000000;
    TRISB  = 0B10000001;    /** PB0=OPENP输入, PB7=433输入 **/
    PORTC  = 0B00000000;
    TRISC  = 0B00000000;

    WPUA   = 0B00000011;    /** PA1 上拉 (按键) ,PB0和PA0也要上拉**/
    WPUB   = 0B10000001;    /** PB7 上拉（433模块未接时防悬空误触发）**/
    WPUC   = 0B00000000;
    WPDA   = 0B10000000;    /** PA7 下拉 **/
    WPDB   = 0B00000000;
    WPDC   = 0B00000000;

    PSRC0  = 0B11111111;
    PSRC1  = 0B11111111;
    PSRC2  = 0B11111111;
    PSINK0 = 0B11111111;
    PSINK1 = 0B11111111;
    PSINK2 = 0B11111111;

    ANSELA = 0B00000000;    /** 全数字 **/
}

/**
 * @brief TIM4 1ms 定时器初始化。
 *        8MHz / 2^6 / 125 = 1000Hz
 * @param[in]  :None
 * @param[Out] :None
 * @return None
 */
void hal_tim4_init(void)
{
    PCKEN   |= 0B00001000;
    TIM4CR1  = 0B00000101;
    TIM4IER  = 0B00000001;
    TIM4SR   = 0;
    TIM4EGR  = 0;
    TIM4CNTR = 0;
    TIM4PSCR = 6;
    TIM4ARR  = 124;
    INTCON  |= 0B11000000;
}

/* ---- LED 硬件绑定 ---- */

/**
 * @brief LED1 亮。
 * @param[in]  :None
 * @param[Out] :None
 * @return None
 */
void hal_led1_on(void)  { LED1_ON(); }

/**
 * @brief LED1 灭。
 * @param[in]  :None
 * @param[Out] :None
 * @return None
 */
void hal_led1_off(void) { LED1_OFF(); }

/**
 * @brief LED1 翻转。
 * @param[in]  :None
 * @param[Out] :None
 * @return None
 */
void hal_led1_tog(void) { LED1_TOG(); }

/**
 * @brief LED2 亮。
 * @param[in]  :None
 * @param[Out] :None
 * @return None
 */
void hal_led2_on(void)  { LED2_ON(); }

/**
 * @brief LED2 灭。
 * @param[in]  :None
 * @param[Out] :None
 * @return None
 */
void hal_led2_off(void) { LED2_OFF(); }

/**
 * @brief LED2 翻转。
 * @param[in]  :None
 * @param[Out] :None
 * @return None
 */
void hal_led2_tog(void) { LED2_TOG(); }

/* ---- 电机硬件绑定 ---- */

/**
 * @brief 驱动电机开阀。
 * @param[in]  :None
 * @param[Out] :None
 * @return None
 */
void hal_motor_open(void)  { OPENS = 1; CLOSES = 0; }

/**
 * @brief 驱动电机关阀。
 * @param[in]  :None
 * @param[Out] :None
 * @return None
 */
void hal_motor_close(void) { OPENS = 0; CLOSES = 1; }

/**
 * @brief 停止电机。
 * @param[in]  :None
 * @param[Out] :None
 * @return None
 */
void hal_motor_stop(void)  { OPENS = 0; CLOSES = 0; }

/* ---- ISR ---- */

/**
 * @brief 用户中断处理，由汇编 ISR 调用。
 * @param[in]  :None
 * @param[Out] :None
 * @return None
 */
static void user_isr(void)
{
    /** UART WiFi 中断 **/
    UART_WiFi_ISR();

    /** 433 解码 (TIM1) **/
    if (T1UIE && T1UIF) {
        T1UIF = 1;
        RF433_ISR();
    }

    /** TIM4 1ms 定时器 **/
    if (T4UIE && T4UIF) {
        T4UIF = 1;
        g_timer_ms++;
        App_Input_1ms();
        Motor_Timer_Task(&g_motor);
        LED_Process_1ms(&g_led1);
        LED_Process_1ms(&g_led2);
    }

    
}

/**
 * @brief MCU 中断向量入口。
 * @param[in]  :None
 * @param[Out] :None
 * @return None
 */
void  interrupt ISR(void) 
{
#asm;
    NOP; NOP; NOP; NOP; NOP; NOP; NOP; NOP; NOP; NOP;
    NOP; NOP ;NOP; NOP; NOP; NOP; NOP; NOP; NOP ;NOP ;NOP;
#endasm;
    user_isr();
}
