// Project:  FT61FC4X_UART.prj
// Device:   FT61FC4X
// Memory:   PROM=4Kx14, SRAM=0.5KB, EEPROM=128
// Description: UART communication with CAT1 module

// RELEASE HISTORY
// VERSION DATE     DESCRIPTION
// 1.1     24-2-2   Modified file header
//OPENP-----PB2
//OPENS----PB1
//CLOSEP----PB0
//CLOSES----PA0
//LED----PA4
//RX----PA7
//TX----PA6
//*********************************************************
#include "SYSCFG.h"
//***********************Macro Definitions****************************
#define  unchar     unsigned char

#define OPENP       PORTBbits.PB2
#define OPENS       PORTBbits.PB1
#define CLOSEP       PORTBbits.PB0
#define CLOSES       PORTBbits.PA0

#define DATA_TRANS   PORTBbits.PA4

#define KEY          PORTBbits.PB7



#define LED_OFF     PORTAbits.PA1 = 0
#define LED_ON      PORTAbits.PA1 = 1
#define LED_TOGGLE  PORTAbits.PA1 = (PORTAbits.PA1 == 1 ? 0 : 1)

#define WAKE_UP     PORTCbits.PC1 = 0
#define SLEEP_DN    PORTCbits.PC1 = 1

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
* Function: interrupt ISR
* Purpose:  Interrupt handler
* Input:    None
* Output:   None
 --------------------------------------------------*/
