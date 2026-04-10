#include "HT67F2362A.h"

typedef struct{

	unsigned char bit0 : 1;	
	unsigned char bit1 : 1;	
	unsigned char bit2 : 1;	
	unsigned char bit3 : 1;	
	unsigned char bit4 : 1;	
	unsigned char bit5 : 1;	
	unsigned char bit6 : 1;
	unsigned char bit7 : 1;		
}iar_bits;

DEFINE_SFR(iar_bits, iar1, 0x02);

#define iar1_4 iar1.bit4
#define iar1_3 iar1.bit3
#define iar1_2 iar1.bit2
#define iar1_1 iar1.bit1
#define iar1_0 iar1.bit0

#define iar1_5 iar1.bit5	// 数据EEPROM 擦控制位
#define iar1_6 iar1.bit6	// 数据EEPROM 擦使能位


//存储容量1024*8位
//地址寄存器EEAL(bit7~0)和EEAH(bit1~0)，地址10位，高6位是页位置，低4位是实际地址，一页包含16个字节
//数据寄存器EED
//控制寄存器EEC，仅可通过MP1L/MP1H 和IAR1 或MP2L/MP2H 和IAR2 进行间接读取或写入，
//在EEC 寄存器上的任何操作被执行前，MP1L 或MP2L 必须先设为“40H”，MP1H 或MP2H 被设为“01H”。

// 读取一个字节数据
unsigned char EEPROM_ReadByte(unsigned char src)
{
	unsigned char data;
	//iar1_4 = 0;		//clear MODE bit, select byte operation mode字节操作模式
	
	_mp1l = 0x40;	//setup memory pointer low byte MP1L, MP1 points to EEC register
	_mp1h = 0x01;	//setup memory pointer high byte MP1H

	_eeal = src;	//放入需读取数据的地址
	_eeah = 0;
	
	iar1_1 = 1;		//set RDEN bit, enable read operations使能数据读取
	iar1_0 = 1;		//start Read Cycle - set RD bit  开始读周期
	while(iar1_0);	//check for read cycle end
	
	data = _eed;	//move read data to register
	
//	_mp1h = 0x00;	//disable EEPROM read function
//	_iar1 = 0x00;
	
	return data;
}

// 以src为起始地址，读取n个字节数据，并存储至dest地址位置
void EEPROM_ReadBytes(unsigned char *dest, unsigned char src, unsigned char n)
{
	iar1_4 = 0;
	unsigned char i = 0;
	for(; i < n; i++)
	{
		*dest++ = EEPROM_ReadByte(src + i);	
	}	
}

// 写入一个字节数据
void EEPROM_WriteByte(unsigned char dest, unsigned char data)
{
	_mp1l = 0x40;
	_mp1h = 0x01;
	
	//iar1_4 = 0;			// clear MODE bit, select byte operation mode
	
	_eeal = dest;		// user defined low byte address
	_eeah = 0;			// user defined high byte address
	_eed  = data;		// user defined data
	
	_emi = 0;			// 总中断使能位EMI清零
	iar1_3 = 1;			// set WREN bit, enable write operations
	iar1_2 = 1;			// start Write Cycle - set WR bit – executed immediately after setting WREN bit
	_emi = 1;			// 总中断使能位EMI置1
	while(iar1_2);		// check for write cycle end
	
	_mp1h = 0;
	_eed = 0;
}

void EEPROM_WriteBytes(unsigned char dest, unsigned char *src, unsigned char n)   //把n个元素的src数组写入地址dest
{
	int i;
	iar1_4 = 0;
	for(i = 0; i < n; i++)
	{
		EEPROM_WriteByte(dest + i, src[i]);		
	}
}

unsigned int EEPROM_Read_Master_Address(void)
{
     unsigned int temp=0;
     unsigned char address[2]={0};
     EEPROM_ReadBytes(address, 0x00, 2);
     temp=address[0];
     temp<<=8;
     temp|=address[1];
     return temp;
}



