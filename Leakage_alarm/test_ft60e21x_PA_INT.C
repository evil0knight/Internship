// Project: FT60E21X_PA_INT.prj
// Device:  FT60E21X
// Memory:  PROM=1KX14, SRAM=64B, EEPROM=128
// Description: ������DemoPortOut(PA3)���100֡50HZ��ռ�ձ�Ϊ50%�ķ�����,MCU����˯��,�ȴ��жϵķ���;
// 		   		��ÿ��PA2��ƽ�仯�жϴ������ظ���������;

// RELEASE HISTORY
// VERSION     DATE         DESCRIPTION
// 1.3        25-7-8        �޸�ϵͳʱ��Ϊ8MHz��ʹ��LVR
//*********************************************************
#include	"SYSCFG.h";
#include 	"FT60F21X.h";
//***********************�궨��****************************
#define	unchar		unsigned char    
#define g_my_addr		0x12345
#define is_leaking 		0x02
#define duima 			0x01
#define led_on			PA3=1
#define led_off			PA3=0
#define led_tuggle		PA3 = (PA3 == 1 ? 0 : 1)
#define key				PA5
#define DATAOUT_HIGH	PA4=1
#define DATAOUT_LOW		PA4=0
typedef unsigned char      uint8_t;
typedef unsigned int       uint16_t;
typedef unsigned long      uint32_t;
 

typedef enum {
    STATE_WAKEUP,  // ���Ѽ�ʱ״̬
    STATE_PAIRING, // ����㲥״̬
    STATE_SLEEP    // ���Ͳ�׼������״̬
} SystemState_t;

unchar  FCount;
unchar  ReadAPin;
volatile SystemState_t g_state = STATE_WAKEUP;
volatile uint16_t g_timer_5s = 0;
volatile uint16_t g_timer_2s = 0;
/*-------------------------------------------------
 * ��������interrupt ISR
 * ���ܣ�  �жϴ�������
 * ���룺  ��
 * �����  ��
 --------------------------------------------------*/
void interrupt ISR(void)	
{ 
	if(INTCON & 0x04)			//Timer0�жϱ�� Bit[2]:T0IF
    {
		if (g_state == STATE_WAKEUP) {
    	    // --- 1. 5�뵹��ʱ����ʱ������������ ---
    	    g_timer_5s++;
    	    if (g_timer_5s >= 500) { 
    	        g_state = STATE_SLEEP; 
    	        g_timer_5s = 0;
    	    }

    	    // --- 2. 2�볤������ʱ����������� ---
    	    if (key == 0) {
    	        g_timer_2s++;
    	        if (g_timer_2s >= 200) { 
    	 	           g_state = STATE_PAIRING; // �л�������
    	            g_timer_5s = 0;          // ����ǰ����5s��ʱ
    	            g_timer_2s = 0;
    	        }
    	    } else {
    	        g_timer_2s = 0; 
    	    }
    	}
		INTCON &= ~(1<<2);		//T0IF = 0;	
        TMR0 =100;				//������ֵ ÿ��ָ������++	���255�������
	}
} 
/*-------------------------------------------------
 * ��������POWER_INITIAL
 * ���ܣ�  �ϵ�ϵͳ��ʼ��
 * ���룺  ��
 * �����  ��
 --------------------------------------------------*/	
void POWER_INITIAL (void) 
{
	OSCCON = 0B01100000;		//ϵͳʱ��ѡ��Ϊ�ڲ�����8MHz
	INTCON = 0;  				//�ݽ�ֹ�����ж�

	PORTA = 0B00000000;				
	TRISA = 0B00100100;			//PA������� 0-��� 1-����  
	WPUA = 0B00100100;     		//PA�˿��������� 1-������ 0-������

	MSCON = 0B00000000;		                             
}
/*----------------------------------------------------
 * ��������TIMER0_INITIAL
 * ���ܣ�  ��ʼ�����ö�ʱ��
 * ����TMR0��ʱʱ��=(1/ϵͳʱ��Ƶ��)*ָ������*Ԥ��Ƶֵ*TMR0
 * 				   =(1/8000000)*4*128*156 = 10ms
 ----------------------------------------------------*/
 void TIMER0_INITIAL (void)  
 {
	T0ON = 0;
	TMR0 = 100; 					//������ֵ ÿ��ָ������++ ���255�������
	T0CON0 = 0B00000000;		//Bit3 ��ʱ��0ʹ��λ Bit[1:0]��ʱ��ʱ��Դѡ��λ	00:ָ������	01:HIRC
	OPTION = 0B00000110;	
	//Bit5: T0CS Timer0ʱ��Դѡ�� 
	//1-�ⲿ���ŵ�ƽ�仯T0CKI 0-�ڲ�ʱ��(FOSC/2)
	//Bit4: T0CKI���Ŵ�����ʽ 1-�½��� 0-������
	//Bit3: PSA Ԥ��Ƶ������λ 0-Timer0 1-WDT 
	//Bit[2:0]: PS 8��Ԥ��Ƶ�� 110 - 1:128,101 - 1:64
    
	T0ON = 1;
}
/*-------------------------------------------------
 * ��������Delay10Us
 * ���ܣ�  ����ʱ����
 * ���룺  Time��ʱʱ�䳤�� ��ʱʱ��Time Us
 * �����  ��
 --------------------------------------------------*/
