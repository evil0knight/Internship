#include "HT67F2362A.h"

void Delay_ms(unsigned int val)
{
	unsigned int i = 0;
	unsigned int j = 0;
	for(i = 0; i < val; i++)
	{
		for(j = 0; j <= 500; j++)
		{
			_nop();
		}
	}	
}




