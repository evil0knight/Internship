#include "HT67F2362A.h"
#include "UART.h"
#include "UART0_433MHZ.h"
#include "Data.h"
#include "Delay.h"

void UART0_433MHz_SendByte(unsigned char Data)                             //发送字符
{
	_txr_rxr0=Data;
	while(_txif0==0);	                                                   //发送数据寄存器TXR_RXR0 状态位（1-数据已从缓冲器加载到移位寄存器中）
	while(_tidle0==0);	                                                   //数据发送完成标志位（1-发送完成）
}

void UART0_433MHz_SendString(unsigned char* String,unsigned char length)   //发送字符串
{
    unsigned char i=0;
    for(i=0;i<length;i++)
    {
    	UART0_433MHz_SendByte(String[i]);
    }	
}
	
void UART0_433MHz_AT_Baudrate(unsigned char Data)                          //输入范围0-7，3-9600，4-38400，7-115200
{
	unsigned char Baudrate[]={0x41, 0x54, 0x2B, 0x55, 0x41, 0x52, 0x54, 0x3D, 0x30, 0x2C, 0x30, 0x0D, 0x0A};
	Baudrate[8]=Data+0x30;
	unsigned char Length=sizeof(Baudrate)/sizeof(Baudrate[0]);
	UART0_433MHz_SendString(Baudrate,Length);
}

void UART0_433MHz_AT_Mode(unsigned char Mode)                              //AT模式设定
{
	unsigned char Mode1[]={0x41, 0x54, 0x2B, 0x4D, 0x4F, 0x44, 0x45, 0x3D, 0x31, 0x0D, 0x0A};
	unsigned char Mode0[]={0x41, 0x54, 0x2B, 0x4D, 0x4F, 0x44, 0x45, 0x3D, 0x30, 0x0D, 0x0A};
	unsigned char Length1=sizeof(Mode1)/sizeof(Mode1[0]);
	unsigned char Length0=sizeof(Mode0)/sizeof(Mode0[0]);
	if (Mode==1)                                                           //透传模式
	{
		UART0_433MHz_SendString(Mode1,Length1);
	}
	else if(Mode==0)                                                       //周期休眠模式
	{
	    _pdc0=0;                                                           //sleep设置为输出引脚
	    _pd0=0;
		UART0_433MHz_SendString(Mode0,Length0);
	}
}

void UART0_433MHz_AT_WT(unsigned char Data)                               //设置休眠唤醒时间 范围0-6
{
	unsigned char WT[]={0x41, 0x54, 0x2B, 0x57, 0x54, 0x3D, 0x30, 0x0D, 0x0A};
	unsigned char Length=sizeof(WT)/sizeof(WT[0]);
	WT[6]+=Data;
	UART0_433MHz_SendString(WT,Length);
}

void UART0_433MHz_AT_Adr(unsigned int ADR_Data)                           //通讯地址设置 0-65535
{
	unsigned char ADR[14]={0};                                            //最大为14位数据,7位固定前缀+5位长度数据+\r\n
	unsigned char Pre_Fixed[7]={0x41, 0x54, 0x2B, 0x41, 0x44, 0x52, 0x3D};//前7位固定前缀(AT+ADR=)
	unsigned char Index=0;                                                //ADR存储数据的索引即当前最新数据的下标
	unsigned char temp0=0;
	/*将固定前缀拷贝至ADR数组即需要发送的数组*/
	unsigned char i=0;
	for(i=0;i<sizeof(Pre_Fixed)/sizeof(Pre_Fixed[0]);i++)
	{
		ADR[Index++]=Pre_Fixed[i];
	}
	/*如果地址为0,直接赋值*/
	if(ADR_Data==0)
	{
	    ADR[Index++]=0x30;	
	}
	/*地址不为0*/
	else
	{
		/*将数据Data先倒序存入ADR数组的固定前缀后*/
	    while(ADR_Data>0)
	    {
	       
	       temp0=ADR_Data%10;
	       ADR_Data/=10;
	       ADR[Index++]=temp0+0x30;	
	    }
	    /*将插入的倒序数据逆向为正序*/
	    unsigned char ADR_End=Index-1;                                    //地址Data最后一位数据的数组下标
	    unsigned char ADR_Start=sizeof(Pre_Fixed)/sizeof(Pre_Fixed[0]);   //地址Data的第一位数据的数组下标
	    unsigned char j=0;
	    unsigned char temp1=0;
	    unsigned char Num=(ADR_End-ADR_Start+1)/2;                        //逆向排列的次数
	    for(j=0;j<Num;j++)                                                //将倒序数据正向排列
	    {
	        temp1=ADR[ADR_Start+j];
	        ADR[ADR_Start+j]=ADR[ADR_End-j];
	        ADR[ADR_End-j]=temp1;
	    }	
	}
	/*填充\r\n*/
	ADR[Index++]=0x0D;
	ADR[Index++]=0x0A;
	
	UART0_433MHz_SendString(ADR,Index);
}

