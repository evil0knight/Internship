#include "HT67F2362A.h"

void System_Clock_Init(void)           //时钟初始化16MHz
{	
	//内部时钟
	_fhs=0;
	
	//内部时钟频率:16MHz
	_hirc0 = 0;
	_hirc1 = 1;
	
	//系统时钟分频: fsys=16MHz
	_cks0 = 0;
	_cks1 = 0;
	_cks2 = 0;	
	
	//使能时钟
	_hircen = 1;
	//等待时钟稳定
	while(!_hircf);	
	
	//关看门狗
	_we0 = 1;
	_we1 = 0;
	_we2 = 1;
	_we3 = 0;
	_we4 = 1;
}




