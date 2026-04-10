// led_driver.c
#include "led_driver.h"

void LED_Init(LED_Obj_t *led, void (*on)(void), void (*off)(void), void (*toggle)(void))
{
    led->remain_blink_ms   = 0;
    led->toggle_tick       = 0;
    led->blink_interval_ms = 0;
    led->hw_on     = on;
    led->hw_off    = off;
    led->hw_toggle = toggle;
    if (led->hw_off) led->hw_off();
}

void LED_On(LED_Obj_t *led)
{
    if (!led) return;
    led->remain_blink_ms = 0;
    if (led->hw_on) led->hw_on();
}

void LED_Off(LED_Obj_t *led)
{
    if (!led) return;
    led->remain_blink_ms = 0;
    if (led->hw_off) led->hw_off();
}

void LED_StartBlink(LED_Obj_t *led, uint16_t total_ms, uint16_t interval_ms)
{
    if (!led) return;
    led->remain_blink_ms   = total_ms;
    led->blink_interval_ms = interval_ms;
    led->toggle_tick       = 0;
}

void LED_Process_1ms(LED_Obj_t *led)
{
    if (!led || led->remain_blink_ms == 0) return;

    led->remain_blink_ms--;
    led->toggle_tick++;

    if (led->toggle_tick >= led->blink_interval_ms) {
        led->toggle_tick = 0;
        if (led->hw_toggle) led->hw_toggle();
    }

    if (led->remain_blink_ms == 0) {
        led->toggle_tick = 0;
        if (led->hw_off) led->hw_off();
    }
}
