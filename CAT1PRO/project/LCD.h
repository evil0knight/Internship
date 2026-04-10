#include "HT67F2362A.h"

#ifndef _LCD_H_
#define _LCD_H_

//定义LCDRam联合体，sbt是位域结构声明，其中例如com0只占1bit
typedef union
{
	struct 
	{
		unsigned char b0:1;	//com0-1bit
		unsigned char b1:1;	//com1
		unsigned char b2:1;	//com2
		unsigned char b3:1;	//com3
		unsigned char b4:4;
	} sbt ;
}LCDRam;


//__attribute__(at(绝对地址))的作用分两个，一个是绝对定位到Flash，另个一是绝对定位到RAM
static volatile LCDRam seg0  __attribute__((at(0x41B)));
static volatile LCDRam seg1  __attribute__((at(0x41A)));
static volatile LCDRam seg2  __attribute__((at(0x419)));
static volatile LCDRam seg3  __attribute__((at(0x416)));

static volatile LCDRam seg4  __attribute__((at(0x415)));
static volatile LCDRam seg5  __attribute__((at(0x414)));
static volatile LCDRam seg6  __attribute__((at(0x413)));
static volatile LCDRam seg7  __attribute__((at(0x412)));

static volatile LCDRam seg8   __attribute__((at(0x411)));
static volatile LCDRam seg9   __attribute__((at(0x410)));
static volatile LCDRam seg10  __attribute__((at(0x40f)));
static volatile LCDRam seg11  __attribute__((at(0x40e)));

static volatile LCDRam seg12  __attribute__((at(0x40d)));
static volatile LCDRam seg13  __attribute__((at(0x40c)));
static volatile LCDRam seg14  __attribute__((at(0x40b)));
static volatile LCDRam seg15  __attribute__((at(0x40a)));

static volatile LCDRam seg16  __attribute__((at(0x409)));
static volatile LCDRam seg17  __attribute__((at(0x408)));
static volatile LCDRam seg18  __attribute__((at(0x407)));
static volatile LCDRam seg19  __attribute__((at(0x406)));

static volatile LCDRam seg20  __attribute__((at(0x405)));
static volatile LCDRam seg21  __attribute__((at(0x404)));
static volatile LCDRam seg22  __attribute__((at(0x403)));
static volatile LCDRam seg23  __attribute__((at(0x402)));


#define s25			seg0.sbt.b0	
#define s24			seg0.sbt.b1	
#define s23			seg0.sbt.b2
#define s22			seg0.sbt.b3	 

#define s26			seg1.sbt.b0	
#define s27			seg1.sbt.b1	
#define s28			seg1.sbt.b2
#define s29			seg1.sbt.b3 

#define s33			seg2.sbt.b0	
#define s32			seg2.sbt.b1	
#define s31			seg2.sbt.b2
#define s30			seg2.sbt.b3 

#define s34			seg3.sbt.b0	
#define s35			seg3.sbt.b1	
#define s36			seg3.sbt.b2
#define s37			seg3.sbt.b3                      

#define s41			seg4.sbt.b0	
#define s40			seg4.sbt.b1	
#define s39			seg4.sbt.b2
#define s38			seg4.sbt.b3  

#define s42			seg5.sbt.b0	
#define s43			seg5.sbt.b1	
#define s44			seg5.sbt.b2
#define s45			seg5.sbt.b3 

#define s49			seg6.sbt.b0	
#define s48			seg6.sbt.b1	
#define s47			seg6.sbt.b2
#define s46			seg6.sbt.b3

#define s50			seg7.sbt.b0	
#define s51			seg7.sbt.b1	
#define s52			seg7.sbt.b2
#define s53			seg7.sbt.b3 

#define s57			seg8.sbt.b0	
#define s56			seg8.sbt.b1	
#define s55			seg8.sbt.b2
#define s54			seg8.sbt.b3 

#define s61			seg9.sbt.b0	
#define s58			seg9.sbt.b1	
#define s59			seg9.sbt.b2
#define s60			seg9.sbt.b3

#define s4			seg10.sbt.b0	
#define s3			seg10.sbt.b1	
#define s2			seg10.sbt.b2
#define s1			seg10.sbt.b3

