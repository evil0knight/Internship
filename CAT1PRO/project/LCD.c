#include "HT67F2362A.h"
#include "LCD.h"
#include "Data.h"
#include "Delay.h"
#include "UART0_433MHZ.h"
#include "UART1_WIFI.h"

unsigned int angles[60];	                               //整圈被分为60段，数组里存储的是地址

void LCD_Init(void)
{
	unsigned int start;
	unsigned int end;
	//存储控制LCD显示内容的开始地址与结束地址
	end     = 0x41B;
	start   = 0x402;
	
	//LCD使能控制
	_lcden = 1;
	
	//LCD波形类型选择
	_type  = 1; 	//A TYPE（相对B为高频率信号）
	
	//LCD占空比选择，决定使用COM口的个数:3个
	_dtyc0 = 0;
	_dtyc1 = 0;
	
	//LCD偏压选择
	_bias  = 0;		//1/3 bias
	
	_rct=0;
	
	//选择内部总偏压电阻，为LCD提供合适的偏置电流
	_rsel0=0;		//快速充电模式 – 在60kΩ 和225kΩ 间切换
	_rsel1=1;
	_rsel2=0;
	
	//R型快速充电时间选择
	_qct0=0;		//快速充电时间1*tsub
	_qct1=0;
	_qct2=0;
	
	//Va节点的R型偏压电源选择
	_plcd0=1;
	_plcd1=1;
	_plcd2=1;
	_plcd3=1;
	
	/*引脚初始化*/
	/*COM*/
	_pgs0 |= (0b11111111);	// PG0 ~ PG3 引脚选择为 COM0 ~ COM3
	
	/*SEG*/
	/* seg 引脚共用选择为SEG
	 * pd6  pb3  pa5  pf0  pj1  pe2  pg5
	 * pb0  pa1  pa6  pf1  pj0  pe3  pg4
	 * pb1  pa3  pa7  pf2  pe0  pg7  
	 * pb4  pa4  pb2  pf3  pe1  pg6  
	 */
	_pds1 |= (3 << 4);	//SEG27
	_pbs0 |= (3 << 0);	//SEG26
	_pbs0 |= (3 << 2);	//SEG25
	_pbs1 |= (3 << 0);	//SEG22
	
	_pbs0 |= (3 << 6);	//SEG21
	_pas0 |= (3 << 2);	//SEG20
	_pas0 |= (3 << 6);	//SEG19
	_pas1 |= (3 << 0);	//SEG18
	
	_pas1 |= (3 << 2);	//SEG17
	_pas1 |= (3 << 4);	//SEG16
	_pas1 |= (3 << 6);	//SEG15
	_pbs0 |= (3 << 4);	//SEG14
	
	_pfs0 |= (3 << 0);	//SEG13
	_pfs0 |= (3 << 2);	//SEG12
	_pfs0 |= (3 << 4);	//SEG11
	_pfs0 |= (3 << 6);	//SEG10
	
	_pjs0 |= (3 << 2);	//SEG9
	_pjs0 |= (3 << 0);	//SEG8
	_pes0 |= (3 << 0);	//SEG7
	_pes0 |= (3 << 2);	//SEG6
	
	_pes0 |= (3 << 4);	//SEG5
	_pes0 |= (3 << 6);	//SEG4
	_pgs1 |= (3 << 6);	//SEG3
	_pgs1 |= (3 << 4);	//SEG2
		
	while(start <= end)
	{
		*(unsigned char*)(start) =0x0;		//熄灭
		start = start + 1;
	}
	
	COL = 1;	//其他 logo
	s94 = 1;	//设备连接 logo
	s95 = 1;	//WiFi logo
	K1  = 1;	//电量框 logo
	s61 = 1;	//双马水控 logo
	
	//SEG地址与偏移量合成一个新地址
	angles[0] = SEG10 | BIT3;
	angles[1] = SEG10 | BIT2;
	angles[2] = SEG10 | BIT1;
	angles[3] = SEG10 | BIT0;
	
	angles[4] = SEG11 | BIT0;
	angles[5] = SEG11 | BIT1;
	angles[6] = SEG11 | BIT2;
	angles[7] = SEG11 | BIT3;
	
	angles[8]  = SEG12  | BIT3;
	angles[9]  = SEG12  | BIT2;
	angles[10] = SEG12  | BIT1;
	angles[11] = SEG12  | BIT0;
	
	angles[12] = SEG13  | BIT0;
	angles[13] = SEG13  | BIT1;
	angles[14] = SEG13  | BIT2;
	angles[15] = SEG13  | BIT3;
	
	angles[16] = SEG14  | BIT3;
	angles[17] = SEG14  | BIT2;
	angles[18] = SEG14  | BIT1;
	angles[19] = SEG14  | BIT0;
	
	angles[20] = SEG23  | BIT0;
	
	angles[21] = SEG0  | BIT3;
	angles[22] = SEG0  | BIT2;
	angles[23] = SEG0  | BIT1;	
	angles[24] = SEG0  | BIT0;
	
	angles[25] = SEG1  | BIT0;
	angles[26] = SEG1  | BIT1;
	angles[27] = SEG1  | BIT2;
	angles[28] = SEG1  | BIT3;
	
	angles[29] = SEG2  | BIT3;
	angles[30] = SEG2  | BIT2;
	angles[31] = SEG2  | BIT1;
	angles[32] = SEG2  | BIT0;
	
	angles[33] = SEG3  | BIT0;
	angles[34] = SEG3  | BIT1;
	angles[35] = SEG3  | BIT2;
	angles[36] = SEG3  | BIT3;
	
	angles[37] = SEG4  | BIT3;
	angles[38] = SEG4  | BIT2;
	angles[39] = SEG4  | BIT1;
	angles[40] = SEG4  | BIT0;
	
	angles[41] = SEG5  | BIT0;
	angles[42] = SEG5  | BIT1;
	angles[43] = SEG5  | BIT2;
	angles[44] = SEG5  | BIT3;
	
	angles[45] = SEG6  | BIT3;
	angles[46] = SEG6  | BIT2;
	angles[47] = SEG6  | BIT1;
	angles[48] = SEG6  | BIT0;
	
	angles[49] = SEG7  | BIT0;
	angles[50] = SEG7  | BIT1;
	angles[51] = SEG7  | BIT2;
	angles[52] = SEG7  | BIT3;
	
	angles[53] = SEG8  | BIT3;
	angles[54] = SEG8  | BIT2;
	angles[55] = SEG8  | BIT1;
	angles[56] = SEG8  | BIT0;
	
	angles[57] = SEG9  | BIT1;
	angles[58] = SEG9  | BIT2;
	angles[59] = SEG9  | BIT3;
}

