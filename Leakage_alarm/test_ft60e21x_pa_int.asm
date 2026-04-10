//Deviec:FT60E21X
//-----------------------Variable---------------------------------
		_PA3		EQU		05H
		_PA4		EQU		05H
		_PA5		EQU		05H
		_PAIF		EQU		0BH
		_PAIE		EQU		0BH
		_T0IE		EQU		0BH
		_GIE		EQU		0BH
		_T0ON		EQU		1FH
		_TRISA2		EQU		85H
		_TRISA5		EQU		85H
		_IOCA2		EQU		96H
		_IOCA5		EQU		96H
		_g_state		EQU		50H
		_g_timer_5s		EQU		4EH
		_g_timer_2s		EQU		7AH
//		main@i		EQU		4DH
//		coding_preamble_1527@i		EQU		42H
//		coding_1527@j		EQU		47H
//		coding_1527@i		EQU		4CH
//		coding_1527@k		EQU		4BH
//		coding_1527@Addr_1527		EQU		42H
//		coding_1527@Data		EQU		46H
//		delay_us@j		EQU		40H
//		delay_us@us		EQU		78H
//		___wmul@product		EQU		76H
//		___wmul@multiplier		EQU		72H
//		___wmul@multiplicand		EQU		74H
//		LED_Flickering3@i		EQU		40H
//		LED_Flickering1@i		EQU		40H
//		DelayMs@Time		EQU		75H
//		DelayMs@b		EQU		78H
//		DelayMs@a		EQU		76H
//		DelayMs@Time		EQU		75H
//		DelayMs@Time		EQU		75H
//		Delay10Us@i		EQU		72H
//-----------------------Variable END---------------------------------

		LJUMP 	0AH 			//0000 	380A
		LJUMP 	C7H 			//0001 	38C7
		LJUMP 	A8H 			//0002 	38A8
		LJUMP 	B9H 			//0003 	38B9
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	70H 			//0006 	01F0
		LDR 	PCLATH,0 		//0007 	080A
		STR 	71H 			//0008 	01F1
		LJUMP 	DCH 			//0009 	38DC
		LJUMP 	0BH 			//000A 	380B
		CLRR 	7AH 			//000B 	017A
		CLRR 	7BH 			//000C 	017B
		BCR 	STATUS,5 		//000D 	1283
		CLRR 	4EH 			//000E 	014E
		CLRR 	4FH 			//000F 	014F
		CLRR 	50H 			//0010 	0150
		CLRR 	STATUS 			//0011 	0103
		LJUMP 	A3H 			//0012 	38A3

		//;test_ft60e21x_PA_INT.C: 238: uint8_t i,k;
		//;test_ft60e21x_PA_INT.C: 239: uint32_t j;
		//;test_ft60e21x_PA_INT.C: 240: if((Addr_1527 > 0xfffff) || Data >15)
		LDR 	45H,0 			//0013 	0845
		BTSS 	STATUS,2 		//0014 	1D03
		RET		 					//0015 	0004
		LDWI 	10H 			//0016 	2A10
		SUBWR 	44H,0 			//0017 	0C44
		BTSS 	STATUS,2 		//0018 	1D03
		LJUMP 	20H 			//0019 	3820
		LDWI 	0H 			//001A 	2A00
		SUBWR 	43H,0 			//001B 	0C43
		BTSS 	STATUS,2 		//001C 	1D03
		LJUMP 	20H 			//001D 	3820
		LDWI 	0H 			//001E 	2A00
		SUBWR 	42H,0 			//001F 	0C42
		BTSC 	STATUS,0 		//0020 	1403
		RET		 					//0021 	0004
		LDWI 	10H 			//0022 	2A10
		SUBWR 	46H,0 			//0023 	0C46
		BTSC 	STATUS,0 		//0024 	1403
		RET		 					//0025 	0004

		//;test_ft60e21x_PA_INT.C: 243: GIE = 0;
		BCR 	INTCON,7 		//0026 	138B

		//;test_ft60e21x_PA_INT.C: 247: coding_syn_1527();
		LCALL 	1B6H 			//0027 	31B6

		//;test_ft60e21x_PA_INT.C: 249: for(i=0;i<20;i++)
		CLRR 	4CH 			//0028 	014C

		//;test_ft60e21x_PA_INT.C: 250: {
		//;test_ft60e21x_PA_INT.C: 251: j = (0x80000 & Addr_1527);
		LDR 	45H,0 			//0029 	0845
		STR 	4AH 			//002A 	01CA
		LDR 	44H,0 			//002B 	0844
		STR 	49H 			//002C 	01C9
		LDR 	43H,0 			//002D 	0843
		STR 	48H 			//002E 	01C8
		LDR 	42H,0 			//002F 	0842
		STR 	47H 			//0030 	01C7
		LDWI 	8H 			//0031 	2A08
		CLRR 	47H 			//0032 	0147
		CLRR 	48H 			//0033 	0148
		ANDWR 	49H,1 			//0034 	02C9
		LDWI 	0H 			//0035 	2A00
		CLRR 	4AH 			//0036 	014A

		//;test_ft60e21x_PA_INT.C: 252: Addr_1527 = (Addr_1527 << 1);
		BCR 	STATUS,0 		//0037 	1003
		RLR 	42H,1 			//0038 	05C2
		RLR 	43H,1 			//0039 	05C3
		RLR 	44H,1 			//003A 	05C4
		RLR 	45H,1 			//003B 	05C5

		//;test_ft60e21x_PA_INT.C: 253: if(j != 0)
		LDR 	4AH,0 			//003C 	084A
		IORWR 	49H,0 			//003D 	0349
		IORWR 	48H,0 			//003E 	0348
		IORWR 	47H,0 			//003F 	0347
		BTSC 	STATUS,2 		//0040 	1503
		LJUMP 	44H 			//0041 	3844

		//;test_ft60e21x_PA_INT.C: 254: coding_H_1527();
		LCALL 	192H 			//0042 	3192
		LJUMP 	45H 			//0043 	3845

		//;test_ft60e21x_PA_INT.C: 255: else
		//;test_ft60e21x_PA_INT.C: 256: coding_L_1527();
		LCALL 	1BDH 			//0044 	31BD
		LDWI 	14H 			//0045 	2A14
		INCR	4CH,1 			//0046 	09CC
		SUBWR 	4CH,0 			//0047 	0C4C
		BTSS 	STATUS,0 		//0048 	1C03
		LJUMP 	29H 			//0049 	3829

		//;test_ft60e21x_PA_INT.C: 257: }
		//;test_ft60e21x_PA_INT.C: 259: for(i=0;i<4;i++)
		CLRR 	4CH 			//004A 	014C

		//;test_ft60e21x_PA_INT.C: 260: {
		//;test_ft60e21x_PA_INT.C: 261: k = (0x08 & Data);
		LDR 	46H,0 			//004B 	0846
		STR 	4BH 			//004C 	01CB
		LDWI 	8H 			//004D 	2A08
		ANDWR 	4BH,1 			//004E 	02CB

		//;test_ft60e21x_PA_INT.C: 262: Data = (Data << 1);
		BCR 	STATUS,0 		//004F 	1003
		RLR 	46H,1 			//0050 	05C6

		//;test_ft60e21x_PA_INT.C: 263: if(k != 0)
		LDR 	4BH,0 			//0051 	084B
		BTSC 	STATUS,2 		//0052 	1503
		LJUMP 	56H 			//0053 	3856

		//;test_ft60e21x_PA_INT.C: 264: coding_H_1527();
		LCALL 	192H 			//0054 	3192
		LJUMP 	57H 			//0055 	3857

		//;test_ft60e21x_PA_INT.C: 265: else
		//;test_ft60e21x_PA_INT.C: 266: coding_L_1527();
		LCALL 	1BDH 			//0056 	31BD
		LDWI 	4H 			//0057 	2A04
		INCR	4CH,1 			//0058 	09CC
		SUBWR 	4CH,0 			//0059 	0C4C
		BTSS 	STATUS,0 		//005A 	1C03
		LJUMP 	4BH 			//005B 	384B

		//;test_ft60e21x_PA_INT.C: 267: }
		//;test_ft60e21x_PA_INT.C: 268: PA4=1;
		//;test_ft60e21x_PA_INT.C: 269: delay_us(4);
		LCALL 	61H 			//005C 	3061
		LCALL 	66H 			//005D 	3066

		//;test_ft60e21x_PA_INT.C: 270: PA4=0;
		BCR 	5H,4 			//005E 	1205

		//;test_ft60e21x_PA_INT.C: 271: GIE = 1;
		BSR 	INTCON,7 		//005F 	1B8B
		RET		 					//0060 	0004
		BSR 	5H,4 			//0061 	1A05
		LDWI 	4H 			//0062 	2A04
		STR 	78H 			//0063 	01F8
		CLRR 	79H 			//0064 	0179
		RET		 					//0065 	0004

		//;test_ft60e21x_PA_INT.C: 131: uint16_t j;
		//;test_ft60e21x_PA_INT.C: 132: us = us * 3;
		LDWI 	3H 			//0066 	2A03
		STR 	72H 			//0067 	01F2
		CLRR 	73H 			//0068 	0173
		LDR 	79H,0 			//0069 	0879
		STR 	75H 			//006A 	01F5
		LDR 	78H,0 			//006B 	0878
		STR 	74H 			//006C 	01F4
		LCALL 	10CH 			//006D 	310C
		LDR 	73H,0 			//006E 	0873
		STR 	79H 			//006F 	01F9
		LDR 	72H,0 			//0070 	0872
		STR 	78H 			//0071 	01F8

		//;test_ft60e21x_PA_INT.C: 133: for(j=0;j<us;j++)
		CLRR 	40H 			//0072 	0140
		CLRR 	41H 			//0073 	0141
		LDR 	79H,0 			//0074 	0879
		SUBWR 	41H,0 			//0075 	0C41
		BTSS 	STATUS,2 		//0076 	1D03
		LJUMP 	7AH 			//0077 	387A
		LDR 	78H,0 			//0078 	0878
		SUBWR 	40H,0 			//0079 	0C40
		BTSC 	STATUS,0 		//007A 	1403
		RET		 					//007B 	0004

		//;test_ft60e21x_PA_INT.C: 134: {
		//;test_ft60e21x_PA_INT.C: 135: __nop();__nop();__nop();__nop();__nop();__nop();__nop();__
		//+                          nop();__nop();__nop();__nop();__nop();__nop();
		NOP		 					//007C 	0000
		NOP		 					//007D 	0000
		NOP		 					//007E 	0000
		NOP		 					//007F 	0000
		NOP		 					//0080 	0000
		NOP		 					//0081 	0000
		NOP		 					//0082 	0000
		NOP		 					//0083 	0000
		NOP		 					//0084 	0000
		NOP		 					//0085 	0000
		NOP		 					//0086 	0000
		NOP		 					//0087 	0000
		NOP		 					//0088 	0000

		//;test_ft60e21x_PA_INT.C: 136: __nop();__nop();__nop();__nop();__nop();__nop();__nop();__
		//+                          nop();__nop();__nop();__nop();__nop();__nop();
		NOP		 					//0089 	0000
		NOP		 					//008A 	0000
		NOP		 					//008B 	0000
		NOP		 					//008C 	0000
		NOP		 					//008D 	0000
		NOP		 					//008E 	0000
		NOP		 					//008F 	0000
		NOP		 					//0090 	0000
		NOP		 					//0091 	0000
		NOP		 					//0092 	0000
		NOP		 					//0093 	0000
		NOP		 					//0094 	0000
		NOP		 					//0095 	0000

		//;test_ft60e21x_PA_INT.C: 137: __nop();__nop();__nop();__nop();__nop();__nop();__nop();__
		//+                          nop();
		NOP		 					//0096 	0000
		NOP		 					//0097 	0000
		NOP		 					//0098 	0000
		NOP		 					//0099 	0000
		NOP		 					//009A 	0000
		NOP		 					//009B 	0000
		NOP		 					//009C 	0000
		NOP		 					//009D 	0000
		BCR 	STATUS,5 		//009E 	1283
		INCR	40H,1 			//009F 	09C0
		BTSC 	STATUS,2 		//00A0 	1503
		INCR	41H,1 			//00A1 	09C1
		LJUMP 	74H 			//00A2 	3874

		//;test_ft60e21x_PA_INT.C: 317: POWER_INITIAL();
		LCALL 	17AH 			//00A3 	317A

		//;test_ft60e21x_PA_INT.C: 318: TIMER0_INITIAL();
		LCALL 	19CH 			//00A4 	319C

		//;test_ft60e21x_PA_INT.C: 319: GIE = 1;
		BSR 	INTCON,7 		//00A5 	1B8B

		//;test_ft60e21x_PA_INT.C: 320: T0IE = 1;
		BSR 	INTCON,5 		//00A6 	1A8B
		LJUMP 	C8H 			//00A7 	38C8

		//;test_ft60e21x_PA_INT.C: 332: for(uint8_t i=0; i<3; i++)
		CLRR 	4DH 			//00A8 	014D

		//;test_ft60e21x_PA_INT.C: 333: {
		//;test_ft60e21x_PA_INT.C: 335: coding_preamble_1527();
		LCALL 	16CH 			//00A9 	316C

		//;test_ft60e21x_PA_INT.C: 336: coding_1527(0x12345, 0x01);
		LCALL 	D4H 			//00AA 	30D4
		CLRR 	46H 			//00AB 	0146
		INCR	46H,1 			//00AC 	09C6
		LCALL 	13H 			//00AD 	3013

		//;test_ft60e21x_PA_INT.C: 339: LED_Flickering1();
		LCALL 	155H 			//00AE 	3155
		LDWI 	3H 			//00AF 	2A03
		BCR 	STATUS,5 		//00B0 	1283
		INCR	4DH,1 			//00B1 	09CD
		SUBWR 	4DH,0 			//00B2 	0C4D
		BTSS 	STATUS,0 		//00B3 	1C03
		LJUMP 	A9H 			//00B4 	38A9

		//;test_ft60e21x_PA_INT.C: 340: }
		//;test_ft60e21x_PA_INT.C: 341: LED_Flickering3();
		LCALL 	13EH 			//00B5 	313E

		//;test_ft60e21x_PA_INT.C: 342: g_state = STATE_WAKEUP;
		BCR 	STATUS,5 		//00B6 	1283
		CLRR 	50H 			//00B7 	0150

		//;test_ft60e21x_PA_INT.C: 343: break;
		LJUMP 	C8H 			//00B8 	38C8

		//;test_ft60e21x_PA_INT.C: 344: case STATE_SLEEP:
		//;test_ft60e21x_PA_INT.C: 346: GIE = 0;
		BCR 	INTCON,7 		//00B9 	138B

		//;test_ft60e21x_PA_INT.C: 347: coding_preamble_1527();
		LCALL 	16CH 			//00BA 	316C

		//;test_ft60e21x_PA_INT.C: 348: coding_1527(0x12345, 0x02);
		LCALL 	D4H 			//00BB 	30D4
		LDWI 	2H 			//00BC 	2A02
		STR 	46H 			//00BD 	01C6
		LCALL 	13H 			//00BE 	3013

		//;test_ft60e21x_PA_INT.C: 349: PA3=0;
		BCR 	5H,3 			//00BF 	1185

		//;test_ft60e21x_PA_INT.C: 351: Enter_Deep_Sleep();
		LCALL 	1AEH 			//00C0 	31AE

		//;test_ft60e21x_PA_INT.C: 354: System_Reinit();
		LCALL 	1C4H 			//00C1 	31C4

		//;test_ft60e21x_PA_INT.C: 355: g_state = STATE_WAKEUP;
		BCR 	STATUS,5 		//00C2 	1283
		CLRR 	50H 			//00C3 	0150

		//;test_ft60e21x_PA_INT.C: 356: g_timer_5s = 0;
		CLRR 	4EH 			//00C4 	014E
		CLRR 	4FH 			//00C5 	014F

		//;test_ft60e21x_PA_INT.C: 357: break;
		LJUMP 	C8H 			//00C6 	38C8

		//;test_ft60e21x_PA_INT.C: 358: case STATE_WAKEUP:
		//;test_ft60e21x_PA_INT.C: 360: PA3=1;
		BSR 	5H,3 			//00C7 	1985

		//;test_ft60e21x_PA_INT.C: 361: break;
		LDR 	50H,0 			//00C8 	0850
		STR 	FSR 			//00C9 	0184
		LDWI 	3H 			//00CA 	2A03
		SUBWR 	FSR,0 			//00CB 	0C04
		BTSC 	STATUS,0 		//00CC 	1403
		LJUMP 	C8H 			//00CD 	38C8
		LDWI 	0H 			//00CE 	2A00
		STR 	PCLATH 			//00CF 	018A
		LDWI 	1H 			//00D0 	2A01
		ADDWR 	FSR,0 			//00D1 	0B04
		STR 	PCL 			//00D2 	0182
		LJUMP 	0AH 			//00D3 	380A
		LDWI 	1H 			//00D4 	2A01
		CLRR 	45H 			//00D5 	0145
		STR 	44H 			//00D6 	01C4
		LDWI 	23H 			//00D7 	2A23
		STR 	43H 			//00D8 	01C3
		LDWI 	45H 			//00D9 	2A45
		STR 	42H 			//00DA 	01C2
		RET		 					//00DB 	0004

		//;test_ft60e21x_PA_INT.C: 48: if(INTCON & 0x04)
		BTSS 	INTCON,2 		//00DC 	1D0B
		LJUMP 	105H 			//00DD 	3905

		//;test_ft60e21x_PA_INT.C: 49: {
		//;test_ft60e21x_PA_INT.C: 50: if (g_state == STATE_WAKEUP) {
		BCR 	STATUS,5 		//00DE 	1283
		LDR 	50H,0 			//00DF 	0850
		BTSS 	STATUS,2 		//00E0 	1D03
		LJUMP 	102H 			//00E1 	3902

		//;test_ft60e21x_PA_INT.C: 52: g_timer_5s++;
		INCR	4EH,1 			//00E2 	09CE
		BTSC 	STATUS,2 		//00E3 	1503
		INCR	4FH,1 			//00E4 	09CF

		//;test_ft60e21x_PA_INT.C: 53: if (g_timer_5s >= 500) {
		LDWI 	1H 			//00E5 	2A01
		SUBWR 	4FH,0 			//00E6 	0C4F
		LDWI 	F4H 			//00E7 	2AF4
		BTSC 	STATUS,2 		//00E8 	1503
		SUBWR 	4EH,0 			//00E9 	0C4E
		BTSS 	STATUS,0 		//00EA 	1C03
		LJUMP 	F0H 			//00EB 	38F0

		//;test_ft60e21x_PA_INT.C: 54: g_state = STATE_SLEEP;
		LDWI 	2H 			//00EC 	2A02
		STR 	50H 			//00ED 	01D0

		//;test_ft60e21x_PA_INT.C: 55: g_timer_5s = 0;
		CLRR 	4EH 			//00EE 	014E
		CLRR 	4FH 			//00EF 	014F

		//;test_ft60e21x_PA_INT.C: 56: }
		//;test_ft60e21x_PA_INT.C: 59: if (PA5 == 0) {
		BTSC 	5H,5 			//00F0 	1685
		LJUMP 	100H 			//00F1 	3900

		//;test_ft60e21x_PA_INT.C: 60: g_timer_2s++;
		INCR	7AH,1 			//00F2 	09FA
		BTSC 	STATUS,2 		//00F3 	1503
		INCR	7BH,1 			//00F4 	09FB

		//;test_ft60e21x_PA_INT.C: 61: if (g_timer_2s >= 200) {
		LDWI 	0H 			//00F5 	2A00
		SUBWR 	7BH,0 			//00F6 	0C7B
		LDWI 	C8H 			//00F7 	2AC8
		BTSC 	STATUS,2 		//00F8 	1503
		SUBWR 	7AH,0 			//00F9 	0C7A
		BTSS 	STATUS,0 		//00FA 	1C03
		LJUMP 	102H 			//00FB 	3902

		//;test_ft60e21x_PA_INT.C: 62: g_state = STATE_PAIRING;
		LDWI 	1H 			//00FC 	2A01
		STR 	50H 			//00FD 	01D0

		//;test_ft60e21x_PA_INT.C: 63: g_timer_5s = 0;
		CLRR 	4EH 			//00FE 	014E
		CLRR 	4FH 			//00FF 	014F

		//;test_ft60e21x_PA_INT.C: 64: g_timer_2s = 0;
		CLRR 	7AH 			//0100 	017A
		CLRR 	7BH 			//0101 	017B

		//;test_ft60e21x_PA_INT.C: 68: }
		//;test_ft60e21x_PA_INT.C: 69: }
		//;test_ft60e21x_PA_INT.C: 70: INTCON &= ~(1<<2);
		BCR 	INTCON,2 		//0102 	110B

		//;test_ft60e21x_PA_INT.C: 71: TMR0 =100;
		LDWI 	64H 			//0103 	2A64
		STR 	1H 			//0104 	0181
		LDR 	71H,0 			//0105 	0871
		STR 	PCLATH 			//0106 	018A
		SWAPR 	70H,0 			//0107 	0770
		STR 	STATUS 			//0108 	0183
		SWAPR 	7EH,1 			//0109 	07FE
		SWAPR 	7EH,0 			//010A 	077E
		RETI		 			//010B 	0009
		CLRR 	76H 			//010C 	0176
		CLRR 	77H 			//010D 	0177
		BTSS 	72H,0 			//010E 	1C72
		LJUMP 	116H 			//010F 	3916
		LDR 	74H,0 			//0110 	0874
		ADDWR 	76H,1 			//0111 	0BF6
		BTSC 	STATUS,0 		//0112 	1403
		INCR	77H,1 			//0113 	09F7
		LDR 	75H,0 			//0114 	0875
		ADDWR 	77H,1 			//0115 	0BF7
		BCR 	STATUS,0 		//0116 	1003
		RLR 	74H,1 			//0117 	05F4
		RLR 	75H,1 			//0118 	05F5
		BCR 	STATUS,0 		//0119 	1003
		RRR	73H,1 			//011A 	06F3
		RRR	72H,1 			//011B 	06F2
		LDR 	72H,0 			//011C 	0872
		IORWR 	73H,0 			//011D 	0373
		BTSS 	STATUS,2 		//011E 	1D03
		LJUMP 	10EH 			//011F 	390E
		LDR 	77H,0 			//0120 	0877
		STR 	73H 			//0121 	01F3
		LDR 	76H,0 			//0122 	0876
		STR 	72H 			//0123 	01F2
		RET		 					//0124 	0004
		STR 	75H 			//0125 	01F5

		//;test_ft60e21x_PA_INT.C: 149: for(unsigned int a=0;a<Time;a++)
		CLRR 	76H 			//0126 	0176
		CLRR 	77H 			//0127 	0177
		LDR 	75H,0 			//0128 	0875
		STR 	73H 			//0129 	01F3
		CLRR 	74H 			//012A 	0174
		LDR 	74H,0 			//012B 	0874
		SUBWR 	77H,0 			//012C 	0C77
		BTSS 	STATUS,2 		//012D 	1D03
		LJUMP 	131H 			//012E 	3931
		LDR 	73H,0 			//012F 	0873
		SUBWR 	76H,0 			//0130 	0C76
		BTSC 	STATUS,0 		//0131 	1403
		RET		 					//0132 	0004

		//;test_ft60e21x_PA_INT.C: 150: {
		//;test_ft60e21x_PA_INT.C: 151: for(unsigned char b=0;b<83;b++)
		CLRR 	78H 			//0133 	0178

		//;test_ft60e21x_PA_INT.C: 152: {
		//;test_ft60e21x_PA_INT.C: 153: Delay10Us();
		LCALL 	1A6H 			//0134 	31A6
		LDWI 	53H 			//0135 	2A53
		INCR	78H,1 			//0136 	09F8
		SUBWR 	78H,0 			//0137 	0C78
		BTSS 	STATUS,0 		//0138 	1C03
		LJUMP 	134H 			//0139 	3934
		INCR	76H,1 			//013A 	09F6
		BTSC 	STATUS,2 		//013B 	1503
		INCR	77H,1 			//013C 	09F7
		LJUMP 	128H 			//013D 	3928

		//;test_ft60e21x_PA_INT.C: 295: for(int i=0;i<6;i++)
		CLRR 	40H 			//013E 	0140
		CLRR 	41H 			//013F 	0141

		//;test_ft60e21x_PA_INT.C: 296: {
		//;test_ft60e21x_PA_INT.C: 297: PA3 = (PA3 == 1 ? 0 : 1);
		LDWI 	8H 			//0140 	2A08
		BCR 	STATUS,5 		//0141 	1283
		XORWR 	5H,1 			//0142 	0485

		//;test_ft60e21x_PA_INT.C: 298: DelayMs(50);
		LDWI 	32H 			//0143 	2A32
		LCALL 	125H 			//0144 	3125
		BCR 	STATUS,5 		//0145 	1283
		INCR	40H,1 			//0146 	09C0
		BTSC 	STATUS,2 		//0147 	1503
		INCR	41H,1 			//0148 	09C1
		LDR 	41H,0 			//0149 	0841
		XORWI 	80H 			//014A 	2680
		STR 	7FH 			//014B 	01FF
		LDWI 	80H 			//014C 	2A80
		SUBWR 	7FH,0 			//014D 	0C7F
		BTSS 	STATUS,2 		//014E 	1D03
		LJUMP 	152H 			//014F 	3952
		LDWI 	6H 			//0150 	2A06
		SUBWR 	40H,0 			//0151 	0C40
		BTSC 	STATUS,0 		//0152 	1403
		RET		 					//0153 	0004
		LJUMP 	140H 			//0154 	3940

		//;test_ft60e21x_PA_INT.C: 303: for(int i=0;i<3;i++)
		CLRR 	40H 			//0155 	0140
		CLRR 	41H 			//0156 	0141

		//;test_ft60e21x_PA_INT.C: 304: {
		//;test_ft60e21x_PA_INT.C: 305: PA3 = (PA3 == 1 ? 0 : 1);
		LDWI 	8H 			//0157 	2A08
		BCR 	STATUS,5 		//0158 	1283
		XORWR 	5H,1 			//0159 	0485

		//;test_ft60e21x_PA_INT.C: 306: DelayMs(10);
		LDWI 	AH 			//015A 	2A0A
		LCALL 	125H 			//015B 	3125
		BCR 	STATUS,5 		//015C 	1283
		INCR	40H,1 			//015D 	09C0
		BTSC 	STATUS,2 		//015E 	1503
		INCR	41H,1 			//015F 	09C1
		LDR 	41H,0 			//0160 	0841
		XORWI 	80H 			//0161 	2680
		STR 	7FH 			//0162 	01FF
		LDWI 	80H 			//0163 	2A80
		SUBWR 	7FH,0 			//0164 	0C7F
		BTSS 	STATUS,2 		//0165 	1D03
		LJUMP 	169H 			//0166 	3969
		LDWI 	3H 			//0167 	2A03
		SUBWR 	40H,0 			//0168 	0C40
		BTSC 	STATUS,0 		//0169 	1403
		RET		 					//016A 	0004
		LJUMP 	157H 			//016B 	3957

		//;test_ft60e21x_PA_INT.C: 224: uint8_t i;
		//;test_ft60e21x_PA_INT.C: 225: for(i = 0; i < 10; i++) {
		CLRR 	42H 			//016C 	0142

		//;test_ft60e21x_PA_INT.C: 226: PA4=1;
		//;test_ft60e21x_PA_INT.C: 227: delay_us(4);
		LCALL 	61H 			//016D 	3061
		LCALL 	66H 			//016E 	3066

		//;test_ft60e21x_PA_INT.C: 228: PA4=0;
		BCR 	5H,4 			//016F 	1205

		//;test_ft60e21x_PA_INT.C: 229: delay_us(20);
		LDWI 	14H 			//0170 	2A14
		STR 	78H 			//0171 	01F8
		CLRR 	79H 			//0172 	0179
		LCALL 	66H 			//0173 	3066
		LDWI 	AH 			//0174 	2A0A
		INCR	42H,1 			//0175 	09C2
		SUBWR 	42H,0 			//0176 	0C42
		BTSC 	STATUS,0 		//0177 	1403
		RET		 					//0178 	0004
		LJUMP 	16DH 			//0179 	396D

		//;test_ft60e21x_PA_INT.C: 82: OSCCON = 0B01100000;
		LDWI 	60H 			//017A 	2A60
		BSR 	STATUS,5 		//017B 	1A83
		STR 	FH 			//017C 	018F

		//;test_ft60e21x_PA_INT.C: 83: INTCON = 0;
		CLRR 	INTCON 			//017D 	010B

		//;test_ft60e21x_PA_INT.C: 85: PORTA = 0B00000000;
		BCR 	STATUS,5 		//017E 	1283
		CLRR 	5H 			//017F 	0105

		//;test_ft60e21x_PA_INT.C: 86: TRISA = 0B00100100;
		LDWI 	24H 			//0180 	2A24
		BSR 	STATUS,5 		//0181 	1A83
		STR 	5H 			//0182 	0185

		//;test_ft60e21x_PA_INT.C: 87: WPUA = 0B00100100;
		STR 	15H 			//0183 	0195

		//;test_ft60e21x_PA_INT.C: 89: MSCON = 0B00000000;
		BCR 	STATUS,5 		//0184 	1283
		CLRR 	1BH 			//0185 	011B
		RET		 					//0186 	0004

		//;test_ft60e21x_PA_INT.C: 182: TRISA2 = 1;
		BSR 	STATUS,5 		//0187 	1A83
		BSR 	5H,2 			//0188 	1905

		//;test_ft60e21x_PA_INT.C: 183: TRISA5 = 1;
		BSR 	5H,5 			//0189 	1A85

		//;test_ft60e21x_PA_INT.C: 188: ReadAPin = PORTA;
		BCR 	STATUS,5 		//018A 	1283
		LDR 	5H,0 			//018B 	0805

		//;test_ft60e21x_PA_INT.C: 190: PAIF = 0;
		BCR 	INTCON,0 		//018C 	100B

		//;test_ft60e21x_PA_INT.C: 192: IOCA2 = 1;
		BSR 	STATUS,5 		//018D 	1A83
		BSR 	16H,2 			//018E 	1916

		//;test_ft60e21x_PA_INT.C: 193: IOCA5 = 1;
		BSR 	16H,5 			//018F 	1A96

		//;test_ft60e21x_PA_INT.C: 195: PAIE = 1;
		BSR 	INTCON,3 		//0190 	198B
		RET		 					//0191 	0004

		//;test_ft60e21x_PA_INT.C: 216: PA4=1;
		BSR 	5H,4 			//0192 	1A05

		//;test_ft60e21x_PA_INT.C: 217: delay_us(12);
		LDWI 	CH 			//0193 	2A0C
		STR 	78H 			//0194 	01F8
		CLRR 	79H 			//0195 	0179
		LCALL 	66H 			//0196 	3066

		//;test_ft60e21x_PA_INT.C: 218: PA4=0;
		BCR 	5H,4 			//0197 	1205

		//;test_ft60e21x_PA_INT.C: 219: delay_us(4);
		LDWI 	4H 			//0198 	2A04
		STR 	78H 			//0199 	01F8
		CLRR 	79H 			//019A 	0179
		LJUMP 	66H 			//019B 	3866

		//;test_ft60e21x_PA_INT.C: 99: T0ON = 0;
		BCR 	1FH,3 			//019C 	119F

		//;test_ft60e21x_PA_INT.C: 100: TMR0 = 100;
		LDWI 	64H 			//019D 	2A64
		STR 	1H 			//019E 	0181

		//;test_ft60e21x_PA_INT.C: 101: T0CON0 = 0B00000000;
		CLRR 	1FH 			//019F 	011F

		//;test_ft60e21x_PA_INT.C: 102: OPTION = 0B00000110;
		LDWI 	6H 			//01A0 	2A06
		BSR 	STATUS,5 		//01A1 	1A83
		STR 	1H 			//01A2 	0181

		//;test_ft60e21x_PA_INT.C: 109: T0ON = 1;
		BCR 	STATUS,5 		//01A3 	1283
		BSR 	1FH,3 			//01A4 	199F
		RET		 					//01A5 	0004

		//;test_ft60e21x_PA_INT.C: 119: for(unsigned char i=0;i<2;i++)
		CLRR 	72H 			//01A6 	0172

		//;test_ft60e21x_PA_INT.C: 120: {
		//;test_ft60e21x_PA_INT.C: 121: __nop();
		NOP		 					//01A7 	0000
		LDWI 	2H 			//01A8 	2A02
		INCR	72H,1 			//01A9 	09F2
		SUBWR 	72H,0 			//01AA 	0C72
		BTSC 	STATUS,0 		//01AB 	1403
		RET		 					//01AC 	0004
		LJUMP 	1A7H 			//01AD 	39A7

		//;test_ft60e21x_PA_INT.C: 277: Wakeup_INITIAL();
		LCALL 	187H 			//01AE 	3187

		//;test_ft60e21x_PA_INT.C: 278: GIE = 0;
		BCR 	INTCON,7 		//01AF 	138B

		//;test_ft60e21x_PA_INT.C: 279: __nop();
		NOP		 					//01B0 	0000

		//;test_ft60e21x_PA_INT.C: 280: __nop();
		NOP		 					//01B1 	0000
		SLEEP	 			//01B2 	0002

		//;test_ft60e21x_PA_INT.C: 282: __nop();
		NOP		 					//01B3 	0000

		//;test_ft60e21x_PA_INT.C: 283: __nop();
		NOP		 					//01B4 	0000
		RET		 					//01B5 	0004

		//;test_ft60e21x_PA_INT.C: 200: PA4=1;
		//;test_ft60e21x_PA_INT.C: 201: delay_us(4);
		LCALL 	61H 			//01B6 	3061
		LCALL 	66H 			//01B7 	3066

		//;test_ft60e21x_PA_INT.C: 202: PA4=0;
		BCR 	5H,4 			//01B8 	1205

		//;test_ft60e21x_PA_INT.C: 203: delay_us(124);
		LDWI 	7CH 			//01B9 	2A7C
		STR 	78H 			//01BA 	01F8
		CLRR 	79H 			//01BB 	0179
		LJUMP 	66H 			//01BC 	3866

		//;test_ft60e21x_PA_INT.C: 208: PA4=1;
		//;test_ft60e21x_PA_INT.C: 209: delay_us(4);
		LCALL 	61H 			//01BD 	3061
		LCALL 	66H 			//01BE 	3066

		//;test_ft60e21x_PA_INT.C: 210: PA4=0;
		BCR 	5H,4 			//01BF 	1205

		//;test_ft60e21x_PA_INT.C: 211: delay_us(12);
		LDWI 	CH 			//01C0 	2A0C
		STR 	78H 			//01C1 	01F8
		CLRR 	79H 			//01C2 	0179
		LJUMP 	66H 			//01C3 	3866

		//;test_ft60e21x_PA_INT.C: 287: PAIF = 0;
		BCR 	INTCON,0 		//01C4 	100B

		//;test_ft60e21x_PA_INT.C: 288: PAIE = 0;
		BCR 	INTCON,3 		//01C5 	118B

		//;test_ft60e21x_PA_INT.C: 289: IOCA2 =0;
		BSR 	STATUS,5 		//01C6 	1A83
		BCR 	16H,2 			//01C7 	1116

		//;test_ft60e21x_PA_INT.C: 290: T0IE = 1;
		BSR 	INTCON,5 		//01C8 	1A8B

		//;test_ft60e21x_PA_INT.C: 291: GIE = 1;
		BSR 	INTCON,7 		//01C9 	1B8B
		RET		 					//01CA 	0004
			END
