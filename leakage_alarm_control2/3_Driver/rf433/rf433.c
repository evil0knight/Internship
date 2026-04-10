// rf433.c - 433MHz 编码接收解码
// 算法来源：英芯泰资料 main接收.c
// TMR0 周期 90us，采样 PB7 (RF433_PIN)
#include "rf433.h"
#include "hal.h"
#include "../3_Driver/led/led_driver.h"
extern LED_Obj_t g_led1;
extern LED_Obj_t g_led2;

// ---- 内部状态 (绝对地址，避免编译器优化) ----
__at(0x20) static unsigned char flag;
#define bit_rf_ok      (flag & 0x01)
#define bit_last_state (flag & 0x02)
#define bit_syn        (flag & 0x04)

#define SET_rf_ok()      (flag |= 0x01)
#define CLR_rf_ok()      (flag &= ~0x01)
#define SET_last_high()  (flag |= 0x02)
#define CLR_last_high()  (flag &= ~0x02)
#define SET_syn()        (flag |= 0x04)
#define CLR_syn()        (flag &= ~0x04)

__at(0x21) static unsigned char a_code1;
__at(0x22) static unsigned char a_code2;
__at(0x23) static unsigned char a_code3;
__at(0x24) static unsigned char hh_w;
__at(0x25) static unsigned char ll_w;
__at(0x26) static unsigned char t_code1;
__at(0x27) static unsigned char t_code2;
__at(0x28) static unsigned char t_code3;
__at(0x29) static unsigned char ma_x;
__at(0x2A) static unsigned char pre_cnt;
#define PRE_CNT_MIN  5   // 连续5个前导码脉冲才认为有效

static unsigned int s;

// ---- 公开变量 (volatile: ISR写/主循环读，必须加) ----
volatile unsigned char rf_data[3]    = {0};
volatile unsigned char rf_data_ready = 0;

void RF433_Init(void)
{
    flag = 0;
    hh_w = 0; ll_w = 0;
    t_code1 = 0; t_code2 = 0; t_code3 = 0;
    ma_x = 0; s = 0;
    pre_cnt = 0;

    // TIM1: 90us 中断
    // FT61FC4X TIM1 时钟源: HIRC = 32MHz (固有频率, 由 TCKSRC Bit[2:1]=01 选择)
    // 注意: 系统时钟 8MHz ≠ TIM1 时钟, HIRC 振荡器本身跑 32MHz
    // 验证: 官方例程 ARR=1000 产生 16kHz 方波 → 1001/31.25us = 32MHz
    // ARR = 90us × 32MHz - 1 = 2880 - 1 = 2879 = 0x0B3F
    PCKEN   |= 0B00000010;      // 使能 TIM1 时钟模块
    CKOCON   = 0B00100000;      // 时钟输出配置（官方例程原值）
    TCKSRC   = 0B00000011;      // TIM1 时钟源: HIRC = 32MHz (Bit[2:1]=01)
    TIM1CR1  = 0B10000100;      // 自动预装载, 向上计数, 暂不使能(CEN=0)
    TIM1SR1  = 0;               // 清除所有中断标志，防止上电残留
    TIM1IER  = 0B00000001;      // 使能更新中断
    T1UIE    = 1;               // 使能 TIM1 更新中断（INTCON2 位）
    TIM1ARRH = 0x0B;            // ARR = 2879 (0x0B3F): HIRC=32MHz, 2880*31.25ns=90us
    TIM1ARRL = 0x3F;
    TIM1CR1  = 0B10000101;      // 现在使能计数器(CEN=1), ARR已就绪
    GIE      = 1;
}

// 内部：将第 bit_idx 位置1到临时编码
static void set_bit(unsigned char bit_idx)
{
    unsigned char mask = (unsigned char)(0x80 >> (bit_idx & 0x07));
    if (bit_idx < 8)       t_code1 |= mask;
    else if (bit_idx < 16) t_code2 |= (unsigned char)(0x80 >> ((bit_idx - 8) & 0x07));
    else                   t_code3 |= (unsigned char)(0x80 >> ((bit_idx - 16) & 0x07));
}

static void save_code(void)
{
    a_code1 = t_code1;
    a_code2 = t_code2;
    a_code3 = t_code3;
    SET_rf_ok();
    CLR_syn();
    s = 1000;
}

void RF433_ISR(void)
{
    //EN=(EN==1)?0:1;
    // 1. 脉宽检测
    if (PB7 == 0) {
        ll_w++;
        CLR_last_high();
    } else {
        
        hh_w++;
        if (!(bit_last_state)) {
            //上升沿：处理上一个低电平脉宽
            if ((hh_w >= 2 && hh_w <= 5) && (ll_w >= 15 && ll_w <= 25)) {
                // 前导码脉冲：累计计数，AGC锁定阶段
                if (pre_cnt < 255) pre_cnt++;
                //LED_On(&g_led1);  // 前导码匹配即亮
            } else if (
                        (pre_cnt >= PRE_CNT_MIN)
                        &&
                       (hh_w >= 2 && hh_w <= 5) && (ll_w >= 80 && ll_w <= 165)
                    ) {
                // 同步码（必须在足够前导码之后才接受）
                // 窗口 [80,165] 覆盖发送端 delay_us 在 T_iter=[22.5~37.5us] 范围内的变动
                SET_syn();
                pre_cnt = 0;
                //LED_On(&g_led2);
                ma_x = 0;
                t_code1 = 0; t_code2 = 0; t_code3 = 0;
            } else if ((bit_syn) && (ll_w >= 7 && ll_w <= 13)) {
                // 逻辑 0
                ma_x++;
                if (ma_x > 23) {
                    if (!bit_rf_ok) save_code();
                }
            } else if ((bit_syn) && (ll_w >= 2 && ll_w <= 7)) {
                // 逻辑 1
                if (ma_x <= 23) {
                    set_bit(ma_x);
                    if (ma_x == 23) {
                        if (!bit_rf_ok) save_code();
                    }
                    ma_x++;
                }
            } else {
                // 干扰，全部重置（包括前导码计数）
                pre_cnt = 0;
                ma_x = 0; CLR_syn();
                t_code1 = 0; t_code2 = 0; t_code3 = 0;
                ll_w = 0;
            }
            ll_w = 0;
            hh_w = 1;
        }
        SET_last_high();
    }

    // 2. 单重认证倒计时
    if (bit_rf_ok) {
        s--;
        if (!s) {
            CLR_rf_ok();
        }
        //LED_On(&g_led1);
        rf_data[0] = a_code1;
        rf_data[1] = a_code2;
        rf_data[2] = a_code3;
        rf_data_ready = 1;
    }

    // 3. 清中断标志 (TIM1 写1清零)
    T1UIF = 1;
}