#define s5			seg11.sbt.b0	
#define s6			seg11.sbt.b1	
#define s7			seg11.sbt.b2
#define s8			seg11.sbt.b3

#define s12			seg12.sbt.b0	
#define s11			seg12.sbt.b1	
#define s10			seg12.sbt.b2
#define s9			seg12.sbt.b3

#define s13			seg13.sbt.b0	
#define s14			seg13.sbt.b1	
#define s15			seg13.sbt.b2
#define s16			seg13.sbt.b3

#define s20			seg14.sbt.b0	
#define s19			seg14.sbt.b1	
#define s18			seg14.sbt.b2
#define s17			seg14.sbt.b3

#define K1			seg15.sbt.b0	
#define K2			seg15.sbt.b1	
#define K4			seg15.sbt.b2
#define K3			seg15.sbt.b3

#define C4			seg16.sbt.b0	
#define G4			seg16.sbt.b1	
#define B4			seg16.sbt.b2
#define s94			seg16.sbt.b3

#define D4			seg17.sbt.b0	
#define E4			seg17.sbt.b1	
#define F4			seg17.sbt.b2
#define A4			seg17.sbt.b3

#define C3			seg18.sbt.b0	
#define G3			seg18.sbt.b1	
#define B3			seg18.sbt.b2
#define s95			seg18.sbt.b3

#define D3			seg19.sbt.b0	
#define E3			seg19.sbt.b1	
#define F3			seg19.sbt.b2
#define A3			seg19.sbt.b3

#define C2			seg20.sbt.b0	
#define G2			seg20.sbt.b1	
#define B2			seg20.sbt.b2
#define COL			seg20.sbt.b3

#define D2			seg21.sbt.b0	
#define E2			seg21.sbt.b1	
#define F2			seg21.sbt.b2
#define A2			seg21.sbt.b3

#define D1			seg22.sbt.b0	
#define C1			seg22.sbt.b1	
#define B1			seg22.sbt.b2
#define A1			seg22.sbt.b3

#define s21			seg23.sbt.b0	
#define E1			seg23.sbt.b1	
#define G1			seg23.sbt.b2
#define F1			seg23.sbt.b3


//原地址左移4位，后面4位偏移由下面的BITx补上
#define SEG0 	(0x41B << 4)
#define SEG1 	(0x41A << 4)
#define SEG2 	(0x419 << 4)
#define SEG3	(0x416 << 4)
#define SEG4	(0x415 << 4)
#define SEG5	(0x414 << 4)
#define SEG6	(0x413 << 4)
#define SEG7	(0x412 << 4)
#define SEG8	(0x411 << 4)
#define SEG9	(0x410 << 4)
#define SEG10	(0x40f << 4)
#define SEG11	(0x40e << 4)
#define SEG12	(0x40d << 4)
#define SEG13	(0x40c << 4)
#define SEG14	(0x40b << 4)
#define SEG15	(0x40a << 4)
#define SEG16	(0x409 << 4)
#define SEG17	(0x408 << 4)
#define SEG18	(0x407 << 4)
#define SEG19	(0x406 << 4)
#define SEG20	(0x405 << 4)
#define SEG21	(0x404 << 4)
#define SEG22	(0x403 << 4)
#define SEG23	(0x402 << 4)


//bit0-com1地址位置-0，以此类推
#define BIT0  (0)
#define BIT1  (1)
#define BIT2  (2)
#define BIT3  (3)

void LCD_Init(void);
void LCD_Hour_High_Show(unsigned char A);
void LCD_Hour_Low_Show(unsigned char A);
void LCD_Minute_High_Show(unsigned char A);
void LCD_Minute_Low_Show(unsigned char A);
void LCD_Show_Time(unsigned int val);
void LCD_Clear_Time(void);
void LCD_Show_Bind(unsigned char value);
void LCD_Show_WIFI(unsigned char value);
void LCD_Show_Power(unsigned char value);
void LCD_Show_Angle(int angle);
void LCD_Time_Flash();                   //控制圆盘最前端线条闪烁
void LCD_Bind_Check(void);
void LCD_WIFI_Check(void); 
void LCD_Power_Check(void);

#endif