void UART0_433MHz_AT_PB(unsigned char Data)                              //设置前导码长度 0-6
{
	unsigned char PB[]={0x41, 0x54, 0x2B, 0x50, 0x42, 0x3D, 0x30, 0x30, 0x30, 0x30, 0x0D, 0x0A};
	unsigned char Length=sizeof(PB)/sizeof(PB[0]);
	PB[6]+=Data;
	UART0_433MHz_SendString(PB,Length);
}

void UART0_433MHz_AT_BW(unsigned char Data)                              //设置带宽，BW越小，速率越低，接收灵敏度更高，距离更远 6-9
{
	unsigned char BW[]={0x41, 0x54, 0x2B, 0x42, 0x57, 0x3D, 0x36, 0x0D, 0x0A};
	unsigned char Length=sizeof(BW)/sizeof(BW[0]);
	BW[6]+=Data-6;
	UART0_433MHz_SendString(BW,Length);
}

void UART0_433MHz_AT_FEQ(void)                                           //设置发送频率434MHz
{
	unsigned char Freq[]={0x41, 0x54, 0x2B, 0x46, 0x45, 0x51, 0x3D, 0x34, 0x33, 0x34, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x0D, 0x0A};
	unsigned char Length=sizeof(Freq)/sizeof(Freq[0]);
	UART0_433MHz_SendString(Freq,Length);
}

void UART0_433MHz_AT_SF(unsigned char Data)                               //设置扩频因子 范围7-12，SF越大，接收灵敏度越高，通信距离越远
{
	if( (Data>=7) && (Data<10) )
	{
	    unsigned char SF[]={0x41, 0x54, 0x2B, 0x53, 0x46, 0x3D, 0x37, 0x0D, 0x0A};
	    SF[6]+=Data-7;
	    unsigned char Length=sizeof(SF)/sizeof(SF[0]);
	    UART0_433MHz_SendString(SF,Length);
	}
	else if( (Data>=10)&&(Data<=12) )
	{
		unsigned char SF[]={0x41, 0x54, 0x2B, 0x53, 0x46, 0x3D, 0x31, 0x30, 0x0D, 0x0A};
		SF[7]+=Data-10;
		unsigned char Length=sizeof(SF)/sizeof(SF[0]);
		UART0_433MHz_SendString(SF,Length);
	}
}

void UART0_433MHz_ATW(void)                                                //保存设置
{
	unsigned char ATW[]={0x41, 0x54, 0x57, 0x0D, 0x0A};
	unsigned char Length=sizeof(ATW)/sizeof(ATW[0]);
 	UART0_433MHz_SendString(ATW,Length);
}

void UART0_433MHz_ATL(void)                                               //查询设置
{
	unsigned char ATL[]={0x41, 0x54, 0x4C, 0x0D, 0x0A};
	unsigned char Length=sizeof(ATL)/sizeof(ATL[0]);
 	UART0_433MHz_SendString(ATL,Length);
}

void AT_PWR(void)                                                        //发送功率29
{
    unsigned char PWR[]={0x41, 0x54,0x2B,0x50, 0x57, 0x52, 0x3D, 0x32, 0x39,0x0D,0x0A }; 
    unsigned char Length=sizeof(PWR)/sizeof(PWR[0]);
 	UART0_433MHz_SendString(PWR,Length);  	
}