//清空时位的高位
void LCD_Hour_High_Clear(void)
{
	A1 = 0; B1 = 0; C1 = 0; D1 = 0; E1 = 0; F1 = 0; G1 = 0;
}

//清空时位的低位
void LCD_Hour_Low_Clear(void)
{
	A2 = 0; B2 = 0; C2 = 0; D2 = 0; E2 = 0; F2 = 0; G2 = 0;
}

//清空分位的高位
void LCD_Minute_High_Clear(void)
{
	A3 = 0; B3 = 0; C3 = 0; D3 = 0; E3 = 0; F3 = 0; G3 = 0;
}

//清空分位的低位
void LCD_Minute_Low_Clear(void)
{
	A4 = 0; B4 = 0; C4 = 0; D4 = 0; E4 = 0; F4 = 0; G4 = 0;
}

//时位高位(输入0-9的数字，对应显示0-9)
void LCD_Hour_High_Show(unsigned char A)
{
	LCD_Hour_High_Clear();
	switch(A)
	{
		case 1: 
		{B1 = 1;C1 = 1;}
		break;
		case 2:
		{A1 = 1; B1 = 1; G1 = 1; E1 = 1; D1 = 1;}
		break;
		case 3:
		{A1 = 1; B1 = 1; G1 = 1; C1 = 1; D1 = 1;}
		break;
		case 4:
		{F1 = 1; G1 = 1; B1 = 1; C1 = 1;}
		break;
		case 5:
		{A1 = 1;F1 = 1; G1 = 1; C1 = 1; D1 = 1;}
		break;
		case 6:
		{A1 = 1; F1 = 1; G1 = 1; C1 = 1; D1 = 1; E1 = 1;}
		break;
		case 7:
		{A1 = 1; B1 = 1; C1 = 1;}
		break;
		case 8:
		{A1 = 1; B1 = 1; C1 = 1; D1 = 1; E1 = 1; F1 = 1; G1 = 1;}
		break;
		case 9:
		{A1 = 1; B1 = 1; C1 = 1; D1 = 1; G1 = 1;F1 = 1;}
		break;
		case 0:
		{A1 = 1; B1 = 1; C1 = 1; D1 = 1; E1 = 1; F1 = 1;}
	}
}  
                          
                        
//时位低位(输入0-9的数字，对应显示0-9)                    
void LCD_Hour_Low_Show(unsigned char A)
{
 	LCD_Hour_Low_Clear();
	switch(A)
	{
		case 1: 
		{B2 = 1;C2 = 1;}
		break;
		case 2:
		{A2 = 1; B2 = 1; G2 = 1; E2 = 1; D2 = 1;}
		break;
		case 3:
		{A2 = 1; B2 = 1; G2 = 1; C2 = 1; D2 = 1;}
		break;
		case 4:
		{F2 = 1; G2 = 1; B2 = 1; C2 = 1;}
		break;
		case 5:
		{A2 = 1;F2 = 1; G2 = 1; C2 = 1; D2 = 1;}
		break;
		case 6:
		{A2 = 1; F2 = 1; G2 = 1; C2 = 1; D2 = 1; E2 = 1;}
		break;
		case 7:
		{A2 = 1; B2 = 1; C2 = 1;}
		break;
		case 8:
		{A2 = 1; B2 = 1; C2 = 1; D2 = 1; E2 = 1; F2 = 1; G2 = 1;}
		break;
		case 9:
		{A2 = 1; B2 = 1; C2 = 1; D2 = 1; G2 = 1;F2 = 1;}
		break;
		case 0:
		{A2 = 1; B2 = 1; C2 = 1; D2 = 1; E2 = 1; F2 = 1;}
	}
}                      
                        

