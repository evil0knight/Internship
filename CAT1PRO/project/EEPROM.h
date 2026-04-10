#include "HT67F2362A.h"

#ifndef _EEPROM_H_
#define _EEPROM_H_

unsigned char EEPROM_ReadByte(unsigned char src);
void EEPROM_ReadBytes(unsigned char *dest, unsigned char src, unsigned char n);
void EEPROM_WriteByte(unsigned char dest, unsigned char data);
void EEPROM_WriteBytes(unsigned char dest, unsigned char *src, unsigned char n);
unsigned int EEPROM_Read_Master_Address(void);


#endif

