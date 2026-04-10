/******************************************************************************
 * Copyright (C) 2024 EternalChip, Inc.(Gmbh) or its affiliates.
 *
 * All Rights Reserved.
 *
 * @file hal_gpio.h
 *
 * @author YA眼膏
 *
 * @brief HAL 层：GPIO/时钟初始化、TIM4 定时器、ISR 入口及硬件绑定函数。
 *        所有寄存器操作仅在此文件中出现，上层不得直接访问寄存器。
 *
 * @version V1.0 2026-4-1
 *
 *****************************************************************************/
#ifndef HAL_GPIO_H
#define HAL_GPIO_H

#include "hal.h"
#include "../config/sys_config.h"

/**
 * @brief GPIO、时钟、中断初始化。
 * @param[in]  :None
 * @param[Out] :None
 * @return None
 */
void hal_gpio_init(void);

/**
 * @brief TIM4 1ms 定时器初始化。
 * @param[in]  :None
 * @param[Out] :None
 * @return None
 */
void hal_tim4_init(void);

/* ---- LED 硬件绑定 ---- */
void hal_led1_on(void);
void hal_led1_off(void);
void hal_led1_tog(void);
void hal_led2_on(void);
void hal_led2_off(void);
void hal_led2_tog(void);

/* ---- 电机硬件绑定 ---- */
void hal_motor_open(void);
void hal_motor_close(void);
void hal_motor_stop(void);

#endif /* HAL_GPIO_H */