//分位高位(输入0-9的数字，对应显示0-9)                        
void LCD_Minute_High_Show(unsigned char A)
{
	LCD_Minute_High_Clear();
	switch(A)
	{
		case 1: 
		{B3 = 1;C3 = 1;}
		break;
		case 2:
		{A3 = 1; B3 = 1; G3 = 1; E3 = 1; D3 = 1;}
		break;
		case 3:
		{A3 = 1; B3 = 1; G3 = 1; C3 = 1; D3 = 1;}
		break;
		case 4:
		{F3 = 1; G3 = 1; B3 = 1; C3 = 1;}
		break;
		case 5:
		{A3 = 1;F3 = 1; G3 = 1; C3 = 1; D3 = 1;}
		break;
		case 6:
		{A3 = 1; F3 = 1; G3 = 1; C3 = 1; D3 = 1; E3 = 1;}
		break;
		case 7:
		{A3 = 1; B3 = 1; C3 = 1;}
		break;
		case 8:
		{A3 = 1; B3 = 1; C3 = 1; D3 = 1; E3 = 1; F3 = 1; G3 = 1;}
		break;
		case 9:
		{A3 = 1; B3 = 1; C3 = 1; D3 = 1; G3 = 1;F3 = 1;}
		break;
		case 0:
		{A3 = 1; B3 = 1; C3 = 1; D3 = 1; E3 = 1; F3 = 1;}
	}

}                                             
                         
  
//分位低位(输入0-9的数字，对应显示0-9)                      
void LCD_Minute_Low_Show(unsigned char A)
{
	LCD_Minute_Low_Clear();
	switch(A)
	{
		case 1: 
		{B4 = 1;C4 = 1;}
		break;
		case 2:
		{A4 = 1; B4 = 1; G4 = 1; E4 = 1; D4 = 1;}
		break;
		case 3:
		{A4 = 1; B4 = 1; G4 = 1; C4 = 1; D4 = 1;}
		break;
		case 4:
		{F4 = 1; G4 = 1; B4 = 1; C4 = 1;}
		break;
		case 5:
		{A4 = 1;F4 = 1; G4 = 1; C4 = 1; D4 = 1;}
		break;
		case 6:
		{A4 = 1; F4 = 1; G4 = 1; C4 = 1; D4 = 1; E4 = 1;}
		break;
		case 7:
		{A4 = 1; B4 = 1; C4 = 1;}
		break;
		case 8:
		{A4 = 1; B4 = 1; C4 = 1; D4 = 1; E4 = 1; F4 = 1; G4 = 1;}
		break;
		case 9:
		{A4 = 1; B4 = 1; C4 = 1; D4 = 1; G4 = 1;F4 = 1;}
		break;
		case 0:
		{A4 = 1; B4 = 1; C4 = 1; D4 = 1; E4 = 1; F4 = 1;}
	}
}     

