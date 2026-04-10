#include "HT67F2362A.h"
#include "data.h"

#define  A_VALUE _pc0
#define  B_VALUE _pe7

unsigned char last_result    = 0;           // 上一次采样的A/B相组合状态值
unsigned char current_result = 0;           // 当前采样的A/B相组合状态值

unsigned char Forward[4] = {0};
unsigned char Reverse[4] = {0};

unsigned char record[4] = {3,1,0,0};
unsigned char write = 0;
unsigned char read  = 0;

/*一般方法：
单片机可利用定时器中断来检测A和B的状态，中断时间在5~20ms之间均可。                    未转动:11 正转:AB数值:11->01->00->10  反转:11->10->00->01

当检测到A^B= 0时，表示为静止状态，记下A和B的状态，静止状态为11或00。                                        3-> 1-> 0-> 2        3-> 2-> 0-> 1

当检测到A^B= 1时，表示有转动，读取AB的状态，如果AB是从11到01或者是

从00到10则为正转，反之如果AB是从11到10或者是从00到01则为反转。
*/

void EC11_Init(void)
{
	/*硬件初始化*/
	_pcc0 = 1;   //A相，PC0设为输入模式
	_pec7 = 1;   //B相，PE7设为输入模式
	
	/*读取AB相电平，确定初始值*/
	last_result = (A_VALUE << 1) | B_VALUE;
	record[write] = last_result;
	write = (write + 1) % 4;

	/*初始化正反转数组，数组下标为AB按位或引索，数组值为前一个状态*/
	//正转
	Forward[3] = 0xff;   //新周期开始，不管
	Forward[1] = 3;
	Forward[0] = 1;
	Forward[2] = 0;
	
	//反转
	Reverse[3] = 0xff;  //新周期开始，不管
	Reverse[2] = 3;
	Reverse[0] = 2;
	Reverse[1] = 0;
}

//处理并上报旋转编码器事件(主循环中运行)
void EC11_Handle(void)                    
{
	unsigned char r2;

	current_result = A_VALUE << 1 | B_VALUE;
	

	if(current_result != last_result)	//AB相跳变时再判断旋转方向
	{
		record[write] = current_result;
		read = write;
		write = (write + 1) % 4;
			
		if(current_result == 2 && last_result == 0)                           //编码器顺时针旋转
		{
			r2 = record[((read + 2) % 4)];
			if(r2 == 1)
			{
			   Handle_EC11_ADD();
			}
		}
			
		else if(current_result == 1 && last_result == 0)                      //编码器逆时针旋转
		{
			r2 = record[((read + 2) % 4)];
			if(r2 == 2)
			{
				Handle_EC11_MIN();
			}
		}
		last_result = current_result;
	}

}