void interrupt ISR(void)
{
	if(URRXNE && RXNEF)       // Receive interrupt
	{
        LED_TOGGLE;
    	receivedata[mmm++] =URDATAL;

        if(mmm>=20)
        {
        	mmm=0;
        }
        NOP();
	}
    //----------------------------
  /*  if(TCEN && TCF)          // Transmit interrupt
    {
        TCF=1;       // Write 1 to clear 0

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
* Function: POWER_INITIAL
* Purpose:  Power-on system initialization
* Input:    None
* Output:   None
 --------------------------------------------------*/
void POWER_INITIAL (void)
{
	OSCCON = 0B01110001;	//16MHz 1:1
	INTCON = 0B10000000;  			// Disable peripheral interrupt

	PORTA = 0B00000000;
	TRISA = 0B10010000;		// PA pin direction 0=output 1=input PA6=output PA7=input
	PORTB = 0B00000000;
	TRISB = 0B10000101;		// PB pin direction 0=output 1=input
	PORTC = 0B00000000;
	TRISC = 0B00000001;		// PC pin direction 0=output 1=input

	WPUA = 0B00000000;     	// PA pull-up resistor 1=enabled 0=disabled
	WPUB = 0B10000101;     	// PB pull-up resistor 1=enabled 0=disabled
	WPUC = 0B00000000;     	// PC pull-up resistor 1=enabled 0=disabled

    WPDA = 0B00000000;     	// PA pull-down resistor 1=enabled 0=disabled PA7 pull-down
	WPDB = 0B00000000;     	// PB pull-down resistor 1=enabled 0=disabled
	WPDC = 0B00000000;     	// PC pull-down resistor 1=enabled 0=disabled

    PSRC0 = 0B11111111;  	// PORTA source current drive 0=small 1=large
    PSRC1 = 0B11111111;     // PORTB source current drive 0=small 1=large
    PSRC2 = 0B11111111;		// PORTC source current drive 00=small 11=large

    PSINK0 = 0B11111111;  	// PORTA sink current drive 0=small 1=large
    PSINK1 = 0B11111111; 	// PORTB sink current drive 0=small 1=large
    PSINK2 = 0B11111111;	// PORTC sink current drive 0=small 1=large

    ANSELA = 0B00000000;    // All digital I/O pins
}
/*-------------------------------------------------
* Function: DelayUs
* Purpose:  Microsecond delay - 16MHz 2T mode - about 1% error
* Input:    Time - delay time in microseconds
* Output:   None
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
* Function: DelayMs
* Purpose:  Millisecond delay - about 1% error
* Input:    Time - delay time in milliseconds
* Output:   None
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
* Function: UART_INITIAL
* Purpose:  UART initialization
* Input:    None
* Output:   None
 --------------------------------------------------*/
void UART_INITIAL(void)
{
	PCKEN |=0B00100000;	// Enable UART clock

    URIER =0B00000001;  // Enable TX/RX interrupt
    URLCR =0B00000001;  // 8-bit data, 1 stop bit, no parity
    URMCR =0B00011000;

    URDLL =104;         // 9600 baud rate = Fosc/16*[URDLH:URDLL]
    URDLH =0;
    TCF=1;
    AFP1=0;
    ODCON0=0B00000000;
	INTCON=0B11000000;

    // TCF: Transmit Complete Flag
    // TXEF: 1=Transmit register empty
    // RXNEF: 1=Receive register not empty
}
/*-------------------------------------------------
* Function: SendByte
* Purpose:  Send a single byte via UART
* Input:    data - byte to send
* Output:   None
 --------------------------------------------------*/
void SendByte(unchar data)
{
    TXEF = 0;
    URDATAL = data;
    while(!TCF)
    {
    }
}
/*-------------------------------------------------
* Function: SendString
* Purpose:  Send a string via UART (without \r\n)
* Input:    str - string to send
* Output:   None
 --------------------------------------------------*/
void SendString(const char* str)
{
    unchar j = 0;
    while(str[j] != '\0')
    {
        SendByte(str[j]);
        j++;
    }
}
/*-------------------------------------------------
* Function: SendATCommand
* Purpose:  Send AT command and automatically append \r\n
* Input:    cmd - AT command string
*           Example1: AT+PWR=29
*           Example2: ATW
* Output:   None
* Note:     Automatically appends \r\n at the end
 --------------------------------------------------*/
void SendATCommand(const char* cmd)
{
    unchar j = 0;

    // Send command string characters
    while(cmd[j] != '\0')
    {
        SendByte(cmd[j]);
        j++;
    }

    // Send \r (0x0D)
    SendByte(0x0D);

    // Send \n (0x0A)
    SendByte(0x0A);
}
/*-------------------------------------------------
* Function: CAT1_Init
* Purpose:  CAT1 433MHz module initialization with AT commands
* Input:    None
* Output:   None
* Note:     Configure power, baud rate, frequency, address, SF, BW, PB
 --------------------------------------------------*/
void CAT1_Init(void)
{
    // Set power
    SendATCommand("AT+PWR=20");
    DelayMs(50);

    // Set UART baud rate 9600
    SendATCommand("AT+UART=3,0");
    DelayMs(50);

    // Set frequency 434MHz
    SendATCommand("AT+FEQ=434000000");
    DelayMs(50);

    // Set address
    SendATCommand("AT+ADR=0");
    DelayMs(50);

    // Set spreading factor (7-12, higher=longer range)
    SendATCommand("AT+SF=7");
    DelayMs(50);

    // Set bandwidth (6-9, lower=longer range)
    SendATCommand("AT+BW=9");
    DelayMs(50);

    // Set preamble length (0-6)
    SendATCommand("AT+PB=3");
    DelayMs(50);

    // Save all settings
    SendATCommand("ATW");
    DelayMs(50);

    WAKE_UP;//唤醒433
}
/*-------------------------------------------------
* Function: main
* Purpose:  Main function
* Input:    None
* Output:   None
 --------------------------------------------------*/
void main(void)
{
	POWER_INITIAL();		// System initialization
    UART_INITIAL();
    DelayMs(100);
    PC1=0;

    // Initialize CAT1 433MHz module with all AT commands
    CAT1_Init();

    // Add more commands if needed
    // SendATCommand("AT+B=3");
    //SendATCommand("Hello");

    /* Old byte-by-byte send method, replaced by SendATCommand
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
    */
        	//NOP();

    /*if(TXEF)                // Power-on send 10+1 bytes data
    {
      URDATAL =0xaa;
    }  */


	while(1)
	{
		// Send "HELLO" every 1 second
		SendString("HELLO");
		DelayMs(250);  // Delay 1000ms = 1s (using 4x250ms)
		DelayMs(250);
		DelayMs(250);
		DelayMs(250);
    }

}