//LCD刷新显示定时时间(输入分钟)
void LCD_Show_Time(unsigned int val)
{
	unsigned char hour;
	unsigned char min;
	unsigned char hour_h;	//时位的高位

	hour = val / 60;
	min  = val % 60;
	
	hour_h = hour / 10;
	
	if(hour_h == 0)
		LCD_Hour_High_Clear();		//小时位只有1位数时，高位不显示
	else
		LCD_Hour_High_Show(hour_h);
		
	LCD_Hour_Low_Show(hour % 10);
	LCD_Minute_High_Show(min / 10);
	LCD_Minute_Low_Show(min % 10);
}        

//LCD清空定时时间
void LCD_Clear_Time(void)
{
//清空时位的高位
	LCD_Hour_High_Clear();
//清空时位的低位
	LCD_Hour_Low_Clear();
//清空分位的高位
	LCD_Minute_High_Clear();
//清空分位的低位
	LCD_Minute_High_Clear();
}              

//显示绑定状态  1---点亮  0---熄灭
void LCD_Show_Bind(unsigned char value)
{
	switch(value)
	{
		case BIND_STATE_CONNECTED:
		s94 = 1;
		break;
		
		case BIND_STATE_DISCONNECTED:
		s94 = 0;
		break;
	}	
}

void LCD_Bind_Check(void)                                   //绑定logo检测函数,1s执行一次
{
	 static unsigned char Bind_Count=0;                     //绑定中闪烁计时
     if(UART0_433MHz_Pairing_Code_Flag==1)                  //对码过程中更改绑定状态为绑定中并先熄灭绑定logo
     {
     	data.Bind_State=BIND_STATE_BINDING;                               
     }
     if(data.Bind_State==BIND_STATE_BINDING)                //绑定中闪烁
     {
        static unsigned char Current_Bind_State=0;          //闪烁
        Bind_Count++;
        if(Bind_Count<=10)                                  //闪烁10s
        {
        	LCD_Show_Bind(Current_Bind_State);                   
            Current_Bind_State=!Current_Bind_State;	        //状态切换
        }
        else                                                //10s后仍为绑定中强制转为未绑定
        {
        	data.Bind_State=BIND_STATE_DISCONNECTED;
        	Bind_Count=0;	                                //重置绑定中闪烁计时
        }
        
     }
     else if(data.Bind_State==BIND_STATE_CONNECTED)	        //绑定状态点亮
     {
     	LCD_Show_Bind(1);
     }
     else if(data.Bind_State==BIND_STATE_DISCONNECTED)      //未绑定状态熄灭
     {
     	LCD_Show_Bind(0);
     }
}

//显示WiFi状态
void LCD_Show_WIFI(unsigned char value)
{
	switch(value)
	{
		case WIFI_STATE_CONNECTED:
		s95 = 1;
		break;
		
		case WIFI_STATE_DISCONNECTED:
		s95 = 0;
		break;
	}	
}