void UART0_433MHz_Init(unsigned int Address)        //433MHz模块初始化,输入参数---通讯地址             需要50ms延时，短了配置可能失败，ATL采集配置需要delay100ms
{ 
   	UART0_433MHz_AT_Baudrate(3);                    //波特率9600
   	Delay_ms(50);
   	UART0_433MHz_AT_FEQ();                          //434MHz
   	Delay_ms(50);
   	UART0_433MHz_AT_Adr(Address);                   //通讯地址
   	Delay_ms(50);
   	UART0_433MHz_AT_Mode(0);                        //透传模式
   	Delay_ms(50);
	UART0_433MHz_AT_SF(7);                          //扩频因子
	Delay_ms(50);
	UART0_433MHz_AT_BW(9);                          //带宽
	Delay_ms(50);
	UART0_433MHz_AT_PB(3);                          //前导码长度
	Delay_ms(50);
	AT_PWR();                                       //发送功率设置
	Delay_ms(50);
	UART0_433MHz_ATW();                             //保存设置
	Delay_ms(50);

}


#define UART0_Receive_BUF_MAX_Length   10
#define UART0_Transmit_BUF_MAX_Length  10

unsigned char UART0_Transmit_BUF[UART0_Transmit_BUF_MAX_Length]={0};  //UART0发送缓存数组

unsigned char UART0_Receive_BUF[UART0_Receive_BUF_MAX_Length]={0};    //UART0接收缓存数组
unsigned char UART0_Receive_BUF_Length=0;                     //UART0接收缓存数组已存元素个数
unsigned char UART0_Receive_Start_Flag=0;                     //UART0允许接收标志位  帧头检测到为0xFF，开始接收
unsigned char UART0_Receive_Finish_Flag=0;                    //UART0接收完成标志位  帧头检测到为0xFE，接收完成

unsigned char UART0_433MHz_CNT=0;                                  //用于判断执行哪个AT指令
unsigned char UART0_433MHz_Pairing_Code_Flag=0;                    //433MHZ对码标志位,置1为要求对码

#ifdef MASTER_PANEL
unsigned char MASTER_SEND_CNT=0;                                   //主面板对码过程中已经发送主面板地址的次数
unsigned char MASTER_SEND_FLAG=0;                                  //主面板发送主面板地址标志位  1---允许发送  0---不能发送
unsigned int Master_Send_Interval_CNT=0;                           //主面板3次发送主面板地址每次间隔2s，本参数用于进行2s计时
#endif

#ifdef SLAVE_PANEL
unsigned char Slave_Recv_ADR_Flag = 0;                             // 1=已收到主面板地址
unsigned char Slave_Recv_CNT = 0;                                  // 接收字节计数
#endif

void UART0_Transmit_Data(unsigned char ADR_Code,unsigned char Func_Code,unsigned int Data)  //通讯指令 0xFF-地址码-功能码-数据段-0xFE   ADR_Code-当前数据来自主面板/副面板/执行器
{                                                                                           //Func_Code-执行的功能类型
     UART0_Transmit_BUF[0]=0xFF;                                        //固定帧头填充                            
     switch(ADR_Code)                                                   //地址码填充
     {
       case 0xAA: if(ADR_Code==0xAA)UART0_Transmit_BUF[1]=0xAA;break;   //当前数据帧属于主面板
       case 0xAB: if(ADR_Code==0xAB)UART0_Transmit_BUF[1]=0xAB;break;   //当前数据帧属于副面板
       default:break;	
     }	
     switch(Func_Code)                                                  //功能码填充
     {
       case 0x01: if(Func_Code==0x01)
                  UART0_Transmit_BUF[2]=0x01;                           //功能码01:下面的数据为主面板地址
                  UART0_Transmit_BUF[3] = (Data / 10000) % 10;          //万位
                  UART0_Transmit_BUF[4] = (Data / 1000) % 10;           //千位
                  UART0_Transmit_BUF[5] = (Data / 100) % 10;            //百位
                  UART0_Transmit_BUF[6] = (Data / 10) % 10;             //十位
                  UART0_Transmit_BUF[7] = Data % 10;                    //个位
                  UART0_Transmit_BUF[8] = 0xFE;                         //帧尾
                  break;  
       case 0x02: if(Func_Code==0x02)UART0_Transmit_BUF[2]=0x02;UART0_Transmit_BUF[3]=(Data&0xFF00)>>8;UART0_Transmit_BUF[4]=Data&0x00FF;UART0_Transmit_BUF[5]=0xFE;break;  //功能码02:下面的数据为剩余时间(单位:min)
       case 0x03: if(Func_Code==0x03)UART0_Transmit_BUF[2]=0x03;UART0_Transmit_BUF[3]=0;UART0_Transmit_BUF[4]=(unsigned char)Data;UART0_Transmit_BUF[5]=0xFE;break;  //功能码03:下面的数据为阀门开关    Data:1 开  Data:0  关
       case 0x04: if(Func_Code==0x04)UART0_Transmit_BUF[2]=0x04;UART0_Transmit_BUF[3]=0;UART0_Transmit_BUF[4]=0;UART0_Transmit_BUF[5]=0xFE;break;  //功能码04:检测是否处于连接状态
       case 0x06: if(Func_Code==0x05)UART0_Transmit_BUF[2]=0x05;UART0_Transmit_BUF[3]=0;UART0_Transmit_BUF[4]=Data;UART0_Transmit_BUF[5]=0xFE;break;  //功能码05:仅用于将剩余电量上传到手机端
       default:break;	
     }
     if(Func_Code==0x01)UART0_433MHz_SendString(UART0_Transmit_BUF,9);  //发送的数据是主面板地址码,直接发送9个字节的发送数据数据缓存数组
     else UART0_433MHz_SendString(UART0_Transmit_BUF,6);                //其他数据,直接发送6个字节的发送数据数据缓存数组
}	

