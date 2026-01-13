/************************************************************************************************************
 * @file    Soft_I2C.h
 * @brief   Software I2C implementation using GPIO
 ************************************************************************************************************/
#ifndef __SOFT_I2C_H
#define __SOFT_I2C_H

#include "ht32.h"
#include "GPIO.h"

//-----------------------------------------------------------------------------
// I2C ??????(????)
//-----------------------------------------------------------------------------
#define I2C_DELAY_US    5       // ????100kHz,?????

//-----------------------------------------------------------------------------
// I2C ????
//-----------------------------------------------------------------------------
#define I2C_OK          0
#define I2C_ERROR       1
#define I2C_TIMEOUT     2

//-----------------------------------------------------------------------------
// ????
//-----------------------------------------------------------------------------
void Soft_I2C_Init(void);
void Soft_I2C_Start(void);
void Soft_I2C_Stop(void);
u8   Soft_I2C_WriteByte(u8 data);
u8   Soft_I2C_ReadByte(u8 ack);
u8   Soft_I2C_WaitAck(void);
void Soft_I2C_Ack(void);
void Soft_I2C_NAck(void);

// ??????
u8 Soft_I2C_WriteReg(u8 devAddr, u8 regAddr, u8 data);
u8 Soft_I2C_ReadReg(u8 devAddr, u8 regAddr, u8 *data);
u8 Soft_I2C_WriteMulti(u8 devAddr, u8 regAddr, u8 *data, u16 len);
u8 Soft_I2C_ReadMulti(u8 devAddr, u8 regAddr, u8 *data, u16 len);
//-----------------------------------------------------------------------------
// TM1640 数码管驱动 (类似I2C协议，但不完全兼容标准I2C)
//-----------------------------------------------------------------------------
// TM1640 命令定义
#define TM1640_CMD_DATA_AUTO    0x40    // 地址自动加1模式
#define TM1640_CMD_DATA_FIXED   0x44    // 固定地址模式
#define TM1640_ADDR_START       0xC0    // 起始地址
#define TM1640_DISP_OFF         0x80    // 关闭显示
#define TM1640_DISP_ON          0x88    // 打开显示
#define TM1640_BRIGHT_1         0x88    // 亮度1 (最暗)
#define TM1640_BRIGHT_8         0x8F    // 亮度8 (最亮)

// TM1640 数字段码表 (0-9)
// 七段数码管显示: 每个bit对应一个段 (a-g + dp)
extern const u8 TM1640_DigitCode[10];

//-----------------------------------------------------------------------------
// TM1640 函数声明
//-----------------------------------------------------------------------------
// 底层通信函数
void TM1640_WriteByte(u8 data);           // 写一个字节 (LSB先发送，不等待ACK)
void TM1640_WriteCmd(u8 cmd);             // 写命令 (Start + 数据 + Stop)

// 高层控制函数
void TM1640_Init(void);                   // 初始化TM1640 (清屏、设亮度、开显示)
void TM1640_Clear(void);                  // 清空所有显示内容
void TM1640_SetBrightness(u8 brightness); // 设置亮度 (1-8)
void TM1640_DisplayNumber(u32 num, u8 digit_count); // 显示数字
void TM1640_DisplayMultiData(float power, float time_min, float env_temp, float self_temp); // 显示4组数据

extern unsigned char brightness;

#endif
