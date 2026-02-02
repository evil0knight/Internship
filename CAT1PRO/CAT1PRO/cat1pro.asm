//Deviec:FT61FC4X
//-----------------------Variable---------------------------------
		_g_timer_ms		EQU		5CH
		_receivedata		EQU		DCH
		_senddat		EQU		C8H
		_toSend		EQU		B4H
		_toSendA		EQU		A0H
		_toSenda		EQU		120H
		_mmm		EQU		61H
		_current_mode		EQU		62H
		_local_paired_id		EQU		5EH
		_BSREG		EQU		08H
		_EEIF		EQU		0BH
		_PEIE		EQU		0BH
		_GIE		EQU		0BH
		_PORTAbits...RA0		EQU		0CH
		_PORTAbits...RA1		EQU		0CH
		_PORTAbits...RA2		EQU		0CH
		_PORTAbits...RA3		EQU		0CH
		_PORTAbits...RA4		EQU		0CH
		_PORTAbits...RA5		EQU		0CH
		_PORTAbits...RA6		EQU		0CH
		_PORTAbits...RA7		EQU		0CH
		_PORTAbits..		EQU		0CH
		_PORTAbits...PA0		EQU		0CH
		_PORTAbits...PA1		EQU		0CH
		_PORTAbits...PA2		EQU		0CH
		_PORTAbits...PA3		EQU		0CH
		_PORTAbits...PA4		EQU		0CH
		_PORTAbits...PA5		EQU		0CH
		_PORTAbits...PA6		EQU		0CH
		_PORTAbits...PA7		EQU		0CH
		_PORTAbits..		EQU		0CH
		_PORTAbits		EQU		0CH
		_PORTBbits...RB0		EQU		0DH
		_PORTBbits...RB1		EQU		0DH
		_PORTBbits...RB2		EQU		0DH
		_PORTBbits...RB3		EQU		0DH
		_PORTBbits...RB4		EQU		0DH
		_PORTBbits...RB5		EQU		0DH
		_PORTBbits...RB6		EQU		0DH
		_PORTBbits...RB7		EQU		0DH
		_PORTBbits..		EQU		0DH
		_PORTBbits...PB0		EQU		0DH
		_PORTBbits...PB1		EQU		0DH
		_PORTBbits...PB2		EQU		0DH
		_PORTBbits...PB3		EQU		0DH
		_PORTBbits...PB4		EQU		0DH
		_PORTBbits...PB5		EQU		0DH
		_PORTBbits...PB6		EQU		0DH
		_PORTBbits...PB7		EQU		0DH
		_PORTBbits..		EQU		0DH
		_PORTBbits		EQU		0DH
		_PORTCbits...RC0		EQU		0EH
		_PORTCbits...RC1		EQU		0EH
		_PORTCbits..		EQU		0EH
		_PORTCbits...PC0		EQU		0EH
		_PORTCbits...PC1		EQU		0EH
		_PORTCbits..		EQU		0EH
		_PORTCbits		EQU		0EH
		_T4UIE		EQU		112H
		_T4UIF		EQU		113H
		_RD		EQU		195H
		_WR		EQU		195H
		_WREN		EQU		195H
		_CFGS		EQU		195H
		_EEPGD		EQU		195H
		_ODCON0		EQU		21FH
		_URRXNE		EQU		48EH
		_RXNEF		EQU		492H
		_TXEF		EQU		492H
		_TCF		EQU		49CH