void LCD_WIFI_Check(void)                               //WIFI检测函数,1s执行一次
{
	 static unsigned char WIFI_Count=0;                 //绑定中闪烁计时
	 if(UART1_WIFI_Config_Flag==1)                      //配网过程中将WIFI状态设置为配网中
	 {
	    data.WIFI_State=WIFI_STATE_BINDING;
	 }
     if(data.WIFI_State==WIFI_STATE_BINDING)            //配网中闪烁
     {
     	static unsigned char Current_WIFI_State=0;
     	WIFI_Count++;
     	if(WIFI_Count<=10)
     	{
     	   LCD_Show_WIFI(Current_WIFI_State);
     	   Current_WIFI_State=!Current_WIFI_State;
     	}
     	else
     	{ 
     	   data.WIFI_State=WIFI_STATE_DISCONNECTED;
     	   WIFI_Count=0;
     	}
     }
     else if(data.WIFI_State==WIFI_STATE_CONNECTED)     //配网成功状态点亮
     {
     	LCD_Show_WIFI(1);
     }
     else if(data.WIFI_State==WIFI_STATE_DISCONNECTED)  //配网失败状态熄灭
     {
     	LCD_Show_WIFI(0);
     }
}

//显示剩余电量
void LCD_Show_Power(unsigned char value)
{
	switch(value)
	{
		case POWER_0: K4 = 0;K3 = 0;K2 = 0;
		break;
		case POWER_1: K4 = 1;K3 = 0;K2 = 0;
		break;
		case POWER_2: K4 = 1;K3 = 1;K2 = 0;
		break;
		case POWER_3: K4 = 1;K3 = 1;K2 = 1;
		break;
	}
}

void LCD_Power_Check(void)
{
    switch(data.Remaining_Power)
    {
        case POWER_0:LCD_Show_Power(POWER_0);break;
        case POWER_1:LCD_Show_Power(POWER_1);break;
        case POWER_2:LCD_Show_Power(POWER_2);break;
        case POWER_3:LCD_Show_Power(POWER_3);break;
        default:break;	
    }
     	
}


static int current_value = -1;
/*value 1 - 60 */ 
void LCD_Show_Angle(int angle)                    
{
	int loc;
	int offset;
	int i;	
	int value;
	
	if(angle > 59 &&  (angle%60 == 0))
	{
		value = 59;
	}
	else
	{
		value = angle % 60 - 1;							// 模运算，用于圆盘分钟显示，angles数组下标从0开始
	}
	
	if(value >= current_value)
	{	

		for(i = current_value; i <= value; i++)		    //在此前基础上再追加点亮
		{
			loc = angles[i] >> 4;						//还原SEGx地址                  loc储存圆盘单个线条的地址
			offset = angles[i] & 0xf;					//还原其中的偏移量
			*(unsigned char *)loc |= (1 << offset);		//SEGx地址上COM（偏移量）处置为1
		}
	}else if(value < current_value)
	{
		for(i = current_value; i > value; i--)			//在此前基础上熄灭部分屏幕
		{
			loc = angles[i] >> 4;
			offset = angles[i] & 0xf;
			*(unsigned char *)loc &= ~(1 << offset);	//相应位置置0
		}
	}
	current_value = value;								//更新目前值
}

static char flash_status = 1;	                        //LCD中末段闪烁状态：1-亮，0-灭
void LCD_Time_Flash()                                   //控制圆盘最前端线条闪烁
{
	int value;
	int loc;
	int offset;
	
	value = current_value;                              //目前圆盘最前端线条的数值赋值给value
	
	if(flash_status == 1)	                            //阀开且当前闪烁亮            
	{
		loc = angles[value] >> 4;
		offset = angles[value] & 0xf;
		*(unsigned char *)loc &= ~(1 << offset);	    //灭
		flash_status = 0;
	}
	else if(flash_status == 0)
	{
		loc = angles[value] >> 4;
		offset = angles[value] & 0xf;
		*(unsigned char *)loc |= (1 << offset);
		flash_status = 1;
	}
}
                     