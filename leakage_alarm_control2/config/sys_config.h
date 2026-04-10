/******************************************************************************
 * Copyright (C) 2024 EternalChip, Inc.(Gmbh) or its affiliates.
 *
 * All Rights Reserved.
 *
 * @file sys_config.h
 *
 * @author YA眼膏
 *
 * @brief 系统级编译期配置参数。
 *
 * @version V1.0 2026-4-1
 *
 *****************************************************************************/
#ifndef SYS_CONFIG_H
#define SYS_CONFIG_H

/** 系统 Tick 频率 (Hz) **/
#define SYS_TICK_RATE_HZ    1000U

/** 按键长按阈值 (ms) **/
#define KEY_LONG_PRESS_MS   2000U

/** 按键短按最小时长 (ms) **/
#define KEY_SHORT_PRESS_MS  50U

/** 对码等待超时 (ms) **/
#define DUIMA_TIMEOUT_MS    10000U

/** 433 数据位定义 (低4位) **/
#define RF433_CMD_DUIMA     0x01U   /** 对码帧 **/
#define RF433_CMD_LEAKING   0x02U   /** 漏水报警帧 **/

#endif /* SYS_CONFIG_H */