//		main@k		EQU		59H
//		main@sys_state		EQU		58H
//		Duima_ProcessReceivedData@data		EQU		54H
//		Duima_ProcessReceivedData@k		EQU		55H
//		Duima_ProcessReceivedData@new_id		EQU		56H
//		Duima_ProcessReceivedData@data		EQU		54H
//		Duima_ProcessReceivedData@len		EQU		7DH
//		Duima_ProcessReceivedData@data		EQU		54H
//		Duima_EEPROM_WriteID@id		EQU		73H
//		Duima_EEPROM_WriteID@addr		EQU		75H
//		Duima_EEPROM_WriteByte@data		EQU		71H
//		Duima_EEPROM_WriteByte@PEIE_1		EQU		72H
//		Duima_EEPROM_WriteByte@data		EQU		71H
//		Duima_EEPROM_WriteByte@addr		EQU		70H
//		Duima_EEPROM_WriteByte@data		EQU		71H
//		Duima_MainLoop@key_state		EQU		60H
//		Duima_MainLoop@press_start_time		EQU		5AH
//		Duima_EEPROM_ReadID@addr		EQU		20H
//		Duima_EEPROM_ReadID@id		EQU		21H
//		Duima_EEPROM_ReadID@addr		EQU		20H
//		Duima_EEPROM_ReadID@addr		EQU		20H
//		Duima_EEPROM_ReadByte@addr		EQU		70H
//		Duima_EEPROM_ReadByte@data		EQU		71H
//		Duima_EEPROM_ReadByte@addr		EQU		70H
//		Duima_EEPROM_ReadByte@addr		EQU		70H
//		Duima_Configure433Address@cmd_buffer		EQU		2EH
//		Duima_Configure433Address@digits		EQU		24H
//		Duima_Configure433Address@temp		EQU		4FH
//		Duima_Configure433Address@digit_count		EQU		53H
//		Duima_Configure433Address@i		EQU		4EH
//		Duima_Configure433Address@addr		EQU		20H
//		___llmod@counter		EQU		78H
//		___llmod@divisor		EQU		70H
//		___llmod@dividend		EQU		74H
//		___lldiv@quotient		EQU		78H
//		___lldiv@counter		EQU		7CH
//		___lldiv@divisor		EQU		70H
//		___lldiv@dividend		EQU		74H
//		SendATCommand@j		EQU		76H
//		SendATCommand@cmd		EQU		71H
//		SendByte@data		EQU		70H
//		SendByte@data		EQU		70H
//		SendByte@data		EQU		70H
//		DelayMs@Time		EQU		72H
//		DelayMs@b		EQU		74H
//		DelayMs@a		EQU		73H
//		DelayMs@Time		EQU		72H
//		DelayMs@Time		EQU		72H
//		DelayUs@Time		EQU		70H
//		DelayUs@a		EQU		71H
//		DelayUs@Time		EQU		70H
//		DelayUs@Time		EQU		70H
//-----------------------Variable END---------------------------------

		MOVLP 	0H 			//0000 	0180
		LJUMP 	24H 			//0001 	3824
		ORG		0004H
		BSR 	7EH, 0H 			//0004 	247E
		MOVLP 	0H 			//0005 	0180

		//;CAT1PRO.C: 65: if(URRXNE && RXNEF)
		MOVLB 	9H 			//0006 	1029
		BTSC 	EH, 0H 			//0007 	280E
		BTSS 	12H, 0H 		//0008 	2C12
		LJUMP 	19H 			//0009 	3819

		//;CAT1PRO.C: 66: {
		//;CAT1PRO.C: 68: receivedata[mmm++] =URDATAL;
		MOVLB 	0H 			//000A 	1020
		LDR 	61H, 0H 			//000B 	1861
		ADDWI 	DCH 			//000C 	0EDC
		STR 	6H 			//000D 	1086
		CLRF 	7H 			//000E 	1187
		MOVLB 	9H 			//000F 	1029
		LDR 	CH, 0H 			//0010 	180C
		STR 	1H 			//0011 	1081
		MOVLB 	0H 			//0012 	1020
		LDWI 	14H 			//0013 	0014
		INCR 	61H, 1H 		//0014 	1AE1

		//;CAT1PRO.C: 70: if(mmm>=20)
		SUBWR 	61H, 0H 		//0015 	1261
		BTSC 	3H, 0H 			//0016 	2803

		//;CAT1PRO.C: 71: {
		//;CAT1PRO.C: 72: mmm=0;
		CLRF 	61H 			//0017 	11E1

		//;CAT1PRO.C: 73: }
		//;CAT1PRO.C: 74: __nop();
		NOP 					//0018 	1000

		//;CAT1PRO.C: 75: }
		//;CAT1PRO.C: 78: if(T4UIE && T4UIF)
		MOVLB 	2H 			//0019 	1022
		BTSC 	12H, 0H 		//001A 	2812
		BTSS 	13H, 0H 		//001B 	2C13
		LJUMP 	22H 			//001C 	3822

		//;CAT1PRO.C: 79: {
		//;CAT1PRO.C: 80: T4UIF = 1;
		BSR 	13H, 0H 			//001D 	2413

		//;CAT1PRO.C: 81: g_timer_ms++;
		MOVLB 	0H 			//001E 	1020
		INCR 	5CH, 1H 		//001F 	1ADC
		BTSC 	3H, 2H 			//0020 	2903
		INCR 	5DH, 1H 		//0021 	1ADD
		BCR 	7EH, 0H 			//0022 	207E
		RETI 					//0023 	1009
		MOVLP 	0H 			//0024 	0180
		LJUMP 	26H 			//0025 	3826
		LDWI 	E1H 			//0026 	00E1
		STR 	4H 			//0027 	1084
		LDWI 	83H 			//0028 	0083
		STR 	5H 			//0029 	1085
		LDWI 	A0H 			//002A 	00A0
		STR 	6H 			//002B 	1086
		LDWI 	0H 			//002C 	0000
		STR 	7H 			//002D 	1087
		LDWI 	50H 			//002E 	0050
		MOVLP 	4H 			//002F 	0184
		LCALL 	4A9H 			//0030 	34A9
		MOVLP 	0H 			//0031 	0180
		LDWI 	31H 			//0032 	0031
		STR 	4H 			//0033 	1084
		LDWI 	84H 			//0034 	0084
		STR 	5H 			//0035 	1085
		LDWI 	20H 			//0036 	0020
		STR 	6H 			//0037 	1086
		LDWI 	1H 			//0038 	0001
		STR 	7H 			//0039 	1087
		LDWI 	14H 			//003A 	0014
		MOVLP 	4H 			//003B 	0184
		LCALL 	4A9H 			//003C 	34A9
		MOVLP 	0H 			//003D 	0180
		CLRF 	5AH 			//003E 	11DA
		CLRF 	5BH 			//003F 	11DB
		CLRF 	5CH 			//0040 	11DC
		CLRF 	5DH 			//0041 	11DD
		CLRF 	5EH 			//0042 	11DE
		CLRF 	5FH 			//0043 	11DF
		CLRF 	60H 			//0044 	11E0
		CLRF 	61H 			//0045 	11E1
		CLRF 	62H 			//0046 	11E2
		BCR 	7EH, 0H 			//0047 	207E
		MOVLB 	0H 			//0048 	1020
		LJUMP 	A8H 			//0049 	38A8
		STR 	54H 			//004A 	10D4

		//;duima.c: 103: if(current_mode == MODE_NORMAL)
		LDR 	62H, 0H 			//004B 	1862
		BTSS 	3H, 2H 			//004C 	2D03
		LJUMP 	6AH 			//004D 	386A

		//;duima.c: 104: {
		//;duima.c: 108: if(len > 0)
		LDR 	7DH, 0H 			//004E 	187D
		BTSC 	3H, 2H 			//004F 	2903
		RET 					//0050 	1008

		//;duima.c: 109: {
		//;duima.c: 111: PORTAbits.PA1 = (PORTAbits.PA1 == 1 ? 0 : 1); DelayMs(50); PORTAbits.PA1
		//+                          = (PORTAbits.PA1 == 1 ? 0 : 1);
		BCR 	3H, 0H 			//0051 	2003
		BTSS 	CH, 1H 			//0052 	2C8C
		BSR 	3H, 0H 			//0053 	2403
		BTSS 	3H, 0H 			//0054 	2C03
		LJUMP 	59H 			//0055 	3859
		MOVLB 	0H 			//0056 	1020
		BSR 	CH, 1H 			//0057 	248C
		LJUMP 	5BH 			//0058 	385B
		MOVLB 	0H 			//0059 	1020
		BCR 	CH, 1H 			//005A 	208C
		LDWI 	32H 			//005B 	0032
		LCALL 	17BH 			//005C 	317B
		MOVLP 	0H 			//005D 	0180
		BCR 	3H, 0H 			//005E 	2003
		MOVLB 	0H 			//005F 	1020
		BTSS 	CH, 1H 			//0060 	2C8C
		BSR 	3H, 0H 			//0061 	2403
		BTSS 	3H, 0H 			//0062 	2C03
		LJUMP 	67H 			//0063 	3867
		MOVLB 	0H 			//0064 	1020
		BSR 	CH, 1H 			//0065 	248C
		RET 					//0066 	1008
		MOVLB 	0H 			//0067 	1020
		BCR 	CH, 1H 			//0068 	208C
		RET 					//0069 	1008

		//;duima.c: 114: }
		//;duima.c: 120: if(current_mode == MODE_PAIRING)
		DECRSZ 	62H, 0H 		//006A 	1B62
		RET 					//006B 	1008

		//;duima.c: 121: {
		//;duima.c: 123: if(len >= 2)
		LDWI 	2H 			//006C 	0002
		SUBWR 	7DH, 0H 		//006D 	127D
		BTSS 	3H, 0H 			//006E 	2C03
		RET 					//006F 	1008

		//;duima.c: 129: new_id = data[0] * 256 + data[1];
		INCR 	54H, 0H 		//0070 	1A54
		STR 	6H 			//0071 	1086
		CLRF 	7H 			//0072 	1187
		LDR 	54H, 0H 			//0073 	1854
		STR 	4H 			//0074 	1084
		CLRF 	5H 			//0075 	1185
		LDR 	0H, 0H 			//0076 	1800
		STR 	57H 			//0077 	10D7
		LDR 	1H, 0H 			//0078 	1801
		STR 	56H 			//0079 	10D6

		//;duima.c: 132: if(new_id == 65535) return;
		INCRSZ 	56H, 0H 		//007A 	1F56
		LJUMP 	7FH 			//007B 	387F
		INCR 	57H, 0H 		//007C 	1A57
		BTSC 	3H, 2H 			//007D 	2903
		RET 					//007E 	1008

		//;duima.c: 135: Duima_EEPROM_WriteID(new_id, 0x13);
		LDR 	57H, 0H 			//007F 	1857
		STR 	74H 			//0080 	10F4
		LDR 	56H, 0H 			//0081 	1856
		STR 	73H 			//0082 	10F3
		LDWI 	13H 			//0083 	0013
		STR 	75H 			//0084 	10F5
		LCALL 	319H 			//0085 	3319
		MOVLP 	0H 			//0086 	0180

		//;duima.c: 136: local_paired_id = new_id;
		MOVLB 	0H 			//0087 	1020
		LDR 	57H, 0H 			//0088 	1857
		STR 	5FH 			//0089 	10DF
		LDR 	56H, 0H 			//008A 	1856
		STR 	5EH 			//008B 	10DE

		//;duima.c: 139: Duima_Configure433Address(local_paired_id);
		LCALL 	3D7H 			//008C 	33D7
		MOVLP 	0H 			//008D 	0180
		LCALL 	194H 			//008E 	3194
		MOVLP 	0H 			//008F 	0180

		//;duima.c: 142: current_mode = MODE_NORMAL;
		MOVLB 	0H 			//0090 	1020
		CLRF 	62H 			//0091 	11E2

		//;duima.c: 145: for(unsigned char k=0; k<6; k++) {
		CLRF 	55H 			//0092 	11D5

		//;duima.c: 146: PORTAbits.PA1 = (PORTAbits.PA1 == 1 ? 0 : 1); DelayMs(10);
		BCR 	3H, 0H 			//0093 	2003
		BTSS 	CH, 1H 			//0094 	2C8C
		BSR 	3H, 0H 			//0095 	2403
		BTSS 	3H, 0H 			//0096 	2C03
		LJUMP 	9BH 			//0097 	389B
		MOVLB 	0H 			//0098 	1020
		BSR 	CH, 1H 			//0099 	248C
		LJUMP 	9DH 			//009A 	389D
		MOVLB 	0H 			//009B 	1020
		BCR 	CH, 1H 			//009C 	208C
		LDWI 	AH 			//009D 	000A
		LCALL 	17BH 			//009E 	317B
		MOVLP 	0H 			//009F 	0180
		MOVLB 	0H 			//00A0 	1020
		LDWI 	6H 			//00A1 	0006
		INCR 	55H, 1H 		//00A2 	1AD5
		SUBWR 	55H, 0H 		//00A3 	1255
		BTSS 	3H, 0H 			//00A4 	2C03
		LJUMP 	94H 			//00A5 	3894

		//;duima.c: 147: }
		//;duima.c: 148: PORTAbits.PA1 = 0;
		BCR 	CH, 1H 			//00A6 	208C
		RET 					//00A7 	1008

		//;CAT1PRO.C: 372: POWER_INITIAL();
		LCALL 	358H 			//00A8 	3358
		MOVLP 	0H 			//00A9 	0180

		//;CAT1PRO.C: 373: UART_INITIAL();
		LCALL 	3A6H 			//00AA 	33A6
		MOVLP 	0H 			//00AB 	0180

		//;CAT1PRO.C: 374: DelayMs(50);
		LDWI 	32H 			//00AC 	0032
		LCALL 	17BH 			//00AD 	317B
		MOVLP 	0H 			//00AE 	0180

		//;CAT1PRO.C: 375: CAT1_Init();
		LCALL 	10BH 			//00AF 	310B
		MOVLP 	0H 			//00B0 	0180

		//;CAT1PRO.C: 378: INTCON = 0B11000000;
		LDWI 	C0H 			//00B1 	00C0
		STR 	BH 			//00B2 	108B

		//;CAT1PRO.C: 379: DelayMs(50);
		LDWI 	32H 			//00B3 	0032
		LCALL 	17BH 			//00B4 	317B
		MOVLP 	0H 			//00B5 	0180
		LJUMP 	FCH 			//00B6 	38FC

		//;CAT1PRO.C: 387: {
		//;CAT1PRO.C: 391: case STATE_WAKE_INIT:
		//;CAT1PRO.C: 392: PORTAbits.PA1 = 1;
		BSR 	CH, 1H 			//00B7 	248C

		//;CAT1PRO.C: 393: g_timer_ms = 0;
		CLRF 	5CH 			//00B8 	11DC
		CLRF 	5DH 			//00B9 	11DD

		//;CAT1PRO.C: 394: mmm = 0;
		CLRF 	61H 			//00BA 	11E1

		//;CAT1PRO.C: 395: PORTCbits.PC1 = 0;
		BCR 	EH, 1H 			//00BB 	208E

		//;CAT1PRO.C: 396: sys_state = STATE_WORKING;
		CLRF 	58H 			//00BC 	11D8
		INCR 	58H, 1H 		//00BD 	1AD8

		//;CAT1PRO.C: 398: break;
		LJUMP 	FEH 			//00BE 	38FE

		//;CAT1PRO.C: 405: Duima_MainLoop();
		LCALL 	2F5H 			//00BF 	32F5
		MOVLP 	0H 			//00C0 	0180

		//;CAT1PRO.C: 408: if(mmm >= 2) {
		LDWI 	2H 			//00C1 	0002
		SUBWR 	61H, 0H 		//00C2 	1261
		BTSS 	3H, 0H 			//00C3 	2C03
		LJUMP 	CBH 			//00C4 	38CB

		//;CAT1PRO.C: 409: Duima_ProcessReceivedData((unsigned char*)receivedata, mmm);
		LDR 	61H, 0H 			//00C5 	1861
		STR 	7DH 			//00C6 	10FD
		LDWI 	DCH 			//00C7 	00DC
		LCALL 	4AH 			//00C8 	304A
		MOVLP 	0H 			//00C9 	0180

		//;CAT1PRO.C: 410: mmm = 0;
		CLRF 	61H 			//00CA 	11E1

		//;CAT1PRO.C: 411: }
		//;CAT1PRO.C: 414: if(current_mode == MODE_PAIRING)
		DECRSZ 	62H, 0H 		//00CB 	1B62
		LJUMP 	DEH 			//00CC 	38DE

		//;CAT1PRO.C: 415: {
		//;CAT1PRO.C: 417: if(g_timer_ms >= 10000) {
		LDWI 	27H 			//00CD 	0027
		SUBWR 	5DH, 0H 		//00CE 	125D
		LDWI 	10H 			//00CF 	0010
		BTSC 	3H, 2H 			//00D0 	2903
		SUBWR 	5CH, 0H 		//00D1 	125C
		BTSS 	3H, 0H 			//00D2 	2C03
		LJUMP 	FEH 			//00D3 	38FE

		//;CAT1PRO.C: 418: Duima_Configure433Address(local_paired_id);
		LCALL 	3D7H 			//00D4 	33D7
		MOVLP 	0H 			//00D5 	0180
		LCALL 	194H 			//00D6 	3194
		MOVLP 	0H 			//00D7 	0180

		//;CAT1PRO.C: 419: current_mode = MODE_NORMAL;
		MOVLB 	0H 			//00D8 	1020
		CLRF 	62H 			//00D9 	11E2

		//;CAT1PRO.C: 420: PORTAbits.PA1 = 0;
		BCR 	CH, 1H 			//00DA 	208C

		//;CAT1PRO.C: 421: sys_state = STATE_GO_SLEEP;
		LDWI 	2H 			//00DB 	0002
		STR 	58H 			//00DC 	10D8
		LJUMP 	FEH 			//00DD 	38FE

		//;CAT1PRO.C: 424: else
		//;CAT1PRO.C: 425: {
		//;CAT1PRO.C: 427: if(g_timer_ms >= 5000) {
		LDWI 	13H 			//00DE 	0013
		SUBWR 	5DH, 0H 		//00DF 	125D
		LDWI 	88H 			//00E0 	0088
		BTSC 	3H, 2H 			//00E1 	2903
		SUBWR 	5CH, 0H 		//00E2 	125C
		BTSC 	3H, 0H 			//00E3 	2803
		LJUMP 	DBH 			//00E4 	38DB
		LJUMP 	FEH 			//00E5 	38FE

		//;CAT1PRO.C: 437: for(unsigned char k=0; k<6; k++)
		CLRF 	59H 			//00E6 	11D9

		//;CAT1PRO.C: 438: {
		//;CAT1PRO.C: 439: PORTAbits.PA1 = (PORTAbits.PA1 == 1 ? 0 : 1);
		BCR 	3H, 0H 			//00E7 	2003
		BTSS 	CH, 1H 			//00E8 	2C8C
		BSR 	3H, 0H 			//00E9 	2403
		BTSS 	3H, 0H 			//00EA 	2C03
		LJUMP 	EFH 			//00EB 	38EF
		MOVLB 	0H 			//00EC 	1020
		BSR 	CH, 1H 			//00ED 	248C
		LJUMP 	F1H 			//00EE 	38F1
		MOVLB 	0H 			//00EF 	1020
		BCR 	CH, 1H 			//00F0 	208C

		//;CAT1PRO.C: 440: DelayMs(100);
		LDWI 	64H 			//00F1 	0064
		LCALL 	17BH 			//00F2 	317B
		MOVLP 	0H 			//00F3 	0180
		MOVLB 	0H 			//00F4 	1020
		LDWI 	6H 			//00F5 	0006
		INCR 	59H, 1H 		//00F6 	1AD9
		SUBWR 	59H, 0H 		//00F7 	1259
		BTSS 	3H, 0H 			//00F8 	2C03
		LJUMP 	E8H 			//00F9 	38E8

		//;CAT1PRO.C: 441: }
		//;CAT1PRO.C: 442: Sys_EnterSleep();
		LCALL 	37FH 			//00FA 	337F
		MOVLP 	0H 			//00FB 	0180

		//;CAT1PRO.C: 382: MAIN_STATE sys_state = STATE_WAKE_INIT;
		MOVLB 	0H 			//00FC 	1020
		CLRF 	58H 			//00FD 	11D8
		LDR 	58H, 0H 			//00FE 	1858
		XORWI 	0H 			//00FF 	0A00
		BTSC 	3H, 2H 			//0100 	2903
		LJUMP 	B7H 			//0101 	38B7
		XORWI 	1H 			//0102 	0A01
		BTSC 	3H, 2H 			//0103 	2903
		LJUMP 	BFH 			//0104 	38BF
		XORWI 	3H 			//0105 	0A03
		BTSC 	3H, 2H 			//0106 	2903
		LJUMP 	E6H 			//0107 	38E6
		LJUMP 	FEH 			//0108 	38FE
		MOVLP 	0H 			//0109 	0180
		LJUMP 	24H 			//010A 	3824

		//;CAT1PRO.C: 284: SendATCommand("AT+PWR=20");
		LDWI 	6DH 			//010B 	006D
		STR 	71H 			//010C 	10F1
		LDWI 	84H 			//010D 	0084
		STR 	72H 			//010E 	10F2
		LCALL 	169H 			//010F 	3169
		MOVLP 	0H 			//0110 	0180

		//;CAT1PRO.C: 285: DelayMs(50);
		LDWI 	32H 			//0111 	0032
		LCALL 	17BH 			//0112 	317B
		MOVLP 	0H 			//0113 	0180

		//;CAT1PRO.C: 288: SendATCommand("AT+UART=3,0");
		LDWI 	56H 			//0114 	0056
		STR 	71H 			//0115 	10F1
		LDWI 	84H 			//0116 	0084
		STR 	72H 			//0117 	10F2
		LCALL 	169H 			//0118 	3169
		MOVLP 	0H 			//0119 	0180

		//;CAT1PRO.C: 289: DelayMs(50);
		LDWI 	32H 			//011A 	0032
		LCALL 	17BH 			//011B 	317B
		MOVLP 	0H 			//011C 	0180

		//;CAT1PRO.C: 292: SendATCommand("AT+FEQ=434000000");
		LDWI 	45H 			//011D 	0045
		STR 	71H 			//011E 	10F1
		LDWI 	84H 			//011F 	0084
		STR 	72H 			//0120 	10F2
		LCALL 	169H 			//0121 	3169
		MOVLP 	0H 			//0122 	0180

		//;CAT1PRO.C: 293: DelayMs(50);
		LDWI 	32H 			//0123 	0032
		LCALL 	17BH 			//0124 	317B
		MOVLP 	0H 			//0125 	0180

		//;CAT1PRO.C: 296: SendATCommand("AT+ADR=0");
		LDWI 	81H 			//0126 	0081
		STR 	71H 			//0127 	10F1
		LDWI 	84H 			//0128 	0084
		STR 	72H 			//0129 	10F2
		LCALL 	169H 			//012A 	3169
		MOVLP 	0H 			//012B 	0180

		//;CAT1PRO.C: 297: DelayMs(50);
		LDWI 	32H 			//012C 	0032
		LCALL 	17BH 			//012D 	317B
		MOVLP 	0H 			//012E 	0180

		//;CAT1PRO.C: 300: SendATCommand("AT+SF=7");
		LDWI 	92H 			//012F 	0092
		STR 	71H 			//0130 	10F1
		LDWI 	84H 			//0131 	0084
		STR 	72H 			//0132 	10F2
		LCALL 	169H 			//0133 	3169
		MOVLP 	0H 			//0134 	0180

		//;CAT1PRO.C: 301: DelayMs(50);
		LDWI 	32H 			//0135 	0032
		LCALL 	17BH 			//0136 	317B
		MOVLP 	0H 			//0137 	0180

		//;CAT1PRO.C: 304: SendATCommand("AT+BW=9");
		LDWI 	9AH 			//0138 	009A
		STR 	71H 			//0139 	10F1
		LDWI 	84H 			//013A 	0084
		STR 	72H 			//013B 	10F2
		LCALL 	169H 			//013C 	3169
		MOVLP 	0H 			//013D 	0180

		//;CAT1PRO.C: 305: DelayMs(50);
		LDWI 	32H 			//013E 	0032
		LCALL 	17BH 			//013F 	317B
		MOVLP 	0H 			//0140 	0180

		//;CAT1PRO.C: 308: SendATCommand("AT+PB=2000");
		LDWI 	62H 			//0141 	0062
		STR 	71H 			//0142 	10F1
		LDWI 	84H 			//0143 	0084
		STR 	72H 			//0144 	10F2
		LCALL 	169H 			//0145 	3169
		MOVLP 	0H 			//0146 	0180

		//;CAT1PRO.C: 309: DelayMs(50);
		LDWI 	32H 			//0147 	0032
		LCALL 	17BH 			//0148 	317B
		MOVLP 	0H 			//0149 	0180

		//;CAT1PRO.C: 311: SendATCommand("AT+MODE=1");
		LDWI 	77H 			//014A 	0077
		STR 	71H 			//014B 	10F1
		LDWI 	84H 			//014C 	0084
		STR 	72H 			//014D 	10F2
		LCALL 	169H 			//014E 	3169
		MOVLP 	0H 			//014F 	0180

		//;CAT1PRO.C: 312: DelayMs(50);
		LDWI 	32H 			//0150 	0032
		LCALL 	17BH 			//0151 	317B
		MOVLP 	0H 			//0152 	0180

		//;CAT1PRO.C: 314: SendATCommand("AT+WT=2");
		LDWI 	8AH 			//0153 	008A
		STR 	71H 			//0154 	10F1
		LDWI 	84H 			//0155 	0084
		STR 	72H 			//0156 	10F2
		LCALL 	169H 			//0157 	3169
		MOVLP 	0H 			//0158 	0180

		//;CAT1PRO.C: 315: DelayMs(50);
		LDWI 	32H 			//0159 	0032
		LCALL 	17BH 			//015A 	317B
		MOVLP 	0H 			//015B 	0180

		//;CAT1PRO.C: 318: Duima_Init();
		LCALL 	287H 			//015C 	3287
		MOVLP 	0H 			//015D 	0180

		//;CAT1PRO.C: 321: SendATCommand("ATW");
		LDWI 	AFH 			//015E 	00AF
		STR 	71H 			//015F 	10F1
		LDWI 	84H 			//0160 	0084
		STR 	72H 			//0161 	10F2
		LCALL 	169H 			//0162 	3169
		MOVLP 	0H 			//0163 	0180

		//;CAT1PRO.C: 322: DelayMs(50);
		LDWI 	32H 			//0164 	0032
		LCALL 	17BH 			//0165 	317B

		//;CAT1PRO.C: 324: PORTCbits.PC1 = 1;
		MOVLB 	0H 			//0166 	1020
		BSR 	EH, 1H 			//0167 	248E
		RET 					//0168 	1008

		//;CAT1PRO.C: 258: unsigned char j = 0;
		CLRF 	76H 			//0169 	11F6

		//;CAT1PRO.C: 261: while(cmd[j] != '\0')
		LCALL 	3CBH 			//016A 	33CB
		MOVLP 	0H 			//016B 	0180
		MOVIW 	FSR0++ 		//016C 	1012
		BTSC 	3H, 2H 			//016D 	2903
		LJUMP 	176H 			//016E 	3976

		//;CAT1PRO.C: 262: {
		//;CAT1PRO.C: 263: SendByte(cmd[j]);
		LCALL 	3CBH 			//016F 	33CB
		MOVLP 	0H 			//0170 	0180
		LDR 	0H, 0H 			//0171 	1800
		LCALL 	18CH 			//0172 	318C
		MOVLP 	0H 			//0173 	0180

		//;CAT1PRO.C: 264: j++;
		INCR 	76H, 1H 		//0174 	1AF6
		LJUMP 	16AH 			//0175 	396A

		//;CAT1PRO.C: 265: }
		//;CAT1PRO.C: 268: SendByte(0x0D);
		LDWI 	DH 			//0176 	000D
		LCALL 	18CH 			//0177 	318C
		MOVLP 	0H 			//0178 	0180

		//;CAT1PRO.C: 271: SendByte(0x0A);
		LDWI 	AH 			//0179 	000A
		LJUMP 	18CH 			//017A 	398C
		STR 	72H 			//017B 	10F2

		//;CAT1PRO.C: 189: unsigned char a,b;
		//;CAT1PRO.C: 190: for(a=0;a<Time;a++)
		CLRF 	73H 			//017C 	11F3
		LDR 	72H, 0H 			//017D 	1872
		SUBWR 	73H, 0H 		//017E 	1273
		BTSC 	3H, 0H 			//017F 	2803
		RET 					//0180 	1008

		//;CAT1PRO.C: 191: {
		//;CAT1PRO.C: 192: for(b=0;b<5;b++)
		CLRF 	74H 			//0181 	11F4

		//;CAT1PRO.C: 193: {
		//;CAT1PRO.C: 194: DelayUs(197);
		LDWI 	C5H 			//0182 	00C5
		LCALL 	209H 			//0183 	3209
		MOVLP 	0H 			//0184 	0180
		LDWI 	5H 			//0185 	0005
		INCR 	74H, 1H 		//0186 	1AF4
		SUBWR 	74H, 0H 		//0187 	1274
		BTSS 	3H, 0H 			//0188 	2C03
		LJUMP 	182H 			//0189 	3982
		INCR 	73H, 1H 		//018A 	1AF3
		LJUMP 	17DH 			//018B 	397D
		STR 	70H 			//018C 	10F0

		//;CAT1PRO.C: 226: TXEF = 0;
		MOVLB 	9H 			//018D 	1029
		BCR 	12H, 5H 			//018E 	2292

		//;CAT1PRO.C: 227: URDATAL = data;
		LDR 	70H, 0H 			//018F 	1870
		STR 	CH 			//0190 	108C

		//;CAT1PRO.C: 229: {
		BTSC 	1CH, 0H 		//0191 	281C
		RET 					//0192 	1008
		LJUMP 	191H 			//0193 	3991

		//;duima.c: 158: unsigned char cmd_buffer[32];
		//;duima.c: 159: unsigned char i;
		//;duima.c: 160: unsigned char digit_count = 0;
		CLRF 	53H 			//0194 	11D3

		//;duima.c: 161: unsigned long temp = addr;
		LDR 	20H, 0H 			//0195 	1820
		STR 	4FH 			//0196 	10CF
		LDR 	21H, 0H 			//0197 	1821
		STR 	50H 			//0198 	10D0
		LDWI 	41H 			//0199 	0041
		CLRF 	51H 			//019A 	11D1
		CLRF 	52H 			//019B 	11D2

		//;duima.c: 162: unsigned char digits[10];
		//;duima.c: 165: cmd_buffer[0]='A'; cmd_buffer[1]='T'; cmd_buffer[2]='+';
		STR 	2EH 			//019C 	10AE
		LDWI 	54H 			//019D 	0054
		STR 	2FH 			//019E 	10AF
		LDWI 	2BH 			//019F 	002B
		STR 	30H 			//01A0 	10B0

		//;duima.c: 166: cmd_buffer[3]='A'; cmd_buffer[4]='D'; cmd_buffer[5]='R'; cmd_buffer[6]='=
		//+                          ';
		LDWI 	41H 			//01A1 	0041
		STR 	31H 			//01A2 	10B1
		LDWI 	44H 			//01A3 	0044
		STR 	32H 			//01A4 	10B2
		LDWI 	52H 			//01A5 	0052
		STR 	33H 			//01A6 	10B3
		LDWI 	3DH 			//01A7 	003D
		STR 	34H 			//01A8 	10B4

		//;duima.c: 169: if(temp == 0) {
		LCALL 	3DCH 			//01A9 	33DC
		MOVLP 	0H 			//01AA 	0180
		BTSS 	3H, 2H 			//01AB 	2D03
		LJUMP 	1DEH 			//01AC 	39DE

		//;duima.c: 170: digits[0] = 0; digit_count = 1;
		CLRF 	24H 			//01AD 	11A4
		CLRF 	53H 			//01AE 	11D3
		INCR 	53H, 1H 		//01AF 	1AD3

		//;duima.c: 171: } else {
		LJUMP 	1E2H 			//01B0 	39E2

		//;duima.c: 173: digits[digit_count++] = temp % 10;
		LDR 	53H, 0H 			//01B1 	1853
		ADDWI 	24H 			//01B2 	0E24
		STR 	6H 			//01B3 	1086
		LDWI 	AH 			//01B4 	000A
		CLRF 	7H 			//01B5 	1187
		STR 	70H 			//01B6 	10F0
		CLRF 	71H 			//01B7 	11F1
		CLRF 	72H 			//01B8 	11F2
		CLRF 	73H 			//01B9 	11F3
		LDR 	52H, 0H 			//01BA 	1852
		STR 	77H 			//01BB 	10F7
		LDR 	51H, 0H 			//01BC 	1851
		STR 	76H 			//01BD 	10F6
		LDR 	50H, 0H 			//01BE 	1850
		STR 	75H 			//01BF 	10F5
		LDR 	4FH, 0H 			//01C0 	184F
		STR 	74H 			//01C1 	10F4
		LCALL 	251H 			//01C2 	3251
		MOVLP 	0H 			//01C3 	0180
		LDR 	70H, 0H 			//01C4 	1870
		STR 	1H 			//01C5 	1081
		LDWI 	AH 			//01C6 	000A
		INCR 	53H, 1H 		//01C7 	1AD3

		//;duima.c: 174: temp /= 10;
		STR 	70H 			//01C8 	10F0
		CLRF 	71H 			//01C9 	11F1
		CLRF 	72H 			//01CA 	11F2
		CLRF 	73H 			//01CB 	11F3
		LDR 	52H, 0H 			//01CC 	1852
		STR 	77H 			//01CD 	10F7
		LDR 	51H, 0H 			//01CE 	1851
		STR 	76H 			//01CF 	10F6
		LDR 	50H, 0H 			//01D0 	1850
		STR 	75H 			//01D1 	10F5
		LDR 	4FH, 0H 			//01D2 	184F
		STR 	74H 			//01D3 	10F4
		LCALL 	212H 			//01D4 	3212
		MOVLP 	0H 			//01D5 	0180
		LDR 	73H, 0H 			//01D6 	1873
		STR 	52H 			//01D7 	10D2
		LDR 	72H, 0H 			//01D8 	1872
		STR 	51H 			//01D9 	10D1
		LDR 	71H, 0H 			//01DA 	1871
		STR 	50H 			//01DB 	10D0
		LDR 	70H, 0H 			//01DC 	1870
		STR 	4FH 			//01DD 	10CF
		LCALL 	3DCH 			//01DE 	33DC
		MOVLP 	0H 			//01DF 	0180
		BTSS 	3H, 2H 			//01E0 	2D03
		LJUMP 	1B1H 			//01E1 	39B1

		//;duima.c: 175: }
		//;duima.c: 176: }
		//;duima.c: 179: for(i = 0; i < digit_count; i++) {
		CLRF 	4EH 			//01E2 	11CE
		LDR 	53H, 0H 			//01E3 	1853
		SUBWR 	4EH, 0H 		//01E4 	124E
		BTSC 	3H, 0H 			//01E5 	2803
		LJUMP 	1FBH 			//01E6 	39FB

		//;duima.c: 180: cmd_buffer[7 + i] = '0' + digits[digit_count - 1 - i];
		LDR 	4EH, 0H 			//01E7 	184E
		ADDWI 	7H 			//01E8 	0E07
		ADDWI 	2EH 			//01E9 	0E2E
		STR 	6H 			//01EA 	1086
		LDWI 	24H 			//01EB 	0024
		CLRF 	7H 			//01EC 	1187
		STR 	22H 			//01ED 	10A2
		LDR 	4EH, 0H 			//01EE 	184E
		SUBWR 	22H, 1H 		//01EF 	12A2
		LDR 	53H, 0H 			//01F0 	1853
		ADDWR 	22H, 0H 		//01F1 	1722
		STR 	23H 			//01F2 	10A3
		ADDWI 	FFH 			//01F3 	0EFF
		STR 	4H 			//01F4 	1084
		CLRF 	5H 			//01F5 	1185
		LDR 	0H, 0H 			//01F6 	1800
		ADDWI 	30H 			//01F7 	0E30
		STR 	1H 			//01F8 	1081
		INCR 	4EH, 1H 		//01F9 	1ACE
		LJUMP 	1E3H 			//01FA 	39E3

		//;duima.c: 181: }
		//;duima.c: 184: cmd_buffer[7 + digit_count] = '\0';
		LDR 	53H, 0H 			//01FB 	1853
		ADDWI 	7H 			//01FC 	0E07
		ADDWI 	2EH 			//01FD 	0E2E
		STR 	6H 			//01FE 	1086
		LDWI 	2EH 			//01FF 	002E
		CLRF 	7H 			//0200 	1187
		CLRF 	1H 			//0201 	1181

		//;duima.c: 187: SendATCommand((const char*)cmd_buffer);
		STR 	71H 			//0202 	10F1
		LDWI 	0H 			//0203 	0000
		STR 	72H 			//0204 	10F2
		LCALL 	169H 			//0205 	3169
		MOVLP 	0H 			//0206 	0180

		//;duima.c: 188: DelayMs(100);
		LDWI 	64H 			//0207 	0064
		LJUMP 	17BH 			//0208 	397B
		STR 	70H 			//0209 	10F0

		//;CAT1PRO.C: 175: unsigned char a;
		//;CAT1PRO.C: 176: for(a=0;a<Time;a++)
		CLRF 	71H 			//020A 	11F1
		LDR 	70H, 0H 			//020B 	1870
		SUBWR 	71H, 0H 		//020C 	1271
		BTSC 	3H, 0H 			//020D 	2803
		RET 					//020E 	1008

		//;CAT1PRO.C: 177: {
		//;CAT1PRO.C: 178: __nop();
		NOP 					//020F 	1000
		INCR 	71H, 1H 		//0210 	1AF1
		LJUMP 	20BH 			//0211 	3A0B
		CLRF 	78H 			//0212 	11F8
		CLRF 	79H 			//0213 	11F9
		CLRF 	7AH 			//0214 	11FA
		CLRF 	7BH 			//0215 	11FB
		LDR 	73H, 0H 			//0216 	1873
		IORWR 	72H, 0H 		//0217 	1472
		IORWR 	71H, 0H 		//0218 	1471
		IORWR 	70H, 0H 		//0219 	1470
		BTSC 	3H, 2H 			//021A 	2903
		LJUMP 	248H 			//021B 	3A48
		CLRF 	7CH 			//021C 	11FC
		INCR 	7CH, 1H 		//021D 	1AFC
		BTSC 	73H, 7H 		//021E 	2BF3
		LJUMP 	225H 			//021F 	3A25
		LSLF 	70H, 1H 		//0220 	05F0
		RLR 	71H, 1H 			//0221 	1DF1
		RLR 	72H, 1H 			//0222 	1DF2
		RLR 	73H, 1H 			//0223 	1DF3
		LJUMP 	21DH 			//0224 	3A1D
		LSLF 	78H, 1H 		//0225 	05F8
		RLR 	79H, 1H 			//0226 	1DF9
		RLR 	7AH, 1H 			//0227 	1DFA
		RLR 	7BH, 1H 			//0228 	1DFB
		LDR 	73H, 0H 			//0229 	1873
		SUBWR 	77H, 0H 		//022A 	1277
		BTSS 	3H, 2H 			//022B 	2D03
		LJUMP 	237H 			//022C 	3A37
		LDR 	72H, 0H 			//022D 	1872
		SUBWR 	76H, 0H 		//022E 	1276
		BTSS 	3H, 2H 			//022F 	2D03
		LJUMP 	237H 			//0230 	3A37
		LDR 	71H, 0H 			//0231 	1871
		SUBWR 	75H, 0H 		//0232 	1275
		BTSS 	3H, 2H 			//0233 	2D03
		LJUMP 	237H 			//0234 	3A37
		LDR 	70H, 0H 			//0235 	1870
		SUBWR 	74H, 0H 		//0236 	1274
		BTSS 	3H, 0H 			//0237 	2C03
		LJUMP 	242H 			//0238 	3A42
		LDR 	70H, 0H 			//0239 	1870
		SUBWR 	74H, 1H 		//023A 	12F4
		LDR 	71H, 0H 			//023B 	1871
		SUBWFB 	75H, 1H 		//023C 	0BF5
		LDR 	72H, 0H 			//023D 	1872
		SUBWFB 	76H, 1H 		//023E 	0BF6
		LDR 	73H, 0H 			//023F 	1873
		SUBWFB 	77H, 1H 		//0240 	0BF7
		BSR 	78H, 0H 			//0241 	2478
		LSRF 	73H, 1H 		//0242 	06F3
		RRR 	72H, 1H 			//0243 	1CF2
		RRR 	71H, 1H 			//0244 	1CF1
		RRR 	70H, 1H 			//0245 	1CF0
		DECRSZ 	7CH, 1H 		//0246 	1BFC
		LJUMP 	225H 			//0247 	3A25
		LDR 	7BH, 0H 			//0248 	187B
		STR 	73H 			//0249 	10F3
		LDR 	7AH, 0H 			//024A 	187A
		STR 	72H 			//024B 	10F2
		LDR 	79H, 0H 			//024C 	1879
		STR 	71H 			//024D 	10F1
		LDR 	78H, 0H 			//024E 	1878
		STR 	70H 			//024F 	10F0
		RET 					//0250 	1008
		LDR 	73H, 0H 			//0251 	1873
		IORWR 	72H, 0H 		//0252 	1472
		IORWR 	71H, 0H 		//0253 	1471
		IORWR 	70H, 0H 		//0254 	1470
		BTSC 	3H, 2H 			//0255 	2903
		LJUMP 	27EH 			//0256 	3A7E
		CLRF 	78H 			//0257 	11F8
		INCR 	78H, 1H 		//0258 	1AF8
		BTSC 	73H, 7H 		//0259 	2BF3
		LJUMP 	260H 			//025A 	3A60
		LSLF 	70H, 1H 		//025B 	05F0
		RLR 	71H, 1H 			//025C 	1DF1
		RLR 	72H, 1H 			//025D 	1DF2
		RLR 	73H, 1H 			//025E 	1DF3
		LJUMP 	258H 			//025F 	3A58
		LDR 	73H, 0H 			//0260 	1873
		SUBWR 	77H, 0H 		//0261 	1277
		BTSS 	3H, 2H 			//0262 	2D03
		LJUMP 	26EH 			//0263 	3A6E
		LDR 	72H, 0H 			//0264 	1872
		SUBWR 	76H, 0H 		//0265 	1276
		BTSS 	3H, 2H 			//0266 	2D03
		LJUMP 	26EH 			//0267 	3A6E
		LDR 	71H, 0H 			//0268 	1871
		SUBWR 	75H, 0H 		//0269 	1275
		BTSS 	3H, 2H 			//026A 	2D03
		LJUMP 	26EH 			//026B 	3A6E
		LDR 	70H, 0H 			//026C 	1870
		SUBWR 	74H, 0H 		//026D 	1274
		BTSS 	3H, 0H 			//026E 	2C03
		LJUMP 	278H 			//026F 	3A78
		LDR 	70H, 0H 			//0270 	1870
		SUBWR 	74H, 1H 		//0271 	12F4
		LDR 	71H, 0H 			//0272 	1871
		SUBWFB 	75H, 1H 		//0273 	0BF5
		LDR 	72H, 0H 			//0274 	1872
		SUBWFB 	76H, 1H 		//0275 	0BF6
		LDR 	73H, 0H 			//0276 	1873
		SUBWFB 	77H, 1H 		//0277 	0BF7
		LSRF 	73H, 1H 		//0278 	06F3
		RRR 	72H, 1H 			//0279 	1CF2
		RRR 	71H, 1H 			//027A 	1CF1
		RRR 	70H, 1H 			//027B 	1CF0
		DECRSZ 	78H, 1H 		//027C 	1BF8
		LJUMP 	260H 			//027D 	3A60
		LDR 	77H, 0H 			//027E 	1877
		STR 	73H 			//027F 	10F3
		LDR 	76H, 0H 			//0280 	1876
		STR 	72H 			//0281 	10F2
		LDR 	75H, 0H 			//0282 	1875
		STR 	71H 			//0283 	10F1
		LDR 	74H, 0H 			//0284 	1874
		STR 	70H 			//0285 	10F0
		RET 					//0286 	1008

		//;duima.c: 51: Duima_Timer_Init();
		LCALL 	2E3H 			//0287 	32E3
		MOVLP 	0H 			//0288 	0180

		//;duima.c: 54: local_paired_id = Duima_EEPROM_ReadID(0x13);
		LDWI 	13H 			//0289 	0013
		LCALL 	298H 			//028A 	3298
		MOVLP 	0H 			//028B 	0180
		LDR 	73H, 0H 			//028C 	1873
		STR 	5FH 			//028D 	10DF
		LDR 	72H, 0H 			//028E 	1872
		STR 	5EH 			//028F 	10DE

		//;duima.c: 59: }
		//;duima.c: 62: (PORTCbits.PC1 = 0);
		//;duima.c: 57: if(local_paired_id == 0xFFFFFFFF) {
		BCR 	EH, 1H 			//0290 	208E

		//;duima.c: 63: DelayMs(100);
		LDWI 	64H 			//0291 	0064
		LCALL 	17BH 			//0292 	317B
		MOVLP 	0H 			//0293 	0180

		//;duima.c: 66: Duima_Configure433Address(local_paired_id);
		MOVLB 	0H 			//0294 	1020
		LCALL 	3D7H 			//0295 	33D7
		MOVLP 	0H 			//0296 	0180
		LJUMP 	194H 			//0297 	3994
		MOVLB 	0H 			//0298 	1020
		STR 	20H 			//0299 	10A0

		//;duima.c: 331: id = Duima_EEPROM_ReadByte(addr);
		LDR 	20H, 0H 			//029A 	1820
		LCALL 	2CEH 			//029B 	32CE
		MOVLP 	0H 			//029C 	0180
		MOVLB 	0H 			//029D 	1020
		STR 	21H 			//029E 	10A1
		CLRF 	22H 			//029F 	11A2
		CLRF 	23H 			//02A0 	11A3
		CLRF 	24H 			//02A1 	11A4

		//;duima.c: 332: id = (id << 8) | Duima_EEPROM_ReadByte(addr+1);
		LDR 	20H, 0H 			//02A2 	1820
		ADDWI 	1H 			//02A3 	0E01
		LCALL 	2CEH 			//02A4 	32CE
		STR 	74H 			//02A5 	10F4
		CLRF 	75H 			//02A6 	11F5
		CLRF 	76H 			//02A7 	11F6
		CLRF 	77H 			//02A8 	11F7
		MOVLB 	0H 			//02A9 	1020
		LDR 	21H, 0H 			//02AA 	1821
		STR 	78H 			//02AB 	10F8
		LDR 	22H, 0H 			//02AC 	1822
		STR 	79H 			//02AD 	10F9
		LDR 	23H, 0H 			//02AE 	1823
		STR 	7AH 			//02AF 	10FA
		LDR 	24H, 0H 			//02B0 	1824
		STR 	7BH 			//02B1 	10FB
		LDR 	7AH, 0H 			//02B2 	187A
		STR 	7BH 			//02B3 	10FB
		LDR 	79H, 0H 			//02B4 	1879
		STR 	7AH 			//02B5 	10FA
		LDR 	78H, 0H 			//02B6 	1878
		STR 	79H 			//02B7 	10F9
		CLRF 	78H 			//02B8 	11F8
		LDR 	78H, 0H 			//02B9 	1878
		IORWR 	74H, 1H 		//02BA 	14F4
		LDR 	79H, 0H 			//02BB 	1879
		IORWR 	75H, 1H 		//02BC 	14F5
		LDR 	7AH, 0H 			//02BD 	187A
		IORWR 	76H, 1H 		//02BE 	14F6
		LDR 	7BH, 0H 			//02BF 	187B
		IORWR 	77H, 1H 		//02C0 	14F7
		LDR 	77H, 0H 			//02C1 	1877
		STR 	24H 			//02C2 	10A4
		LDR 	76H, 0H 			//02C3 	1876
		STR 	23H 			//02C4 	10A3
		LDR 	75H, 0H 			//02C5 	1875
		STR 	22H 			//02C6 	10A2
		LDR 	74H, 0H 			//02C7 	1874
		STR 	21H 			//02C8 	10A1

		//;duima.c: 334: return id;
		LDR 	22H, 0H 			//02C9 	1822
		STR 	73H 			//02CA 	10F3
		LDR 	21H, 0H 			//02CB 	1821
		STR 	72H 			//02CC 	10F2
		RET 					//02CD 	1008
		STR 	70H 			//02CE 	10F0

		//;duima.c: 254: unsigned char data;
		//;duima.c: 256: while(GIE) {
		BTSS 	BH, 7H 			//02CF 	2F8B
		LJUMP 	2D5H 			//02D0 	3AD5

		//;duima.c: 257: GIE = 0;
		BCR 	BH, 7H 			//02D1 	238B

		//;duima.c: 258: __nop();
		NOP 					//02D2 	1000

		//;duima.c: 259: __nop();
		NOP 					//02D3 	1000
		LJUMP 	2CFH 			//02D4 	3ACF

		//;duima.c: 260: }
		//;duima.c: 262: EEADRL = addr;
		LDR 	70H, 0H 			//02D5 	1870
		MOVLB 	3H 			//02D6 	1023
		STR 	11H 			//02D7 	1091

		//;duima.c: 263: CFGS = 0;
		BCR 	15H, 6H 			//02D8 	2315

		//;duima.c: 264: EEPGD = 0;
		BCR 	15H, 7H 			//02D9 	2395

		//;duima.c: 265: RD = 1;
		BSR 	15H, 0H 			//02DA 	2415

		//;duima.c: 266: __nop();
		NOP 					//02DB 	1000

		//;duima.c: 267: __nop();
		NOP 					//02DC 	1000

		//;duima.c: 268: __nop();
		NOP 					//02DD 	1000

		//;duima.c: 269: __nop();
		NOP 					//02DE 	1000

		//;duima.c: 270: data = EEDATL;
		MOVLB 	3H 			//02DF 	1023
		LDR 	13H, 0H 			//02E0 	1813
		STR 	71H 			//02E1 	10F1

		//;duima.c: 272: return data;
		RET 					//02E2 	1008

		//;duima.c: 13: g_timer_ms = 0;
		MOVLB 	0H 			//02E3 	1020
		CLRF 	5CH 			//02E4 	11DC
		CLRF 	5DH 			//02E5 	11DD

		//;duima.c: 16: PCKEN |= 0B00001000;
		MOVLB 	1H 			//02E6 	1021
		BSR 	1AH, 3H 			//02E7 	259A

		//;duima.c: 20: TIM4CR1 = 0B00000101;
		LDWI 	5H 			//02E8 	0005
		MOVLB 	2H 			//02E9 	1022
		STR 	11H 			//02EA 	1091

		//;duima.c: 23: TIM4IER = 0B00000001;
		LDWI 	1H 			//02EB 	0001
		STR 	12H 			//02EC 	1092

		//;duima.c: 26: TIM4SR = 0;
		CLRF 	13H 			//02ED 	1193

		//;duima.c: 27: TIM4EGR = 0;
		CLRF 	14H 			//02EE 	1194

		//;duima.c: 30: TIM4CNTR = 0;
		CLRF 	15H 			//02EF 	1195

		//;duima.c: 39: TIM4PSCR = 6;
		LDWI 	6H 			//02F0 	0006
		STR 	16H 			//02F1 	1096

		//;duima.c: 40: TIM4ARR = 249;
		LDWI 	F9H 			//02F2 	00F9
		STR 	17H 			//02F3 	1097
		RET 					//02F4 	1008

		//;duima.c: 198: static unsigned char key_state = 0;
		//;duima.c: 199: static unsigned int press_start_time = 0;
		//;duima.c: 202: if(current_mode == MODE_NORMAL)
		LDR 	62H, 0H 			//02F5 	1862
		BTSS 	3H, 2H 			//02F6 	2D03
		RET 					//02F7 	1008

		//;duima.c: 203: {
		//;duima.c: 207: if(PORTBbits.PB7 == 0)
		BTSC 	DH, 7H 			//02F8 	2B8D
		LJUMP 	317H 			//02F9 	3B17

		//;duima.c: 208: {
		//;duima.c: 210: if(key_state == 0)
		LDR 	60H, 0H 			//02FA 	1860
		BTSS 	3H, 2H 			//02FB 	2D03
		LJUMP 	304H 			//02FC 	3B04

		//;duima.c: 211: {
		//;duima.c: 212: key_state = 1;
		CLRF 	60H 			//02FD 	11E0
		INCR 	60H, 1H 		//02FE 	1AE0

		//;duima.c: 213: press_start_time = g_timer_ms;
		LDR 	5DH, 0H 			//02FF 	185D
		STR 	5BH 			//0300 	10DB
		LDR 	5CH, 0H 			//0301 	185C
		STR 	5AH 			//0302 	10DA

		//;duima.c: 214: }
		RET 					//0303 	1008

		//;duima.c: 216: else if(key_state == 1)
		DECRSZ 	60H, 0H 		//0304 	1B60
		RET 					//0305 	1008

		//;duima.c: 217: {
		//;duima.c: 220: if((g_timer_ms - press_start_time) >= 2000)
		LDR 	5AH, 0H 			//0306 	185A
		SUBWR 	5CH, 0H 		//0307 	125C
		STR 	54H 			//0308 	10D4
		LDR 	5BH, 0H 			//0309 	185B
		SUBWFB 	5DH, 0H 		//030A 	0B5D
		STR 	55H 			//030B 	10D5
		LDWI 	7H 			//030C 	0007
		SUBWR 	55H, 0H 		//030D 	1255
		LDWI 	D0H 			//030E 	00D0
		BTSC 	3H, 2H 			//030F 	2903
		SUBWR 	54H, 0H 		//0310 	1254
		BTSS 	3H, 0H 			//0311 	2C03
		RET 					//0312 	1008

		//;duima.c: 221: {
		//;duima.c: 223: Duima_StartPairing();
		LCALL 	3B7H 			//0313 	33B7

		//;duima.c: 227: key_state = 2;
		LDWI 	2H 			//0314 	0002
		STR 	60H 			//0315 	10E0
		RET 					//0316 	1008

		//;duima.c: 235: else
		//;duima.c: 236: {
		//;duima.c: 238: key_state = 0;
		CLRF 	60H 			//0317 	11E0
		RET 					//0318 	1008

		//;duima.c: 344: Duima_EEPROM_WriteByte((unsigned char)(id >> 8), addr);
		LDR 	75H, 0H 			//0319 	1875
		STR 	70H 			//031A 	10F0
		LDR 	74H, 0H 			//031B 	1874
		LCALL 	323H 			//031C 	3323
		MOVLP 	0H 			//031D 	0180

		//;duima.c: 345: Duima_EEPROM_WriteByte((unsigned char)(id), addr+1);
		LDR 	75H, 0H 			//031E 	1875
		ADDWI 	1H 			//031F 	0E01
		STR 	70H 			//0320 	10F0
		LDR 	73H, 0H 			//0321 	1873
		LJUMP 	323H 			//0322 	3B23
		STR 	71H 			//0323 	10F1

		//;duima.c: 295: unsigned char PEIE_1=PEIE;
		LDWI 	0H 			//0324 	0000
		BTSC 	BH, 6H 			//0325 	2B0B
		LDWI 	1H 			//0326 	0001
		STR 	72H 			//0327 	10F2

		//;duima.c: 296: while(GIE|PEIE) {
		LDWI 	0H 			//0328 	0000
		BTSC 	BH, 7H 			//0329 	2B8B
		IORWI 	1H 			//032A 	0801
		BTSC 	BH, 6H 			//032B 	2B0B
		IORWI 	1H 			//032C 	0801
		BTSS 	9H, 0H 			//032D 	2C09
		LJUMP 	334H 			//032E 	3B34

		//;duima.c: 297: GIE = 0;PEIE=0;
		BCR 	BH, 7H 			//032F 	238B
		BCR 	BH, 6H 			//0330 	230B

		//;duima.c: 298: __nop();
		NOP 					//0331 	1000

		//;duima.c: 299: __nop();
		NOP 					//0332 	1000
		LJUMP 	328H 			//0333 	3B28

		//;duima.c: 300: }
		//;duima.c: 302: EEADRL = addr;
		LDR 	70H, 0H 			//0334 	1870
		MOVLB 	3H 			//0335 	1023
		STR 	11H 			//0336 	1091

		//;duima.c: 303: EEDATL = data;
		LDR 	71H, 0H 			//0337 	1871
		STR 	13H 			//0338 	1093

		//;duima.c: 304: CFGS = 0;
		BCR 	15H, 6H 			//0339 	2315

		//;duima.c: 305: EEPGD = 0;
		BCR 	15H, 7H 			//033A 	2395

		//;duima.c: 306: EEIF = 0;
		BCR 	BH, 2H 			//033B 	210B

		//;duima.c: 307: WREN = 1;
		BSR 	15H, 2H 			//033C 	2515

		//;duima.c: 310: Unlock_Flash();
		LCALL 	34EH 			//033D 	334E
		MOVLP 	0H 			//033E 	0180

		//;duima.c: 311: __nop();
		NOP 					//033F 	1000

		//;duima.c: 312: __nop();
		NOP 					//0340 	1000

		//;duima.c: 313: __nop();
		NOP 					//0341 	1000

		//;duima.c: 314: __nop();
		NOP 					//0342 	1000

		//;duima.c: 317: while(WR) ;
		MOVLB 	3H 			//0343 	1023
		BTSC 	15H, 1H 		//0344 	2895
		LJUMP 	343H 			//0345 	3B43

		//;duima.c: 319: WREN = 0;
		BCR 	15H, 2H 			//0346 	2115

		//;duima.c: 320: GIE = 1;PEIE=PEIE_1;
		BSR 	BH, 7H 			//0347 	278B
		BTSS 	72H, 0H 		//0348 	2C72
		LJUMP 	34CH 			//0349 	3B4C
		BSR 	BH, 6H 			//034A 	270B
		RET 					//034B 	1008
		BCR 	BH, 6H 			//034C 	230B
		RET 					//034D 	1008
		LDWI 	3H 			//034E 	0003
		STR 	8H 			//034F 	1088
		LDWI 	55H 			//0350 	0055
		STR 	16H 			//0351 	1096
		LDWI 	AAH 			//0352 	00AA
		STR 	16H 			//0353 	1096
		BSR 	15H, 1H 			//0354 	2495
		NOP 					//0355 	1000
		NOP 					//0356 	1000
		RET 					//0357 	1008

		//;CAT1PRO.C: 110: OSCCON = 0B01110001;
		LDWI 	71H 			//0358 	0071
		MOVLB 	1H 			//0359 	1021
		STR 	19H 			//035A 	1099

		//;CAT1PRO.C: 111: INTCON = 0B00000000;
		CLRF 	BH 			//035B 	118B

		//;CAT1PRO.C: 114: PORTA = 0B00000000;
		MOVLB 	0H 			//035C 	1020
		CLRF 	CH 			//035D 	118C

		//;CAT1PRO.C: 115: TRISA = 0B10010000;
		LDWI 	90H 			//035E 	0090
		MOVLB 	1H 			//035F 	1021
		STR 	CH 			//0360 	108C

		//;CAT1PRO.C: 116: PORTB = 0B00000000;
		MOVLB 	0H 			//0361 	1020
		CLRF 	DH 			//0362 	118D

		//;CAT1PRO.C: 117: TRISB = 0B10000101;
		LDWI 	85H 			//0363 	0085
		MOVLB 	1H 			//0364 	1021
		STR 	DH 			//0365 	108D

		//;CAT1PRO.C: 118: PORTC = 0B00000000;
		MOVLB 	0H 			//0366 	1020
		CLRF 	EH 			//0367 	118E

		//;CAT1PRO.C: 119: TRISC = 0B00000000;
		MOVLB 	1H 			//0368 	1021
		CLRF 	EH 			//0369 	118E

		//;CAT1PRO.C: 122: WPUA = 0B00010000;
		LDWI 	10H 			//036A 	0010
		MOVLB 	3H 			//036B 	1023
		STR 	CH 			//036C 	108C

		//;CAT1PRO.C: 123: WPUB = 0B10000101;
		LDWI 	85H 			//036D 	0085
		STR 	DH 			//036E 	108D

		//;CAT1PRO.C: 124: WPUC = 0B00000000;
		CLRF 	EH 			//036F 	118E

		//;CAT1PRO.C: 127: WPDA = 0B00000000;
		MOVLB 	4H 			//0370 	1024
		CLRF 	CH 			//0371 	118C

		//;CAT1PRO.C: 128: WPDB = 0B00000000;
		CLRF 	DH 			//0372 	118D

		//;CAT1PRO.C: 129: WPDC = 0B00000000;
		CLRF 	EH 			//0373 	118E

		//;CAT1PRO.C: 132: PSRC0 = 0B11111111;
		LDWI 	FFH 			//0374 	00FF
		MOVLB 	2H 			//0375 	1022
		STR 	1AH 			//0376 	109A

		//;CAT1PRO.C: 133: PSRC1 = 0B11111111;
		STR 	1BH 			//0377 	109B

		//;CAT1PRO.C: 134: PSRC2 = 0B11111111;
		STR 	1CH 			//0378 	109C

		//;CAT1PRO.C: 137: PSINK0 = 0B11111111;
		MOVLB 	3H 			//0379 	1023
		STR 	1AH 			//037A 	109A

		//;CAT1PRO.C: 138: PSINK1 = 0B11111111;
		STR 	1BH 			//037B 	109B

		//;CAT1PRO.C: 139: PSINK2 = 0B11111111;
		STR 	1CH 			//037C 	109C

		//;CAT1PRO.C: 141: ANSELA = 0B00000000;
		CLRF 	17H 			//037D 	1197
		RET 					//037E 	1008

		//;CAT1PRO.C: 344: PORTAbits.PA1 = 0;
		BCR 	CH, 1H 			//037F 	208C

		//;CAT1PRO.C: 345: PORTCbits.PC1 = 1;
		BSR 	EH, 1H 			//0380 	248E

		//;CAT1PRO.C: 346: DelayMs(50);
		LDWI 	32H 			//0381 	0032
		LCALL 	17BH 			//0382 	317B
		MOVLP 	0H 			//0383 	0180

		//;CAT1PRO.C: 351: IO_INT_INITIAL();
		LCALL 	399H 			//0384 	3399
		MOVLP 	0H 			//0385 	0180

		//;CAT1PRO.C: 352: EPIF0 = 0x90;
		LDWI 	90H 			//0386 	0090
		MOVLB 	0H 			//0387 	1020
		STR 	14H 			//0388 	1094

		//;CAT1PRO.C: 354: GIE = 0;
		BCR 	BH, 7H 			//0389 	238B

		//;CAT1PRO.C: 357: __nop(); __nop();__nop();__nop();
		NOP 					//038A 	1000
		NOP 					//038B 	1000
		NOP 					//038C 	1000
		NOP 					//038D 	1000
		SLEEP 					//038E 	1063

		//;CAT1PRO.C: 359: __nop(); __nop();__nop();__nop();
		NOP 					//038F 	1000
		NOP 					//0390 	1000
		NOP 					//0391 	1000
		NOP 					//0392 	1000

		//;CAT1PRO.C: 362: EPIF0 = 0x90;
		MOVLB 	0H 			//0393 	1020
		STR 	14H 			//0394 	1094

		//;CAT1PRO.C: 363: INTCON = 0B11000000;
		LDWI 	C0H 			//0395 	00C0
		STR 	BH 			//0396 	108B

		//;CAT1PRO.C: 365: DelayMs(50);
		LDWI 	32H 			//0397 	0032
		LJUMP 	17BH 			//0398 	397B

		//;CAT1PRO.C: 153: EPS0 = 0B00000000;
		MOVLB 	2H 			//0399 	1022
		CLRF 	18H 			//039A 	1198

		//;CAT1PRO.C: 156: EPS1 = 0B01000000;
		LDWI 	40H 			//039B 	0040
		STR 	19H 			//039C 	1099

		//;CAT1PRO.C: 158: ITYPE0 = 0B00000000;
		CLRF 	1EH 			//039D 	119E

		//;CAT1PRO.C: 160: ITYPE1 = 0B10000000;
		LDWI 	80H 			//039E 	0080
		STR 	1FH 			//039F 	109F

		//;CAT1PRO.C: 162: EPIE0 = 0B10010000;
		LDWI 	90H 			//03A0 	0090
		MOVLB 	1H 			//03A1 	1021
		STR 	14H 			//03A2 	1094

		//;CAT1PRO.C: 164: INTCON = 0B11000000;
		LDWI 	C0H 			//03A3 	00C0
		STR 	BH 			//03A4 	108B
		RET 					//03A5 	1008

		//;CAT1PRO.C: 206: PCKEN |=0B00100000;
		MOVLB 	1H 			//03A6 	1021
		BSR 	1AH, 5H 			//03A7 	269A

		//;CAT1PRO.C: 208: URIER =0B00000001;
		LDWI 	1H 			//03A8 	0001
		MOVLB 	9H 			//03A9 	1029
		STR 	EH 			//03AA 	108E

		//;CAT1PRO.C: 209: URLCR =0B00000001;
		STR 	FH 			//03AB 	108F

		//;CAT1PRO.C: 210: URMCR =0B00011000;
		LDWI 	18H 			//03AC 	0018
		STR 	11H 			//03AD 	1091

		//;CAT1PRO.C: 212: URDLL =104;
		LDWI 	68H 			//03AE 	0068
		STR 	14H 			//03AF 	1094

		//;CAT1PRO.C: 213: URDLH =0;
		CLRF 	15H 			//03B0 	1195

		//;CAT1PRO.C: 214: TCF=1;
		BSR 	1CH, 0H 			//03B1 	241C

		//;CAT1PRO.C: 215: AFP1=0;
		MOVLB 	3H 			//03B2 	1023
		CLRF 	1FH 			//03B3 	119F

		//;CAT1PRO.C: 216: ODCON0=0B00000000;
		MOVLB 	4H 			//03B4 	1024
		CLRF 	1FH 			//03B5 	119F
		RET 					//03B6 	1008

		//;duima.c: 75: if(current_mode == MODE_PAIRING) return;
		DECRSZ 	62H, 0H 		//03B7 	1B62
		LJUMP 	3BAH 			//03B8 	3BBA
		RET 					//03B9 	1008

		//;duima.c: 77: current_mode = MODE_PAIRING;
		CLRF 	62H 			//03BA 	11E2
		INCR 	62H, 1H 		//03BB 	1AE2

		//;duima.c: 78: PORTAbits.PA1 = 1;
		BSR 	CH, 1H 			//03BC 	248C

		//;duima.c: 81: (PORTCbits.PC1 = 0);
		BCR 	EH, 1H 			//03BD 	208E

		//;duima.c: 82: DelayMs(20);
		LDWI 	14H 			//03BE 	0014
		LCALL 	17BH 			//03BF 	317B
		MOVLP 	0H 			//03C0 	0180

		//;duima.c: 86: Duima_Configure433Address(65535);
		LDWI 	FFH 			//03C1 	00FF
		MOVLB 	0H 			//03C2 	1020
		STR 	20H 			//03C3 	10A0
		STR 	21H 			//03C4 	10A1
		LCALL 	194H 			//03C5 	3194

		//;duima.c: 89: mmm = 0;
		MOVLB 	0H 			//03C6 	1020
		CLRF 	61H 			//03C7 	11E1

		//;duima.c: 92: g_timer_ms = 0;
		CLRF 	5CH 			//03C8 	11DC
		CLRF 	5DH 			//03C9 	11DD
		RET 					//03CA 	1008
		LDR 	72H, 0H 			//03CB 	1872
		STR 	74H 			//03CC 	10F4
		LDR 	71H, 0H 			//03CD 	1871
		STR 	73H 			//03CE 	10F3
		LDR 	76H, 0H 			//03CF 	1876
		ADDWR 	73H, 0H 		//03D0 	1773
		STR 	4H 			//03D1 	1084
		LDR 	74H, 0H 			//03D2 	1874
		BTSC 	3H, 0H 			//03D3 	2803
		INCR 	74H, 0H 		//03D4 	1A74
		STR 	5H 			//03D5 	1085
		RET 					//03D6 	1008
		LDR 	5FH, 0H 			//03D7 	185F
		STR 	21H 			//03D8 	10A1
		LDR 	5EH, 0H 			//03D9 	185E
		STR 	20H 			//03DA 	10A0
		RET 					//03DB 	1008
		LDR 	52H, 0H 			//03DC 	1852
		IORWR 	51H, 0H 		//03DD 	1451
		IORWR 	50H, 0H 		//03DE 	1450
		IORWR 	4FH, 0H 		//03DF 	144F
		RET 					//03E0 	1008
		RETW 	41H 			//03E1 	0441
		RETW 	54H 			//03E2 	0454
		RETW 	DH 			//03E3 	040D
		RETW 	AH 			//03E4 	040A
		RETW 	0H 			//03E5 	0400
		RETW 	0H 			//03E6 	0400
		RETW 	0H 			//03E7 	0400
		RETW 	0H 			//03E8 	0400
		RETW 	0H 			//03E9 	0400
		RETW 	0H 			//03EA 	0400
		RETW 	0H 			//03EB 	0400
		RETW 	0H 			//03EC 	0400
		RETW 	0H 			//03ED 	0400
		RETW 	0H 			//03EE 	0400
		RETW 	0H 			//03EF 	0400
		RETW 	0H 			//03F0 	0400
		RETW 	0H 			//03F1 	0400
		RETW 	0H 			//03F2 	0400
		RETW 	0H 			//03F3 	0400
		RETW 	0H 			//03F4 	0400
		RETW 	41H 			//03F5 	0441
		RETW 	54H 			//03F6 	0454
		RETW 	2BH 			//03F7 	042B
		RETW 	50H 			//03F8 	0450
		RETW 	57H 			//03F9 	0457
		RETW 	52H 			//03FA 	0452
		RETW 	3DH 			//03FB 	043D
		RETW 	32H 			//03FC 	0432
		RETW 	39H 			//03FD 	0439
		RETW 	DH 			//03FE 	040D
		RETW 	AH 			//03FF 	040A
		RETW 	0H 			//0400 	0400
		RETW 	0H 			//0401 	0400
		RETW 	0H 			//0402 	0400
		RETW 	0H 			//0403 	0400
		RETW 	0H 			//0404 	0400
		RETW 	0H 			//0405 	0400
		RETW 	0H 			//0406 	0400
		RETW 	0H 			//0407 	0400
		RETW 	0H 			//0408 	0400
		RETW 	41H 			//0409 	0441
		RETW 	54H 			//040A 	0454
		RETW 	DH 			//040B 	040D
		RETW 	AH 			//040C 	040A
		RETW 	0H 			//040D 	0400
		RETW 	0H 			//040E 	0400
		RETW 	0H 			//040F 	0400
		RETW 	0H 			//0410 	0400
		RETW 	0H 			//0411 	0400
		RETW 	0H 			//0412 	0400
		RETW 	0H 			//0413 	0400
		RETW 	0H 			//0414 	0400
		RETW 	0H 			//0415 	0400
		RETW 	0H 			//0416 	0400
		RETW 	0H 			//0417 	0400
		RETW 	0H 			//0418 	0400
		RETW 	0H 			//0419 	0400
		RETW 	0H 			//041A 	0400
		RETW 	0H 			//041B 	0400
		RETW 	0H 			//041C 	0400
		RETW 	0H 			//041D 	0400
		RETW 	AH 			//041E 	040A
		RETW 	0H 			//041F 	0400
		RETW 	AH 			//0420 	040A
		RETW 	0H 			//0421 	0400
		RETW 	AH 			//0422 	040A
		RETW 	0H 			//0423 	0400
		RETW 	AH 			//0424 	040A
		RETW 	0H 			//0425 	0400
		RETW 	0H 			//0426 	0400
		RETW 	0H 			//0427 	0400
		RETW 	0H 			//0428 	0400
		RETW 	0H 			//0429 	0400
		RETW 	0H 			//042A 	0400
		RETW 	0H 			//042B 	0400
		RETW 	0H 			//042C 	0400
		RETW 	0H 			//042D 	0400
		RETW 	0H 			//042E 	0400
		RETW 	0H 			//042F 	0400
		RETW 	0H 			//0430 	0400
		RETW 	41H 			//0431 	0441
		RETW 	54H 			//0432 	0454
		RETW 	2BH 			//0433 	042B
		RETW 	55H 			//0434 	0455
		RETW 	41H 			//0435 	0441
		RETW 	52H 			//0436 	0452
		RETW 	54H 			//0437 	0454
		RETW 	3DH 			//0438 	043D
		RETW 	33H 			//0439 	0433
		RETW 	2CH 			//043A 	042C
		RETW 	30H 			//043B 	0430
		RETW 	DH 			//043C 	040D
		RETW 	AH 			//043D 	040A
		RETW 	55H 			//043E 	0455
		RETW 	66H 			//043F 	0466
		RETW 	77H 			//0440 	0477
		RETW 	88H 			//0441 	0488
		RETW 	99H 			//0442 	0499
		RETW 	AAH 			//0443 	04AA
		RETW 	0H 			//0444 	0400
		RETW 	41H 			//0445 	0441
		RETW 	54H 			//0446 	0454
		RETW 	2BH 			//0447 	042B
		RETW 	46H 			//0448 	0446
		RETW 	45H 			//0449 	0445
		RETW 	51H 			//044A 	0451
		RETW 	3DH 			//044B 	043D
		RETW 	34H 			//044C 	0434
		RETW 	33H 			//044D 	0433
		RETW 	34H 			//044E 	0434
		RETW 	30H 			//044F 	0430
		RETW 	30H 			//0450 	0430
		RETW 	30H 			//0451 	0430
		RETW 	30H 			//0452 	0430
		RETW 	30H 			//0453 	0430
		RETW 	30H 			//0454 	0430
		RETW 	0H 			//0455 	0400
		RETW 	41H 			//0456 	0441
		RETW 	54H 			//0457 	0454
		RETW 	2BH 			//0458 	042B
		RETW 	55H 			//0459 	0455
		RETW 	41H 			//045A 	0441
		RETW 	52H 			//045B 	0452
		RETW 	54H 			//045C 	0454
		RETW 	3DH 			//045D 	043D
		RETW 	33H 			//045E 	0433
		RETW 	2CH 			//045F 	042C
		RETW 	30H 			//0460 	0430
		RETW 	0H 			//0461 	0400
		RETW 	41H 			//0462 	0441
		RETW 	54H 			//0463 	0454
		RETW 	2BH 			//0464 	042B
		RETW 	50H 			//0465 	0450
		RETW 	42H 			//0466 	0442
		RETW 	3DH 			//0467 	043D
		RETW 	32H 			//0468 	0432
		RETW 	30H 			//0469 	0430
		RETW 	30H 			//046A 	0430
		RETW 	30H 			//046B 	0430
		RETW 	0H 			//046C 	0400
		RETW 	41H 			//046D 	0441
		RETW 	54H 			//046E 	0454
		RETW 	2BH 			//046F 	042B
		RETW 	50H 			//0470 	0450
		RETW 	57H 			//0471 	0457
		RETW 	52H 			//0472 	0452
		RETW 	3DH 			//0473 	043D
		RETW 	32H 			//0474 	0432
		RETW 	30H 			//0475 	0430
		RETW 	0H 			//0476 	0400
		RETW 	41H 			//0477 	0441
		RETW 	54H 			//0478 	0454
		RETW 	2BH 			//0479 	042B
		RETW 	4DH 			//047A 	044D
		RETW 	4FH 			//047B 	044F
		RETW 	44H 			//047C 	0444
		RETW 	45H 			//047D 	0445
		RETW 	3DH 			//047E 	043D
		RETW 	31H 			//047F 	0431
		RETW 	0H 			//0480 	0400
		RETW 	41H 			//0481 	0441
		RETW 	54H 			//0482 	0454
		RETW 	2BH 			//0483 	042B
		RETW 	41H 			//0484 	0441
		RETW 	44H 			//0485 	0444
		RETW 	52H 			//0486 	0452
		RETW 	3DH 			//0487 	043D
		RETW 	30H 			//0488 	0430
		RETW 	0H 			//0489 	0400
		RETW 	41H 			//048A 	0441
		RETW 	54H 			//048B 	0454
		RETW 	2BH 			//048C 	042B
		RETW 	57H 			//048D 	0457
		RETW 	54H 			//048E 	0454
		RETW 	3DH 			//048F 	043D
		RETW 	32H 			//0490 	0432
		RETW 	0H 			//0491 	0400
		RETW 	41H 			//0492 	0441
		RETW 	54H 			//0493 	0454
		RETW 	2BH 			//0494 	042B
		RETW 	53H 			//0495 	0453
		RETW 	46H 			//0496 	0446
		RETW 	3DH 			//0497 	043D
		RETW 	37H 			//0498 	0437
		RETW 	0H 			//0499 	0400
		RETW 	41H 			//049A 	0441
		RETW 	54H 			//049B 	0454
		RETW 	2BH 			//049C 	042B
		RETW 	42H 			//049D 	0442
		RETW 	57H 			//049E 	0457
		RETW 	3DH 			//049F 	043D
		RETW 	39H 			//04A0 	0439
		RETW 	0H 			//04A1 	0400
		RETW 	41H 			//04A2 	0441
		RETW 	42H 			//04A3 	0442
		RETW 	43H 			//04A4 	0443
		RETW 	44H 			//04A5 	0444
		RETW 	DH 			//04A6 	040D
		RETW 	AH 			//04A7 	040A
		RETW 	0H 			//04A8 	0400
		STR 	7EH 			//04A9 	10FE
		MOVIW 	FSR0++ 		//04AA 	1012
		MOVWI 	FSR1++ 		//04AB 	101E
		DECRSZ 	7EH, 1H 		//04AC 	1BFE
		LJUMP 	4AAH 			//04AD 	3CAA
		RETW 	0H 			//04AE 	0400
		RETW 	41H 			//04AF 	0441
		RETW 	54H 			//04B0 	0454
		RETW 	57H 			//04B1 	0457
		RETW 	0H 			//04B2 	0400
			END
