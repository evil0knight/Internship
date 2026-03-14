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
		LJUMP 	7FH 			//0001 	387F
		LJUMP 	63H 			//0002 	3863
		LJUMP 	73H 			//0003 	3873
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	70H 			//0006 	01F0
		LDR 	PCLATH,0 		//0007 	080A
		STR 	71H 			//0008 	01F1
		LJUMP 	94H 			//0009 	3894
		LJUMP 	0BH 			//000A 	380B
		CLRR 	7AH 			//000B 	017A
		CLRR 	7BH 			//000C 	017B
		BCR 	STATUS,5 		//000D 	1283
		CLRR 	4EH 			//000E 	014E
		CLRR 	4FH 			//000F 	014F
		CLRR 	50H 			//0010 	0150
		CLRR 	STATUS 			//0011 	0103
		LJUMP 	5EH 			//0012 	385E

		//;test_ft60e21x_PA_INT.C: 226: uint8_t i,k;
		//;test_ft60e21x_PA_INT.C: 227: uint32_t j;
		//;test_ft60e21x_PA_INT.C: 228: if((Addr_1527 > 0xfffff) || Data >15)
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

		//;test_ft60e21x_PA_INT.C: 231: GIE = 0;
		BCR 	INTCON,7 		//0026 	138B

		//;test_ft60e21x_PA_INT.C: 233: coding_syn_1527();
		LCALL 	194H 			//0027 	3194

		//;test_ft60e21x_PA_INT.C: 235: for(i=0;i<20;i++)
		CLRR 	4CH 			//0028 	014C

		//;test_ft60e21x_PA_INT.C: 236: {
		//;test_ft60e21x_PA_INT.C: 237: j = (0x80000 & Addr_1527);
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

		//;test_ft60e21x_PA_INT.C: 238: Addr_1527 = (Addr_1527 << 1);
		BCR 	STATUS,0 		//0037 	1003
		RLR 	42H,1 			//0038 	05C2
		RLR 	43H,1 			//0039 	05C3
		RLR 	44H,1 			//003A 	05C4
		RLR 	45H,1 			//003B 	05C5

		//;test_ft60e21x_PA_INT.C: 239: if(j != 0)
		LDR 	4AH,0 			//003C 	084A
		IORWR 	49H,0 			//003D 	0349
		IORWR 	48H,0 			//003E 	0348
		IORWR 	47H,0 			//003F 	0347
		BTSC 	STATUS,2 		//0040 	1503
		LJUMP 	44H 			//0041 	3844

		//;test_ft60e21x_PA_INT.C: 240: coding_H_1527();
		LCALL 	170H 			//0042 	3170
		LJUMP 	45H 			//0043 	3845

		//;test_ft60e21x_PA_INT.C: 241: else
		//;test_ft60e21x_PA_INT.C: 242: coding_L_1527();
		LCALL 	159H 			//0044 	3159
		LDWI 	14H 			//0045 	2A14
		INCR	4CH,1 			//0046 	09CC
		SUBWR 	4CH,0 			//0047 	0C4C
		BTSS 	STATUS,0 		//0048 	1C03
		LJUMP 	29H 			//0049 	3829

		//;test_ft60e21x_PA_INT.C: 243: }
		//;test_ft60e21x_PA_INT.C: 245: for(i=0;i<4;i++)
		CLRR 	4CH 			//004A 	014C

		//;test_ft60e21x_PA_INT.C: 246: {
		//;test_ft60e21x_PA_INT.C: 247: k = (0x08 & Data);
		LDR 	46H,0 			//004B 	0846
		STR 	4BH 			//004C 	01CB
		LDWI 	8H 			//004D 	2A08
		ANDWR 	4BH,1 			//004E 	02CB

		//;test_ft60e21x_PA_INT.C: 248: Data = (Data << 1);
		BCR 	STATUS,0 		//004F 	1003
		RLR 	46H,1 			//0050 	05C6

		//;test_ft60e21x_PA_INT.C: 249: if(k != 0)
		LDR 	4BH,0 			//0051 	084B
		BTSC 	STATUS,2 		//0052 	1503
		LJUMP 	56H 			//0053 	3856

		//;test_ft60e21x_PA_INT.C: 250: coding_H_1527();
		LCALL 	170H 			//0054 	3170
		LJUMP 	57H 			//0055 	3857

		//;test_ft60e21x_PA_INT.C: 251: else
		//;test_ft60e21x_PA_INT.C: 252: coding_L_1527();
		LCALL 	159H 			//0056 	3159
		LDWI 	4H 			//0057 	2A04
		INCR	4CH,1 			//0058 	09CC
		SUBWR 	4CH,0 			//0059 	0C4C
		BTSS 	STATUS,0 		//005A 	1C03
		LJUMP 	4BH 			//005B 	384B

		//;test_ft60e21x_PA_INT.C: 253: }
		//;test_ft60e21x_PA_INT.C: 254: GIE = 1;
		BSR 	INTCON,7 		//005C 	1B8B
		RET		 					//005D 	0004

		//;test_ft60e21x_PA_INT.C: 300: POWER_INITIAL();
		LCALL 	14CH 			//005E 	314C

		//;test_ft60e21x_PA_INT.C: 301: TIMER0_INITIAL();
		LCALL 	17AH 			//005F 	317A

		//;test_ft60e21x_PA_INT.C: 302: GIE = 1;
		BSR 	INTCON,7 		//0060 	1B8B

		//;test_ft60e21x_PA_INT.C: 303: T0IE = 1;
		BSR 	INTCON,5 		//0061 	1A8B
		LJUMP 	80H 			//0062 	3880

		//;test_ft60e21x_PA_INT.C: 315: for(uint8_t i=0; i<3; i++)
		CLRR 	4DH 			//0063 	014D

		//;test_ft60e21x_PA_INT.C: 316: {
		//;test_ft60e21x_PA_INT.C: 318: coding_1527(0x12345, 0x01);
		LCALL 	8CH 			//0064 	308C
		CLRR 	46H 			//0065 	0146
		INCR	46H,1 			//0066 	09C6
		LCALL 	13H 			//0067 	3013

		//;test_ft60e21x_PA_INT.C: 321: LED_Flickering1();
		LCALL 	135H 			//0068 	3135
		LDWI 	3H 			//0069 	2A03
		BCR 	STATUS,5 		//006A 	1283
		INCR	4DH,1 			//006B 	09CD
		SUBWR 	4DH,0 			//006C 	0C4D
		BTSS 	STATUS,0 		//006D 	1C03
		LJUMP 	64H 			//006E 	3864

		//;test_ft60e21x_PA_INT.C: 322: }
		//;test_ft60e21x_PA_INT.C: 323: LED_Flickering3();
		LCALL 	11EH 			//006F 	311E

		//;test_ft60e21x_PA_INT.C: 324: g_state = STATE_WAKEUP;
		BCR 	STATUS,5 		//0070 	1283
		CLRR 	50H 			//0071 	0150

		//;test_ft60e21x_PA_INT.C: 325: break;
		LJUMP 	80H 			//0072 	3880

		//;test_ft60e21x_PA_INT.C: 328: coding_1527(0x12345, 0x02);
		LCALL 	8CH 			//0073 	308C
		LDWI 	2H 			//0074 	2A02
		STR 	46H 			//0075 	01C6
		LCALL 	13H 			//0076 	3013

		//;test_ft60e21x_PA_INT.C: 329: PA3=0;
		BCR 	5H,3 			//0077 	1185

		//;test_ft60e21x_PA_INT.C: 331: Enter_Deep_Sleep();
		LCALL 	18CH 			//0078 	318C

		//;test_ft60e21x_PA_INT.C: 334: System_Reinit();
		LCALL 	19BH 			//0079 	319B

		//;test_ft60e21x_PA_INT.C: 335: g_state = STATE_WAKEUP;
		BCR 	STATUS,5 		//007A 	1283
		CLRR 	50H 			//007B 	0150

		//;test_ft60e21x_PA_INT.C: 336: g_timer_5s = 0;
		CLRR 	4EH 			//007C 	014E
		CLRR 	4FH 			//007D 	014F

		//;test_ft60e21x_PA_INT.C: 337: break;
		LJUMP 	80H 			//007E 	3880

		//;test_ft60e21x_PA_INT.C: 338: case STATE_WAKEUP:
		//;test_ft60e21x_PA_INT.C: 340: PA3=1;
		BSR 	5H,3 			//007F 	1985

		//;test_ft60e21x_PA_INT.C: 341: break;
		LDR 	50H,0 			//0080 	0850
		STR 	FSR 			//0081 	0184
		LDWI 	3H 			//0082 	2A03
		SUBWR 	FSR,0 			//0083 	0C04
		BTSC 	STATUS,0 		//0084 	1403
		LJUMP 	80H 			//0085 	3880
		LDWI 	0H 			//0086 	2A00
		STR 	PCLATH 			//0087 	018A
		LDWI 	1H 			//0088 	2A01
		ADDWR 	FSR,0 			//0089 	0B04
		STR 	PCL 			//008A 	0182
		LJUMP 	0AH 			//008B 	380A
		LDWI 	1H 			//008C 	2A01
		CLRR 	45H 			//008D 	0145
		STR 	44H 			//008E 	01C4
		LDWI 	23H 			//008F 	2A23
		STR 	43H 			//0090 	01C3
		LDWI 	45H 			//0091 	2A45
		STR 	42H 			//0092 	01C2
		RET		 					//0093 	0004

		//;test_ft60e21x_PA_INT.C: 48: if(INTCON & 0x04)
		BTSS 	INTCON,2 		//0094 	1D0B
		LJUMP 	BDH 			//0095 	38BD

		//;test_ft60e21x_PA_INT.C: 49: {
		//;test_ft60e21x_PA_INT.C: 50: if (g_state == STATE_WAKEUP) {
		BCR 	STATUS,5 		//0096 	1283
		LDR 	50H,0 			//0097 	0850
		BTSS 	STATUS,2 		//0098 	1D03
		LJUMP 	BAH 			//0099 	38BA

		//;test_ft60e21x_PA_INT.C: 52: g_timer_5s++;
		INCR	4EH,1 			//009A 	09CE
		BTSC 	STATUS,2 		//009B 	1503
		INCR	4FH,1 			//009C 	09CF

		//;test_ft60e21x_PA_INT.C: 53: if (g_timer_5s >= 500) {
		LDWI 	1H 			//009D 	2A01
		SUBWR 	4FH,0 			//009E 	0C4F
		LDWI 	F4H 			//009F 	2AF4
		BTSC 	STATUS,2 		//00A0 	1503
		SUBWR 	4EH,0 			//00A1 	0C4E
		BTSS 	STATUS,0 		//00A2 	1C03
		LJUMP 	A8H 			//00A3 	38A8

		//;test_ft60e21x_PA_INT.C: 54: g_state = STATE_SLEEP;
		LDWI 	2H 			//00A4 	2A02
		STR 	50H 			//00A5 	01D0

		//;test_ft60e21x_PA_INT.C: 55: g_timer_5s = 0;
		CLRR 	4EH 			//00A6 	014E
		CLRR 	4FH 			//00A7 	014F

		//;test_ft60e21x_PA_INT.C: 56: }
		//;test_ft60e21x_PA_INT.C: 59: if (PA5 == 0) {
		BTSC 	5H,5 			//00A8 	1685
		LJUMP 	B8H 			//00A9 	38B8

		//;test_ft60e21x_PA_INT.C: 60: g_timer_2s++;
		INCR	7AH,1 			//00AA 	09FA
		BTSC 	STATUS,2 		//00AB 	1503
		INCR	7BH,1 			//00AC 	09FB

		//;test_ft60e21x_PA_INT.C: 61: if (g_timer_2s >= 200) {
		LDWI 	0H 			//00AD 	2A00
		SUBWR 	7BH,0 			//00AE 	0C7B
		LDWI 	C8H 			//00AF 	2AC8
		BTSC 	STATUS,2 		//00B0 	1503
		SUBWR 	7AH,0 			//00B1 	0C7A
		BTSS 	STATUS,0 		//00B2 	1C03
		LJUMP 	BAH 			//00B3 	38BA

		//;test_ft60e21x_PA_INT.C: 62: g_state = STATE_PAIRING;
		LDWI 	1H 			//00B4 	2A01
		STR 	50H 			//00B5 	01D0

		//;test_ft60e21x_PA_INT.C: 63: g_timer_5s = 0;
		CLRR 	4EH 			//00B6 	014E
		CLRR 	4FH 			//00B7 	014F

		//;test_ft60e21x_PA_INT.C: 64: g_timer_2s = 0;
		CLRR 	7AH 			//00B8 	017A
		CLRR 	7BH 			//00B9 	017B

		//;test_ft60e21x_PA_INT.C: 68: }
		//;test_ft60e21x_PA_INT.C: 69: }
		//;test_ft60e21x_PA_INT.C: 70: INTCON &= ~(1<<2);
		BCR 	INTCON,2 		//00BA 	110B

		//;test_ft60e21x_PA_INT.C: 71: TMR0 =100;
		LDWI 	64H 			//00BB 	2A64
		STR 	1H 			//00BC 	0181
		LDR 	71H,0 			//00BD 	0871
		STR 	PCLATH 			//00BE 	018A
		SWAPR 	70H,0 			//00BF 	0770
		STR 	STATUS 			//00C0 	0183
		SWAPR 	7EH,1 			//00C1 	07FE
		SWAPR 	7EH,0 			//00C2 	077E
		RETI		 			//00C3 	0009

		//;test_ft60e21x_PA_INT.C: 131: uint16_t j;
		//;test_ft60e21x_PA_INT.C: 132: us = us * 3;
		LDWI 	3H 			//00C4 	2A03
		STR 	72H 			//00C5 	01F2
		CLRR 	73H 			//00C6 	0173
		LDR 	79H,0 			//00C7 	0879
		STR 	75H 			//00C8 	01F5
		LDR 	78H,0 			//00C9 	0878
		STR 	74H 			//00CA 	01F4
		LCALL 	ECH 			//00CB 	30EC
		LDR 	73H,0 			//00CC 	0873
		STR 	79H 			//00CD 	01F9
		LDR 	72H,0 			//00CE 	0872
		STR 	78H 			//00CF 	01F8

		//;test_ft60e21x_PA_INT.C: 133: for(j=0;j<us;j++)
		CLRR 	40H 			//00D0 	0140
		CLRR 	41H 			//00D1 	0141
		LDR 	79H,0 			//00D2 	0879
		SUBWR 	41H,0 			//00D3 	0C41
		BTSS 	STATUS,2 		//00D4 	1D03
		LJUMP 	D8H 			//00D5 	38D8
		LDR 	78H,0 			//00D6 	0878
		SUBWR 	40H,0 			//00D7 	0C40
		BTSC 	STATUS,0 		//00D8 	1403
		RET		 					//00D9 	0004

		//;test_ft60e21x_PA_INT.C: 134: {
		//;test_ft60e21x_PA_INT.C: 135: __nop();__nop();__nop();__nop();__nop();__nop();__nop();__
		//+                          nop();__nop();__nop();__nop();__nop();__nop();
		NOP		 					//00DA 	0000
		NOP		 					//00DB 	0000
		NOP		 					//00DC 	0000
		NOP		 					//00DD 	0000
		NOP		 					//00DE 	0000
		NOP		 					//00DF 	0000
		NOP		 					//00E0 	0000
		NOP		 					//00E1 	0000
		NOP		 					//00E2 	0000
		NOP		 					//00E3 	0000
		NOP		 					//00E4 	0000
		NOP		 					//00E5 	0000
		NOP		 					//00E6 	0000
		BCR 	STATUS,5 		//00E7 	1283
		INCR	40H,1 			//00E8 	09C0
		BTSC 	STATUS,2 		//00E9 	1503
		INCR	41H,1 			//00EA 	09C1
		LJUMP 	D2H 			//00EB 	38D2
		CLRR 	76H 			//00EC 	0176
		CLRR 	77H 			//00ED 	0177
		BTSS 	72H,0 			//00EE 	1C72
		LJUMP 	F6H 			//00EF 	38F6
		LDR 	74H,0 			//00F0 	0874
		ADDWR 	76H,1 			//00F1 	0BF6
		BTSC 	STATUS,0 		//00F2 	1403
		INCR	77H,1 			//00F3 	09F7
		LDR 	75H,0 			//00F4 	0875
		ADDWR 	77H,1 			//00F5 	0BF7
		BCR 	STATUS,0 		//00F6 	1003
		RLR 	74H,1 			//00F7 	05F4
		RLR 	75H,1 			//00F8 	05F5
		BCR 	STATUS,0 		//00F9 	1003
		RRR	73H,1 			//00FA 	06F3
		RRR	72H,1 			//00FB 	06F2
		LDR 	72H,0 			//00FC 	0872
		IORWR 	73H,0 			//00FD 	0373
		BTSS 	STATUS,2 		//00FE 	1D03
		LJUMP 	EEH 			//00FF 	38EE
		LDR 	77H,0 			//0100 	0877
		STR 	73H 			//0101 	01F3
		LDR 	76H,0 			//0102 	0876
		STR 	72H 			//0103 	01F2
		RET		 					//0104 	0004
		STR 	75H 			//0105 	01F5

		//;test_ft60e21x_PA_INT.C: 147: for(unsigned int a=0;a<Time;a++)
		CLRR 	76H 			//0106 	0176
		CLRR 	77H 			//0107 	0177
		LDR 	75H,0 			//0108 	0875
		STR 	73H 			//0109 	01F3
		CLRR 	74H 			//010A 	0174
		LDR 	74H,0 			//010B 	0874
		SUBWR 	77H,0 			//010C 	0C77
		BTSS 	STATUS,2 		//010D 	1D03
		LJUMP 	111H 			//010E 	3911
		LDR 	73H,0 			//010F 	0873
		SUBWR 	76H,0 			//0110 	0C76
		BTSC 	STATUS,0 		//0111 	1403
		RET		 					//0112 	0004

		//;test_ft60e21x_PA_INT.C: 148: {
		//;test_ft60e21x_PA_INT.C: 149: for(unsigned char b=0;b<83;b++)
		CLRR 	78H 			//0113 	0178

		//;test_ft60e21x_PA_INT.C: 150: {
		//;test_ft60e21x_PA_INT.C: 151: Delay10Us();
		LCALL 	184H 			//0114 	3184
		LDWI 	53H 			//0115 	2A53
		INCR	78H,1 			//0116 	09F8
		SUBWR 	78H,0 			//0117 	0C78
		BTSS 	STATUS,0 		//0118 	1C03
		LJUMP 	114H 			//0119 	3914
		INCR	76H,1 			//011A 	09F6
		BTSC 	STATUS,2 		//011B 	1503
		INCR	77H,1 			//011C 	09F7
		LJUMP 	108H 			//011D 	3908

		//;test_ft60e21x_PA_INT.C: 278: for(int i=0;i<6;i++)
		CLRR 	40H 			//011E 	0140
		CLRR 	41H 			//011F 	0141

		//;test_ft60e21x_PA_INT.C: 279: {
		//;test_ft60e21x_PA_INT.C: 280: PA3 = (PA3 == 1 ? 0 : 1);
		LDWI 	8H 			//0120 	2A08
		BCR 	STATUS,5 		//0121 	1283
		XORWR 	5H,1 			//0122 	0485

		//;test_ft60e21x_PA_INT.C: 281: DelayMs(50);
		LDWI 	32H 			//0123 	2A32
		LCALL 	105H 			//0124 	3105
		BCR 	STATUS,5 		//0125 	1283
		INCR	40H,1 			//0126 	09C0
		BTSC 	STATUS,2 		//0127 	1503
		INCR	41H,1 			//0128 	09C1
		LDR 	41H,0 			//0129 	0841
		XORWI 	80H 			//012A 	2680
		STR 	7FH 			//012B 	01FF
		LDWI 	80H 			//012C 	2A80
		SUBWR 	7FH,0 			//012D 	0C7F
		BTSS 	STATUS,2 		//012E 	1D03
		LJUMP 	132H 			//012F 	3932
		LDWI 	6H 			//0130 	2A06
		SUBWR 	40H,0 			//0131 	0C40
		BTSC 	STATUS,0 		//0132 	1403
		RET		 					//0133 	0004
		LJUMP 	120H 			//0134 	3920

		//;test_ft60e21x_PA_INT.C: 286: for(int i=0;i<3;i++)
		CLRR 	40H 			//0135 	0140
		CLRR 	41H 			//0136 	0141

		//;test_ft60e21x_PA_INT.C: 287: {
		//;test_ft60e21x_PA_INT.C: 288: PA3 = (PA3 == 1 ? 0 : 1);
		LDWI 	8H 			//0137 	2A08
		BCR 	STATUS,5 		//0138 	1283
		XORWR 	5H,1 			//0139 	0485

		//;test_ft60e21x_PA_INT.C: 289: DelayMs(10);
		LDWI 	AH 			//013A 	2A0A
		LCALL 	105H 			//013B 	3105
		BCR 	STATUS,5 		//013C 	1283
		INCR	40H,1 			//013D 	09C0
		BTSC 	STATUS,2 		//013E 	1503
		INCR	41H,1 			//013F 	09C1
		LDR 	41H,0 			//0140 	0841
		XORWI 	80H 			//0141 	2680
		STR 	7FH 			//0142 	01FF
		LDWI 	80H 			//0143 	2A80
		SUBWR 	7FH,0 			//0144 	0C7F
		BTSS 	STATUS,2 		//0145 	1D03
		LJUMP 	149H 			//0146 	3949
		LDWI 	3H 			//0147 	2A03
		SUBWR 	40H,0 			//0148 	0C40
		BTSC 	STATUS,0 		//0149 	1403
		RET		 					//014A 	0004
		LJUMP 	137H 			//014B 	3937

		//;test_ft60e21x_PA_INT.C: 82: OSCCON = 0B01100000;
		LDWI 	60H 			//014C 	2A60
		BSR 	STATUS,5 		//014D 	1A83
		STR 	FH 			//014E 	018F

		//;test_ft60e21x_PA_INT.C: 83: INTCON = 0;
		CLRR 	INTCON 			//014F 	010B

		//;test_ft60e21x_PA_INT.C: 85: PORTA = 0B00000000;
		BCR 	STATUS,5 		//0150 	1283
		CLRR 	5H 			//0151 	0105

		//;test_ft60e21x_PA_INT.C: 86: TRISA = 0B00100100;
		LDWI 	24H 			//0152 	2A24
		BSR 	STATUS,5 		//0153 	1A83
		STR 	5H 			//0154 	0185

		//;test_ft60e21x_PA_INT.C: 87: WPUA = 0B00100100;
		STR 	15H 			//0155 	0195

		//;test_ft60e21x_PA_INT.C: 89: MSCON = 0B00000000;
		BCR 	STATUS,5 		//0156 	1283
		CLRR 	1BH 			//0157 	011B
		RET		 					//0158 	0004

		//;test_ft60e21x_PA_INT.C: 206: PA4=1;
		//;test_ft60e21x_PA_INT.C: 207: delay_us(4);
		LCALL 	160H 			//0159 	3160
		LCALL 	C4H 			//015A 	30C4

		//;test_ft60e21x_PA_INT.C: 208: PA4=0;
		BCR 	5H,4 			//015B 	1205

		//;test_ft60e21x_PA_INT.C: 209: delay_us(12);
		LDWI 	CH 			//015C 	2A0C
		STR 	78H 			//015D 	01F8
		CLRR 	79H 			//015E 	0179
		LJUMP 	C4H 			//015F 	38C4
		BSR 	5H,4 			//0160 	1A05
		LDWI 	4H 			//0161 	2A04
		STR 	78H 			//0162 	01F8
		CLRR 	79H 			//0163 	0179
		RET		 					//0164 	0004

		//;test_ft60e21x_PA_INT.C: 180: TRISA2 = 1;
		BSR 	STATUS,5 		//0165 	1A83
		BSR 	5H,2 			//0166 	1905

		//;test_ft60e21x_PA_INT.C: 181: TRISA5 = 1;
		BSR 	5H,5 			//0167 	1A85

		//;test_ft60e21x_PA_INT.C: 186: ReadAPin = PORTA;
		BCR 	STATUS,5 		//0168 	1283
		LDR 	5H,0 			//0169 	0805

		//;test_ft60e21x_PA_INT.C: 188: PAIF = 0;
		BCR 	INTCON,0 		//016A 	100B

		//;test_ft60e21x_PA_INT.C: 190: IOCA2 = 1;
		BSR 	STATUS,5 		//016B 	1A83
		BSR 	16H,2 			//016C 	1916

		//;test_ft60e21x_PA_INT.C: 191: IOCA5 = 1;
		BSR 	16H,5 			//016D 	1A96

		//;test_ft60e21x_PA_INT.C: 193: PAIE = 1;
		BSR 	INTCON,3 		//016E 	198B
		RET		 					//016F 	0004

		//;test_ft60e21x_PA_INT.C: 214: PA4=1;
		BSR 	5H,4 			//0170 	1A05

		//;test_ft60e21x_PA_INT.C: 215: delay_us(12);
		LDWI 	CH 			//0171 	2A0C
		STR 	78H 			//0172 	01F8
		CLRR 	79H 			//0173 	0179
		LCALL 	C4H 			//0174 	30C4

		//;test_ft60e21x_PA_INT.C: 216: PA4=0;
		BCR 	5H,4 			//0175 	1205

		//;test_ft60e21x_PA_INT.C: 217: delay_us(4);
		LDWI 	4H 			//0176 	2A04
		STR 	78H 			//0177 	01F8
		CLRR 	79H 			//0178 	0179
		LJUMP 	C4H 			//0179 	38C4

		//;test_ft60e21x_PA_INT.C: 99: T0ON = 0;
		BCR 	1FH,3 			//017A 	119F

		//;test_ft60e21x_PA_INT.C: 100: TMR0 = 100;
		LDWI 	64H 			//017B 	2A64
		STR 	1H 			//017C 	0181

		//;test_ft60e21x_PA_INT.C: 101: T0CON0 = 0B00000000;
		CLRR 	1FH 			//017D 	011F

		//;test_ft60e21x_PA_INT.C: 102: OPTION = 0B00000110;
		LDWI 	6H 			//017E 	2A06
		BSR 	STATUS,5 		//017F 	1A83
		STR 	1H 			//0180 	0181

		//;test_ft60e21x_PA_INT.C: 109: T0ON = 1;
		BCR 	STATUS,5 		//0181 	1283
		BSR 	1FH,3 			//0182 	199F
		RET		 					//0183 	0004

		//;test_ft60e21x_PA_INT.C: 119: for(unsigned char i=0;i<2;i++)
		CLRR 	72H 			//0184 	0172

		//;test_ft60e21x_PA_INT.C: 120: {
		//;test_ft60e21x_PA_INT.C: 121: __nop();
		NOP		 					//0185 	0000
		LDWI 	2H 			//0186 	2A02
		INCR	72H,1 			//0187 	09F2
		SUBWR 	72H,0 			//0188 	0C72
		BTSC 	STATUS,0 		//0189 	1403
		RET		 					//018A 	0004
		LJUMP 	185H 			//018B 	3985

		//;test_ft60e21x_PA_INT.C: 260: Wakeup_INITIAL();
		LCALL 	165H 			//018C 	3165

		//;test_ft60e21x_PA_INT.C: 261: GIE = 0;
		BCR 	INTCON,7 		//018D 	138B

		//;test_ft60e21x_PA_INT.C: 262: __nop();
		NOP		 					//018E 	0000

		//;test_ft60e21x_PA_INT.C: 263: __nop();
		NOP		 					//018F 	0000
		SLEEP	 			//0190 	0002

		//;test_ft60e21x_PA_INT.C: 265: __nop();
		NOP		 					//0191 	0000

		//;test_ft60e21x_PA_INT.C: 266: __nop();
		NOP		 					//0192 	0000
		RET		 					//0193 	0004

		//;test_ft60e21x_PA_INT.C: 198: PA4=1;
		//;test_ft60e21x_PA_INT.C: 199: delay_us(4);
		LCALL 	160H 			//0194 	3160
		LCALL 	C4H 			//0195 	30C4

		//;test_ft60e21x_PA_INT.C: 200: PA4=0;
		BCR 	5H,4 			//0196 	1205

		//;test_ft60e21x_PA_INT.C: 201: delay_us(124);
		LDWI 	7CH 			//0197 	2A7C
		STR 	78H 			//0198 	01F8
		CLRR 	79H 			//0199 	0179
		LJUMP 	C4H 			//019A 	38C4

		//;test_ft60e21x_PA_INT.C: 270: PAIF = 0;
		BCR 	INTCON,0 		//019B 	100B

		//;test_ft60e21x_PA_INT.C: 271: PAIE = 0;
		BCR 	INTCON,3 		//019C 	118B

		//;test_ft60e21x_PA_INT.C: 272: IOCA2 =0;
		BSR 	STATUS,5 		//019D 	1A83
		BCR 	16H,2 			//019E 	1116

		//;test_ft60e21x_PA_INT.C: 273: T0IE = 1;
		BSR 	INTCON,5 		//019F 	1A8B

		//;test_ft60e21x_PA_INT.C: 274: GIE = 1;
		BSR 	INTCON,7 		//01A0 	1B8B
		RET		 					//01A1 	0004
			END