void Delay10Us(void)
{
	for(unsigned char i=0;i<2;i++)
	{
		NOP();                                                                                      
	}
}   
/*
�������ʱ�����Ǵ������￼�����ģ���ʱ����ʵʱ�䲻��
���Ǻͽ��ն������׵�
�ҾͲ��Ҹ���
*/
void delay_us(uint16_t us)
{
	uint16_t j;
	us = us * 3;
	for(j=0;j<us;j++)
	{
		NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();
		NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();
		NOP();NOP();NOP();NOP();NOP();NOP();NOP();NOP();
	}
}

/*-------------------------------------------------
 * ��������DelayMs
 * ���ܣ�  ����ʱ����
 * ���룺  Time��ʱʱ�䳤�� ��ʱʱ��Time ms
 * �����  ��
 --------------------------------------------------*/
 void DelayMs(unsigned char Time)
 {
	for(unsigned int a=0;a<Time;a++)
	{
		for(unsigned char b=0;b<83;b++)
		{
		 	Delay10Us(); 	
		}
	}
 }
/*------------------------------------------------- 
 * �������ƣ�DelayS
 * ���ܣ�    ����ʱ����
 * ���������Time ��ʱʱ�䳤�� ��ʱʱ��Time S
 * ���ز������� 
 -------------------------------------------------*/
void DelayS(unsigned char Time)
{
	unsigned char a,b;
	for(a=0;a<Time;a++)
	{
		for(b=0;b<10;b++)
		{
		 	DelayMs(100); 	
		}
	}
}
/*-------------------------------------------------
 * ������: PA2_Level_Change_INITIAL
 * ���ܣ�  PA�˿�(PA2)��ƽ�仯�жϳ�ʼ��
 * ���룺  ��
 * �����  ��
--------------------------------------------------*/
void Wakeup_INITIAL(void)
{
    TRISA2 = 1;             // ȷ�� PA2 ������ģʽ
    TRISA5 = 1;             // ȷ�� PA5����ť��������ģʽ
    
    // �ؼ���������ȡ PORTA �ĵ�ǰֵ��
    // �ֲ�涨�����ȡ�˿�������ڲ��ĵ�ƽƥ��״̬��
    // �����´ε�ƽ���䣨���°�ť��ʱ���ܴ����жϡ�
    ReadAPin = PORTA;       
    
    PAIF = 0;               // ��� PA �˿��жϱ�־λ
    
    IOCA2 = 1;              // ʹ�� PA2 �ĵ�ƽ�仯�жϣ�©ˮ���ѣ�
    IOCA5 = 1;              // ʹ�� PA5 �ĵ�ƽ�仯�жϣ���ť���ѣ�
    
    PAIE = 1;               // ʹ���ܵ� PA �˿��ж�����λ
}
// 同步码: HIGH 4us + LOW 124us
void coding_syn_1527(void)
{
    DATAOUT_HIGH;
    delay_us(4);
    DATAOUT_LOW;
    delay_us(124);
}
// 逻辑0: HIGH 4us + LOW 12us
void coding_L_1527(void)
{
    DATAOUT_HIGH;
    delay_us(4);
    DATAOUT_LOW;
    delay_us(12);
}
// 逻辑1: HIGH 12us + LOW 4us
void coding_H_1527(void)
{
    DATAOUT_HIGH;
    delay_us(12);
    DATAOUT_LOW;
    delay_us(4);
}
// 前导码: HIGH ~300us + LOW ~1800us → ll_w≈20 (窗口15-25)
void coding_preamble_1527(void)
{
    uint8_t i;
    for(i = 0; i < 10; i++) {
        DATAOUT_HIGH;
        delay_us(4);   // ~300us HIGH
        DATAOUT_LOW;
        delay_us(20);  // ~1800us LOW
    }
}

