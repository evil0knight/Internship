/******************************************************************************
 * Copyright (C) 2024 EternalChip, Inc.(Gmbh) or its affiliates.
 *
 * All Rights Reserved.
 *
 * @file hal_eeprom.h
 *
 * @author YA眼膏
 *
 * @brief HAL 层：FT61F14X EEPROM 读写接口。
 *        所有寄存器操作仅在此文件对应的 .c 中出现，上层不得直接访问寄存器。
 *
 * @version V1.0 2026-4-1
 *
 *****************************************************************************/
#ifndef HAL_EEPROM_H
#define HAL_EEPROM_H

#include "hal.h"

/** EEPROM 地址布局 **/
#define EE_ADDR_PAIRED_CODE   0x00U   /** 对端地址起始 (3 字节) **/
#define EE_ADDR_PAIRED_FLAG   0x03U   /** 对码有效标志 **/
#define EE_ADDR_MY_ADDR       0x04U   /** 本机地址起始 (3 字节，高20位有效) **/
#define EE_PAIRED_FLAG_VALID  0x5AU   /** 标志值：已对码 **/

/**
 * @brief 从 EEPROM 读取一个字节。
 * @param[in]  addr: EEPROM 地址 (0x00–0x7F)
 * @param[Out] :None
 * @return 读取到的字节值
 */
unsigned char hal_eeprom_read(unsigned char addr);

/**
 * @brief 向 EEPROM 写入一个字节。
 * @param[in]  addr: EEPROM 地址 (0x00–0x7F)
 * @param[in]  data: 要写入的字节
 * @param[Out] :None
 * @return None
 */
void hal_eeprom_write(unsigned char addr, unsigned char data);

#endif /* HAL_EEPROM_H */
