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
		LJUMP 	BDH 			//0001 	38BD
		LJUMP 	A1H 			//0002 	38A1
		LJUMP 	B1H 			//0003 	38B1
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	70H 			//0006 	01F0
		LDR 	PCLATH,0 		//0007 	080A
		STR 	71H 			//0008 	01F1
		LJUMP 	D2H 			//0009 	38D2
		LJUMP 	0BH 			//000A 	380B
		CLRR 	7AH 			//000B 	017A
		CLRR 	7BH 			//000C 	017B
		BCR 	STATUS,5 		//000D 	1283
		CLRR 	4EH 			//000E 	014E
		CLRR 	4FH 			//000F 	014F
		CLRR 	50H 			//0010 	0150
		CLRR 	STATUS 			//0011 	0103
		LJUMP 	9CH 			//0012 	389C

		//;test_ft60e21x_PA_INT.C: 256: uint8_t i,k;
		//;test_ft60e21x_PA_INT.C: 257: uint32_t j;
		//;test_ft60e21x_PA_INT.C: 258: if((Addr_1527 > 0xfffff) || Data >15)
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

		//;test_ft60e21x_PA_INT.C: 261: GIE = 0;
		BCR 	INTCON,7 		//0026 	138B

		//;test_ft60e21x_PA_INT.C: 263: coding_rubbish_1527();
		LCALL 	102H 			//0027 	3102

		//;test_ft60e21x_PA_INT.C: 265: coding_syn_1527();
		LCALL 	1B6H 			//0028 	31B6

		//;test_ft60e21x_PA_INT.C: 267: for(i=0;i<20;i++)
		CLRR 	4CH 			//0029 	014C

		//;test_ft60e21x_PA_INT.C: 268: {
		//;test_ft60e21x_PA_INT.C: 269: j = (0x80000 & Addr_1527);
		LDR 	45H,0 			//002A 	0845
		STR 	4AH 			//002B 	01CA
		LDR 	44H,0 			//002C 	0844
		STR 	49H 			//002D 	01C9
		LDR 	43H,0 			//002E 	0843
		STR 	48H 			//002F 	01C8
		LDR 	42H,0 			//0030 	0842
		STR 	47H 			//0031 	01C7
		LDWI 	8H 			//0032 	2A08
		CLRR 	47H 			//0033 	0147
		CLRR 	48H 			//0034 	0148
		ANDWR 	49H,1 			//0035 	02C9
		LDWI 	0H 			//0036 	2A00
		CLRR 	4AH 			//0037 	014A

		//;test_ft60e21x_PA_INT.C: 270: Addr_1527 = (Addr_1527 << 1);
		BCR 	STATUS,0 		//0038 	1003
		RLR 	42H,1 			//0039 	05C2
		RLR 	43H,1 			//003A 	05C3
		RLR 	44H,1 			//003B 	05C4
		RLR 	45H,1 			//003C 	05C5

		//;test_ft60e21x_PA_INT.C: 271: if(j != 0)
		LDR 	4AH,0 			//003D 	084A
		IORWR 	49H,0 			//003E 	0349
		IORWR 	48H,0 			//003F 	0348
		IORWR 	47H,0 			//0040 	0347
		BTSC 	STATUS,2 		//0041 	1503
		LJUMP 	45H 			//0042 	3845

		//;test_ft60e21x_PA_INT.C: 272: coding_H_1527();
		LCALL 	1C4H 			//0043 	31C4
		LJUMP 	46H 			//0044 	3846

		//;test_ft60e21x_PA_INT.C: 273: else
		//;test_ft60e21x_PA_INT.C: 274: coding_L_1527();
		LCALL 	1BDH 			//0045 	31BD
		LDWI 	14H 			//0046 	2A14
		INCR	4CH,1 			//0047 	09CC
		SUBWR 	4CH,0 			//0048 	0C4C
		BTSS 	STATUS,0 		//0049 	1C03
		LJUMP 	2AH 			//004A 	382A

		//;test_ft60e21x_PA_INT.C: 275: }
		//;test_ft60e21x_PA_INT.C: 277: for(i=0;i<4;i++)
		CLRR 	4CH 			//004B 	014C

		//;test_ft60e21x_PA_INT.C: 278: {
		//;test_ft60e21x_PA_INT.C: 279: k = (0x08 & Data);
		LDR 	46H,0 			//004C 	0846
		STR 	4BH 			//004D 	01CB
		LDWI 	8H 			//004E 	2A08
		ANDWR 	4BH,1 			//004F 	02CB

		//;test_ft60e21x_PA_INT.C: 280: Data = (Data << 1);
		BCR 	STATUS,0 		//0050 	1003
		RLR 	46H,1 			//0051 	05C6

		//;test_ft60e21x_PA_INT.C: 281: if(k != 0)
		LDR 	4BH,0 			//0052 	084B
		BTSC 	STATUS,2 		//0053 	1503
		LJUMP 	57H 			//0054 	3857

		//;test_ft60e21x_PA_INT.C: 282: coding_H_1527();
		LCALL 	1C4H 			//0055 	31C4
		LJUMP 	58H 			//0056 	3858

		//;test_ft60e21x_PA_INT.C: 283: else
		//;test_ft60e21x_PA_INT.C: 284: coding_L_1527();
		LCALL 	1BDH 			//0057 	31BD
		LDWI 	4H 			//0058 	2A04
		INCR	4CH,1 			//0059 	09CC
		SUBWR 	4CH,0 			//005A 	0C4C
		BTSS 	STATUS,0 		//005B 	1C03
		LJUMP 	4CH 			//005C 	384C

		//;test_ft60e21x_PA_INT.C: 285: }
		//;test_ft60e21x_PA_INT.C: 286: GIE = 1;
		BSR 	INTCON,7 		//005D 	1B8B
		RET		 					//005E 	0004

		//;test_ft60e21x_PA_INT.C: 131: uint16_t j;
		//;test_ft60e21x_PA_INT.C: 132: us = us * 3;
		LDWI 	3H 			//005F 	2A03
		STR 	72H 			//0060 	01F2
		CLRR 	73H 			//0061 	0173
		LDR 	79H,0 			//0062 	0879
		STR 	75H 			//0063 	01F5
		LDR 	78H,0 			//0064 	0878
		STR 	74H 			//0065 	01F4
		LCALL 	124H 			//0066 	3124
		LDR 	73H,0 			//0067 	0873
		STR 	79H 			//0068 	01F9
		LDR 	72H,0 			//0069 	0872
		STR 	78H 			//006A 	01F8

		//;test_ft60e21x_PA_INT.C: 133: for(j=0;j<us;j++)
		CLRR 	40H 			//006B 	0140
		CLRR 	41H 			//006C 	0141
		LDR 	79H,0 			//006D 	0879
		SUBWR 	41H,0 			//006E 	0C41
		BTSS 	STATUS,2 		//006F 	1D03
		LJUMP 	73H 			//0070 	3873
		LDR 	78H,0 			//0071 	0878
		SUBWR 	40H,0 			//0072 	0C40
		BTSC 	STATUS,0 		//0073 	1403
		RET		 					//0074 	0004

		//;test_ft60e21x_PA_INT.C: 134: {
		//;test_ft60e21x_PA_INT.C: 135: __nop();__nop();__nop();__nop();__nop();__nop();__nop();__
		//+                          nop();__nop();__nop();__nop();__nop();__nop();
		NOP		 					//0075 	0000
		NOP		 					//0076 	0000
		NOP		 					//0077 	0000
		NOP		 					//0078 	0000
		NOP		 					//0079 	0000
		NOP		 					//007A 	0000
		NOP		 					//007B 	0000
		NOP		 					//007C 	0000
		NOP		 					//007D 	0000
		NOP		 					//007E 	0000
		NOP		 					//007F 	0000
		NOP		 					//0080 	0000
		NOP		 					//0081 	0000

		//;test_ft60e21x_PA_INT.C: 136: __nop();__nop();__nop();__nop();__nop();__nop();__nop();__
		//+                          nop();__nop();__nop();__nop();__nop();__nop();
		NOP		 					//0082 	0000
		NOP		 					//0083 	0000
		NOP		 					//0084 	0000
		NOP		 					//0085 	0000
		NOP		 					//0086 	0000
		NOP		 					//0087 	0000
		NOP		 					//0088 	0000
		NOP		 					//0089 	0000
		NOP		 					//008A 	0000
		NOP		 					//008B 	0000
		NOP		 					//008C 	0000
		NOP		 					//008D 	0000
		NOP		 					//008E 	0000

		//;test_ft60e21x_PA_INT.C: 137: __nop();__nop();__nop();__nop();__nop();__nop();__nop();__
		//+                          nop();
		NOP		 					//008F 	0000
		NOP		 					//0090 	0000
		NOP		 					//0091 	0000
		NOP		 					//0092 	0000
		NOP		 					//0093 	0000
		NOP		 					//0094 	0000
		NOP		 					//0095 	0000
		NOP		 					//0096 	0000
		BCR 	STATUS,5 		//0097 	1283
		INCR	40H,1 			//0098 	09C0
		BTSC 	STATUS,2 		//0099 	1503
		INCR	41H,1 			//009A 	09C1
		LJUMP 	6DH 			//009B 	386D

		//;test_ft60e21x_PA_INT.C: 332: POWER_INITIAL();
		LCALL 	184H 			//009C 	3184

		//;test_ft60e21x_PA_INT.C: 333: TIMER0_INITIAL();
		LCALL 	19CH 			//009D 	319C

		//;test_ft60e21x_PA_INT.C: 334: GIE = 1;
		BSR 	INTCON,7 		//009E 	1B8B

		//;test_ft60e21x_PA_INT.C: 335: T0IE = 1;
		BSR 	INTCON,5 		//009F 	1A8B
		LJUMP 	BEH 			//00A0 	38BE

		//;test_ft60e21x_PA_INT.C: 347: for(uint8_t i=0; i<3; i++)
		CLRR 	4DH 			//00A1 	014D

		//;test_ft60e21x_PA_INT.C: 348: {
		//;test_ft60e21x_PA_INT.C: 350: coding_1527(0x12345, 0x01);
		LCALL 	CAH 			//00A2 	30CA
		CLRR 	46H 			//00A3 	0146
		INCR	46H,1 			//00A4 	09C6
		LCALL 	13H 			//00A5 	3013

		//;test_ft60e21x_PA_INT.C: 353: LED_Flickering1();
		LCALL 	16DH 			//00A6 	316D
		LDWI 	3H 			//00A7 	2A03
		BCR 	STATUS,5 		//00A8 	1283
		INCR	4DH,1 			//00A9 	09CD
		SUBWR 	4DH,0 			//00AA 	0C4D
		BTSS 	STATUS,0 		//00AB 	1C03
		LJUMP 	A2H 			//00AC 	38A2

		//;test_ft60e21x_PA_INT.C: 354: }
		//;test_ft60e21x_PA_INT.C: 355: LED_Flickering3();
		LCALL 	156H 			//00AD 	3156

		//;test_ft60e21x_PA_INT.C: 356: g_state = STATE_WAKEUP;
		BCR 	STATUS,5 		//00AE 	1283
		CLRR 	50H 			//00AF 	0150

		//;test_ft60e21x_PA_INT.C: 357: break;
		LJUMP 	BEH 			//00B0 	38BE

		//;test_ft60e21x_PA_INT.C: 360: coding_1527(0x12345, 0x02);
		LCALL 	CAH 			//00B1 	30CA
		LDWI 	2H 			//00B2 	2A02
		STR 	46H 			//00B3 	01C6
		LCALL 	13H 			//00B4 	3013

		//;test_ft60e21x_PA_INT.C: 361: PA3=0;
		BCR 	5H,3 			//00B5 	1185

		//;test_ft60e21x_PA_INT.C: 363: Enter_Deep_Sleep();
		LCALL 	1AEH 			//00B6 	31AE

		//;test_ft60e21x_PA_INT.C: 366: System_Reinit();
		LCALL 	1CBH 			//00B7 	31CB

		//;test_ft60e21x_PA_INT.C: 367: g_state = STATE_WAKEUP;
		BCR 	STATUS,5 		//00B8 	1283
		CLRR 	50H 			//00B9 	0150

		//;test_ft60e21x_PA_INT.C: 368: g_timer_5s = 0;
		CLRR 	4EH 			//00BA 	014E
		CLRR 	4FH 			//00BB 	014F

		//;test_ft60e21x_PA_INT.C: 369: break;
		LJUMP 	BEH 			//00BC 	38BE

		//;test_ft60e21x_PA_INT.C: 370: case STATE_WAKEUP:
		//;test_ft60e21x_PA_INT.C: 372: PA3=1;
		BSR 	5H,3 			//00BD 	1985

		//;test_ft60e21x_PA_INT.C: 373: break;
		LDR 	50H,0 			//00BE 	0850
		STR 	FSR 			//00BF 	0184
		LDWI 	3H 			//00C0 	2A03
		SUBWR 	FSR,0 			//00C1 	0C04
		BTSC 	STATUS,0 		//00C2 	1403
		LJUMP 	BEH 			//00C3 	38BE
		LDWI 	0H 			//00C4 	2A00
		STR 	PCLATH 			//00C5 	018A
		LDWI 	1H 			//00C6 	2A01
		ADDWR 	FSR,0 			//00C7 	0B04
		STR 	PCL 			//00C8 	0182
		LJUMP 	0AH 			//00C9 	380A
		LDWI 	1H 			//00CA 	2A01
		CLRR 	45H 			//00CB 	0145
		STR 	44H 			//00CC 	01C4
		LDWI 	23H 			//00CD 	2A23
		STR 	43H 			//00CE 	01C3
		LDWI 	45H 			//00CF 	2A45
		STR 	42H 			//00D0 	01C2
		RET		 					//00D1 	0004

		//;test_ft60e21x_PA_INT.C: 48: if(INTCON & 0x04)
		BTSS 	INTCON,2 		//00D2 	1D0B
		LJUMP 	FBH 			//00D3 	38FB

		//;test_ft60e21x_PA_INT.C: 49: {
		//;test_ft60e21x_PA_INT.C: 50: if (g_state == STATE_WAKEUP) {
		BCR 	STATUS,5 		//00D4 	1283
		LDR 	50H,0 			//00D5 	0850
		BTSS 	STATUS,2 		//00D6 	1D03
		LJUMP 	F8H 			//00D7 	38F8

		//;test_ft60e21x_PA_INT.C: 52: g_timer_5s++;
		INCR	4EH,1 			//00D8 	09CE
		BTSC 	STATUS,2 		//00D9 	1503
		INCR	4FH,1 			//00DA 	09CF

		//;test_ft60e21x_PA_INT.C: 53: if (g_timer_5s >= 500) {
		LDWI 	1H 			//00DB 	2A01
		SUBWR 	4FH,0 			//00DC 	0C4F
		LDWI 	F4H 			//00DD 	2AF4
		BTSC 	STATUS,2 		//00DE 	1503
		SUBWR 	4EH,0 			//00DF 	0C4E
		BTSS 	STATUS,0 		//00E0 	1C03
		LJUMP 	E6H 			//00E1 	38E6

		//;test_ft60e21x_PA_INT.C: 54: g_state = STATE_SLEEP;
		LDWI 	2H 			//00E2 	2A02
		STR 	50H 			//00E3 	01D0

		//;test_ft60e21x_PA_INT.C: 55: g_timer_5s = 0;
		CLRR 	4EH 			//00E4 	014E
		CLRR 	4FH 			//00E5 	014F

		//;test_ft60e21x_PA_INT.C: 56: }
		//;test_ft60e21x_PA_INT.C: 59: if (PA5 == 0) {
		BTSC 	5H,5 			//00E6 	1685
		LJUMP 	F6H 			//00E7 	38F6

		//;test_ft60e21x_PA_INT.C: 60: g_timer_2s++;
		INCR	7AH,1 			//00E8 	09FA
		BTSC 	STATUS,2 		//00E9 	1503
		INCR	7BH,1 			//00EA 	09FB

		//;test_ft60e21x_PA_INT.C: 61: if (g_timer_2s >= 200) {
		LDWI 	0H 			//00EB 	2A00
		SUBWR 	7BH,0 			//00EC 	0C7B
		LDWI 	C8H 			//00ED 	2AC8
		BTSC 	STATUS,2 		//00EE 	1503
		SUBWR 	7AH,0 			//00EF 	0C7A
		BTSS 	STATUS,0 		//00F0 	1C03
		LJUMP 	F8H 			//00F1 	38F8

		//;test_ft60e21x_PA_INT.C: 62: g_state = STATE_PAIRING;
		LDWI 	1H 			//00F2 	2A01
		STR 	50H 			//00F3 	01D0

		//;test_ft60e21x_PA_INT.C: 63: g_timer_5s = 0;
		CLRR 	4EH 			//00F4 	014E
		CLRR 	4FH 			//00F5 	014F

		//;test_ft60e21x_PA_INT.C: 64: g_timer_2s = 0;
		CLRR 	7AH 			//00F6 	017A
		CLRR 	7BH 			//00F7 	017B

		//;test_ft60e21x_PA_INT.C: 68: }
		//;test_ft60e21x_PA_INT.C: 69: }
		//;test_ft60e21x_PA_INT.C: 70: INTCON &= ~(1<<2);
		BCR 	INTCON,2 		//00F8 	110B

		//;test_ft60e21x_PA_INT.C: 71: TMR0 =100;
		LDWI 	64H 			//00F9 	2A64
		STR 	1H 			//00FA 	0181
		LDR 	71H,0 			//00FB 	0871
		STR 	PCLATH 			//00FC 	018A
		SWAPR 	70H,0 			//00FD 	0770
		STR 	STATUS 			//00FE 	0183
		SWAPR 	7EH,1 			//00FF 	07FE
		SWAPR 	7EH,0 			//0100 	077E
		RETI		 			//0101 	0009

		//;test_ft60e21x_PA_INT.C: 225: PA4=1;
		//;test_ft60e21x_PA_INT.C: 226: delay_us(4);
		LCALL 	11AH 			//0102 	311A
		LCALL 	5FH 			//0103 	305F

		//;test_ft60e21x_PA_INT.C: 227: PA4=0;
		//;test_ft60e21x_PA_INT.C: 228: delay_us(4);
		LCALL 	11FH 			//0104 	311F
		LCALL 	5FH 			//0105 	305F

		//;test_ft60e21x_PA_INT.C: 229: PA4=1;
		//;test_ft60e21x_PA_INT.C: 230: delay_us(4);
		LCALL 	11AH 			//0106 	311A
		LCALL 	5FH 			//0107 	305F

		//;test_ft60e21x_PA_INT.C: 231: PA4=0;
		//;test_ft60e21x_PA_INT.C: 232: delay_us(4);
		LCALL 	11FH 			//0108 	311F
		LCALL 	5FH 			//0109 	305F

		//;test_ft60e21x_PA_INT.C: 233: PA4=1;
		//;test_ft60e21x_PA_INT.C: 234: delay_us(4);
		LCALL 	11AH 			//010A 	311A
		LCALL 	5FH 			//010B 	305F

		//;test_ft60e21x_PA_INT.C: 235: PA4=0;
		//;test_ft60e21x_PA_INT.C: 236: delay_us(4);
		LCALL 	11FH 			//010C 	311F
		LCALL 	5FH 			//010D 	305F

		//;test_ft60e21x_PA_INT.C: 237: PA4=1;
		//;test_ft60e21x_PA_INT.C: 238: delay_us(4);
		LCALL 	11AH 			//010E 	311A
		LCALL 	5FH 			//010F 	305F

		//;test_ft60e21x_PA_INT.C: 239: PA4=0;
		//;test_ft60e21x_PA_INT.C: 240: delay_us(4);
		LCALL 	11FH 			//0110 	311F
		LCALL 	5FH 			//0111 	305F

		//;test_ft60e21x_PA_INT.C: 241: PA4=1;
		//;test_ft60e21x_PA_INT.C: 242: delay_us(4);
		LCALL 	11AH 			//0112 	311A
		LCALL 	5FH 			//0113 	305F

		//;test_ft60e21x_PA_INT.C: 243: PA4=0;
		//;test_ft60e21x_PA_INT.C: 244: delay_us(4);
		LCALL 	11FH 			//0114 	311F
		LCALL 	5FH 			//0115 	305F

		//;test_ft60e21x_PA_INT.C: 245: PA4=1;
		//;test_ft60e21x_PA_INT.C: 246: delay_us(4);
		LCALL 	11AH 			//0116 	311A
		LCALL 	5FH 			//0117 	305F

		//;test_ft60e21x_PA_INT.C: 247: PA4=0;
		//;test_ft60e21x_PA_INT.C: 248: delay_us(4);
		LCALL 	11FH 			//0118 	311F
		LJUMP 	5FH 			//0119 	385F
		BSR 	5H,4 			//011A 	1A05
		LDWI 	4H 			//011B 	2A04
		STR 	78H 			//011C 	01F8
		CLRR 	79H 			//011D 	0179
		RET		 					//011E 	0004
		BCR 	5H,4 			//011F 	1205
		LDWI 	4H 			//0120 	2A04
		STR 	78H 			//0121 	01F8
		CLRR 	79H 			//0122 	0179
		RET		 					//0123 	0004
		CLRR 	76H 			//0124 	0176
		CLRR 	77H 			//0125 	0177
		BTSS 	72H,0 			//0126 	1C72
		LJUMP 	12EH 			//0127 	392E
		LDR 	74H,0 			//0128 	0874
		ADDWR 	76H,1 			//0129 	0BF6
		BTSC 	STATUS,0 		//012A 	1403
		INCR	77H,1 			//012B 	09F7
		LDR 	75H,0 			//012C 	0875
		ADDWR 	77H,1 			//012D 	0BF7
		BCR 	STATUS,0 		//012E 	1003
		RLR 	74H,1 			//012F 	05F4
		RLR 	75H,1 			//0130 	05F5
		BCR 	STATUS,0 		//0131 	1003
		RRR	73H,1 			//0132 	06F3
		RRR	72H,1 			//0133 	06F2
		LDR 	72H,0 			//0134 	0872
		IORWR 	73H,0 			//0135 	0373
		BTSS 	STATUS,2 		//0136 	1D03
		LJUMP 	126H 			//0137 	3926
		LDR 	77H,0 			//0138 	0877
		STR 	73H 			//0139 	01F3
		LDR 	76H,0 			//013A 	0876
		STR 	72H 			//013B 	01F2
		RET		 					//013C 	0004
		STR 	75H 			//013D 	01F5

		//;test_ft60e21x_PA_INT.C: 149: for(unsigned int a=0;a<Time;a++)
		CLRR 	76H 			//013E 	0176
		CLRR 	77H 			//013F 	0177
		LDR 	75H,0 			//0140 	0875
		STR 	73H 			//0141 	01F3
		CLRR 	74H 			//0142 	0174
		LDR 	74H,0 			//0143 	0874
		SUBWR 	77H,0 			//0144 	0C77
		BTSS 	STATUS,2 		//0145 	1D03
		LJUMP 	149H 			//0146 	3949
		LDR 	73H,0 			//0147 	0873
		SUBWR 	76H,0 			//0148 	0C76
		BTSC 	STATUS,0 		//0149 	1403
		RET		 					//014A 	0004

		//;test_ft60e21x_PA_INT.C: 150: {
		//;test_ft60e21x_PA_INT.C: 151: for(unsigned char b=0;b<83;b++)
		CLRR 	78H 			//014B 	0178

		//;test_ft60e21x_PA_INT.C: 152: {
		//;test_ft60e21x_PA_INT.C: 153: Delay10Us();
		LCALL 	1A6H 			//014C 	31A6
		LDWI 	53H 			//014D 	2A53
		INCR	78H,1 			//014E 	09F8
		SUBWR 	78H,0 			//014F 	0C78
		BTSS 	STATUS,0 		//0150 	1C03
		LJUMP 	14CH 			//0151 	394C
		INCR	76H,1 			//0152 	09F6
		BTSC 	STATUS,2 		//0153 	1503
		INCR	77H,1 			//0154 	09F7
		LJUMP 	140H 			//0155 	3940

		//;test_ft60e21x_PA_INT.C: 310: for(int i=0;i<6;i++)
		CLRR 	40H 			//0156 	0140
		CLRR 	41H 			//0157 	0141

		//;test_ft60e21x_PA_INT.C: 311: {
		//;test_ft60e21x_PA_INT.C: 312: PA3 = (PA3 == 1 ? 0 : 1);
		LDWI 	8H 			//0158 	2A08
		BCR 	STATUS,5 		//0159 	1283
		XORWR 	5H,1 			//015A 	0485

		//;test_ft60e21x_PA_INT.C: 313: DelayMs(50);
		LDWI 	32H 			//015B 	2A32
		LCALL 	13DH 			//015C 	313D
		BCR 	STATUS,5 		//015D 	1283
		INCR	40H,1 			//015E 	09C0
		BTSC 	STATUS,2 		//015F 	1503
		INCR	41H,1 			//0160 	09C1
		LDR 	41H,0 			//0161 	0841
		XORWI 	80H 			//0162 	2680
		STR 	7FH 			//0163 	01FF
		LDWI 	80H 			//0164 	2A80
		SUBWR 	7FH,0 			//0165 	0C7F
		BTSS 	STATUS,2 		//0166 	1D03
		LJUMP 	16AH 			//0167 	396A
		LDWI 	6H 			//0168 	2A06
		SUBWR 	40H,0 			//0169 	0C40
		BTSC 	STATUS,0 		//016A 	1403
		RET		 					//016B 	0004
		LJUMP 	158H 			//016C 	3958

		//;test_ft60e21x_PA_INT.C: 318: for(int i=0;i<3;i++)
		CLRR 	40H 			//016D 	0140
		CLRR 	41H 			//016E 	0141

		//;test_ft60e21x_PA_INT.C: 319: {
		//;test_ft60e21x_PA_INT.C: 320: PA3 = (PA3 == 1 ? 0 : 1);
		LDWI 	8H 			//016F 	2A08
		BCR 	STATUS,5 		//0170 	1283
		XORWR 	5H,1 			//0171 	0485

		//;test_ft60e21x_PA_INT.C: 321: DelayMs(10);
		LDWI 	AH 			//0172 	2A0A
		LCALL 	13DH 			//0173 	313D
		BCR 	STATUS,5 		//0174 	1283
		INCR	40H,1 			//0175 	09C0
		BTSC 	STATUS,2 		//0176 	1503
		INCR	41H,1 			//0177 	09C1
		LDR 	41H,0 			//0178 	0841
		XORWI 	80H 			//0179 	2680
		STR 	7FH 			//017A 	01FF
		LDWI 	80H 			//017B 	2A80
		SUBWR 	7FH,0 			//017C 	0C7F
		BTSS 	STATUS,2 		//017D 	1D03
		LJUMP 	181H 			//017E 	3981
		LDWI 	3H 			//017F 	2A03
		SUBWR 	40H,0 			//0180 	0C40
		BTSC 	STATUS,0 		//0181 	1403
		RET		 					//0182 	0004
		LJUMP 	16FH 			//0183 	396F

		//;test_ft60e21x_PA_INT.C: 82: OSCCON = 0B01100000;
		LDWI 	60H 			//0184 	2A60
		BSR 	STATUS,5 		//0185 	1A83
		STR 	FH 			//0186 	018F

		//;test_ft60e21x_PA_INT.C: 83: INTCON = 0;
		CLRR 	INTCON 			//0187 	010B

		//;test_ft60e21x_PA_INT.C: 85: PORTA = 0B00000000;
		BCR 	STATUS,5 		//0188 	1283
		CLRR 	5H 			//0189 	0105

		//;test_ft60e21x_PA_INT.C: 86: TRISA = 0B00100100;
		LDWI 	24H 			//018A 	2A24
		BSR 	STATUS,5 		//018B 	1A83
		STR 	5H 			//018C 	0185

		//;test_ft60e21x_PA_INT.C: 87: WPUA = 0B00100100;
		STR 	15H 			//018D 	0195

		//;test_ft60e21x_PA_INT.C: 89: MSCON = 0B00000000;
		BCR 	STATUS,5 		//018E 	1283
		CLRR 	1BH 			//018F 	011B
		RET		 					//0190 	0004

		//;test_ft60e21x_PA_INT.C: 182: TRISA2 = 1;
		BSR 	STATUS,5 		//0191 	1A83
		BSR 	5H,2 			//0192 	1905

		//;test_ft60e21x_PA_INT.C: 183: TRISA5 = 1;
		BSR 	5H,5 			//0193 	1A85

		//;test_ft60e21x_PA_INT.C: 188: ReadAPin = PORTA;
		BCR 	STATUS,5 		//0194 	1283
		LDR 	5H,0 			//0195 	0805

		//;test_ft60e21x_PA_INT.C: 190: PAIF = 0;
		BCR 	INTCON,0 		//0196 	100B

		//;test_ft60e21x_PA_INT.C: 192: IOCA2 = 1;
		BSR 	STATUS,5 		//0197 	1A83
		BSR 	16H,2 			//0198 	1916

		//;test_ft60e21x_PA_INT.C: 193: IOCA5 = 1;
		BSR 	16H,5 			//0199 	1A96

		//;test_ft60e21x_PA_INT.C: 195: PAIE = 1;
		BSR 	INTCON,3 		//019A 	198B
		RET		 					//019B 	0004

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

		//;test_ft60e21x_PA_INT.C: 292: Wakeup_INITIAL();
		LCALL 	191H 			//01AE 	3191

		//;test_ft60e21x_PA_INT.C: 293: GIE = 0;
		BCR 	INTCON,7 		//01AF 	138B

		//;test_ft60e21x_PA_INT.C: 294: __nop();
		NOP		 					//01B0 	0000

		//;test_ft60e21x_PA_INT.C: 295: __nop();
		NOP		 					//01B1 	0000
		SLEEP	 			//01B2 	0002

		//;test_ft60e21x_PA_INT.C: 297: __nop();
		NOP		 					//01B3 	0000

		//;test_ft60e21x_PA_INT.C: 298: __nop();
		NOP		 					//01B4 	0000
		RET		 					//01B5 	0004

		//;test_ft60e21x_PA_INT.C: 200: PA4=1;
		//;test_ft60e21x_PA_INT.C: 201: delay_us(4);
		LCALL 	11AH 			//01B6 	311A
		LCALL 	5FH 			//01B7 	305F

		//;test_ft60e21x_PA_INT.C: 202: PA4=0;
		BCR 	5H,4 			//01B8 	1205

		//;test_ft60e21x_PA_INT.C: 203: delay_us(124);
		LDWI 	7CH 			//01B9 	2A7C
		STR 	78H 			//01BA 	01F8
		CLRR 	79H 			//01BB 	0179
		LJUMP 	5FH 			//01BC 	385F

		//;test_ft60e21x_PA_INT.C: 208: PA4=1;
		//;test_ft60e21x_PA_INT.C: 209: delay_us(4);
		LCALL 	11AH 			//01BD 	311A
		LCALL 	5FH 			//01BE 	305F

		//;test_ft60e21x_PA_INT.C: 210: PA4=0;
		BCR 	5H,4 			//01BF 	1205

		//;test_ft60e21x_PA_INT.C: 211: delay_us(12);
		LDWI 	CH 			//01C0 	2A0C
		STR 	78H 			//01C1 	01F8
		CLRR 	79H 			//01C2 	0179
		LJUMP 	5FH 			//01C3 	385F

		//;test_ft60e21x_PA_INT.C: 216: PA4=1;
		BSR 	5H,4 			//01C4 	1A05

		//;test_ft60e21x_PA_INT.C: 217: delay_us(12);
		LDWI 	CH 			//01C5 	2A0C
		STR 	78H 			//01C6 	01F8
		CLRR 	79H 			//01C7 	0179
		LCALL 	5FH 			//01C8 	305F

		//;test_ft60e21x_PA_INT.C: 218: PA4=0;
		//;test_ft60e21x_PA_INT.C: 219: delay_us(4);
		LCALL 	11FH 			//01C9 	311F
		LJUMP 	5FH 			//01CA 	385F

		//;test_ft60e21x_PA_INT.C: 302: PAIF = 0;
		BCR 	INTCON,0 		//01CB 	100B

		//;test_ft60e21x_PA_INT.C: 303: PAIE = 0;
		BCR 	INTCON,3 		//01CC 	118B

		//;test_ft60e21x_PA_INT.C: 304: IOCA2 =0;
		BSR 	STATUS,5 		//01CD 	1A83
		BCR 	16H,2 			//01CE 	1116

		//;test_ft60e21x_PA_INT.C: 305: T0IE = 1;
		BSR 	INTCON,5 		//01CF 	1A8B

		//;test_ft60e21x_PA_INT.C: 306: GIE = 1;
		BSR 	INTCON,7 		//01D0 	1B8B
		RET		 					//01D1 	0004
			END