//������1527����
//���������uint32_t addr   20λ��ַ��
//          uint8_t data    4������
void coding_1527(uint32_t Addr_1527, uint8_t Data)
{
  uint8_t i,k;
  uint32_t j;
  if((Addr_1527 > 0xfffff) || Data >15) //�Ƿ�ֵ
    return;
    
	GIE = 0;
	//����������
	
  //ͬ����
  coding_syn_1527(); 
  //��ַ��
	for(i=0;i<20;i++)
  {
   j = (0x80000 & Addr_1527);
   Addr_1527 = (Addr_1527 << 1);
  if(j != 0)
    coding_H_1527();
  else
    coding_L_1527();
  }
  //������
  for(i=0;i<4;i++)
  {  
   k = (0x08 & Data);
   Data = (Data << 1);
  if(k != 0)
    coding_H_1527();
  else
    coding_L_1527();
  }
  DATAOUT_HIGH;
  delay_us(4);
  DATAOUT_LOW;
  GIE = 1;
}


void Enter_Deep_Sleep()
{
	Wakeup_INITIAL();		//��ʼ��PA��ƽ�仯�ж�
	GIE = 0;					     	//�ر�ȫ���ж�
    NOP();
    NOP();
	SLEEP(); 					     	//˯��
	NOP();
    NOP();
}
void System_Reinit()
{
	PAIF = 0;  							//��PAIF��־λ
	PAIE = 0;  							//���Ƚ�ֹPA2�ж�
	IOCA2 =0;  							//��ֹPA2��ƽ�仯�ж�
	T0IE = 1; 
    GIE = 1; 
}
void LED_Flickering3()
{
	for(int i=0;i<6;i++)
	{
		led_tuggle;
		DelayMs(50);
	}
}
void LED_Flickering1()
{
	for(int i=0;i<3;i++)
	{
		led_tuggle;
		DelayMs(10);
	}
}
/*-------------------------------------------------
 * ������: main 
 * ���ܣ�  ������
 * ���룺  ��
 * �����  ��
--------------------------------------------------*/
void main()
{
	POWER_INITIAL();					//ϵͳ��ʼ��
	TIMER0_INITIAL();					//��ʱ����ʼ��
	GIE = 1; 							//���ж�
	T0IE = 1;							//����ʱ��/������0�ж�
	while(1)
	{
		//����ִ�г�����һ��״̬������Ϊ���룬���ѣ�˯�ߣ�3��ģʽ
		//���������ַ�ʽ��һ����©ˮ���ѣ�һ���ǰ�ť����
		//��˯���л��ѣ����뻽��ģʽ��Ȼ���ʱ����ʼ��ʱ�����5S���ˣ��ͷ��ʹ�ʱ�Ƿ�©ˮ��Ȼ��˯��
		//����ڼ��⵽2S�ĳ�����ť���������ʱ�������ģʽ
		//����ģʽ�Ȱѵ�ַ���óɹ㲥��ַ���ù㲥��ַ����һ���Լ��ĵ�ַ���Ժ������ݾ����������ַ
		//Ȼ��Ӷ���ģʽ�˳������뻽��ģʽ���ȴ�����ģʽ�ļ�ʱ������
    	switch (g_state) {
    	    case STATE_PAIRING:
				// 发送三次，确保接收端存在。等接收端学习状态时抓取
    		for(uint8_t i=0; i<3; i++)
    		{
     		   // --- 先发前导码，再发广播地址（告诉别人：是我！） ---
    	        coding_preamble_1527();
    	        coding_1527(g_my_addr, duima);
			
    		    // ��˸һ���Լ��� LED ��ʾ���ڶ���
    		    LED_Flickering1();
    		}
				LED_Flickering3();//�������
    	        g_state = STATE_WAKEUP;         // �ص�����ģʽ�����¿�ʼ5s����ʱ
    	        break;
    	    case STATE_SLEEP:
    	        // --- 先发前导码，再发本机地址和漏水状态 ---
				GIE = 0;
				coding_preamble_1527();
    	        coding_1527(g_my_addr, is_leaking); // 发送漏水状态
				led_off;
    	        // --- ������ƽ ---
    	        Enter_Deep_Sleep(); 
		
    	        // --- ������ĵ�һ�ֳ� ---
    	        System_Reinit();
    	        g_state = STATE_WAKEUP;
    	        g_timer_5s = 0;
    	        break;
    	    case STATE_WAKEUP:
    	        // ������Դ���һЩ��������UI�����������
				led_on;
    	        break;
   	 	}
	}  
}