void UART0_433MHz_Pairing_Code(void)                               //对码按键按下，启动对码(50ms运行一次)
{
	                                                               //对码启动将绑定标志位清零
	switch(UART0_433MHz_CNT)                                       //对码的AT指令需要延时50ms便于顺利执行,UART0_433MHz_CNT用于判断AT指令执行流程到达那一步,便于执行下一步
	{
	  case 0:UART0_433MHz_AT_Baudrate(3);UART0_433MHz_CNT++; break;//波特率9600	
	  case 1:UART0_433MHz_AT_FEQ();UART0_433MHz_CNT++;       break;//434MHz	
	  case 2:UART0_433MHz_AT_Adr(0xFFFF);UART0_433MHz_CNT++; break;//通讯地址设置为通用地址65535	
	  case 3:UART0_433MHz_AT_Mode(0);UART0_433MHz_CNT++;     break;//传输模式	
	  case 4:UART0_433MHz_AT_SF(7);UART0_433MHz_CNT++;       break;//扩频因子
	  case 5:UART0_433MHz_AT_BW(9);UART0_433MHz_CNT++;       break;//带宽	
	  case 6:UART0_433MHz_AT_PB(3);UART0_433MHz_CNT++;       break;//前导码长度	
	  case 7:AT_PWR();UART0_433MHz_CNT++;                    break;//发送功率设置	
	  
	  #ifdef MASTER_PANEL                                          //当前为主面板
	  case 8:UART0_433MHz_ATW();MASTER_SEND_FLAG=1;Master_Send_Interval_CNT=0;UART0_433MHz_CNT++;break;//保存设置,并允许下次进入对码不用等待2s立即发送主面板地址
	  case 9:
	         Master_Send_Interval_CNT++;
	         if(Master_Send_Interval_CNT>=40)                      //50ms进一次对码函数,计时40即2s，2s置一次允许发送主面板地址标志位
	         {
	         	Master_Send_Interval_CNT=0;                        //清空2s计时
	         	MASTER_SEND_FLAG=1;                                //允许发送主面板地址标志位置1
	         }
	         if(MASTER_SEND_FLAG==1&&MASTER_SEND_CNT<MASTER_SEND_TOTAL_TIMES)//当前达到2s允许发送主面板地址且已发送次数小于最大发送次数
	         {
	         	MASTER_SEND_FLAG=0;                                //关闭2s计时允许发送标志位
	         	UART0_Transmit_Data(0xAA,0x01,data.Master_Address);//将主面板唯一地址发送给副面板，要求副面板将通讯地址修改为主面板的唯一地址 	
	         	MASTER_SEND_CNT++;                                 //主面板地址已发送次数+1
	         }
	         if(MASTER_SEND_CNT>=MASTER_SEND_TOTAL_TIMES)          //发送次数达到3次,清零发送次数，UART0_433MHz_CNT++下次进入对码函数进行下一步
	         {
	         	MASTER_SEND_CNT=0;
	         	UART0_433MHz_CNT++;
	         }	
	         break;                                                                                  
	  case 10:UART0_433MHz_AT_Adr(data.Master_Address);UART0_Transmit_Data(0xAA,0x04,0);UART0_433MHz_CNT++;break;//主面板修改回自己的通讯地址，并发送连接信号指令，副面板收到会点亮绑定logo
	  #endif
	  
	  #ifdef SLAVE_PANEL                                           //当前为副面板
      case 8:
            if(Slave_Recv_ADR_Flag == 1)                           //等待接收主面板地址，收到后设置为自身地址
            {
            	Slave_Recv_ADR_Flag = 0;                           //副面板接收主面板地址标志位清零
                UART0_433MHz_AT_Adr(data.Master_Address);          //设置为接收的主面板地址
                UART0_433MHz_CNT++;
            }
            break;
      case 9:UART0_433MHz_AT_Adr(data.Master_Address);UART0_433MHz_CNT++;break;  //副面板将地址修改成主面板地址    
      #endif
      
	  default:UART0_433MHz_ATW();UART0_433MHz_CNT=0;UART0_433MHz_Pairing_Code_Flag=0; break;//清零UART0_433MHz_CNT,清零对码启动标志位
	}
   
}

