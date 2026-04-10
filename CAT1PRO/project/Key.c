#include "HT67F2362A.h"
#include "Key.h"
#include "Data.h"
#include "UART0_433MHZ.h"
#include "UART1_WIFI.h"

struct Key_Config                                    //单个按键结构体
{
	unsigned char Name;					             //按键名称
	unsigned char State;				             //按键状态 0:按下,1:松开
	unsigned char Key_Type;                          //按键类型 0:短按上报一次1:长按上报一次,2:长按间隔上报
};

struct Key_Config Key[KEY_NUM] =                     //按键结构体数组(初始化默认为未按下状态)
{
  {ADD_KEY,RELEASE,LONG_PRESS_INTERVAL_REPORT},      //加键，长按间隔上报
  {MIN_KEY,RELEASE,LONG_PRESS_INTERVAL_REPORT},      //减键，长按间隔上报
  {WIFI_CONFIG_KEY,RELEASE,LONG_PRESS_SINGLE_REPORT},//WIFI配网键，长按单次上报
  {PAIR_CODE_KEY,RELEASE,LONG_PRESS_SINGLE_REPORT},  //对码键，长按单次上报
  {CONFIRM_KEY,RELEASE,SHORT_PRESS_REPORT}           //确认键，短按上报
};

#define Debounce_CNT                   2             //消抖计时(2代指20ms，因为对应函数10ms执行一次)
#define LONG_PRESS_INTERVAL_CNT        30            //长按间隔上报(长按达到300ms上报一次)
#define LONG_PRESS_SINGLE_CNT          100           //长按单次上报(长按达到1s上报)

unsigned char LONG_PRESS_INTERVAL_REPORT_CNT[KEY_NUM]={0};//所有按键的长按上报计时(部分未使用)
unsigned char Debounce[KEY_NUM]={0};                 //所有按键的消抖计时
unsigned char Long_Press_SINGLE_REPORT_CNT[KEY_NUM]={0}; //长按单次计时
unsigned char Key_Report_CNT[KEY_NUM]={0};           //所有按键的上报计次

void Key_Init(void)                                  //按键初始化
{
	 /*按键配置为输入模式*/
 	 _pdc2 = 1;
 	 _pdc3 = 1;
 	 _pcc2 = 1;
 	 _pcc1 = 1;
 	 _pec5 = 1;
 	 _pec6 = 1;
	
	/*按键配置为上拉模式*/
	_pdpu2 = 1;
	_pdpu3 = 1;
	_pcpu2 = 1;
	_pcpu1 = 1;
	_pepu5 = 1;
	_pepu6 = 1;
}

unsigned char Key_Read(unsigned char Data)         //输入1-5的按键值，读取相应按键电平
{
	unsigned char Value=0;
    switch(Data)
    {
      case WIFI_CONFIG_KEY: Value = _pd3; break;
	  case ADD_KEY:         Value = _pc1; break;
	  case MIN_KEY:         Value = _pc2; break;
	  case PAIR_CODE_KEY:   Value = _pd2; break;
	  case CONFIRM_KEY:     Value = _pe5; break;
      default:              Value = 0;    break;
    }	
    return Value;
}

void Key_Check(void)                                //按键检测(主循环中10ms执行一次) 
{
    unsigned char i=0;
    unsigned char Value=0;                          //用于储存按键电平
    for(i=0;i<KEY_NUM;i++)                          //依次读取所有按键电平并进行处理
    {
    	Value=Key_Read(Key[i].Name);                //读取按键电平        
    	if(Value==PRESS)                            //按键为按下状态                  
    	{
    	   if(Debounce[i]<Debounce_CNT)             //进行20ms按键消抖
    	   {
    	   	  Debounce[i]++;                        
    	   }
    	   else if(Debounce[i]==Debounce_CNT)	    //消抖延时结束
    	   {
    	   	  Key[i].State=PRESS;                   //更新按键状态为按下
    	   }
    	}
    	else                                        //按键为松开状态
    	{
    		if(Key[i].State == PRESS && Key[i].Key_Type == SHORT_PRESS_REPORT)
    	   	{
    	   		Key_Report_CNT[i] = 1;              //短按按键松开后才上报
    	   	}
    	   	Key[i].State=RELEASE;                   //更新按键状态为松开
    	   	Debounce[i]=0;                          //消抖计时清零
    	   	LONG_PRESS_INTERVAL_REPORT_CNT[i] = 0;  //间隔上报计时清零
    	   	Long_Press_SINGLE_REPORT_CNT[i]=0;      //长按单次上报清零   
    	}
    	if(Key[i].State==PRESS)                     //按键确认按下
    	{
    		switch(Key[i].Key_Type)                 //分别处理不同类型的长按按键              
            {
                case LONG_PRESS_SINGLE_REPORT:
                     if(Long_Press_SINGLE_REPORT_CNT[i] < LONG_PRESS_SINGLE_CNT)//长按时间累加
                     {
                        Long_Press_SINGLE_REPORT_CNT[i]++;
                     }
                     if(Long_Press_SINGLE_REPORT_CNT[i] == LONG_PRESS_SINGLE_CNT)
                     {
                     	Key_Report_CNT[i]=1;        //长按单次上报，按键上报次数对应位置1
                     	Long_Press_SINGLE_REPORT_CNT[i]++; // 防止重复触发,除非松开清零
                     }
                     break;
                case LONG_PRESS_INTERVAL_REPORT:    //长按间隔上报，达到长按间隔事件，按键上报次数+1   
                     // 首次触发：消抖完成 → 立刻+1（只执行1次）
                     if(Long_Press_SINGLE_REPORT_CNT[i] == 0)
                     {
                         Key_Report_CNT[i]++;
                         Long_Press_SINGLE_REPORT_CNT[i]++;
                     }
                     // 第一次触发后，开始计时1秒（等待期，不触发）
                     else if(Long_Press_SINGLE_REPORT_CNT[i] < LONG_PRESS_SINGLE_CNT)
                     {
                         Long_Press_SINGLE_REPORT_CNT[i]++;
                     }
                     // 1秒等待结束 → 开始每300ms自动累加
                     else
                     {
                        LONG_PRESS_INTERVAL_REPORT_CNT[i]++;
                        if(LONG_PRESS_INTERVAL_REPORT_CNT[i] >= LONG_PRESS_INTERVAL_CNT)
                        {
                            LONG_PRESS_INTERVAL_REPORT_CNT[i] = 0;
                            Key_Report_CNT[i]++;
                        }
                     }
                     break;
            }
    	}
    }
   
}

void Key_Handle(void)                                              //按键处理函数，针对按键上报次数调用相应函数         
{
     if(Key_Report_CNT[0]>0) { Handle_ADD();Key_Report_CNT[0]--;}  //按键+处理
     if(Key_Report_CNT[1]>0) { Handle_MIN();Key_Report_CNT[1]--;}  //按键-处理
     if(Key_Report_CNT[2]>0) { UART1_WIFI_Config_Flag=1;Key_Report_CNT[2]--;}          //按键WIFI配网处理,配网启动标志位置1，启动配网
     if(Key_Report_CNT[3]>0) { UART0_433MHz_Pairing_Code_Flag=1;Key_Report_CNT[3]--;}  //按键对码处理,对码启动标志位置1,启动对码
     if(Key_Report_CNT[4]>0) { Handle_ADD();Key_Report_CNT[4]--;}  //确认按键处理
}

