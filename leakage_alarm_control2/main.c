/******************************************************************************
 * Copyright (C) 2024 EternalChip, Inc.(Gmbh) or its affiliates.
 *
 * All Rights Reserved.
 *
 * @file main.c
 *
 * @author YA眼膏
 *
 * @brief 系统入口：初始化各层，启动主循环。
 *
 * @version V1.0 2026-4-1
 *
 *****************************************************************************/
#include "4_HAL/hal_gpio.h"
#include "3_Driver/uart/uart_wifi.h"
#include "3_Driver/rf433/rf433.h"
#include "1_App/app.h"
#include "3_Driver/led/led_driver.h"
extern LED_Obj_t g_led1;

/**
 * @brief 应用程序入口。
 * @param[in]  :None
 * @param[Out] :None
 * @return None
 */
void main(void)
{
    hal_gpio_init();
    UART_WiFi_Init();
    RF433_Init();
    hal_tim4_init();
    App_Init();
    //LED_StartBlink(&g_led1,5000, 50);

    while (1) {
        App_Run();
        
    }
}