void UART0_Clear_Receive_BUF(void)              //清空UART0接收缓存数组
{
     unsigned char Length=sizeof(UART0_Receive_BUF)/sizeof(UART0_Receive_BUF[0]);
     unsigned char i=0;
     for(i=0;i<Length;i++)
     {
     	UART0_Receive_BUF[i]=0;
     }
     UART0_Receive_BUF_Length=0;                //清空接收缓存数组已存元素个数	
}

void UART0_Receive_Data(unsigned char data)     //用于433MHz通讯模块接收数据
{
		if(data==0xFF)                          //检测到帧头0xFF
		{ 
		   UART0_Clear_Receive_BUF();           //清空缓存数组和接收缓存数组已存元素个数
		   UART0_Receive_BUF[UART0_Receive_BUF_Length]=data;//缓存数组填入首元素0xFF
		   UART0_Receive_BUF_Length++;          //接收缓存数组已存元素个数+1
		   UART0_Receive_Start_Flag=1;          //UART0接收标志位置1，即开始接收
		}
		else                                    //检测到为其他数据
		{
			if(UART0_Receive_Start_Flag==1)     //允许接收数据
			{
		   	   if(UART0_Receive_BUF_Length>=UART0_Receive_BUF_MAX_Length)//接收缓存数组已存元素个数大于等于最大上限
		   	   {
		   	      UART0_Clear_Receive_BUF();    //清空缓存数组和接收缓存数组已存元素个数   
		   	      UART0_Receive_Start_Flag=0;   //结束接收，允许接收标志位清零
		   	   }
		   	   else                             //接收缓存数组已存元素个数小于最大上限
		   	   {
		   	      if(data!=0xFE)                //数据不是帧尾
		   	      {
		   	      	 UART0_Receive_BUF[UART0_Receive_BUF_Length]=data;
		   	      	 UART0_Receive_BUF_Length++;//接收缓存数组已存元素个数+1
		   	      }
		   	      else
		   	      {
		   	      	 UART0_Receive_BUF[UART0_Receive_BUF_Length]=data;
		   	      	 UART0_Receive_BUF_Length++;//接收缓存数组已存元素个数+1
		   	      	 UART0_Receive_Start_Flag=0;//结束接收，允许接收标志位清零
		   	      	 UART0_Receive_Finish_Flag=1;//接收完成
		   	      }
		   	   }
			}
 
		}
}

/*
帧头               0xFF
地址码             0xAA(主面板)         0xAB(副面板)          0xAC(执行器)
功能码             0x01(主面板地址)     0x02(剩余时间)     0x03(阀门开关)       0x04(连接信号)  0x05(剩余电量)
两个字节的数据段
帧尾               0xFE
*/

