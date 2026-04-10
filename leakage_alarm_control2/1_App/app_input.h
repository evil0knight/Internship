/******************************************************************************
 * Copyright (C) 2024 EternalChip, Inc.(Gmbh) or its affiliates.
 *
 * All Rights Reserved.
 *
 * @file app_input.h
 *
 * @author YA眼膏
 *
 * @brief 应用层输入处理：按键消抖与对码超时计数。
 *        由 HAL ISR 每 1ms 调用一次，产生事件后写入 g_event。
 *
 * @version V1.0 2026-4-1
 *
 *****************************************************************************/
#ifndef APP_INPUT_H
#define APP_INPUT_H

/**
 * @brief 1ms 周期任务：按键消抖 + 对码超时检测。
 *        在 TIM4 中断中调用。
 * @param[in]  :None
 * @param[Out] :None
 * @return None
 */
void App_Input_1ms(void);

#endif /* APP_INPUT_H */
