// Project:  FT61FC4X_UART.prj
// Device:   FT61FC4X
// Memory:   PROM=4Kx14, SRAM=0.5KB, EEPROM=128 
// Description: 串口上电发送10个字符，然后等待接收10个字节数据（通过串口助手发送接收）

// RELEASE HISTORY
// VERSION DATE     DESCRIPTION
// 1.1     24-2-2   修改文件头
//OPENP-----PB2
//OPENS----PB1
//CLOSEP----PB0
//CLOSES----PA0
//LED----PA4
//RX----PA7
//TX----PA6
//*********************************************************
#include "SYSCFG.h"
//***********************宏定义****************************
#define  unchar     unsigned char 

#define OPENP       PORTBbits.PB2
#define OPENS       PORTBbits.PB1
#define CLOSEP       PORTBbits.PB0
#define CLOSES       PORTBbits.PA0

#define DATA_TRANS   PORTBbits.PA4

#define KEY          PORTBbits.PB7



#define LED_OFF     PORTBbits.PA1 = 0
#define LED_ON      PORTBbits.PA1 = 1

#define WAKE_UP     PORTCbits.PC1 = 0
#define SLEEP_DN    PORTBbits.PC1 = 1

//const char Freq[]={0x41, 0x54, 0x2B, 0x46, 0x45, 0x51, 0x3D, 0x34, 0x33, 0x34, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x0D, 0x0A, 0x00};
volatile  unchar	receivedata[20]={0x00,0x0a,0x00,0x0a,0x00,0x0a,0x00,0x0a};
volatile  unchar	senddat[20]={'A','T',0x0d,0x0a};
//volatile  string	senddata;
volatile  unchar    toSend[20]={'A','T','+','P','W','R','=','2','9',0x0d,0x0a};
volatile  unchar    toSendA[20]={'A','T',0x0d,0x0a};

volatile  unchar    toSenda[20]={'A','T','+','U','A','R','T','=','3',',','0',0x0d,0x0a,0x55,0x66,0x77,0x88,0x99,0xaa};
unchar    i=0;
unchar    mmm=0;
const  	char*   abc="ABCD\r\n";

/*-------------------------------------------------
* 函数名：interrupt ISR
* 功能： 中断处理
* 输入：  无
* 输出：  无
 --------------------------------------------------*/
void interrupt ISR(void)            
{ 
	if(URRXNE && RXNEF)       //接收中断         	
	{
    	receivedata[mmm++] =URDATAL; 
        
        if(mmm>=20)
        {
        	mmm=0;
        } 
        NOP();
	} 
    //----------------------------
  /*  if(TCEN && TCF)          //发送中断
    {	
        TCF=1;       //写1清0
        
    	if(i<5)
        {
    		URDATAL =toSend[i++];
        }
        else
        {
          i=0;
        }
		NOP(); 
     }  */
}  
/*-------------------------------------------------
* 函数名：POWER_INITIAL
* 功能：  上电系统初始化
* 输入：  无
* 输出：  无
 --------------------------------------------------*/	
void POWER_INITIAL (void) 
{
	OSCCON = 0B01110001;	//16MHz 1:1
	INTCON = 0B10000000;  			//暂禁止所有中断
    
	PORTA = 0B00000000;		
	TRISA = 0B10010000;		//PA输入输出 0-输出 1-输入 PA6-输出 PA7-输入
	PORTB = 0B00000000;		
	TRISB = 0B10000101;		//PB输入输出 0-输出 1-输入							
	PORTC = 0B00000000; 	
	TRISC = 0B00000001;		//PC输入输出 0-输出 1-输入  	
	
	WPUA = 0B00000000;     	//PA端口上拉控制 1-开上拉 0-关上拉
	WPUB = 0B10000101;     	//PB端口上拉控制 1-开上拉 0-关上拉
	WPUC = 0B00000000;     	//PC端口上拉控制 1-开上拉 0-关上拉
    
    WPDA = 0B00000000;     	//PA端口下拉控制 1-开下拉 0-关下拉 PA7上拉
	WPDB = 0B00000000;     	//PB端口下拉控制 1-开下拉 0-关下拉
	WPDC = 0B00000000;     	//PC端口下拉控制 1-开下拉 0-关下拉
    
    PSRC0 = 0B11111111;  	//PORTA 源电流设置最大 0:最小，1:最大
    PSRC1 = 0B11111111;     //PORTB 源电流设置最大 0:最小，1:最大
    PSRC2 = 0B11111111;		//PORTC 源电流设置最大 00:最小 11:最大    
    
    PSINK0 = 0B11111111;  	//PORTA灌电流设置最大 0:最小，1:最大
    PSINK1 = 0B11111111; 	//PORTB灌电流设置最大 0:最小，1:最大
    PSINK2 = 0B11111111;	//PORTC灌电流设置最大 0:最小，1:最大
	
    ANSELA = 0B00000000;    //全为数字管脚
}
/*------------------------------------------------- 
* 函数名称：DelayUs
* 功能：    短延时函数 --16M-2T--大概快1%左右.
* 输入参数：Time延时时间长度 延时时长Time Us
* 返回参数：无 
 -------------------------------------------------*/
void DelayUs(unsigned char Time)
{
	unsigned char a;
	for(a=0;a<Time;a++)
	{
		NOP();
	}
}                  
/*-------------------------------------------------
* 函数名称：DelayMs
* 功能：    短延时函数 快1%
* 输入参数：Time延时时间长度 延时时长Time ms
* 返回参数：无 
 -------------------------------------------------*/
void DelayMs(unsigned char Time)
{
	unsigned char a,b;
	for(a=0;a<Time;a++)
	{
		for(b=0;b<5;b++)
		{
		 	DelayUs(197);
		}
	}
}
/*-------------------------------------------------
* 函数名: UART_INITIAL
* 功能：  主函数
* 输入：  无
* 输出：  无
 --------------------------------------------------*/
void UART_INITIAL(void)
{
	PCKEN |=0B00100000;	//打开UART时钟
    
    URIER =0B00000001;  //使能发送接收完成中断
    URLCR =0B00000001;  //8位数据，停止位1，无奇偶校验
    URMCR =0B00011000;
    
    URDLL =104;         //9600波特率 = Fosc/16*[URDLH:URDLL]
    URDLH =0;
    TCF=1;
    AFP1=0;
    ODCON0=0B00000000;
	INTCON=0B11000000;
    
    //TCF: 发送完成标志
    //TXEF:1发送寄存器为空
    //RXNEF:1按收寄存器非空
}
/*-------------------------------------------------
* 函数名: main 
* 功能：  主函数
* 输入：  无
* 输出：  无
 --------------------------------------------------*/
void main(void)
{
	POWER_INITIAL();		//系统初始化
    UART_INITIAL();
    DelayMs(100);
    PC1=0;

    WAKE_UP;
    
    //i=0;
	for(i=0;i<11;i++)
      {
    	 TXEF=0;         
         URDATAL=toSend[i];
         while(!TCF)
         {
         }
         //DelayUs(255);  
         //DelayUs(255);
         //DelayUs(255);
                      
           
      }  
      
        	//NOP();
    
    /*if(TXEF)                //上电发送10+1个数据
    {
      URDATAL =0xaa;        
    }  */ 
      

	while(1)
	{
		NOP();
    }	

}