void UART0_433MHz_Receive_Process(void)                           //433MHZ芯片接收的数据帧处理
{   
       if( UART0_Receive_Finish_Flag == 1 )		                  //UART0接收完成
        {
        	/*当前控制板为主面板*/
        	#ifdef MASTER_PANEL                                   //当前控制板为主面板
        	  if(UART0_Receive_BUF[1] == 0xAA)                    //当前数据帧来自主面板        
        	  {
        	  	return;                                           //主面板不会收到主面板发出的数据
        	  }
        	  
        	  else if(UART0_Receive_BUF[1] == 0xAB)               //当前数据来自副面板	
        	  {
        	    switch(UART0_Receive_BUF[2])                      //功能码判断类型
        	    {
        	    	case 0x01:break;                              //副面板不会传递主面板地址码
        	    	
        	    	case 0x02:data.Remaining_time=UART0_Receive_BUF[3];data.Remaining_time=(data.Remaining_time<<8)|UART0_Receive_BUF[4];\
        	    	          UART0_Transmit_Data(0xAA,0x02,data.Remaining_time);break;//副面板向主面板传递剩余时间，主面板提取剩余时间，主面板将剩余时间下发到执行器上报到WIFI端
        	    	          
        	    	case 0x03:break;                              //副面板不会传递阀门当前开关状态
        	    	case 0x04:break;                              //主面板不需要接收副面板的连接信号
        	    	case 0x05:break;                              //副面板不会有剩余电量这个参数
        	    	default:  break;
        	    }
        	  }
        	  
        	  else if(UART0_Receive_BUF[1] == 0xAC)               //当前数据来自执行器
        	  {
        	  	switch(UART0_Receive_BUF[2])                      //功能码判断类型
        	    {
        	    	case 0x01:break;                              //执行器不会传递主面板地址码
        	    	case 0x02:break;                              //执行器不会传递剩余时间
        	    	case 0x03:data.Motor_State=UART0_Receive_BUF[4];break;//执行器传递阀门当前开关状态，主面板接收阀门状态并上报到WIFI端
        	    	case 0x04:break;//执行器传递的连接信号，主面板的绑定logo对应执行器，这里接收到执行器的连接信号点亮绑定logo
        	    	case 0x05:data.Remaining_Power=UART0_Receive_BUF[4];break;//接收执行器上传的剩余电量
        	    	default:  break;
        	    }
        	  }
        	  
        	#endif
        	
        	/*当前控制板为副面板*/
            #ifdef SLAVE_PANEL                                    //当前控制板为副面板
        	  if(UART0_Receive_BUF[1] == 0xAA)                    //当前数据来自主面板
        	  { 
        	  	switch(UART0_Receive_BUF[2])                      //功能码判断类型
        	    {
        	    	case 0x01:data.Master_Address=UART0_Receive_BUF[3]*10000+UART0_Receive_BUF[4]*1000+UART0_Receive_BUF[5]*100+UART0_Receive_BUF[6]*10+UART0_Receive_BUF[7];Slave_Recv_ADR_Flag=1;break;//获取主面板地址
        	    	case 0x02:data.Remaining_time=UART0_Receive_BUF[3];data.Remaining_time=(data.Remaining_time<<8)|UART0_Receive_BUF[4];break;//主面板传递剩余时间，副面板提取剩余时间
        	    	case 0x03:break;                              //副面板不需要接收主面板的阀门开关状态
        	    	case 0x04:data.Bind_State=BIND_STATE_DISCONNECTED;break;//在上电时或对码时，需要更新绑定logo，主面板传递连接信号，副面板收到信号将绑定logo点亮
        	    	default:  break;
        	    }
        	  }
        	  
        	  else if(UART0_Receive_BUF[1] == 0xAB)	             //当前数据来自副面板
        	  {
        	  	 return;                                         //副面板不会收到副面板发出的数据
        	  }
        	  
        	  else if(UART0_Receive_BUF[1] == 0xAC)              //当前数据来自执行器
        	  {
        	  	 return;                                         //副面板不与执行器通信
        	  }
        	  
        	#endif
        	UART0_Receive_Finish_Flag = 0;                       //清空接收完成标志位
        }
        
}
        	