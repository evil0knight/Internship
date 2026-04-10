// led_driver.h
#ifndef LED_DRIVER_H
#define LED_DRIVER_H

#include "SYSCFG.h"

typedef unsigned int uint16_t;

typedef struct {
    uint16_t remain_blink_ms;
    uint16_t toggle_tick;
    uint16_t blink_interval_ms;
    void (*hw_on)(void);
    void (*hw_off)(void);
    void (*hw_toggle)(void);
} LED_Obj_t;

void LED_Init(LED_Obj_t *led, void (*on)(void), void (*off)(void), void (*toggle)(void));
void LED_On(LED_Obj_t *led);
void LED_Off(LED_Obj_t *led);
void LED_StartBlink(LED_Obj_t *led, uint16_t total_ms, uint16_t interval_ms);
void LED_Process_1ms(LED_Obj_t *led);  // 放在1ms定时器中断里调用

#endif
