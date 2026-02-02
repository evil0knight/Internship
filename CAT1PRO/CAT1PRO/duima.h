#ifndef _DUIMA_H_
#define _DUIMA_H_

// =========================================================
// 【核心修复】包含系统头文件，直接使用硬件寄存器定义
// 不要再手动声明 extern volatile unsigned char ... 了！
// =========================================================
#include "SYSCFG.h"

//==============================================================================
// 1. 配置参数
//==============================================================================
#define DUIMA_BROADCAST_ID      65535   // 广播地址 (0xFFFF)
#define EEPROM_PAIRED_ID_ADDR   0x13    // 按照你的要求，改为 0x13

// GPIO定义
#define DUIMA_KEY_PIN           PORTBbits.PB7
#define DUIMA_433_SLEEP_PIN     PORTCbits.PC1

#define DUIMA_WAKEUP_433        (DUIMA_433_SLEEP_PIN = 0)
#define DUIMA_SLEEP_433         (DUIMA_433_SLEEP_PIN = 1)

#define LED_OFF                 PORTAbits.PA1 = 0
#define LED_ON                  PORTAbits.PA1 = 1
#define LED_TOGGLE              PORTAbits.PA1 = (PORTAbits.PA1 == 1 ? 0 : 1)

//==============================================================================
// 2. 状态管理
//==============================================================================
typedef enum {
    MODE_NORMAL = 0,    // 正常模式
    MODE_PAIRING = 1    // 对码模式
} SYS_MODE;

// 全局变量声明
extern SYS_MODE current_mode;
extern unsigned int local_paired_id;
extern volatile unsigned int g_timer_ms;
extern unsigned char mmm;

//==============================================================================
// 3. 函数声明
//==============================================================================
void Duima_Init(void);
void Duima_Timer_Init(void);
void Duima_StartPairing(void);
void Duima_ProcessReceivedData(unsigned char *data, unsigned char len);
void Duima_Configure433Address(unsigned int addr);
void Duima_MainLoop(void);

// EEPROM 相关
unsigned int Duima_EEPROM_ReadID(unsigned char addr);
void Duima_EEPROM_WriteID(unsigned int id, unsigned char addr);
void Duima_EEPROM_WriteByte(unsigned char data, unsigned char addr);
unsigned char Duima_EEPROM_ReadByte(unsigned char addr);
void Unlock_Flash(void); // 声明解锁函数

// 辅助函数
extern void SendATCommand(const char* cmd);
extern void DelayMs(unsigned char ms);
extern unsigned char Duima_Key_LongPress(unsigned int press_ms);

#endif // _DUIMA_H_