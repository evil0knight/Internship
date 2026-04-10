// motor_driver.c
#include "motor_driver.h"
#include "hal.h"

void Motor_Init(Motor_Obj_t *motor,
                void (*hw_open)(void), void (*hw_close)(void), void (*hw_stop)(void),
                void (*on_error)(void), void (*on_arrived)(void))
{
    motor->current_state   = MOTOR_ST_UNKNOWN;
    motor->running_ms      = 0;
    motor->hw_open         = hw_open;
    motor->hw_close        = hw_close;
    motor->hw_stop         = hw_stop;
    motor->on_jammed_error = on_error;
    motor->on_arrived      = on_arrived;
    if (motor->hw_stop) motor->hw_stop();
}

void Motor_Open(Motor_Obj_t *motor)
{
    if (!motor) return;
    if (motor->current_state == MOTOR_ST_OPENED) return;
    motor->current_state = MOTOR_ST_OPENING;
    motor->running_ms    = 0;
    if (motor->hw_open) motor->hw_open();
}

void Motor_Close(Motor_Obj_t *motor)
{
    if (!motor) return;
    if (motor->current_state == MOTOR_ST_CLOSED) return;
    motor->current_state = MOTOR_ST_CLOSING;
    motor->running_ms    = 0;
    if (motor->hw_close) motor->hw_close();
}

void Motor_Arrived(Motor_Obj_t *motor)
{
    if (!motor) return;
    if (motor->hw_stop) motor->hw_stop();
    if (motor->current_state == MOTOR_ST_OPENING)
        motor->current_state = MOTOR_ST_OPENED;
    else if (motor->current_state == MOTOR_ST_CLOSING)
        motor->current_state = MOTOR_ST_CLOSED;
    motor->running_ms = 0;
    if (motor->on_arrived) motor->on_arrived();
}

void Motor_Stop_And_Clear(Motor_Obj_t *motor)
{
    if (!motor) return;
    if (motor->hw_stop) motor->hw_stop();
    motor->current_state = MOTOR_ST_UNKNOWN;
    motor->running_ms    = 0;
}

void Motor_Timer_Task(Motor_Obj_t *motor)
{
    if (!(motor->current_state == MOTOR_ST_OPENING ||
          motor->current_state == MOTOR_ST_CLOSING))
        return;

    motor->running_ms++;

    if (OPENP == 0 || CLOSEP == 0) {
        Motor_Arrived(motor);
    } else if (motor->running_ms >= MOTOR_MAX_RUN_MS) {
        Motor_Stop_And_Clear(motor);
        if (motor->on_jammed_error) motor->on_jammed_error();
    }
}
