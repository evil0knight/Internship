// motor_driver.h
#ifndef MOTOR_DRIVER_H
#define MOTOR_DRIVER_H

#include "SYSCFG.h"

typedef unsigned int  uint16_t;

#define MOTOR_MAX_RUN_MS  5000  // 5秒超时 (卡住判断)

typedef enum {
    MOTOR_ST_UNKNOWN = 0,
    MOTOR_ST_OPENED,
    MOTOR_ST_CLOSED,
    MOTOR_ST_OPENING,
    MOTOR_ST_CLOSING,
    MOTOR_ST_JAMMED
} MotorState_t;

typedef struct {
    MotorState_t current_state;
    uint16_t     running_ms;
    void (*hw_open)(void);
    void (*hw_close)(void);
    void (*hw_stop)(void);
    void (*on_jammed_error)(void);
    void (*on_arrived)(void);
} Motor_Obj_t;

void Motor_Init(Motor_Obj_t *motor,
                void (*hw_open)(void), void (*hw_close)(void), void (*hw_stop)(void),
                void (*on_error)(void), void (*on_arrived)(void));
void Motor_Open(Motor_Obj_t *motor);
void Motor_Close(Motor_Obj_t *motor);
void Motor_Arrived(Motor_Obj_t *motor);
void Motor_Stop_And_Clear(Motor_Obj_t *motor);
void Motor_Timer_Task(Motor_Obj_t *motor);  // 放在1ms定时器中断里调用

#endif
