//Deviec:FT61FC4X
//-----------------------Variable---------------------------------
		_g_timer_ms		EQU		C2H
		_receivedata		EQU		CDH
		_senddat		EQU		15CH
		_toSend		EQU		148H
		_toSendA		EQU		134H
		_toSenda		EQU		120H
		_ring_buf		EQU		A0H
		_head		EQU		CCH
		_tail		EQU		7AH
		_g_cal_crc		EQU		CBH
		_g_rx_crc		EQU		CAH
		_g_crc_match		EQU		C9H
		_g_frame_len		EQU		C8H
		_g_frame_count		EQU		C7H
		_current_mode		EQU		7BH
		_local_paired_id		EQU		C4H
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
//		main@k		EQU		E2H
//		main@sys_state		EQU		E1H
//		UART_Task@check_buf		EQU		65H
//		UART_Task@i		EQU		6EH
//		UART_Task@match		EQU		6DH
//		UART_Task@min_len		EQU		62H
//		UART_Task@calculated_crc		EQU		61H
//		Duima_ProcessReceivedData@data		EQU		5DH
//		Duima_ProcessReceivedData@k		EQU		5AH
//		Duima_ProcessReceivedData@new_id		EQU		5BH
//		Duima_ProcessReceivedData@data		EQU		5DH
//		Duima_ProcessReceivedData@len		EQU		59H
//		Duima_ProcessReceivedData@data		EQU		5DH
//		Duima_EEPROM_WriteID@id		EQU		75H
//		Duima_EEPROM_WriteID@addr		EQU		77H
//		Duima_EEPROM_WriteByte@data		EQU		73H
//		Duima_EEPROM_WriteByte@PEIE_1		EQU		74H
//		Duima_EEPROM_WriteByte@data		EQU		73H
//		Duima_EEPROM_WriteByte@addr		EQU		72H
//		Duima_EEPROM_WriteByte@data		EQU		73H
//		Duima_ControlMotor@cmd		EQU		72H
//		Duima_ControlMotor@cmd		EQU		72H
//		Duima_ControlMotor@cmd		EQU		72H
//		Duima_MainLoop@key_state		EQU		C6H
//		Duima_MainLoop@press_start_time		EQU		C0H
//		Duima_EEPROM_ReadID@addr		EQU		28H
//		Duima_EEPROM_ReadID@id		EQU		29H
//		Duima_EEPROM_ReadID@addr		EQU		28H
//		Duima_EEPROM_ReadID@addr		EQU		28H
//		Duima_EEPROM_ReadByte@addr		EQU		72H
//		Duima_EEPROM_ReadByte@data		EQU		73H
//		Duima_EEPROM_ReadByte@addr		EQU		72H
//		Duima_EEPROM_ReadByte@addr		EQU		72H
//		Duima_Configure433Address@cmd_buffer		EQU		33H
//		Duima_Configure433Address@digits		EQU		29H
//		Duima_Configure433Address@temp		EQU		54H
//		Duima_Configure433Address@digit_count		EQU		58H
//		Duima_Configure433Address@i		EQU		53H
//		Duima_Configure433Address@addr		EQU		25H
//		___llmod@counter		EQU		20H
//		___llmod@divisor		EQU		72H
//		___llmod@dividend		EQU		76H
//		___lldiv@quotient		EQU		20H
//		___lldiv@counter		EQU		24H
//		___lldiv@divisor		EQU		72H
//		___lldiv@dividend		EQU		76H
//		SendATCommand@j		EQU		78H
//		SendATCommand@cmd		EQU		73H
//		SendByte@data		EQU		72H
//		SendByte@data		EQU		72H
//		SendByte@data		EQU		72H
//		DelayMs@Time		EQU		74H
//		DelayMs@b		EQU		76H
//		DelayMs@a		EQU		75H
//		DelayMs@Time		EQU		74H
//		DelayMs@Time		EQU		74H
//		DelayUs@Time		EQU		72H
//		DelayUs@a		EQU		73H
//		DelayUs@Time		EQU		72H
//		DelayUs@Time		EQU		72H
//		ISR@next_head		EQU		71H
//		ISR@data		EQU		70H
//-----------------------Variable END---------------------------------

		MOVLP 	0H 			//0000 	0180
		LJUMP 	2AH 			//0001 	382A
		ORG		0004H
		BSR 	7EH, 0H 			//0004 	247E
		MOVLP 	0H 			//0005 	0180

		//;CAT1PRO.C: 98: if(URRXNE && RXNEF)
		MOVLB 	9H 			//0006 	1029
		BTSC 	EH, 0H 			//0007 	280E
		BTSS 	12H, 0H 		//0008 	2C12
		LJUMP 	1FH 			//0009 	381F

		//;CAT1PRO.C: 99: {
		//;CAT1PRO.C: 100: unsigned char data = URDATAL;
		LDR 	CH, 0H 			//000A 	180C
		STR 	70H 			//000B 	10F0

		//;CAT1PRO.C: 101: unsigned char next_head = (head + 1) % 32;
		MOVLB 	1H 			//000C 	1021
		LDR 	4CH, 0H 			//000D 	184C
		ADDWI 	1H 			//000E 	0E01
		STR 	71H 			//000F 	10F1
		LDWI 	1FH 			//0010 	001F
		ANDWR 	71H, 1H 		//0011 	15F1

		//;CAT1PRO.C: 104: if(next_head != tail) {
		LDR 	71H, 0H 			//0012 	1871
		XORWR 	7AH, 0H 		//0013 	167A
		BTSC 	3H, 2H 			//0014 	2903
		LJUMP 	1EH 			//0015 	381E

		//;CAT1PRO.C: 105: ring_buf[head] = data;
		LDR 	4CH, 0H 			//0016 	184C
		ADDWI 	A0H 			//0017 	0EA0
		STR 	6H 			//0018 	1086
		CLRF 	7H 			//0019 	1187
		LDR 	70H, 0H 			//001A 	1870
		STR 	1H 			//001B 	1081

		//;CAT1PRO.C: 106: head = next_head;
		LDR 	71H, 0H 			//001C 	1871
		STR 	4CH 			//001D 	10CC

		//;CAT1PRO.C: 107: }
		//;CAT1PRO.C: 110: __nop();
		NOP 					//001E 	1000

		//;CAT1PRO.C: 111: }
		//;CAT1PRO.C: 116: if(T4UIE && T4UIF)
		MOVLB 	2H 			//001F 	1022
		BTSC 	12H, 0H 		//0020 	2812
		BTSS 	13H, 0H 		//0021 	2C13
		LJUMP 	28H 			//0022 	3828

		//;CAT1PRO.C: 117: {
		//;CAT1PRO.C: 118: T4UIF = 1;
		BSR 	13H, 0H 			//0023 	2413

		//;CAT1PRO.C: 119: g_timer_ms++;
		MOVLB 	1H 			//0024 	1021
		INCR 	42H, 1H 		//0025 	1AC2
		BTSC 	3H, 2H 			//0026 	2903
		INCR 	43H, 1H 		//0027 	1AC3
		BCR 	7EH, 0H 			//0028 	207E
		RETI 					//0029 	1009
		MOVLP 	0H 			//002A 	0180
		LJUMP 	45H 			//002B 	3845

		//;duima.c: 75: if(current_mode == MODE_PAIRING) return;
		DECRSZ 	7BH, 0H 		//002C 	1B7B
		LJUMP 	2FH 			//002D 	382F
		RET 					//002E 	1008

		//;duima.c: 77: current_mode = MODE_PAIRING;
		CLRF 	7BH 			//002F 	11FB
		INCR 	7BH, 1H 		//0030 	1AFB

		//;duima.c: 78: PORTAbits.PA1 = 1;
		BSR 	CH, 1H 			//0031 	248C

		//;duima.c: 81: (PORTCbits.PC1 = 0);
		BCR 	EH, 1H 			//0032 	208E

		//;duima.c: 82: DelayMs(20);
		LDWI 	14H 			//0033 	0014
		LCALL 	234H 			//0034 	3234
		MOVLP 	0H 			//0035 	0180

		//;duima.c: 86: Duima_Configure433Address(65535);
		LDWI 	FFH 			//0036 	00FF
		MOVLB 	0H 			//0037 	1020
		STR 	25H 			//0038 	10A5
		STR 	26H 			//0039 	10A6
		LCALL 	256H 			//003A 	3256
		MOVLP 	0H 			//003B 	0180

		//;duima.c: 89: head = 0;
		MOVLB 	1H 			//003C 	1021
		CLRF 	4CH 			//003D 	11CC

		//;duima.c: 90: tail = 0;
		CLRF 	7AH 			//003E 	11FA

		//;duima.c: 93: DelayMs(200);
		LDWI 	C8H 			//003F 	00C8
		LCALL 	234H 			//0040 	3234

		//;duima.c: 96: g_timer_ms = 0;
		MOVLB 	1H 			//0041 	1021
		CLRF 	42H 			//0042 	11C2
		CLRF 	43H 			//0043 	11C3
		RET 					//0044 	1008
		LDWI 	8AH 			//0045 	008A
		STR 	4H 			//0046 	1084
		LDWI 	85H 			//0047 	0085
		STR 	5H 			//0048 	1085
		LDWI 	CDH 			//0049 	00CD
		STR 	6H 			//004A 	1086
		LDWI 	0H 			//004B 	0000
		STR 	7H 			//004C 	1087
		LDWI 	14H 			//004D 	0014
		MOVLP 	5H 			//004E 	0185
		LCALL 	5FFH 			//004F 	35FF
		MOVLP 	0H 			//0050 	0180
		LDWI 	A6H 			//0051 	00A6
		STR 	4H 			//0052 	1084
		LDWI 	84H 			//0053 	0084
		STR 	5H 			//0054 	1085
		LDWI 	20H 			//0055 	0020
		STR 	6H 			//0056 	1086
		LDWI 	1H 			//0057 	0001
		STR 	7H 			//0058 	1087
		LDWI 	50H 			//0059 	0050
		MOVLP 	5H 			//005A 	0185
		LCALL 	5FFH 			//005B 	35FF
		MOVLP 	0H 			//005C 	0180
		LDWI 	A0H 			//005D 	00A0
		CLRF 	7AH 			//005E 	11FA
		CLRF 	7BH 			//005F 	11FB
		STR 	4H 			//0060 	1084
		LDWI 	0H 			//0061 	0000
		STR 	5H 			//0062 	1085
		LDWI 	2DH 			//0063 	002D
		MOVLP 	6H 			//0064 	0186
		LCALL 	605H 			//0065 	3605
		MOVLP 	0H 			//0066 	0180
		BCR 	7EH, 0H 			//0067 	207E
		MOVLB 	0H 			//0068 	1020
		LJUMP 	15EH 			//0069 	395E

		//;CAT1PRO.C: 332: unsigned char check_buf[8];
		//;CAT1PRO.C: 333: unsigned char i;
		//;CAT1PRO.C: 334: unsigned char match;
		//;CAT1PRO.C: 335: unsigned char calculated_crc;
		//;CAT1PRO.C: 336: unsigned char min_len;
		//;CAT1PRO.C: 339: const unsigned char CMD_FRAME_OPEN[7] = {0xBB, 0x01, 0x01, 0x01, 0x03,
		//+                          0x0D, 0x0A};
		//;CAT1PRO.C: 340: const unsigned char CMD_FRAME_CLOSE[7] = {0xBB, 0x01, 0x01, 0x02, 0x04,
		//+                           0x0D, 0x0A};
		//;CAT1PRO.C: 341: const unsigned char CMD_FRAME_STOP[7] = {0xBB, 0x01, 0x01, 0x00, 0x02,
		//+                          0x0D, 0x0A};
		//;CAT1PRO.C: 345: min_len = (current_mode == MODE_PAIRING) ? 8 : 7;
		DECR 	7BH, 0H 		//006A 	137B
		BTSC 	3H, 2H 			//006B 	2903
		LJUMP 	6FH 			//006C 	386F
		LDWI 	7H 			//006D 	0007
		LJUMP 	70H 			//006E 	3870
		LDWI 	8H 			//006F 	0008
		MOVLB 	0H 			//0070 	1020
		STR 	63H 			//0071 	10E3
		CLRF 	64H 			//0072 	11E4
		STR 	62H 			//0073 	10E2

		//;CAT1PRO.C: 348: while((head - tail + 32) % 32 >= min_len)
		MOVLB 	1H 			//0074 	1021
		LDR 	4CH, 0H 			//0075 	184C
		MOVLB 	0H 			//0076 	1020
		STR 	5EH 			//0077 	10DE
		LDR 	7AH, 0H 			//0078 	187A
		SUBWR 	5EH, 1H 		//0079 	12DE
		LDWI 	20H 			//007A 	0020
		ADDWR 	5EH, 0H 		//007B 	175E
		STR 	5FH 			//007C 	10DF
		ANDWI 	1FH 			//007D 	091F
		STR 	60H 			//007E 	10E0
		LDR 	62H, 0H 			//007F 	1862
		SUBWR 	60H, 0H 		//0080 	1260
		BTSS 	3H, 0H 			//0081 	2C03
		RET 					//0082 	1008

		//;CAT1PRO.C: 349: {
		//;CAT1PRO.C: 351: for(i = 0; i < 7; i++) {
		CLRF 	6EH 			//0083 	11EE

		//;CAT1PRO.C: 352: check_buf[i] = ring_buf[(tail + i) % 32];
		LDR 	6EH, 0H 			//0084 	186E
		ADDWI 	65H 			//0085 	0E65
		STR 	6H 			//0086 	1086
		CLRF 	7H 			//0087 	1187
		LDR 	7AH, 0H 			//0088 	187A
		ADDWR 	6EH, 0H 		//0089 	176E
		ANDWI 	1FH 			//008A 	091F
		ADDWI 	A0H 			//008B 	0EA0
		STR 	4H 			//008C 	1084
		CLRF 	5H 			//008D 	1185
		LDR 	0H, 0H 			//008E 	1800
		STR 	1H 			//008F 	1081
		LDWI 	7H 			//0090 	0007
		INCR 	6EH, 1H 		//0091 	1AEE
		SUBWR 	6EH, 0H 		//0092 	126E
		BTSS 	3H, 0H 			//0093 	2C03
		LJUMP 	84H 			//0094 	3884

		//;CAT1PRO.C: 353: }
		//;CAT1PRO.C: 358: match = 1;
		CLRF 	6DH 			//0095 	11ED
		INCR 	6DH, 1H 		//0096 	1AED

		//;CAT1PRO.C: 359: for(i = 0; i < 7; i++) {
		CLRF 	6EH 			//0097 	11EE

		//;CAT1PRO.C: 360: if(check_buf[i] != CMD_FRAME_OPEN[i]) {
		LDR 	6EH, 0H 			//0098 	186E
		ADDWI 	72H 			//0099 	0E72
		STR 	4H 			//009A 	1084
		LDWI 	85H 			//009B 	0085
		LCALL 	3E3H 			//009C 	33E3
		MOVLP 	0H 			//009D 	0180
		BTSC 	3H, 2H 			//009E 	2903
		LJUMP 	A2H 			//009F 	38A2

		//;CAT1PRO.C: 361: match = 0;
		CLRF 	6DH 			//00A0 	11ED

		//;CAT1PRO.C: 362: break;
		LJUMP 	A7H 			//00A1 	38A7
		LDWI 	7H 			//00A2 	0007
		INCR 	6EH, 1H 		//00A3 	1AEE
		SUBWR 	6EH, 0H 		//00A4 	126E
		BTSS 	3H, 0H 			//00A5 	2C03
		LJUMP 	98H 			//00A6 	3898

		//;CAT1PRO.C: 363: }
		//;CAT1PRO.C: 364: }
		//;CAT1PRO.C: 365: if(match) {
		LDR 	6DH, 0H 			//00A7 	186D
		BTSC 	3H, 2H 			//00A8 	2903
		LJUMP 	C8H 			//00A9 	38C8

		//;CAT1PRO.C: 367: Duima_ControlMotor(0x01);
		LDWI 	1H 			//00AA 	0001
		LCALL 	144H 			//00AB 	3144
		MOVLP 	0H 			//00AC 	0180

		//;CAT1PRO.C: 368: g_frame_count++;
		MOVLB 	1H 			//00AD 	1021
		INCR 	47H, 1H 		//00AE 	1AC7

		//;CAT1PRO.C: 369: PORTAbits.PA1 = (PORTAbits.PA1 == 1 ? 0 : 1); DelayMs(50); PORTAbits.PA
		//+                          1 = (PORTAbits.PA1 == 1 ? 0 : 1);
		BCR 	3H, 0H 			//00AF 	2003
		MOVLB 	0H 			//00B0 	1020
		BTSS 	CH, 1H 			//00B1 	2C8C
		BSR 	3H, 0H 			//00B2 	2403
		BTSS 	3H, 0H 			//00B3 	2C03
		LJUMP 	B8H 			//00B4 	38B8
		MOVLB 	0H 			//00B5 	1020
		BSR 	CH, 1H 			//00B6 	248C
		LJUMP 	BAH 			//00B7 	38BA
		MOVLB 	0H 			//00B8 	1020
		BCR 	CH, 1H 			//00B9 	208C
		LDWI 	32H 			//00BA 	0032
		LCALL 	234H 			//00BB 	3234
		MOVLP 	0H 			//00BC 	0180
		BCR 	3H, 0H 			//00BD 	2003
		MOVLB 	0H 			//00BE 	1020
		BTSS 	CH, 1H 			//00BF 	2C8C
		BSR 	3H, 0H 			//00C0 	2403
		BTSC 	3H, 0H 			//00C1 	2803
		LJUMP 	10DH 			//00C2 	390D
		MOVLB 	0H 			//00C3 	1020
		BCR 	CH, 1H 			//00C4 	208C

		//;CAT1PRO.C: 370: tail = (tail + 7) % 32;
		LDWI 	7H 			//00C5 	0007
		ADDWR 	7AH, 1H 		//00C6 	17FA

		//;CAT1PRO.C: 371: continue;
		LJUMP 	141H 			//00C7 	3941

		//;CAT1PRO.C: 372: }
		//;CAT1PRO.C: 377: match = 1;
		CLRF 	6DH 			//00C8 	11ED
		INCR 	6DH, 1H 		//00C9 	1AED

		//;CAT1PRO.C: 378: for(i = 0; i < 7; i++) {
		CLRF 	6EH 			//00CA 	11EE

		//;CAT1PRO.C: 379: if(check_buf[i] != CMD_FRAME_CLOSE[i]) {
		LDR 	6EH, 0H 			//00CB 	186E
		ADDWI 	F1H 			//00CC 	0EF1
		STR 	4H 			//00CD 	1084
		LDWI 	85H 			//00CE 	0085
		LCALL 	3E3H 			//00CF 	33E3
		MOVLP 	0H 			//00D0 	0180
		BTSC 	3H, 2H 			//00D1 	2903
		LJUMP 	D5H 			//00D2 	38D5

		//;CAT1PRO.C: 380: match = 0;
		CLRF 	6DH 			//00D3 	11ED

		//;CAT1PRO.C: 381: break;
		LJUMP 	DAH 			//00D4 	38DA
		LDWI 	7H 			//00D5 	0007
		INCR 	6EH, 1H 		//00D6 	1AEE
		SUBWR 	6EH, 0H 		//00D7 	126E
		BTSS 	3H, 0H 			//00D8 	2C03
		LJUMP 	CBH 			//00D9 	38CB

		//;CAT1PRO.C: 382: }
		//;CAT1PRO.C: 383: }
		//;CAT1PRO.C: 384: if(match) {
		LDR 	6DH, 0H 			//00DA 	186D
		BTSC 	3H, 2H 			//00DB 	2903
		LJUMP 	DFH 			//00DC 	38DF

		//;CAT1PRO.C: 386: Duima_ControlMotor(0x02);
		LDWI 	2H 			//00DD 	0002
		LJUMP 	F5H 			//00DE 	38F5

		//;CAT1PRO.C: 388: PORTAbits.PA1 = (PORTAbits.PA1 == 1 ? 0 : 1); DelayMs(50); PORTAbits.PA
		//+                          1 = (PORTAbits.PA1 == 1 ? 0 : 1);
		//;CAT1PRO.C: 387: g_frame_count++;
		//;CAT1PRO.C: 391: }
		//;CAT1PRO.C: 396: match = 1;
		CLRF 	6DH 			//00DF 	11ED
		INCR 	6DH, 1H 		//00E0 	1AED

		//;CAT1PRO.C: 397: for(i = 0; i < 7; i++) {
		CLRF 	6EH 			//00E1 	11EE

		//;CAT1PRO.C: 398: if(check_buf[i] != CMD_FRAME_STOP[i]) {
		LDR 	6EH, 0H 			//00E2 	186E
		ADDWI 	EAH 			//00E3 	0EEA
		STR 	4H 			//00E4 	1084
		LDWI 	85H 			//00E5 	0085
		LCALL 	3E3H 			//00E6 	33E3
		MOVLP 	0H 			//00E7 	0180
		BTSC 	3H, 2H 			//00E8 	2903
		LJUMP 	ECH 			//00E9 	38EC

		//;CAT1PRO.C: 399: match = 0;
		CLRF 	6DH 			//00EA 	11ED

		//;CAT1PRO.C: 400: break;
		LJUMP 	F1H 			//00EB 	38F1
		LDWI 	7H 			//00EC 	0007
		INCR 	6EH, 1H 		//00ED 	1AEE
		SUBWR 	6EH, 0H 		//00EE 	126E
		BTSS 	3H, 0H 			//00EF 	2C03
		LJUMP 	E2H 			//00F0 	38E2

		//;CAT1PRO.C: 401: }
		//;CAT1PRO.C: 402: }
		//;CAT1PRO.C: 403: if(match) {
		LDR 	6DH, 0H 			//00F1 	186D
		BTSC 	3H, 2H 			//00F2 	2903
		LJUMP 	110H 			//00F3 	3910

		//;CAT1PRO.C: 405: Duima_ControlMotor(0x00);
		LDWI 	0H 			//00F4 	0000
		LCALL 	144H 			//00F5 	3144
		MOVLP 	0H 			//00F6 	0180

		//;CAT1PRO.C: 406: g_frame_count++;
		MOVLB 	1H 			//00F7 	1021
		INCR 	47H, 1H 		//00F8 	1AC7

		//;CAT1PRO.C: 407: PORTAbits.PA1 = (PORTAbits.PA1 == 1 ? 0 : 1); DelayMs(50); PORTAbits.PA
		//+                          1 = (PORTAbits.PA1 == 1 ? 0 : 1);
		BCR 	3H, 0H 			//00F9 	2003
		MOVLB 	0H 			//00FA 	1020
		BTSS 	CH, 1H 			//00FB 	2C8C
		BSR 	3H, 0H 			//00FC 	2403
		BTSS 	3H, 0H 			//00FD 	2C03
		LJUMP 	102H 			//00FE 	3902
		MOVLB 	0H 			//00FF 	1020
		BSR 	CH, 1H 			//0100 	248C
		LJUMP 	104H 			//0101 	3904
		MOVLB 	0H 			//0102 	1020
		BCR 	CH, 1H 			//0103 	208C
		LDWI 	32H 			//0104 	0032
		LCALL 	234H 			//0105 	3234
		MOVLP 	0H 			//0106 	0180
		BCR 	3H, 0H 			//0107 	2003
		MOVLB 	0H 			//0108 	1020
		BTSS 	CH, 1H 			//0109 	2C8C
		BSR 	3H, 0H 			//010A 	2403
		BTSS 	3H, 0H 			//010B 	2C03
		LJUMP 	C3H 			//010C 	38C3
		MOVLB 	0H 			//010D 	1020
		BSR 	CH, 1H 			//010E 	248C
		LJUMP 	C5H 			//010F 	38C5

		//;CAT1PRO.C: 410: }
		//;CAT1PRO.C: 417: if(current_mode == MODE_PAIRING)
		DECRSZ 	7BH, 0H 		//0110 	1B7B
		LJUMP 	140H 			//0111 	3940

		//;CAT1PRO.C: 418: {
		//;CAT1PRO.C: 420: check_buf[7] = ring_buf[(tail + 7) % 32];
		LDR 	7AH, 0H 			//0112 	187A
		ADDWI 	7H 			//0113 	0E07
		ANDWI 	1FH 			//0114 	091F
		ADDWI 	A0H 			//0115 	0EA0
		STR 	6H 			//0116 	1086
		CLRF 	7H 			//0117 	1187
		LDR 	1H, 0H 			//0118 	1801
		STR 	6CH 			//0119 	10EC

		//;CAT1PRO.C: 423: if(check_buf[0] == 0xBB &&
		//;CAT1PRO.C: 424: check_buf[1] == 0x02 &&
		//;CAT1PRO.C: 425: check_buf[2] == 0x02 &&
		//;CAT1PRO.C: 426: check_buf[6] == 0x0D &&
		//;CAT1PRO.C: 427: check_buf[7] == 0x0A)
		LDWI 	BBH 			//011A 	00BB
		XORWR 	65H, 0H 		//011B 	1665
		BTSS 	3H, 2H 			//011C 	2D03
		LJUMP 	140H 			//011D 	3940
		LDWI 	2H 			//011E 	0002
		XORWR 	66H, 0H 		//011F 	1666
		BTSS 	3H, 2H 			//0120 	2D03
		LJUMP 	140H 			//0121 	3940
		LDWI 	2H 			//0122 	0002
		XORWR 	67H, 0H 		//0123 	1667
		BTSS 	3H, 2H 			//0124 	2D03
		LJUMP 	140H 			//0125 	3940
		LDWI 	DH 			//0126 	000D
		XORWR 	6BH, 0H 		//0127 	166B
		BTSS 	3H, 2H 			//0128 	2D03
		LJUMP 	140H 			//0129 	3940
		LDWI 	AH 			//012A 	000A
		XORWR 	6CH, 0H 		//012B 	166C
		BTSS 	3H, 2H 			//012C 	2D03
		LJUMP 	140H 			//012D 	3940

		//;CAT1PRO.C: 428: {
		//;CAT1PRO.C: 430: calculated_crc = check_buf[1] + check_buf[2] + check_buf[3] + check_buf
		//+                          [4];
		LDR 	66H, 0H 			//012E 	1866
		ADDWR 	67H, 0H 		//012F 	1767
		ADDWR 	68H, 0H 		//0130 	1768
		ADDWR 	69H, 0H 		//0131 	1769
		STR 	61H 			//0132 	10E1

		//;CAT1PRO.C: 432: if((calculated_crc & 0xFF) == check_buf[5])
		XORWR 	6AH, 0H 		//0133 	166A
		BTSS 	3H, 2H 			//0134 	2D03
		LJUMP 	140H 			//0135 	3940

		//;CAT1PRO.C: 433: {
		//;CAT1PRO.C: 435: Duima_ProcessReceivedData(check_buf, 8);
		LDWI 	8H 			//0136 	0008
		STR 	59H 			//0137 	10D9
		LDWI 	65H 			//0138 	0065
		MOVLP 	4H 			//0139 	0184
		LCALL 	40CH 			//013A 	340C
		MOVLP 	0H 			//013B 	0180

		//;CAT1PRO.C: 436: g_frame_count++;
		MOVLB 	1H 			//013C 	1021
		INCR 	47H, 1H 		//013D 	1AC7

		//;CAT1PRO.C: 437: tail = (tail + 8) % 32;
		LDWI 	8H 			//013E 	0008
		LJUMP 	C6H 			//013F 	38C6

		//;CAT1PRO.C: 439: }
		//;CAT1PRO.C: 440: }
		//;CAT1PRO.C: 441: }
		//;CAT1PRO.C: 446: tail = (tail + 1) % 32;
		INCR 	7AH, 1H 		//0140 	1AFA
		LDWI 	1FH 			//0141 	001F
		ANDWR 	7AH, 1H 		//0142 	15FA
		LJUMP 	74H 			//0143 	3874
		STR 	72H 			//0144 	10F2

		//;duima.c: 343: switch(cmd)
		LJUMP 	152H 			//0145 	3952

		//;duima.c: 344: {
		//;duima.c: 345: case 0x01:
		//;duima.c: 346: PORTBbits.PB1 = 1;
		BSR 	DH, 1H 			//0146 	248D

		//;duima.c: 347: PORTAbits.PA0 = 0;
		BCR 	CH, 0H 			//0147 	200C

		//;duima.c: 348: break;
		RET 					//0148 	1008

		//;duima.c: 350: case 0x02:
		//;duima.c: 351: PORTBbits.PB1 = 0;
		BCR 	DH, 1H 			//0149 	208D

		//;duima.c: 352: PORTAbits.PA0 = 1;
		BSR 	CH, 0H 			//014A 	240C

		//;duima.c: 353: break;
		RET 					//014B 	1008

		//;duima.c: 355: case 0x00:
		//;duima.c: 356: PORTBbits.PB1 = 0;
		BCR 	DH, 1H 			//014C 	208D

		//;duima.c: 357: PORTAbits.PA0 = 0;
		BCR 	CH, 0H 			//014D 	200C

		//;duima.c: 358: break;
		RET 					//014E 	1008

		//;duima.c: 360: default:
		//;duima.c: 362: PORTBbits.PB1 = 0;
		BCR 	DH, 1H 			//014F 	208D

		//;duima.c: 363: PORTAbits.PA0 = 0;
		BCR 	CH, 0H 			//0150 	200C

		//;duima.c: 364: break;
		RET 					//0151 	1008
		LDR 	72H, 0H 			//0152 	1872
		XORWI 	0H 			//0153 	0A00
		BTSC 	3H, 2H 			//0154 	2903
		LJUMP 	14CH 			//0155 	394C
		XORWI 	1H 			//0156 	0A01
		BTSC 	3H, 2H 			//0157 	2903
		LJUMP 	146H 			//0158 	3946
		XORWI 	3H 			//0159 	0A03
		BTSC 	3H, 2H 			//015A 	2903
		LJUMP 	149H 			//015B 	3949
		LJUMP 	14FH 			//015C 	394F
		RET 					//015D 	1008

		//;CAT1PRO.C: 548: POWER_INITIAL();
		MOVLP 	5H 			//015E 	0185
		LCALL 	54BH 			//015F 	354B
		MOVLP 	0H 			//0160 	0180

		//;CAT1PRO.C: 549: UART_INITIAL();
		LCALL 	3D2H 			//0161 	33D2
		MOVLP 	0H 			//0162 	0180

		//;CAT1PRO.C: 550: DelayMs(50);
		LDWI 	32H 			//0163 	0032
		LCALL 	234H 			//0164 	3234
		MOVLP 	0H 			//0165 	0180

		//;CAT1PRO.C: 551: CAT1_Init();
		LCALL 	1C4H 			//0166 	31C4
		MOVLP 	0H 			//0167 	0180

		//;CAT1PRO.C: 554: INTCON = 0B11000000;
		LDWI 	C0H 			//0168 	00C0
		STR 	BH 			//0169 	108B

		//;CAT1PRO.C: 555: DelayMs(50);
		LDWI 	32H 			//016A 	0032
		LCALL 	234H 			//016B 	3234
		MOVLP 	0H 			//016C 	0180
		LJUMP 	1B5H 			//016D 	39B5

		//;CAT1PRO.C: 564: {
		//;CAT1PRO.C: 568: case STATE_WAKE_INIT:
		//;CAT1PRO.C: 569: PORTAbits.PA1 = 1;
		MOVLB 	0H 			//016E 	1020
		BSR 	CH, 1H 			//016F 	248C

		//;CAT1PRO.C: 570: g_timer_ms = 0;
		MOVLB 	1H 			//0170 	1021
		CLRF 	42H 			//0171 	11C2
		CLRF 	43H 			//0172 	11C3

		//;CAT1PRO.C: 572: PORTCbits.PC1 = 0;
		MOVLB 	0H 			//0173 	1020
		BCR 	EH, 1H 			//0174 	208E

		//;CAT1PRO.C: 573: sys_state = STATE_WORKING;
		MOVLB 	1H 			//0175 	1021
		CLRF 	61H 			//0176 	11E1
		INCR 	61H, 1H 		//0177 	1AE1

		//;CAT1PRO.C: 574: break;
		LJUMP 	1B7H 			//0178 	39B7

		//;CAT1PRO.C: 582: Duima_MainLoop();
		MOVLP 	4H 			//0179 	0184
		LCALL 	4F6H 			//017A 	34F6
		MOVLP 	0H 			//017B 	0180

		//;CAT1PRO.C: 585: UART_Task();
		LCALL 	6AH 			//017C 	306A
		MOVLP 	0H 			//017D 	0180

		//;CAT1PRO.C: 588: Duima_CheckLimitSwitch();
		LCALL 	3AFH 			//017E 	33AF
		MOVLP 	0H 			//017F 	0180

		//;CAT1PRO.C: 591: if(current_mode == MODE_PAIRING)
		DECRSZ 	7BH, 0H 		//0180 	1B7B
		LJUMP 	193H 			//0181 	3993

		//;CAT1PRO.C: 592: {
		//;CAT1PRO.C: 594: if(g_timer_ms >= 10000) {
		LCALL 	403H 			//0182 	3403
		MOVLP 	0H 			//0183 	0180
		BTSC 	3H, 2H 			//0184 	2903
		SUBWR 	42H, 0H 		//0185 	1242
		BTSS 	3H, 0H 			//0186 	2C03
		LJUMP 	1B7H 			//0187 	39B7

		//;CAT1PRO.C: 595: Duima_Configure433Address(local_paired_id);
		LCALL 	3FBH 			//0188 	33FB
		MOVLP 	0H 			//0189 	0180
		LCALL 	256H 			//018A 	3256
		MOVLP 	0H 			//018B 	0180

		//;CAT1PRO.C: 596: current_mode = MODE_NORMAL;
		CLRF 	7BH 			//018C 	11FB

		//;CAT1PRO.C: 597: PORTAbits.PA1 = 0;
		MOVLB 	0H 			//018D 	1020
		BCR 	CH, 1H 			//018E 	208C

		//;CAT1PRO.C: 598: sys_state = STATE_GO_SLEEP;
		LDWI 	2H 			//018F 	0002
		MOVLB 	1H 			//0190 	1021
		STR 	61H 			//0191 	10E1
		LJUMP 	1B7H 			//0192 	39B7

		//;CAT1PRO.C: 601: else
		//;CAT1PRO.C: 602: {
		//;CAT1PRO.C: 604: if(g_timer_ms >= 10000) {
		LCALL 	403H 			//0193 	3403
		MOVLP 	0H 			//0194 	0180
		BTSC 	3H, 2H 			//0195 	2903
		SUBWR 	42H, 0H 		//0196 	1242
		BTSS 	3H, 0H 			//0197 	2C03
		LJUMP 	1B7H 			//0198 	39B7

		//;CAT1PRO.C: 605: PORTBbits.PB1 = 0;
		MOVLB 	0H 			//0199 	1020
		BCR 	DH, 1H 			//019A 	208D

		//;CAT1PRO.C: 606: PORTAbits.PA0 = 0;
		BCR 	CH, 0H 			//019B 	200C
		LJUMP 	18FH 			//019C 	398F

		//;CAT1PRO.C: 617: for(unsigned char k=0; k<6; k++)
		CLRF 	62H 			//019D 	11E2

		//;CAT1PRO.C: 618: {
		//;CAT1PRO.C: 619: PORTAbits.PA1 = (PORTAbits.PA1 == 1 ? 0 : 1);
		BCR 	3H, 0H 			//019E 	2003
		MOVLB 	0H 			//019F 	1020
		BTSS 	CH, 1H 			//01A0 	2C8C
		BSR 	3H, 0H 			//01A1 	2403
		BTSS 	3H, 0H 			//01A2 	2C03
		LJUMP 	1A7H 			//01A3 	39A7
		MOVLB 	0H 			//01A4 	1020
		BSR 	CH, 1H 			//01A5 	248C
		LJUMP 	1A9H 			//01A6 	39A9
		MOVLB 	0H 			//01A7 	1020
		BCR 	CH, 1H 			//01A8 	208C

		//;CAT1PRO.C: 620: DelayMs(10);
		LDWI 	AH 			//01A9 	000A
		LCALL 	234H 			//01AA 	3234
		MOVLP 	0H 			//01AB 	0180
		MOVLB 	1H 			//01AC 	1021
		LDWI 	6H 			//01AD 	0006
		INCR 	62H, 1H 		//01AE 	1AE2
		SUBWR 	62H, 0H 		//01AF 	1262
		BTSS 	3H, 0H 			//01B0 	2C03
		LJUMP 	19FH 			//01B1 	399F

		//;CAT1PRO.C: 621: }
		//;CAT1PRO.C: 622: Sys_EnterSleep();
		MOVLP 	5H 			//01B2 	0185
		LCALL 	522H 			//01B3 	3522
		MOVLP 	0H 			//01B4 	0180

		//;CAT1PRO.C: 558: MAIN_STATE sys_state = STATE_WAKE_INIT;
		MOVLB 	1H 			//01B5 	1021
		CLRF 	61H 			//01B6 	11E1
		LDR 	61H, 0H 			//01B7 	1861
		XORWI 	0H 			//01B8 	0A00
		BTSC 	3H, 2H 			//01B9 	2903
		LJUMP 	16EH 			//01BA 	396E
		XORWI 	1H 			//01BB 	0A01
		BTSC 	3H, 2H 			//01BC 	2903
		LJUMP 	179H 			//01BD 	3979
		XORWI 	3H 			//01BE 	0A03
		BTSC 	3H, 2H 			//01BF 	2903
		LJUMP 	19DH 			//01C0 	399D
		LJUMP 	1B7H 			//01C1 	39B7
		MOVLP 	0H 			//01C2 	0180
		LJUMP 	2AH 			//01C3 	382A

		//;CAT1PRO.C: 460: SendATCommand("AT+PWR=20");
		LDWI 	B5H 			//01C4 	00B5
		STR 	73H 			//01C5 	10F3
		LDWI 	85H 			//01C6 	0085
		STR 	74H 			//01C7 	10F4
		LCALL 	222H 			//01C8 	3222
		MOVLP 	0H 			//01C9 	0180

		//;CAT1PRO.C: 461: DelayMs(50);
		LDWI 	32H 			//01CA 	0032
		LCALL 	234H 			//01CB 	3234
		MOVLP 	0H 			//01CC 	0180

		//;CAT1PRO.C: 464: SendATCommand("AT+UART=3,0");
		LDWI 	9EH 			//01CD 	009E
		STR 	73H 			//01CE 	10F3
		LDWI 	85H 			//01CF 	0085
		STR 	74H 			//01D0 	10F4
		LCALL 	222H 			//01D1 	3222
		MOVLP 	0H 			//01D2 	0180

		//;CAT1PRO.C: 465: DelayMs(50);
		LDWI 	32H 			//01D3 	0032
		LCALL 	234H 			//01D4 	3234
		MOVLP 	0H 			//01D5 	0180

		//;CAT1PRO.C: 468: SendATCommand("AT+FEQ=434000000");
		LDWI 	79H 			//01D6 	0079
		STR 	73H 			//01D7 	10F3
		LDWI 	85H 			//01D8 	0085
		STR 	74H 			//01D9 	10F4
		LCALL 	222H 			//01DA 	3222
		MOVLP 	0H 			//01DB 	0180

		//;CAT1PRO.C: 469: DelayMs(50);
		LDWI 	32H 			//01DC 	0032
		LCALL 	234H 			//01DD 	3234
		MOVLP 	0H 			//01DE 	0180

		//;CAT1PRO.C: 472: SendATCommand("AT+ADR=0");
		LDWI 	C9H 			//01DF 	00C9
		STR 	73H 			//01E0 	10F3
		LDWI 	85H 			//01E1 	0085
		STR 	74H 			//01E2 	10F4
		LCALL 	222H 			//01E3 	3222
		MOVLP 	0H 			//01E4 	0180

		//;CAT1PRO.C: 473: DelayMs(50);
		LDWI 	32H 			//01E5 	0032
		LCALL 	234H 			//01E6 	3234
		MOVLP 	0H 			//01E7 	0180

		//;CAT1PRO.C: 476: SendATCommand("AT+SF=7");
		LDWI 	DAH 			//01E8 	00DA
		STR 	73H 			//01E9 	10F3
		LDWI 	85H 			//01EA 	0085
		STR 	74H 			//01EB 	10F4
		LCALL 	222H 			//01EC 	3222
		MOVLP 	0H 			//01ED 	0180

		//;CAT1PRO.C: 477: DelayMs(50);
		LDWI 	32H 			//01EE 	0032
		LCALL 	234H 			//01EF 	3234
		MOVLP 	0H 			//01F0 	0180

		//;CAT1PRO.C: 480: SendATCommand("AT+BW=9");
		LDWI 	E2H 			//01F1 	00E2
		STR 	73H 			//01F2 	10F3
		LDWI 	85H 			//01F3 	0085
		STR 	74H 			//01F4 	10F4
		LCALL 	222H 			//01F5 	3222
		MOVLP 	0H 			//01F6 	0180

		//;CAT1PRO.C: 481: DelayMs(50);
		LDWI 	32H 			//01F7 	0032
		LCALL 	234H 			//01F8 	3234
		MOVLP 	0H 			//01F9 	0180

		//;CAT1PRO.C: 484: SendATCommand("AT+PB=2000");
		LDWI 	AAH 			//01FA 	00AA
		STR 	73H 			//01FB 	10F3
		LDWI 	85H 			//01FC 	0085
		STR 	74H 			//01FD 	10F4
		LCALL 	222H 			//01FE 	3222
		MOVLP 	0H 			//01FF 	0180

		//;CAT1PRO.C: 485: DelayMs(50);
		LDWI 	32H 			//0200 	0032
		LCALL 	234H 			//0201 	3234
		MOVLP 	0H 			//0202 	0180

		//;CAT1PRO.C: 487: SendATCommand("AT+MODE=1");
		LDWI 	BFH 			//0203 	00BF
		STR 	73H 			//0204 	10F3
		LDWI 	85H 			//0205 	0085
		STR 	74H 			//0206 	10F4
		LCALL 	222H 			//0207 	3222
		MOVLP 	0H 			//0208 	0180

		//;CAT1PRO.C: 488: DelayMs(50);
		LDWI 	32H 			//0209 	0032
		LCALL 	234H 			//020A 	3234
		MOVLP 	0H 			//020B 	0180

		//;CAT1PRO.C: 490: SendATCommand("AT+WT=2");
		LDWI 	D2H 			//020C 	00D2
		STR 	73H 			//020D 	10F3
		LDWI 	85H 			//020E 	0085
		STR 	74H 			//020F 	10F4
		LCALL 	222H 			//0210 	3222
		MOVLP 	0H 			//0211 	0180

		//;CAT1PRO.C: 491: DelayMs(50);
		LDWI 	32H 			//0212 	0032
		LCALL 	234H 			//0213 	3234
		MOVLP 	0H 			//0214 	0180

		//;CAT1PRO.C: 494: Duima_Init();
		LCALL 	340H 			//0215 	3340
		MOVLP 	0H 			//0216 	0180

		//;CAT1PRO.C: 497: SendATCommand("ATW");
		LDWI 	BH 			//0217 	000B
		STR 	73H 			//0218 	10F3
		LDWI 	86H 			//0219 	0086
		STR 	74H 			//021A 	10F4
		LCALL 	222H 			//021B 	3222
		MOVLP 	0H 			//021C 	0180

		//;CAT1PRO.C: 498: DelayMs(50);
		LDWI 	32H 			//021D 	0032
		LCALL 	234H 			//021E 	3234

		//;CAT1PRO.C: 500: PORTCbits.PC1 = 1;
		MOVLB 	0H 			//021F 	1020
		BSR 	EH, 1H 			//0220 	248E
		RET 					//0221 	1008

		//;CAT1PRO.C: 279: unsigned char j = 0;
		CLRF 	78H 			//0222 	11F8

		//;CAT1PRO.C: 282: while(cmd[j] != '\0')
		LCALL 	3EFH 			//0223 	33EF
		MOVLP 	0H 			//0224 	0180
		MOVIW 	FSR0++ 		//0225 	1012
		BTSC 	3H, 2H 			//0226 	2903
		LJUMP 	22FH 			//0227 	3A2F

		//;CAT1PRO.C: 283: {
		//;CAT1PRO.C: 284: SendByte(cmd[j]);
		LCALL 	3EFH 			//0228 	33EF
		MOVLP 	0H 			//0229 	0180
		LDR 	0H, 0H 			//022A 	1800
		LCALL 	245H 			//022B 	3245
		MOVLP 	0H 			//022C 	0180

		//;CAT1PRO.C: 285: j++;
		INCR 	78H, 1H 		//022D 	1AF8
		LJUMP 	223H 			//022E 	3A23

		//;CAT1PRO.C: 286: }
		//;CAT1PRO.C: 289: SendByte(0x0D);
		LDWI 	DH 			//022F 	000D
		LCALL 	245H 			//0230 	3245
		MOVLP 	0H 			//0231 	0180

		//;CAT1PRO.C: 292: SendByte(0x0A);
		LDWI 	AH 			//0232 	000A
		LJUMP 	245H 			//0233 	3A45
		STR 	74H 			//0234 	10F4

		//;CAT1PRO.C: 210: unsigned char a,b;
		//;CAT1PRO.C: 211: for(a=0;a<Time;a++)
		CLRF 	75H 			//0235 	11F5
		LDR 	74H, 0H 			//0236 	1874
		SUBWR 	75H, 0H 		//0237 	1275
		BTSC 	3H, 0H 			//0238 	2803
		RET 					//0239 	1008

		//;CAT1PRO.C: 212: {
		//;CAT1PRO.C: 213: for(b=0;b<5;b++)
		CLRF 	76H 			//023A 	11F6

		//;CAT1PRO.C: 214: {
		//;CAT1PRO.C: 215: DelayUs(197);
		LDWI 	C5H 			//023B 	00C5
		LCALL 	24DH 			//023C 	324D
		MOVLP 	0H 			//023D 	0180
		LDWI 	5H 			//023E 	0005
		INCR 	76H, 1H 		//023F 	1AF6
		SUBWR 	76H, 0H 		//0240 	1276
		BTSS 	3H, 0H 			//0241 	2C03
		LJUMP 	23BH 			//0242 	3A3B
		INCR 	75H, 1H 		//0243 	1AF5
		LJUMP 	236H 			//0244 	3A36
		STR 	72H 			//0245 	10F2

		//;CAT1PRO.C: 247: TXEF = 0;
		MOVLB 	9H 			//0246 	1029
		BCR 	12H, 5H 			//0247 	2292

		//;CAT1PRO.C: 248: URDATAL = data;
		LDR 	72H, 0H 			//0248 	1872
		STR 	CH 			//0249 	108C

		//;CAT1PRO.C: 250: {
		BTSC 	1CH, 0H 		//024A 	281C
		RET 					//024B 	1008
		LJUMP 	24AH 			//024C 	3A4A
		STR 	72H 			//024D 	10F2

		//;CAT1PRO.C: 196: unsigned char a;
		//;CAT1PRO.C: 197: for(a=0;a<Time;a++)
		CLRF 	73H 			//024E 	11F3
		LDR 	72H, 0H 			//024F 	1872
		SUBWR 	73H, 0H 		//0250 	1273
		BTSC 	3H, 0H 			//0251 	2803
		RET 					//0252 	1008

		//;CAT1PRO.C: 198: {
		//;CAT1PRO.C: 199: __nop();
		NOP 					//0253 	1000
		INCR 	73H, 1H 		//0254 	1AF3
		LJUMP 	24FH 			//0255 	3A4F

		//;duima.c: 148: unsigned char cmd_buffer[32];
		//;duima.c: 149: unsigned char i;
		//;duima.c: 150: unsigned char digit_count = 0;
		CLRF 	58H 			//0256 	11D8

		//;duima.c: 151: unsigned long temp = addr;
		LDR 	25H, 0H 			//0257 	1825
		STR 	54H 			//0258 	10D4
		LDR 	26H, 0H 			//0259 	1826
		STR 	55H 			//025A 	10D5
		LDWI 	41H 			//025B 	0041
		CLRF 	56H 			//025C 	11D6
		CLRF 	57H 			//025D 	11D7

		//;duima.c: 152: unsigned char digits[10];
		//;duima.c: 155: cmd_buffer[0]='A'; cmd_buffer[1]='T'; cmd_buffer[2]='+';
		STR 	33H 			//025E 	10B3
		LDWI 	54H 			//025F 	0054
		STR 	34H 			//0260 	10B4
		LDWI 	2BH 			//0261 	002B
		STR 	35H 			//0262 	10B5

		//;duima.c: 156: cmd_buffer[3]='A'; cmd_buffer[4]='D'; cmd_buffer[5]='R'; cmd_buffer[6]='=
		//+                          ';
		LDWI 	41H 			//0263 	0041
		STR 	36H 			//0264 	10B6
		LDWI 	44H 			//0265 	0044
		STR 	37H 			//0266 	10B7
		LDWI 	52H 			//0267 	0052
		STR 	38H 			//0268 	10B8
		LDWI 	3DH 			//0269 	003D
		STR 	39H 			//026A 	10B9

		//;duima.c: 159: if(temp == 0) {
		LCALL 	407H 			//026B 	3407
		MOVLP 	0H 			//026C 	0180
		BTSS 	3H, 2H 			//026D 	2D03
		LJUMP 	2A0H 			//026E 	3AA0

		//;duima.c: 160: digits[0] = 0; digit_count = 1;
		CLRF 	29H 			//026F 	11A9
		CLRF 	58H 			//0270 	11D8
		INCR 	58H, 1H 		//0271 	1AD8

		//;duima.c: 161: } else {
		LJUMP 	2A4H 			//0272 	3AA4

		//;duima.c: 163: digits[digit_count++] = temp % 10;
		LDR 	58H, 0H 			//0273 	1858
		ADDWI 	29H 			//0274 	0E29
		STR 	6H 			//0275 	1086
		LDWI 	AH 			//0276 	000A
		CLRF 	7H 			//0277 	1187
		STR 	72H 			//0278 	10F2
		CLRF 	73H 			//0279 	11F3
		CLRF 	74H 			//027A 	11F4
		CLRF 	75H 			//027B 	11F5
		LDR 	57H, 0H 			//027C 	1857
		STR 	79H 			//027D 	10F9
		LDR 	56H, 0H 			//027E 	1856
		STR 	78H 			//027F 	10F8
		LDR 	55H, 0H 			//0280 	1855
		STR 	77H 			//0281 	10F7
		LDR 	54H, 0H 			//0282 	1854
		STR 	76H 			//0283 	10F6
		LCALL 	30AH 			//0284 	330A
		MOVLP 	0H 			//0285 	0180
		LDR 	72H, 0H 			//0286 	1872
		STR 	1H 			//0287 	1081
		LDWI 	AH 			//0288 	000A
		INCR 	58H, 1H 		//0289 	1AD8

		//;duima.c: 164: temp /= 10;
		STR 	72H 			//028A 	10F2
		CLRF 	73H 			//028B 	11F3
		CLRF 	74H 			//028C 	11F4
		CLRF 	75H 			//028D 	11F5
		LDR 	57H, 0H 			//028E 	1857
		STR 	79H 			//028F 	10F9
		LDR 	56H, 0H 			//0290 	1856
		STR 	78H 			//0291 	10F8
		LDR 	55H, 0H 			//0292 	1855
		STR 	77H 			//0293 	10F7
		LDR 	54H, 0H 			//0294 	1854
		STR 	76H 			//0295 	10F6
		LCALL 	2CBH 			//0296 	32CB
		MOVLP 	0H 			//0297 	0180
		LDR 	75H, 0H 			//0298 	1875
		STR 	57H 			//0299 	10D7
		LDR 	74H, 0H 			//029A 	1874
		STR 	56H 			//029B 	10D6
		LDR 	73H, 0H 			//029C 	1873
		STR 	55H 			//029D 	10D5
		LDR 	72H, 0H 			//029E 	1872
		STR 	54H 			//029F 	10D4
		LCALL 	407H 			//02A0 	3407
		MOVLP 	0H 			//02A1 	0180
		BTSS 	3H, 2H 			//02A2 	2D03
		LJUMP 	273H 			//02A3 	3A73

		//;duima.c: 165: }
		//;duima.c: 166: }
		//;duima.c: 169: for(i = 0; i < digit_count; i++) {
		CLRF 	53H 			//02A4 	11D3
		LDR 	58H, 0H 			//02A5 	1858
		SUBWR 	53H, 0H 		//02A6 	1253
		BTSC 	3H, 0H 			//02A7 	2803
		LJUMP 	2BDH 			//02A8 	3ABD

		//;duima.c: 170: cmd_buffer[7 + i] = '0' + digits[digit_count - 1 - i];
		LDR 	53H, 0H 			//02A9 	1853
		ADDWI 	7H 			//02AA 	0E07
		ADDWI 	33H 			//02AB 	0E33
		STR 	6H 			//02AC 	1086
		LDWI 	29H 			//02AD 	0029
		CLRF 	7H 			//02AE 	1187
		STR 	27H 			//02AF 	10A7
		LDR 	53H, 0H 			//02B0 	1853
		SUBWR 	27H, 1H 		//02B1 	12A7
		LDR 	58H, 0H 			//02B2 	1858
		ADDWR 	27H, 0H 		//02B3 	1727
		STR 	28H 			//02B4 	10A8
		ADDWI 	FFH 			//02B5 	0EFF
		STR 	4H 			//02B6 	1084
		CLRF 	5H 			//02B7 	1185
		LDR 	0H, 0H 			//02B8 	1800
		ADDWI 	30H 			//02B9 	0E30
		STR 	1H 			//02BA 	1081
		INCR 	53H, 1H 		//02BB 	1AD3
		LJUMP 	2A5H 			//02BC 	3AA5

		//;duima.c: 171: }
		//;duima.c: 174: cmd_buffer[7 + digit_count] = '\0';
		LDR 	58H, 0H 			//02BD 	1858
		ADDWI 	7H 			//02BE 	0E07
		ADDWI 	33H 			//02BF 	0E33
		STR 	6H 			//02C0 	1086
		LDWI 	33H 			//02C1 	0033
		CLRF 	7H 			//02C2 	1187
		CLRF 	1H 			//02C3 	1181

		//;duima.c: 177: SendATCommand((const char*)cmd_buffer);
		STR 	73H 			//02C4 	10F3
		LDWI 	0H 			//02C5 	0000
		STR 	74H 			//02C6 	10F4
		LCALL 	222H 			//02C7 	3222
		MOVLP 	0H 			//02C8 	0180

		//;duima.c: 178: DelayMs(100);
		LDWI 	64H 			//02C9 	0064
		LJUMP 	234H 			//02CA 	3A34
		CLRF 	20H 			//02CB 	11A0
		CLRF 	21H 			//02CC 	11A1
		CLRF 	22H 			//02CD 	11A2
		CLRF 	23H 			//02CE 	11A3
		LDR 	75H, 0H 			//02CF 	1875
		IORWR 	74H, 0H 		//02D0 	1474
		IORWR 	73H, 0H 		//02D1 	1473
		IORWR 	72H, 0H 		//02D2 	1472
		BTSC 	3H, 2H 			//02D3 	2903
		LJUMP 	301H 			//02D4 	3B01
		CLRF 	24H 			//02D5 	11A4
		INCR 	24H, 1H 		//02D6 	1AA4
		BTSC 	75H, 7H 		//02D7 	2BF5
		LJUMP 	2DEH 			//02D8 	3ADE
		LSLF 	72H, 1H 		//02D9 	05F2
		RLR 	73H, 1H 			//02DA 	1DF3
		RLR 	74H, 1H 			//02DB 	1DF4
		RLR 	75H, 1H 			//02DC 	1DF5
		LJUMP 	2D6H 			//02DD 	3AD6
		LSLF 	20H, 1H 		//02DE 	05A0
		RLR 	21H, 1H 			//02DF 	1DA1
		RLR 	22H, 1H 			//02E0 	1DA2
		RLR 	23H, 1H 			//02E1 	1DA3
		LDR 	75H, 0H 			//02E2 	1875
		SUBWR 	79H, 0H 		//02E3 	1279
		BTSS 	3H, 2H 			//02E4 	2D03
		LJUMP 	2F0H 			//02E5 	3AF0
		LDR 	74H, 0H 			//02E6 	1874
		SUBWR 	78H, 0H 		//02E7 	1278
		BTSS 	3H, 2H 			//02E8 	2D03
		LJUMP 	2F0H 			//02E9 	3AF0
		LDR 	73H, 0H 			//02EA 	1873
		SUBWR 	77H, 0H 		//02EB 	1277
		BTSS 	3H, 2H 			//02EC 	2D03
		LJUMP 	2F0H 			//02ED 	3AF0
		LDR 	72H, 0H 			//02EE 	1872
		SUBWR 	76H, 0H 		//02EF 	1276
		BTSS 	3H, 0H 			//02F0 	2C03
		LJUMP 	2FBH 			//02F1 	3AFB
		LDR 	72H, 0H 			//02F2 	1872
		SUBWR 	76H, 1H 		//02F3 	12F6
		LDR 	73H, 0H 			//02F4 	1873
		SUBWFB 	77H, 1H 		//02F5 	0BF7
		LDR 	74H, 0H 			//02F6 	1874
		SUBWFB 	78H, 1H 		//02F7 	0BF8
		LDR 	75H, 0H 			//02F8 	1875
		SUBWFB 	79H, 1H 		//02F9 	0BF9
		BSR 	20H, 0H 			//02FA 	2420
		LSRF 	75H, 1H 		//02FB 	06F5
		RRR 	74H, 1H 			//02FC 	1CF4
		RRR 	73H, 1H 			//02FD 	1CF3
		RRR 	72H, 1H 			//02FE 	1CF2
		DECRSZ 	24H, 1H 		//02FF 	1BA4
		LJUMP 	2DEH 			//0300 	3ADE
		LDR 	23H, 0H 			//0301 	1823
		STR 	75H 			//0302 	10F5
		LDR 	22H, 0H 			//0303 	1822
		STR 	74H 			//0304 	10F4
		LDR 	21H, 0H 			//0305 	1821
		STR 	73H 			//0306 	10F3
		LDR 	20H, 0H 			//0307 	1820
		STR 	72H 			//0308 	10F2
		RET 					//0309 	1008
		LDR 	75H, 0H 			//030A 	1875
		IORWR 	74H, 0H 		//030B 	1474
		IORWR 	73H, 0H 		//030C 	1473
		IORWR 	72H, 0H 		//030D 	1472
		BTSC 	3H, 2H 			//030E 	2903
		LJUMP 	337H 			//030F 	3B37
		CLRF 	20H 			//0310 	11A0
		INCR 	20H, 1H 		//0311 	1AA0
		BTSC 	75H, 7H 		//0312 	2BF5
		LJUMP 	319H 			//0313 	3B19
		LSLF 	72H, 1H 		//0314 	05F2
		RLR 	73H, 1H 			//0315 	1DF3
		RLR 	74H, 1H 			//0316 	1DF4
		RLR 	75H, 1H 			//0317 	1DF5
		LJUMP 	311H 			//0318 	3B11
		LDR 	75H, 0H 			//0319 	1875
		SUBWR 	79H, 0H 		//031A 	1279
		BTSS 	3H, 2H 			//031B 	2D03
		LJUMP 	327H 			//031C 	3B27
		LDR 	74H, 0H 			//031D 	1874
		SUBWR 	78H, 0H 		//031E 	1278
		BTSS 	3H, 2H 			//031F 	2D03
		LJUMP 	327H 			//0320 	3B27
		LDR 	73H, 0H 			//0321 	1873
		SUBWR 	77H, 0H 		//0322 	1277
		BTSS 	3H, 2H 			//0323 	2D03
		LJUMP 	327H 			//0324 	3B27
		LDR 	72H, 0H 			//0325 	1872
		SUBWR 	76H, 0H 		//0326 	1276
		BTSS 	3H, 0H 			//0327 	2C03
		LJUMP 	331H 			//0328 	3B31
		LDR 	72H, 0H 			//0329 	1872
		SUBWR 	76H, 1H 		//032A 	12F6
		LDR 	73H, 0H 			//032B 	1873
		SUBWFB 	77H, 1H 		//032C 	0BF7
		LDR 	74H, 0H 			//032D 	1874
		SUBWFB 	78H, 1H 		//032E 	0BF8
		LDR 	75H, 0H 			//032F 	1875
		SUBWFB 	79H, 1H 		//0330 	0BF9
		LSRF 	75H, 1H 		//0331 	06F5
		RRR 	74H, 1H 			//0332 	1CF4
		RRR 	73H, 1H 			//0333 	1CF3
		RRR 	72H, 1H 			//0334 	1CF2
		DECRSZ 	20H, 1H 		//0335 	1BA0
		LJUMP 	319H 			//0336 	3B19
		LDR 	79H, 0H 			//0337 	1879
		STR 	75H 			//0338 	10F5
		LDR 	78H, 0H 			//0339 	1878
		STR 	74H 			//033A 	10F4
		LDR 	77H, 0H 			//033B 	1877
		STR 	73H 			//033C 	10F3
		LDR 	76H, 0H 			//033D 	1876
		STR 	72H 			//033E 	10F2
		RET 					//033F 	1008

		//;duima.c: 51: Duima_Timer_Init();
		LCALL 	39EH 			//0340 	339E
		MOVLP 	0H 			//0341 	0180

		//;duima.c: 54: local_paired_id = Duima_EEPROM_ReadID(0x13);
		LDWI 	13H 			//0342 	0013
		LCALL 	353H 			//0343 	3353
		MOVLP 	0H 			//0344 	0180
		LDR 	75H, 0H 			//0345 	1875
		MOVLB 	1H 			//0346 	1021
		STR 	45H 			//0347 	10C5
		LDR 	74H, 0H 			//0348 	1874
		STR 	44H 			//0349 	10C4

		//;duima.c: 59: }
		//;duima.c: 62: (PORTCbits.PC1 = 0);
		//;duima.c: 57: if(local_paired_id == 0xFFFFFFFF) {
		MOVLB 	0H 			//034A 	1020
		BCR 	EH, 1H 			//034B 	208E

		//;duima.c: 63: DelayMs(100);
		LDWI 	64H 			//034C 	0064
		LCALL 	234H 			//034D 	3234
		MOVLP 	0H 			//034E 	0180

		//;duima.c: 66: Duima_Configure433Address(local_paired_id);
		MOVLB 	1H 			//034F 	1021
		LCALL 	3FBH 			//0350 	33FB
		MOVLP 	0H 			//0351 	0180
		LJUMP 	256H 			//0352 	3A56
		MOVLB 	0H 			//0353 	1020
		STR 	28H 			//0354 	10A8

		//;duima.c: 321: id = Duima_EEPROM_ReadByte(addr);
		LDR 	28H, 0H 			//0355 	1828
		LCALL 	389H 			//0356 	3389
		MOVLP 	0H 			//0357 	0180
		MOVLB 	0H 			//0358 	1020
		STR 	29H 			//0359 	10A9
		CLRF 	2AH 			//035A 	11AA
		CLRF 	2BH 			//035B 	11AB
		CLRF 	2CH 			//035C 	11AC

		//;duima.c: 322: id = (id << 8) | Duima_EEPROM_ReadByte(addr+1);
		LDR 	28H, 0H 			//035D 	1828
		ADDWI 	1H 			//035E 	0E01
		LCALL 	389H 			//035F 	3389
		MOVLB 	0H 			//0360 	1020
		STR 	20H 			//0361 	10A0
		CLRF 	21H 			//0362 	11A1
		CLRF 	22H 			//0363 	11A2
		CLRF 	23H 			//0364 	11A3
		LDR 	29H, 0H 			//0365 	1829
		STR 	24H 			//0366 	10A4
		LDR 	2AH, 0H 			//0367 	182A
		STR 	25H 			//0368 	10A5
		LDR 	2BH, 0H 			//0369 	182B
		STR 	26H 			//036A 	10A6
		LDR 	2CH, 0H 			//036B 	182C
		STR 	27H 			//036C 	10A7
		LDR 	26H, 0H 			//036D 	1826
		STR 	27H 			//036E 	10A7
		LDR 	25H, 0H 			//036F 	1825
		STR 	26H 			//0370 	10A6
		LDR 	24H, 0H 			//0371 	1824
		STR 	25H 			//0372 	10A5
		CLRF 	24H 			//0373 	11A4
		LDR 	24H, 0H 			//0374 	1824
		IORWR 	20H, 1H 		//0375 	14A0
		LDR 	25H, 0H 			//0376 	1825
		IORWR 	21H, 1H 		//0377 	14A1
		LDR 	26H, 0H 			//0378 	1826
		IORWR 	22H, 1H 		//0379 	14A2
		LDR 	27H, 0H 			//037A 	1827
		IORWR 	23H, 1H 		//037B 	14A3
		LDR 	23H, 0H 			//037C 	1823
		STR 	2CH 			//037D 	10AC
		LDR 	22H, 0H 			//037E 	1822
		STR 	2BH 			//037F 	10AB
		LDR 	21H, 0H 			//0380 	1821
		STR 	2AH 			//0381 	10AA
		LDR 	20H, 0H 			//0382 	1820
		STR 	29H 			//0383 	10A9

		//;duima.c: 324: return id;
		LDR 	2AH, 0H 			//0384 	182A
		STR 	75H 			//0385 	10F5
		LDR 	29H, 0H 			//0386 	1829
		STR 	74H 			//0387 	10F4
		RET 					//0388 	1008
		STR 	72H 			//0389 	10F2

		//;duima.c: 244: unsigned char data;
		//;duima.c: 246: while(GIE) {
		BTSS 	BH, 7H 			//038A 	2F8B
		LJUMP 	390H 			//038B 	3B90

		//;duima.c: 247: GIE = 0;
		BCR 	BH, 7H 			//038C 	238B

		//;duima.c: 248: __nop();
		NOP 					//038D 	1000

		//;duima.c: 249: __nop();
		NOP 					//038E 	1000
		LJUMP 	38AH 			//038F 	3B8A

		//;duima.c: 250: }
		//;duima.c: 252: EEADRL = addr;
		LDR 	72H, 0H 			//0390 	1872
		MOVLB 	3H 			//0391 	1023
		STR 	11H 			//0392 	1091

		//;duima.c: 253: CFGS = 0;
		BCR 	15H, 6H 			//0393 	2315

		//;duima.c: 254: EEPGD = 0;
		BCR 	15H, 7H 			//0394 	2395

		//;duima.c: 255: RD = 1;
		BSR 	15H, 0H 			//0395 	2415

		//;duima.c: 256: __nop();
		NOP 					//0396 	1000

		//;duima.c: 257: __nop();
		NOP 					//0397 	1000

		//;duima.c: 258: __nop();
		NOP 					//0398 	1000

		//;duima.c: 259: __nop();
		NOP 					//0399 	1000

		//;duima.c: 260: data = EEDATL;
		MOVLB 	3H 			//039A 	1023
		LDR 	13H, 0H 			//039B 	1813
		STR 	73H 			//039C 	10F3

		//;duima.c: 262: return data;
		RET 					//039D 	1008

		//;duima.c: 13: g_timer_ms = 0;
		MOVLB 	1H 			//039E 	1021
		CLRF 	42H 			//039F 	11C2
		CLRF 	43H 			//03A0 	11C3

		//;duima.c: 16: PCKEN |= 0B00001000;
		BSR 	1AH, 3H 			//03A1 	259A

		//;duima.c: 20: TIM4CR1 = 0B00000101;
		LDWI 	5H 			//03A2 	0005
		MOVLB 	2H 			//03A3 	1022
		STR 	11H 			//03A4 	1091

		//;duima.c: 23: TIM4IER = 0B00000001;
		LDWI 	1H 			//03A5 	0001
		STR 	12H 			//03A6 	1092

		//;duima.c: 26: TIM4SR = 0;
		CLRF 	13H 			//03A7 	1193

		//;duima.c: 27: TIM4EGR = 0;
		CLRF 	14H 			//03A8 	1194

		//;duima.c: 30: TIM4CNTR = 0;
		CLRF 	15H 			//03A9 	1195

		//;duima.c: 39: TIM4PSCR = 6;
		LDWI 	6H 			//03AA 	0006
		STR 	16H 			//03AB 	1096

		//;duima.c: 40: TIM4ARR = 249;
		LDWI 	F9H 			//03AC 	00F9
		STR 	17H 			//03AD 	1097
		RET 					//03AE 	1008

		//;duima.c: 376: if(PORTBbits.PB2 == 0)
		BTSS 	DH, 2H 			//03AF 	2D0D

		//;duima.c: 377: {
		//;duima.c: 379: if(PORTBbits.PB1 == 1 && PORTAbits.PA0 == 0)
		BTSS 	DH, 1H 			//03B0 	2C8D
		LJUMP 	3C0H 			//03B1 	3BC0
		BTSC 	CH, 0H 			//03B2 	280C
		LJUMP 	3C0H 			//03B3 	3BC0

		//;duima.c: 380: {
		//;duima.c: 381: PORTBbits.PB1 = 0;
		BCR 	DH, 1H 			//03B4 	208D

		//;duima.c: 382: PORTAbits.PA0 = 0;
		BCR 	CH, 0H 			//03B5 	200C

		//;duima.c: 383: PORTAbits.PA1 = (PORTAbits.PA1 == 1 ? 0 : 1);
		BCR 	3H, 0H 			//03B6 	2003
		BTSS 	CH, 1H 			//03B7 	2C8C
		BSR 	3H, 0H 			//03B8 	2403
		BTSS 	3H, 0H 			//03B9 	2C03
		LJUMP 	3BEH 			//03BA 	3BBE
		MOVLB 	0H 			//03BB 	1020
		BSR 	CH, 1H 			//03BC 	248C
		LJUMP 	3C0H 			//03BD 	3BC0
		MOVLB 	0H 			//03BE 	1020
		BCR 	CH, 1H 			//03BF 	208C

		//;duima.c: 384: }
		//;duima.c: 385: }
		//;duima.c: 388: if(PORTBbits.PB0 == 0)
		BTSS 	DH, 0H 			//03C0 	2C0D

		//;duima.c: 389: {
		//;duima.c: 391: if(PORTBbits.PB1 == 0 && PORTAbits.PA0 == 1)
		BTSC 	DH, 1H 			//03C1 	288D
		RET 					//03C2 	1008
		BTSS 	CH, 0H 			//03C3 	2C0C
		RET 					//03C4 	1008

		//;duima.c: 392: {
		//;duima.c: 393: PORTBbits.PB1 = 0;
		BCR 	DH, 1H 			//03C5 	208D

		//;duima.c: 394: PORTAbits.PA0 = 0;
		BCR 	CH, 0H 			//03C6 	200C

		//;duima.c: 395: PORTAbits.PA1 = (PORTAbits.PA1 == 1 ? 0 : 1);
		BCR 	3H, 0H 			//03C7 	2003
		BTSS 	CH, 1H 			//03C8 	2C8C
		BSR 	3H, 0H 			//03C9 	2403
		BTSS 	3H, 0H 			//03CA 	2C03
		LJUMP 	3CFH 			//03CB 	3BCF
		MOVLB 	0H 			//03CC 	1020
		BSR 	CH, 1H 			//03CD 	248C
		RET 					//03CE 	1008
		MOVLB 	0H 			//03CF 	1020
		BCR 	CH, 1H 			//03D0 	208C
		RET 					//03D1 	1008

		//;CAT1PRO.C: 227: PCKEN |=0B00100000;
		MOVLB 	1H 			//03D2 	1021
		BSR 	1AH, 5H 			//03D3 	269A

		//;CAT1PRO.C: 229: URIER =0B00000001;
		LDWI 	1H 			//03D4 	0001
		MOVLB 	9H 			//03D5 	1029
		STR 	EH 			//03D6 	108E

		//;CAT1PRO.C: 230: URLCR =0B00000001;
		STR 	FH 			//03D7 	108F

		//;CAT1PRO.C: 231: URMCR =0B00011000;
		LDWI 	18H 			//03D8 	0018
		STR 	11H 			//03D9 	1091

		//;CAT1PRO.C: 233: URDLL =104;
		LDWI 	68H 			//03DA 	0068
		STR 	14H 			//03DB 	1094

		//;CAT1PRO.C: 234: URDLH =0;
		CLRF 	15H 			//03DC 	1195

		//;CAT1PRO.C: 235: TCF=1;
		BSR 	1CH, 0H 			//03DD 	241C

		//;CAT1PRO.C: 236: AFP1=0;
		MOVLB 	3H 			//03DE 	1023
		CLRF 	1FH 			//03DF 	119F

		//;CAT1PRO.C: 237: ODCON0=0B00000000;
		MOVLB 	4H 			//03E0 	1024
		CLRF 	1FH 			//03E1 	119F
		RET 					//03E2 	1008
		BTSC 	3H, 0H 			//03E3 	2803
		ADDWI 	1H 			//03E4 	0E01
		STR 	5H 			//03E5 	1085
		LDR 	0H, 0H 			//03E6 	1800
		STR 	5EH 			//03E7 	10DE
		LDR 	6EH, 0H 			//03E8 	186E
		ADDWI 	65H 			//03E9 	0E65
		STR 	6H 			//03EA 	1086
		CLRF 	7H 			//03EB 	1187
		LDR 	1H, 0H 			//03EC 	1801
		XORWR 	5EH, 0H 		//03ED 	165E
		RET 					//03EE 	1008
		LDR 	74H, 0H 			//03EF 	1874
		STR 	76H 			//03F0 	10F6
		LDR 	73H, 0H 			//03F1 	1873
		STR 	75H 			//03F2 	10F5
		LDR 	78H, 0H 			//03F3 	1878
		ADDWR 	75H, 0H 		//03F4 	1775
		STR 	4H 			//03F5 	1084
		LDR 	76H, 0H 			//03F6 	1876
		BTSC 	3H, 0H 			//03F7 	2803
		INCR 	76H, 0H 		//03F8 	1A76
		STR 	5H 			//03F9 	1085
		RET 					//03FA 	1008
		LDR 	45H, 0H 			//03FB 	1845
		MOVLB 	0H 			//03FC 	1020
		STR 	26H 			//03FD 	10A6
		MOVLB 	1H 			//03FE 	1021
		LDR 	44H, 0H 			//03FF 	1844
		MOVLB 	0H 			//0400 	1020
		STR 	25H 			//0401 	10A5
		RET 					//0402 	1008
		LDWI 	27H 			//0403 	0027
		MOVLB 	1H 			//0404 	1021
		SUBWR 	43H, 0H 		//0405 	1243
		RETW 	10H 			//0406 	0410
		LDR 	57H, 0H 			//0407 	1857
		IORWR 	56H, 0H 		//0408 	1456
		IORWR 	55H, 0H 		//0409 	1455
		IORWR 	54H, 0H 		//040A 	1454
		RET 					//040B 	1008
		STR 	5DH 			//040C 	10DD

		//;duima.c: 107: if(data == 0 || len < 7) return;
		LDR 	5DH, 0H 			//040D 	185D
		BTSC 	3H, 2H 			//040E 	2903
		RET 					//040F 	1008
		LDWI 	7H 			//0410 	0007
		SUBWR 	59H, 0H 		//0411 	1259
		BTSC 	3H, 0H 			//0412 	2803

		//;duima.c: 110: if(current_mode == MODE_PAIRING)
		DECRSZ 	7BH, 0H 		//0413 	1B7B
		RET 					//0414 	1008

		//;duima.c: 111: {
		//;duima.c: 113: if(data[0] == 0xBB && data[1] == 0x02 && data[2] == 0x02)
		LDR 	5DH, 0H 			//0415 	185D
		STR 	6H 			//0416 	1086
		LDWI 	BBH 			//0417 	00BB
		CLRF 	7H 			//0418 	1187
		XORWR 	1H, 0H 		//0419 	1601
		BTSS 	3H, 2H 			//041A 	2D03
		RET 					//041B 	1008
		INCR 	5DH, 0H 		//041C 	1A5D
		STR 	6H 			//041D 	1086
		LDWI 	2H 			//041E 	0002
		XORWR 	1H, 0H 		//041F 	1601
		BTSS 	3H, 2H 			//0420 	2D03
		RET 					//0421 	1008
		LDR 	5DH, 0H 			//0422 	185D
		ADDWI 	2H 			//0423 	0E02
		STR 	6H 			//0424 	1086
		LDWI 	2H 			//0425 	0002
		XORWR 	1H, 0H 		//0426 	1601
		BTSS 	3H, 2H 			//0427 	2D03
		RET 					//0428 	1008

		//;duima.c: 119: new_id = ((unsigned int)data[3] << 8) | data[4];
		LDR 	5DH, 0H 			//0429 	185D
		ADDWI 	4H 			//042A 	0E04
		STR 	6H 			//042B 	1086
		LDR 	5DH, 0H 			//042C 	185D
		ADDWI 	3H 			//042D 	0E03
		STR 	4H 			//042E 	1084
		CLRF 	5H 			//042F 	1185
		LDR 	0H, 0H 			//0430 	1800
		STR 	5CH 			//0431 	10DC
		LDR 	1H, 0H 			//0432 	1801
		STR 	5BH 			//0433 	10DB

		//;duima.c: 122: if(new_id == 65535) return;
		INCRSZ 	5BH, 0H 		//0434 	1F5B
		LJUMP 	439H 			//0435 	3C39
		INCR 	5CH, 0H 		//0436 	1A5C
		BTSC 	3H, 2H 			//0437 	2903
		RET 					//0438 	1008

		//;duima.c: 125: Duima_EEPROM_WriteID(new_id, 0x13);
		LDR 	5CH, 0H 			//0439 	185C
		STR 	76H 			//043A 	10F6
		LDR 	5BH, 0H 			//043B 	185B
		STR 	75H 			//043C 	10F5
		LDWI 	13H 			//043D 	0013
		STR 	77H 			//043E 	10F7
		LCALL 	467H 			//043F 	3467

		//;duima.c: 126: local_paired_id = new_id;
		MOVLB 	0H 			//0440 	1020
		LDR 	5CH, 0H 			//0441 	185C
		MOVLB 	1H 			//0442 	1021
		STR 	45H 			//0443 	10C5
		MOVLB 	0H 			//0444 	1020
		LDR 	5BH, 0H 			//0445 	185B
		MOVLB 	1H 			//0446 	1021
		STR 	44H 			//0447 	10C4

		//;duima.c: 129: Duima_Configure433Address(local_paired_id);
		MOVLP 	3H 			//0448 	0183
		LCALL 	3FBH 			//0449 	33FB
		MOVLP 	4H 			//044A 	0184
		MOVLP 	2H 			//044B 	0182
		LCALL 	256H 			//044C 	3256
		MOVLP 	4H 			//044D 	0184

		//;duima.c: 132: current_mode = MODE_NORMAL;
		CLRF 	7BH 			//044E 	11FB

		//;duima.c: 135: for(unsigned char k=0; k<6; k++) {
		MOVLB 	0H 			//044F 	1020
		CLRF 	5AH 			//0450 	11DA

		//;duima.c: 136: PORTAbits.PA1 = (PORTAbits.PA1 == 1 ? 0 : 1); DelayMs(100);
		BCR 	3H, 0H 			//0451 	2003
		BTSS 	CH, 1H 			//0452 	2C8C
		BSR 	3H, 0H 			//0453 	2403
		BTSS 	3H, 0H 			//0454 	2C03
		LJUMP 	459H 			//0455 	3C59
		MOVLB 	0H 			//0456 	1020
		BSR 	CH, 1H 			//0457 	248C
		LJUMP 	45BH 			//0458 	3C5B
		MOVLB 	0H 			//0459 	1020
		BCR 	CH, 1H 			//045A 	208C
		LDWI 	64H 			//045B 	0064
		MOVLP 	2H 			//045C 	0182
		LCALL 	234H 			//045D 	3234
		MOVLP 	4H 			//045E 	0184
		MOVLB 	0H 			//045F 	1020
		LDWI 	6H 			//0460 	0006
		INCR 	5AH, 1H 		//0461 	1ADA
		SUBWR 	5AH, 0H 		//0462 	125A
		BTSS 	3H, 0H 			//0463 	2C03
		LJUMP 	452H 			//0464 	3C52

		//;duima.c: 137: }
		//;duima.c: 138: PORTAbits.PA1 = 0;
		BCR 	CH, 1H 			//0465 	208C
		RET 					//0466 	1008

		//;duima.c: 334: Duima_EEPROM_WriteByte((unsigned char)(id >> 8), addr);
		LDR 	77H, 0H 			//0467 	1877
		STR 	72H 			//0468 	10F2
		LDR 	76H, 0H 			//0469 	1876
		LCALL 	471H 			//046A 	3471
		MOVLP 	4H 			//046B 	0184

		//;duima.c: 335: Duima_EEPROM_WriteByte((unsigned char)(id), addr+1);
		LDR 	77H, 0H 			//046C 	1877
		ADDWI 	1H 			//046D 	0E01
		STR 	72H 			//046E 	10F2
		LDR 	75H, 0H 			//046F 	1875
		LJUMP 	471H 			//0470 	3C71
		STR 	73H 			//0471 	10F3

		//;duima.c: 285: unsigned char PEIE_1=PEIE;
		LDWI 	0H 			//0472 	0000
		BTSC 	BH, 6H 			//0473 	2B0B
		LDWI 	1H 			//0474 	0001
		STR 	74H 			//0475 	10F4

		//;duima.c: 286: while(GIE|PEIE) {
		LDWI 	0H 			//0476 	0000
		BTSC 	BH, 7H 			//0477 	2B8B
		IORWI 	1H 			//0478 	0801
		BTSC 	BH, 6H 			//0479 	2B0B
		IORWI 	1H 			//047A 	0801
		BTSS 	9H, 0H 			//047B 	2C09
		LJUMP 	482H 			//047C 	3C82

		//;duima.c: 287: GIE = 0;PEIE=0;
		BCR 	BH, 7H 			//047D 	238B
		BCR 	BH, 6H 			//047E 	230B

		//;duima.c: 288: __nop();
		NOP 					//047F 	1000

		//;duima.c: 289: __nop();
		NOP 					//0480 	1000
		LJUMP 	476H 			//0481 	3C76

		//;duima.c: 290: }
		//;duima.c: 292: EEADRL = addr;
		LDR 	72H, 0H 			//0482 	1872
		MOVLB 	3H 			//0483 	1023
		STR 	11H 			//0484 	1091

		//;duima.c: 293: EEDATL = data;
		LDR 	73H, 0H 			//0485 	1873
		STR 	13H 			//0486 	1093

		//;duima.c: 294: CFGS = 0;
		BCR 	15H, 6H 			//0487 	2315

		//;duima.c: 295: EEPGD = 0;
		BCR 	15H, 7H 			//0488 	2395

		//;duima.c: 296: EEIF = 0;
		BCR 	BH, 2H 			//0489 	210B

		//;duima.c: 297: WREN = 1;
		BSR 	15H, 2H 			//048A 	2515

		//;duima.c: 300: Unlock_Flash();
		LCALL 	49CH 			//048B 	349C
		MOVLP 	4H 			//048C 	0184

		//;duima.c: 301: __nop();
		NOP 					//048D 	1000

		//;duima.c: 302: __nop();
		NOP 					//048E 	1000

		//;duima.c: 303: __nop();
		NOP 					//048F 	1000

		//;duima.c: 304: __nop();
		NOP 					//0490 	1000

		//;duima.c: 307: while(WR) ;
		MOVLB 	3H 			//0491 	1023
		BTSC 	15H, 1H 		//0492 	2895
		LJUMP 	491H 			//0493 	3C91

		//;duima.c: 309: WREN = 0;
		BCR 	15H, 2H 			//0494 	2115

		//;duima.c: 310: GIE = 1;PEIE=PEIE_1;
		BSR 	BH, 7H 			//0495 	278B
		BTSS 	74H, 0H 		//0496 	2C74
		LJUMP 	49AH 			//0497 	3C9A
		BSR 	BH, 6H 			//0498 	270B
		RET 					//0499 	1008
		BCR 	BH, 6H 			//049A 	230B
		RET 					//049B 	1008
		LDWI 	3H 			//049C 	0003
		STR 	8H 			//049D 	1088
		LDWI 	55H 			//049E 	0055
		STR 	16H 			//049F 	1096
		LDWI 	AAH 			//04A0 	00AA
		STR 	16H 			//04A1 	1096
		BSR 	15H, 1H 			//04A2 	2495
		NOP 					//04A3 	1000
		NOP 					//04A4 	1000
		RET 					//04A5 	1008
		RETW 	41H 			//04A6 	0441
		RETW 	54H 			//04A7 	0454
		RETW 	2BH 			//04A8 	042B
		RETW 	55H 			//04A9 	0455
		RETW 	41H 			//04AA 	0441
		RETW 	52H 			//04AB 	0452
		RETW 	54H 			//04AC 	0454
		RETW 	3DH 			//04AD 	043D
		RETW 	33H 			//04AE 	0433
		RETW 	2CH 			//04AF 	042C
		RETW 	30H 			//04B0 	0430
		RETW 	DH 			//04B1 	040D
		RETW 	AH 			//04B2 	040A
		RETW 	55H 			//04B3 	0455
		RETW 	66H 			//04B4 	0466
		RETW 	77H 			//04B5 	0477
		RETW 	88H 			//04B6 	0488
		RETW 	99H 			//04B7 	0499
		RETW 	AAH 			//04B8 	04AA
		RETW 	0H 			//04B9 	0400
		RETW 	41H 			//04BA 	0441
		RETW 	54H 			//04BB 	0454
		RETW 	DH 			//04BC 	040D
		RETW 	AH 			//04BD 	040A
		RETW 	0H 			//04BE 	0400
		RETW 	0H 			//04BF 	0400
		RETW 	0H 			//04C0 	0400
		RETW 	0H 			//04C1 	0400
		RETW 	0H 			//04C2 	0400
		RETW 	0H 			//04C3 	0400
		RETW 	0H 			//04C4 	0400
		RETW 	0H 			//04C5 	0400
		RETW 	0H 			//04C6 	0400
		RETW 	0H 			//04C7 	0400
		RETW 	0H 			//04C8 	0400
		RETW 	0H 			//04C9 	0400
		RETW 	0H 			//04CA 	0400
		RETW 	0H 			//04CB 	0400
		RETW 	0H 			//04CC 	0400
		RETW 	0H 			//04CD 	0400
		RETW 	41H 			//04CE 	0441
		RETW 	54H 			//04CF 	0454
		RETW 	2BH 			//04D0 	042B
		RETW 	50H 			//04D1 	0450
		RETW 	57H 			//04D2 	0457
		RETW 	52H 			//04D3 	0452
		RETW 	3DH 			//04D4 	043D
		RETW 	32H 			//04D5 	0432
		RETW 	39H 			//04D6 	0439
		RETW 	DH 			//04D7 	040D
		RETW 	AH 			//04D8 	040A
		RETW 	0H 			//04D9 	0400
		RETW 	0H 			//04DA 	0400
		RETW 	0H 			//04DB 	0400
		RETW 	0H 			//04DC 	0400
		RETW 	0H 			//04DD 	0400
		RETW 	0H 			//04DE 	0400
		RETW 	0H 			//04DF 	0400
		RETW 	0H 			//04E0 	0400
		RETW 	0H 			//04E1 	0400
		RETW 	41H 			//04E2 	0441
		RETW 	54H 			//04E3 	0454
		RETW 	DH 			//04E4 	040D
		RETW 	AH 			//04E5 	040A
		RETW 	0H 			//04E6 	0400
		RETW 	0H 			//04E7 	0400
		RETW 	0H 			//04E8 	0400
		RETW 	0H 			//04E9 	0400
		RETW 	0H 			//04EA 	0400
		RETW 	0H 			//04EB 	0400
		RETW 	0H 			//04EC 	0400
		RETW 	0H 			//04ED 	0400
		RETW 	0H 			//04EE 	0400
		RETW 	0H 			//04EF 	0400
		RETW 	0H 			//04F0 	0400
		RETW 	0H 			//04F1 	0400
		RETW 	0H 			//04F2 	0400
		RETW 	0H 			//04F3 	0400
		RETW 	0H 			//04F4 	0400
		RETW 	0H 			//04F5 	0400

		//;duima.c: 188: static unsigned char key_state = 0;
		//;duima.c: 189: static unsigned int press_start_time = 0;
		//;duima.c: 192: if(current_mode == MODE_NORMAL)
		LDR 	7BH, 0H 			//04F6 	187B
		BTSS 	3H, 2H 			//04F7 	2D03
		RET 					//04F8 	1008

		//;duima.c: 193: {
		//;duima.c: 197: if(PORTBbits.PB7 == 0)
		MOVLB 	0H 			//04F9 	1020
		BTSC 	DH, 7H 			//04FA 	2B8D
		LJUMP 	51FH 			//04FB 	3D1F

		//;duima.c: 198: {
		//;duima.c: 200: if(key_state == 0)
		MOVLB 	1H 			//04FC 	1021
		LDR 	46H, 0H 			//04FD 	1846
		BTSS 	3H, 2H 			//04FE 	2D03
		LJUMP 	507H 			//04FF 	3D07

		//;duima.c: 201: {
		//;duima.c: 202: key_state = 1;
		CLRF 	46H 			//0500 	11C6
		INCR 	46H, 1H 		//0501 	1AC6

		//;duima.c: 203: press_start_time = g_timer_ms;
		LDR 	43H, 0H 			//0502 	1843
		STR 	41H 			//0503 	10C1
		LDR 	42H, 0H 			//0504 	1842
		STR 	40H 			//0505 	10C0

		//;duima.c: 204: }
		RET 					//0506 	1008

		//;duima.c: 206: else if(key_state == 1)
		DECRSZ 	46H, 0H 		//0507 	1B46
		RET 					//0508 	1008

		//;duima.c: 207: {
		//;duima.c: 210: if((g_timer_ms - press_start_time) >= 2000)
		LDR 	40H, 0H 			//0509 	1840
		SUBWR 	42H, 0H 		//050A 	1242
		MOVLB 	0H 			//050B 	1020
		STR 	59H 			//050C 	10D9
		MOVLB 	1H 			//050D 	1021
		LDR 	41H, 0H 			//050E 	1841
		SUBWFB 	43H, 0H 		//050F 	0B43
		MOVLB 	0H 			//0510 	1020
		STR 	5AH 			//0511 	10DA
		LDWI 	7H 			//0512 	0007
		SUBWR 	5AH, 0H 		//0513 	125A
		LDWI 	D0H 			//0514 	00D0
		BTSC 	3H, 2H 			//0515 	2903
		SUBWR 	59H, 0H 		//0516 	1259
		BTSS 	3H, 0H 			//0517 	2C03
		RET 					//0518 	1008

		//;duima.c: 211: {
		//;duima.c: 213: Duima_StartPairing();
		MOVLP 	0H 			//0519 	0180
		LCALL 	2CH 			//051A 	302C

		//;duima.c: 217: key_state = 2;
		LDWI 	2H 			//051B 	0002
		MOVLB 	1H 			//051C 	1021
		STR 	46H 			//051D 	10C6
		RET 					//051E 	1008

		//;duima.c: 225: else
		//;duima.c: 226: {
		//;duima.c: 228: key_state = 0;
		MOVLB 	1H 			//051F 	1021
		CLRF 	46H 			//0520 	11C6
		RET 					//0521 	1008

		//;CAT1PRO.C: 520: PORTAbits.PA1 = 0;
		MOVLB 	0H 			//0522 	1020
		BCR 	CH, 1H 			//0523 	208C

		//;CAT1PRO.C: 521: PORTCbits.PC1 = 1;
		BSR 	EH, 1H 			//0524 	248E

		//;CAT1PRO.C: 522: DelayMs(50);
		LDWI 	32H 			//0525 	0032
		MOVLP 	2H 			//0526 	0182
		LCALL 	234H 			//0527 	3234
		MOVLP 	5H 			//0528 	0185

		//;CAT1PRO.C: 527: IO_INT_INITIAL();
		LCALL 	53EH 			//0529 	353E

		//;CAT1PRO.C: 528: EPIF0 = 0x90;
		LDWI 	90H 			//052A 	0090
		MOVLB 	0H 			//052B 	1020
		STR 	14H 			//052C 	1094

		//;CAT1PRO.C: 530: GIE = 0;
		BCR 	BH, 7H 			//052D 	238B

		//;CAT1PRO.C: 533: __nop(); __nop();__nop();__nop();
		NOP 					//052E 	1000
		NOP 					//052F 	1000
		NOP 					//0530 	1000
		NOP 					//0531 	1000
		SLEEP 					//0532 	1063

		//;CAT1PRO.C: 535: __nop(); __nop();__nop();__nop();
		NOP 					//0533 	1000
		NOP 					//0534 	1000
		NOP 					//0535 	1000
		NOP 					//0536 	1000

		//;CAT1PRO.C: 538: EPIF0 = 0x90;
		MOVLB 	0H 			//0537 	1020
		STR 	14H 			//0538 	1094

		//;CAT1PRO.C: 539: INTCON = 0B11000000;
		LDWI 	C0H 			//0539 	00C0
		STR 	BH 			//053A 	108B

		//;CAT1PRO.C: 541: DelayMs(50);
		LDWI 	32H 			//053B 	0032
		MOVLP 	2H 			//053C 	0182
		LJUMP 	234H 			//053D 	3A34

		//;CAT1PRO.C: 174: EPS0 = 0B00000000;
		MOVLB 	2H 			//053E 	1022
		CLRF 	18H 			//053F 	1198

		//;CAT1PRO.C: 177: EPS1 = 0B01000000;
		LDWI 	40H 			//0540 	0040
		STR 	19H 			//0541 	1099

		//;CAT1PRO.C: 179: ITYPE0 = 0B00000000;
		CLRF 	1EH 			//0542 	119E

		//;CAT1PRO.C: 181: ITYPE1 = 0B10000000;
		LDWI 	80H 			//0543 	0080
		STR 	1FH 			//0544 	109F

		//;CAT1PRO.C: 183: EPIE0 = 0B10010000;
		LDWI 	90H 			//0545 	0090
		MOVLB 	1H 			//0546 	1021
		STR 	14H 			//0547 	1094

		//;CAT1PRO.C: 185: INTCON = 0B11000000;
		LDWI 	C0H 			//0548 	00C0
		STR 	BH 			//0549 	108B
		RET 					//054A 	1008

		//;CAT1PRO.C: 131: OSCCON = 0B01110001;
		LDWI 	71H 			//054B 	0071
		MOVLB 	1H 			//054C 	1021
		STR 	19H 			//054D 	1099

		//;CAT1PRO.C: 132: INTCON = 0B00000000;
		CLRF 	BH 			//054E 	118B

		//;CAT1PRO.C: 135: PORTA = 0B00000000;
		MOVLB 	0H 			//054F 	1020
		CLRF 	CH 			//0550 	118C

		//;CAT1PRO.C: 136: TRISA = 0B10010000;
		LDWI 	90H 			//0551 	0090
		MOVLB 	1H 			//0552 	1021
		STR 	CH 			//0553 	108C

		//;CAT1PRO.C: 137: PORTB = 0B00000000;
		MOVLB 	0H 			//0554 	1020
		CLRF 	DH 			//0555 	118D

		//;CAT1PRO.C: 138: TRISB = 0B10000101;
		LDWI 	85H 			//0556 	0085
		MOVLB 	1H 			//0557 	1021
		STR 	DH 			//0558 	108D

		//;CAT1PRO.C: 139: PORTC = 0B00000000;
		MOVLB 	0H 			//0559 	1020
		CLRF 	EH 			//055A 	118E

		//;CAT1PRO.C: 140: TRISC = 0B00000000;
		MOVLB 	1H 			//055B 	1021
		CLRF 	EH 			//055C 	118E

		//;CAT1PRO.C: 143: WPUA = 0B00010000;
		LDWI 	10H 			//055D 	0010
		MOVLB 	3H 			//055E 	1023
		STR 	CH 			//055F 	108C

		//;CAT1PRO.C: 144: WPUB = 0B10000101;
		LDWI 	85H 			//0560 	0085
		STR 	DH 			//0561 	108D

		//;CAT1PRO.C: 145: WPUC = 0B00000000;
		CLRF 	EH 			//0562 	118E

		//;CAT1PRO.C: 148: WPDA = 0B00000000;
		MOVLB 	4H 			//0563 	1024
		CLRF 	CH 			//0564 	118C

		//;CAT1PRO.C: 149: WPDB = 0B00000000;
		CLRF 	DH 			//0565 	118D

		//;CAT1PRO.C: 150: WPDC = 0B00000000;
		CLRF 	EH 			//0566 	118E

		//;CAT1PRO.C: 153: PSRC0 = 0B11111111;
		LDWI 	FFH 			//0567 	00FF
		MOVLB 	2H 			//0568 	1022
		STR 	1AH 			//0569 	109A

		//;CAT1PRO.C: 154: PSRC1 = 0B11111111;
		STR 	1BH 			//056A 	109B

		//;CAT1PRO.C: 155: PSRC2 = 0B11111111;
		STR 	1CH 			//056B 	109C

		//;CAT1PRO.C: 158: PSINK0 = 0B11111111;
		MOVLB 	3H 			//056C 	1023
		STR 	1AH 			//056D 	109A

		//;CAT1PRO.C: 159: PSINK1 = 0B11111111;
		STR 	1BH 			//056E 	109B

		//;CAT1PRO.C: 160: PSINK2 = 0B11111111;
		STR 	1CH 			//056F 	109C

		//;CAT1PRO.C: 162: ANSELA = 0B00000000;
		CLRF 	17H 			//0570 	1197
		RET 					//0571 	1008
		RETW 	BBH 			//0572 	04BB
		RETW 	1H 			//0573 	0401
		RETW 	1H 			//0574 	0401
		RETW 	1H 			//0575 	0401
		RETW 	3H 			//0576 	0403
		RETW 	DH 			//0577 	040D
		RETW 	AH 			//0578 	040A
		RETW 	41H 			//0579 	0441
		RETW 	54H 			//057A 	0454
		RETW 	2BH 			//057B 	042B
		RETW 	46H 			//057C 	0446
		RETW 	45H 			//057D 	0445
		RETW 	51H 			//057E 	0451
		RETW 	3DH 			//057F 	043D
		RETW 	34H 			//0580 	0434
		RETW 	33H 			//0581 	0433
		RETW 	34H 			//0582 	0434
		RETW 	30H 			//0583 	0430
		RETW 	30H 			//0584 	0430
		RETW 	30H 			//0585 	0430
		RETW 	30H 			//0586 	0430
		RETW 	30H 			//0587 	0430
		RETW 	30H 			//0588 	0430
		RETW 	0H 			//0589 	0400
		RETW 	0H 			//058A 	0400
		RETW 	AH 			//058B 	040A
		RETW 	0H 			//058C 	0400
		RETW 	AH 			//058D 	040A
		RETW 	0H 			//058E 	0400
		RETW 	AH 			//058F 	040A
		RETW 	0H 			//0590 	0400
		RETW 	AH 			//0591 	040A
		RETW 	0H 			//0592 	0400
		RETW 	0H 			//0593 	0400
		RETW 	0H 			//0594 	0400
		RETW 	0H 			//0595 	0400
		RETW 	0H 			//0596 	0400
		RETW 	0H 			//0597 	0400
		RETW 	0H 			//0598 	0400
		RETW 	0H 			//0599 	0400
		RETW 	0H 			//059A 	0400
		RETW 	0H 			//059B 	0400
		RETW 	0H 			//059C 	0400
		RETW 	0H 			//059D 	0400
		RETW 	41H 			//059E 	0441
		RETW 	54H 			//059F 	0454
		RETW 	2BH 			//05A0 	042B
		RETW 	55H 			//05A1 	0455
		RETW 	41H 			//05A2 	0441
		RETW 	52H 			//05A3 	0452
		RETW 	54H 			//05A4 	0454
		RETW 	3DH 			//05A5 	043D
		RETW 	33H 			//05A6 	0433
		RETW 	2CH 			//05A7 	042C
		RETW 	30H 			//05A8 	0430
		RETW 	0H 			//05A9 	0400
		RETW 	41H 			//05AA 	0441
		RETW 	54H 			//05AB 	0454
		RETW 	2BH 			//05AC 	042B
		RETW 	50H 			//05AD 	0450
		RETW 	42H 			//05AE 	0442
		RETW 	3DH 			//05AF 	043D
		RETW 	32H 			//05B0 	0432
		RETW 	30H 			//05B1 	0430
		RETW 	30H 			//05B2 	0430
		RETW 	30H 			//05B3 	0430
		RETW 	0H 			//05B4 	0400
		RETW 	41H 			//05B5 	0441
		RETW 	54H 			//05B6 	0454
		RETW 	2BH 			//05B7 	042B
		RETW 	50H 			//05B8 	0450
		RETW 	57H 			//05B9 	0457
		RETW 	52H 			//05BA 	0452
		RETW 	3DH 			//05BB 	043D
		RETW 	32H 			//05BC 	0432
		RETW 	30H 			//05BD 	0430
		RETW 	0H 			//05BE 	0400
		RETW 	41H 			//05BF 	0441
		RETW 	54H 			//05C0 	0454
		RETW 	2BH 			//05C1 	042B
		RETW 	4DH 			//05C2 	044D
		RETW 	4FH 			//05C3 	044F
		RETW 	44H 			//05C4 	0444
		RETW 	45H 			//05C5 	0445
		RETW 	3DH 			//05C6 	043D
		RETW 	31H 			//05C7 	0431
		RETW 	0H 			//05C8 	0400
		RETW 	41H 			//05C9 	0441
		RETW 	54H 			//05CA 	0454
		RETW 	2BH 			//05CB 	042B
		RETW 	41H 			//05CC 	0441
		RETW 	44H 			//05CD 	0444
		RETW 	52H 			//05CE 	0452
		RETW 	3DH 			//05CF 	043D
		RETW 	30H 			//05D0 	0430
		RETW 	0H 			//05D1 	0400
		RETW 	41H 			//05D2 	0441
		RETW 	54H 			//05D3 	0454
		RETW 	2BH 			//05D4 	042B
		RETW 	57H 			//05D5 	0457
		RETW 	54H 			//05D6 	0454
		RETW 	3DH 			//05D7 	043D
		RETW 	32H 			//05D8 	0432
		RETW 	0H 			//05D9 	0400
		RETW 	41H 			//05DA 	0441
		RETW 	54H 			//05DB 	0454
		RETW 	2BH 			//05DC 	042B
		RETW 	53H 			//05DD 	0453
		RETW 	46H 			//05DE 	0446
		RETW 	3DH 			//05DF 	043D
		RETW 	37H 			//05E0 	0437
		RETW 	0H 			//05E1 	0400
		RETW 	41H 			//05E2 	0441
		RETW 	54H 			//05E3 	0454
		RETW 	2BH 			//05E4 	042B
		RETW 	42H 			//05E5 	0442
		RETW 	57H 			//05E6 	0457
		RETW 	3DH 			//05E7 	043D
		RETW 	39H 			//05E8 	0439
		RETW 	0H 			//05E9 	0400
		RETW 	BBH 			//05EA 	04BB
		RETW 	1H 			//05EB 	0401
		RETW 	1H 			//05EC 	0401
		RETW 	0H 			//05ED 	0400
		RETW 	2H 			//05EE 	0402
		RETW 	DH 			//05EF 	040D
		RETW 	AH 			//05F0 	040A
		RETW 	BBH 			//05F1 	04BB
		RETW 	1H 			//05F2 	0401
		RETW 	1H 			//05F3 	0401
		RETW 	2H 			//05F4 	0402
		RETW 	4H 			//05F5 	0404
		RETW 	DH 			//05F6 	040D
		RETW 	AH 			//05F7 	040A
		RETW 	41H 			//05F8 	0441
		RETW 	42H 			//05F9 	0442
		RETW 	43H 			//05FA 	0443
		RETW 	44H 			//05FB 	0444
		RETW 	DH 			//05FC 	040D
		RETW 	AH 			//05FD 	040A
		RETW 	0H 			//05FE 	0400
		STR 	7EH 			//05FF 	10FE
		MOVIW 	FSR0++ 		//0600 	1012
		MOVWI 	FSR1++ 		//0601 	101E
		DECRSZ 	7EH, 1H 		//0602 	1BFE
		LJUMP 	600H 			//0603 	3E00
		RETW 	0H 			//0604 	0400
		CLRWDT 			//0605 	1064
		CLRF 	0H 			//0606 	1180
		ADDFSR 	0H, 1H 		//0607 	0101
		DECRSZ 	9H, 1H 		//0608 	1B89
		LJUMP 	606H 			//0609 	3E06
		RETW 	0H 			//060A 	0400
		RETW 	41H 			//060B 	0441
		RETW 	54H 			//060C 	0454
		RETW 	57H 			//060D 	0457
		RETW 	0H 			//060E 	0400
			END
