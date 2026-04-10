/******************************************************************************
 * Copyright (C) 2024 EternalChip, Inc.(Gmbh) or its affiliates.
 *
 * All Rights Reserved.
 *
 * @file hal_eeprom.c
 *
 * @author YA眼膏
 *
 * @brief HAL 层实现：FT61F14X EEPROM 读写。
 *        移植自官方例程 FT61F14x_EEPROM.C。
 *
 * @version V1.0 2026-4-1
 *
 *****************************************************************************/
#include "hal_eeprom.h"

/*----------------------------------------------------
 * Function: Unlock_Flash
 * Purpose:  写 EEPROM 前必须执行的解锁序列，禁止编译器优化。
 ----------------------------------------------------*/
static void Unlock_Flash(void)
{
#asm
    MOVLW   0x03
    MOVWF   _BSREG
    MOVLW   0x55
    MOVWF   _EECON2 & 0x7F
    MOVLW   0xAA
    MOVWF   _EECON2 & 0x7F
    BSF     _EECON1 & 0x7F, 1   /** WR=1 **/
    NOP
    NOP
#endasm
}

/**
 * @brief 从 EEPROM 读取一个字节。
 * @param[in]  addr: EEPROM 地址 (0x00–0x7F)
 * @param[Out] :None
 * @return 读取到的字节值
 */
unsigned char hal_eeprom_read(unsigned char addr)
{
    unsigned char data;

    while (GIE) {
        GIE = 0;
        NOP();
        NOP();
    }

    EEADRL = addr;
    CFGS   = 0;
    EEPGD  = 0;
    RD     = 1;
    NOP();
    NOP();
    NOP();
    NOP();
    data = EEDATL;
    GIE = 1;

    return data;
}

/**
 * @brief 向 EEPROM 写入一个字节。
 * @param[in]  addr: EEPROM 地址 (0x00–0x7F)
 * @param[in]  data: 要写入的字节
 * @param[Out] :None
 * @return None
 */
void hal_eeprom_write(unsigned char addr, unsigned char data)
{
    while (GIE) {
        GIE = 0;
        NOP();
        NOP();
    }

    EEADRL = addr;
    EEDATL = data;
    CFGS   = 0;
    EEPGD  = 0;
    EEIF   = 0;
    WREN   = 1;

    Unlock_Flash();
    NOP();
    NOP();
    NOP();
    NOP();

    while (WR);
    WREN = 0;
    GIE  = 1;
}
