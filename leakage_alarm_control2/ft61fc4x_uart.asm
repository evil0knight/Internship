//Deviec:FT61FC4X
//-----------------------Variable---------------------------------
		_g_motor.current_state		EQU		3FH
		_g_motor.running_ms		EQU		40H
		_g_motor.hw_open		EQU		42H
		_g_motor.hw_close		EQU		44H
		_g_motor.hw_stop		EQU		46H
		_g_motor.on_jammed_error		EQU		48H
		_g_motor.on_arrived		EQU		4AH
		_g_motor		EQU		3FH
		_g_led1.remain_blink_ms		EQU		4CH
		_g_led1.toggle_tick		EQU		4EH
		_g_led1.blink_interval_ms		EQU		50H
		_g_led1.hw_on		EQU		52H
		_g_led1.hw_off		EQU		54H
		_g_led1.hw_toggle		EQU		56H
		_g_led1		EQU		4CH
		_g_led2.remain_blink_ms		EQU		B5H
		_g_led2.toggle_tick		EQU		B7H
		_g_led2.blink_interval_ms		EQU		B9H
		_g_led2.hw_on		EQU		BBH
		_g_led2.hw_off		EQU		BDH
		_g_led2.hw_toggle		EQU		BFH
		_g_led2		EQU		B5H
		_g_event		EQU		3AH
		_g_state		EQU		39H
		_g_power_cut		EQU		7AH
		_g_pairedCode		EQU		2BH
		_s_keyHoldMs		EQU		33H
		_s_keyLast		EQU		65H
		_s_duimaTimer		EQU		31H
		_flag		EQU		20H
		_a_code1		EQU		21H
		_a_code2		EQU		22H
		_a_code3		EQU		23H
		_hh_w		EQU		24H
		_ll_w		EQU		25H
		_t_code1		EQU		26H
		_t_code2		EQU		27H
		_t_code3		EQU		28H
		_ma_x		EQU		29H
		_pre_cnt		EQU		2AH
		_s		EQU		35H
		_rf_data		EQU		2EH
		_rf_data_ready		EQU		3BH
		_rx_buf		EQU		ABH
		_rx_len		EQU		7BH
		_rx_flag		EQU		3EH
		_tx_buf		EQU		A0H
		_tx_total		EQU		3DH
		_tx_idx		EQU		3CH
		_g_timer_ms		EQU		37H
		_W_TMP		EQU		70H
		_BSR_TMP		EQU		71H
		_BSREG		EQU		08H
		_EEIF		EQU		0BH
		_GIE		EQU		0BH
		_PA0		EQU		0CH
		_PA1		EQU		0CH
		_PA2		EQU		0CH
		_PA4		EQU		0CH
		_PB0		EQU		0DH
		_PB1		EQU		0DH
		_PB2		EQU		0DH
		_PB6		EQU		0DH
		_PB7		EQU		0DH
		_T4UIE		EQU		112H
		_T4UIF		EQU		113H
		_RD		EQU		195H
		_WR		EQU		195H
		_WREN		EQU		195H
		_CFGS		EQU		195H
		_EEPGD		EQU		195H
		_T1UIE		EQU		215H
		_T1UIF		EQU		216H
		_URRXNE		EQU		48EH
		_TCEN		EQU		48EH
		_RXNEF		EQU		492H
		_TCF		EQU		49CH
//		App_Run@i		EQU		61H
//		App_Run@ev		EQU		60H
//		parse_rf433@cmd		EQU		5AH
//		hal_eeprom_write@addr		EQU		59H
//		hal_eeprom_write@addr		EQU		59H
//		hal_eeprom_write@data		EQU		58H
//		hal_eeprom_write@addr		EQU		59H
//		Motor_Stop_And_Clear@motor.current_state		EQU		5AH
//		Motor_Stop_And_Clear@motor.running_ms		EQU		5BH
//		Motor_Stop_And_Clear@motor.hw_open		EQU		5DH
//		Motor_Stop_And_Clear@motor.hw_close		EQU		5FH
//		Motor_Stop_And_Clear@motor.hw_stop		EQU		61H
//		Motor_Stop_And_Clear@motor.on_jammed_error		EQU		63H
//		Motor_Stop_And_Clear@motor.on_arrived		EQU		65H
//		Motor_Stop_And_Clear@motor		EQU		5AH
//		Motor_Stop_And_Clear@motor		EQU		5AH
//		Motor_Stop_And_Clear@motor		EQU		5AH
//		Motor_Open@motor.current_state		EQU		5AH
//		Motor_Open@motor.running_ms		EQU		5BH
//		Motor_Open@motor.hw_open		EQU		5DH
//		Motor_Open@motor.hw_close		EQU		5FH
//		Motor_Open@motor.hw_stop		EQU		61H
//		Motor_Open@motor.on_jammed_error		EQU		63H
//		Motor_Open@motor.on_arrived		EQU		65H
//		Motor_Open@motor		EQU		5AH
//		Motor_Open@motor		EQU		5AH
//		Motor_Open@motor		EQU		5AH
//		Motor_Close@motor.current_state		EQU		5AH
//		Motor_Close@motor.running_ms		EQU		5BH
//		Motor_Close@motor.hw_open		EQU		5DH
//		Motor_Close@motor.hw_close		EQU		5FH
//		Motor_Close@motor.hw_stop		EQU		61H
//		Motor_Close@motor.on_jammed_error		EQU		63H
//		Motor_Close@motor.on_arrived		EQU		65H
//		Motor_Close@motor		EQU		5AH
//		Motor_Close@motor		EQU		5AH
//		Motor_Close@motor		EQU		5AH
//		LED_On@led.remain_blink_ms		EQU		5AH
//		LED_On@led.toggle_tick		EQU		5CH
//		LED_On@led.blink_interval_ms		EQU		5EH
//		LED_On@led.hw_on		EQU		60H
//		LED_On@led.hw_off		EQU		62H
//		LED_On@led.hw_toggle		EQU		64H
//		LED_On@led		EQU		5AH
//		LED_On@led		EQU		5AH
//		LED_On@led		EQU		5AH
//		LED_StartBlink@led.remain_blink_ms		EQU		5CH
//		LED_StartBlink@led.toggle_tick		EQU		5EH
//		LED_StartBlink@led.blink_interval_ms		EQU		60H
//		LED_StartBlink@led.hw_on		EQU		62H
//		LED_StartBlink@led.hw_off		EQU		64H
//		LED_StartBlink@led.hw_toggle		EQU		66H
//		LED_StartBlink@led		EQU		5CH
//		LED_StartBlink@led		EQU		5CH
//		LED_StartBlink@total_ms		EQU		58H
//		LED_StartBlink@interval_ms		EQU		5AH
//		LED_StartBlink@led		EQU		5CH
//		LED_Off@led.remain_blink_ms		EQU		5AH
//		LED_Off@led.toggle_tick		EQU		5CH
//		LED_Off@led.blink_interval_ms		EQU		5EH
//		LED_Off@led.hw_on		EQU		60H
//		LED_Off@led.hw_off		EQU		62H
//		LED_Off@led.hw_toggle		EQU		64H
//		LED_Off@led		EQU		5AH
//		LED_Off@led		EQU		5AH
//		LED_Off@led		EQU		5AH
//		___wmul@product		EQU		5CH
//		___wmul@multiplier		EQU		58H
//		___wmul@multiplicand		EQU		5AH
//		hal_eeprom_read@addr		EQU		58H
//		hal_eeprom_read@data		EQU		59H
//		hal_eeprom_read@addr		EQU		58H
//		hal_eeprom_read@addr		EQU		58H
//		Motor_Init@motor.current_state		EQU		64H
//		Motor_Init@motor.running_ms		EQU		65H
//		Motor_Init@motor.hw_open		EQU		67H
//		Motor_Init@motor.hw_close		EQU		69H
//		Motor_Init@motor.hw_stop		EQU		6BH
//		Motor_Init@motor.on_jammed_error		EQU		6DH
//		Motor_Init@motor.on_arrived		EQU		6FH
//		Motor_Init@motor		EQU		64H
//		Motor_Init@motor		EQU		64H
//		Motor_Init@hw_open		EQU		58H
//		Motor_Init@hw_close		EQU		5AH
//		Motor_Init@hw_stop		EQU		5CH
//		Motor_Init@on_error		EQU		5EH
//		Motor_Init@on_arrived		EQU		60H
//		Motor_Init@motor		EQU		64H
//		LED_Init@led.remain_blink_ms		EQU		60H
//		LED_Init@led.toggle_tick		EQU		62H
//		LED_Init@led.blink_interval_ms		EQU		64H
//		LED_Init@led.hw_on		EQU		66H
//		LED_Init@led.hw_off		EQU		68H
//		LED_Init@led.hw_toggle		EQU		6AH
//		LED_Init@led		EQU		60H
//		LED_Init@led		EQU		60H
//		LED_Init@on		EQU		58H
//		LED_Init@off		EQU		5AH
//		LED_Init@toggle		EQU		5CH
//		LED_Init@led		EQU		60H
//		UART_WiFi_ISR@byte		EQU		72H
//		set_bit@bit_idx		EQU		77H
//		set_bit@mask		EQU		76H
//		set_bit@bit_idx		EQU		77H
//		set_bit@bit_idx		EQU		77H
//		Motor_Timer_Task@motor.current_state		EQU		79H
//		Motor_Timer_Task@motor.running_ms		EQU		7AH
//		Motor_Timer_Task@motor.hw_open		EQU		7CH
//		Motor_Timer_Task@motor.hw_close		EQU		7EH
//		Motor_Timer_Task@motor.hw_stop		EQU		80H
//		Motor_Timer_Task@motor.on_jammed_error		EQU		82H
//		Motor_Timer_Task@motor.on_arrived		EQU		84H
//		Motor_Timer_Task@motor		EQU		79H
//		Motor_Timer_Task@motor		EQU		79H
//		Motor_Timer_Task@motor		EQU		79H
//		i1Motor_Stop_And_Clear@motor.current_state		EQU		74H
//		i1Motor_Stop_And_Clear@motor.running_ms		EQU		75H
//		i1Motor_Stop_And_Clear@motor.hw_open		EQU		77H
//		i1Motor_Stop_And_Clear@motor.hw_close		EQU		79H
//		i1Motor_Stop_And_Clear@motor.hw_stop		EQU		7BH
//		i1Motor_Stop_And_Clear@motor.on_jammed_error		EQU		7DH
//		i1Motor_Stop_And_Clear@motor.on_arrived		EQU		7FH
//		i1Motor_Stop_And_Clear@motor		EQU		74H
//		i1Motor_Stop_And_Clear@motor		EQU		74H
//		i1Motor_Stop_And_Clear@motor		EQU		74H
//		i1LED_StartBlink@led.remain_blink_ms		EQU		76H
//		i1LED_StartBlink@led.toggle_tick		EQU		78H
//		i1LED_StartBlink@led.blink_interval_ms		EQU		7AH
//		i1LED_StartBlink@led.hw_on		EQU		7CH
//		i1LED_StartBlink@led.hw_off		EQU		7EH
//		i1LED_StartBlink@led.hw_toggle		EQU		80H
//		i1LED_StartBlink@led		EQU		76H
//		i1LED_StartBlink@led		EQU		76H
//		i1LED_StartBlink@total_ms		EQU		72H
//		i1LED_StartBlink@interval_ms		EQU		74H
//		i1LED_StartBlink@led		EQU		76H
//		Motor_Arrived@motor.current_state		EQU		74H
//		Motor_Arrived@motor.running_ms		EQU		75H
//		Motor_Arrived@motor.hw_open		EQU		77H
//		Motor_Arrived@motor.hw_close		EQU		79H
//		Motor_Arrived@motor.hw_stop		EQU		7BH
//		Motor_Arrived@motor.on_jammed_error		EQU		7DH
//		Motor_Arrived@motor.on_arrived		EQU		7FH
//		Motor_Arrived@motor		EQU		74H
//		Motor_Arrived@motor		EQU		74H
//		Motor_Arrived@motor		EQU		74H
//		LED_Process_1ms@led.remain_blink_ms		EQU		76H
//		LED_Process_1ms@led.toggle_tick		EQU		78H
//		LED_Process_1ms@led.blink_interval_ms		EQU		7AH
//		LED_Process_1ms@led.hw_on		EQU		7CH
//		LED_Process_1ms@led.hw_off		EQU		7EH
//		LED_Process_1ms@led.hw_toggle		EQU		80H
//		LED_Process_1ms@led		EQU		76H
//		LED_Process_1ms@led		EQU		76H
//		LED_Process_1ms@led		EQU		76H
//-----------------------Variable END---------------------------------

		MOVLP 	0H 			//0000 	0180
		LJUMP 	CH 			//0001 	380C
		ORG		0004H
		BSR 	7EH, 0H 			//0004 	247E
		MOVLP 	0H 			//0005 	0180
		NOP 					//0006 	1000
		NOP 					//0007 	1000

		//;hal_gpio.c: 209: user_isr();
		MOVLP 	0H 			//0008 	0180
		LCALL 	F9H 			//0009 	30F9
		BCR 	7EH, 0H 			//000A 	207E
		RETI 					//000B 	1009
		MOVLP 	3H 			//000C 	0183
		LJUMP 	3B4H 			//000D 	3BB4

		//;app.c: 79: LED_StartBlink(&g_led1, 0xFFFF, 100);
		LDWI 	FFH 			//000E 	00FF
		STR 	72H 			//000F 	10F2
		STR 	73H 			//0010 	10F3
		LDWI 	64H 			//0011 	0064
		STR 	74H 			//0012 	10F4
		LDWI 	4CH 			//0013 	004C
		CLRF 	75H 			//0014 	11F5
		LCALL 	19H 			//0015 	3019

		//;app.c: 80: g_event = EV_TIM_5S_OVER;
		LDWI 	BH 			//0016 	000B
		STR 	3AH 			//0017 	10BA
		RET 					//0018 	1008
		STR 	76H 			//0019 	10F6

		//;led_driver.c: 31: if (!led) return;
		LDR 	76H, 0H 			//001A 	1876
		BTSC 	3H, 2H 			//001B 	2903
		RET 					//001C 	1008

		//;led_driver.c: 32: led->remain_blink_ms = total_ms;
		STR 	6H 			//001D 	1086
		CLRF 	7H 			//001E 	1187
		LDR 	72H, 0H 			//001F 	1872
		MOVWI 	0H[1] 			//0020 	0FC0
		LDR 	73H, 0H 			//0021 	1873
		MOVWI 	1H[1] 			//0022 	0FC1

		//;led_driver.c: 33: led->blink_interval_ms = interval_ms;
		LDR 	76H, 0H 			//0023 	1876
		ADDWI 	4H 			//0024 	0E04
		STR 	6H 			//0025 	1086
		LDR 	74H, 0H 			//0026 	1874
		MOVWI 	0H[1] 			//0027 	0FC0
		LDR 	75H, 0H 			//0028 	1875
		MOVWI 	1H[1] 			//0029 	0FC1

		//;led_driver.c: 34: led->toggle_tick = 0;
		LDR 	76H, 0H 			//002A 	1876
		ADDWI 	2H 			//002B 	0E02
		LJUMP 	EDH 			//002C 	38ED
		LDWI 	4CH 			//002D 	004C
		LCALL 	5FH 			//002E 	305F
		MOVLP 	0H 			//002F 	0180
		LDWI 	D0H 			//0030 	00D0
		STR 	58H 			//0031 	10D8
		LDWI 	7H 			//0032 	0007
		STR 	59H 			//0033 	10D9
		LDWI 	32H 			//0034 	0032
		STR 	5AH 			//0035 	10DA
		LDWI 	B5H 			//0036 	00B5
		CLRF 	5BH 			//0037 	11DB
		LJUMP 	D9H 			//0038 	38D9
		LDWI 	3FH 			//0039 	003F
		LCALL 	75H 			//003A 	3075
		MOVLP 	0H 			//003B 	0180
		LCALL 	F2H 			//003C 	30F2
		MOVLP 	0H 			//003D 	0180
		LDWI 	4CH 			//003E 	004C
		CLRF 	5BH 			//003F 	11DB
		LJUMP 	D9H 			//0040 	38D9
		LDWI 	4CH 			//0041 	004C
		LCALL 	5FH 			//0042 	305F
		MOVLP 	0H 			//0043 	0180
		LDWI 	D0H 			//0044 	00D0
		STR 	58H 			//0045 	10D8
		LDWI 	7H 			//0046 	0007
		STR 	59H 			//0047 	10D9
		LDWI 	F4H 			//0048 	00F4
		STR 	5AH 			//0049 	10DA
		LDWI 	1H 			//004A 	0001
		STR 	5BH 			//004B 	10DB
		LDWI 	B5H 			//004C 	00B5
		LJUMP 	D9H 			//004D 	38D9
		LDWI 	4CH 			//004E 	004C
		BCR 	7AH, 0H 			//004F 	207A
		LCALL 	5FH 			//0050 	305F
		MOVLP 	0H 			//0051 	0180
		LCALL 	F2H 			//0052 	30F2
		MOVLP 	0H 			//0053 	0180
		LDWI 	B5H 			//0054 	00B5
		CLRF 	5BH 			//0055 	11DB
		LJUMP 	D9H 			//0056 	38D9
		LDWI 	4CH 			//0057 	004C
		LCALL 	5FH 			//0058 	305F
		MOVLP 	0H 			//0059 	0180
		LDWI 	B5H 			//005A 	00B5
		LCALL 	5FH 			//005B 	305F
		MOVLP 	0H 			//005C 	0180
		LDWI 	3FH 			//005D 	003F
		LJUMP 	75H 			//005E 	3875
		STR 	5AH 			//005F 	10DA

		//;led_driver.c: 24: if (!led) return;
		LDR 	5AH, 0H 			//0060 	185A
		BTSC 	3H, 2H 			//0061 	2903
		RET 					//0062 	1008

		//;led_driver.c: 25: led->remain_blink_ms = 0;
		LCALL 	339H 			//0063 	3339
		MOVLP 	0H 			//0064 	0180

		//;led_driver.c: 26: if (led->hw_off) led->hw_off();
		LDR 	5AH, 0H 			//0065 	185A
		ADDWI 	8H 			//0066 	0E08
		STR 	6H 			//0067 	1086
		MOVIW 	FSR1++ 		//0068 	1016
		IORWR 	1H, 0H 		//0069 	1401
		BTSC 	3H, 2H 			//006A 	2903
		RET 					//006B 	1008
		LDR 	5AH, 0H 			//006C 	185A
		MOVLP 	5H 			//006D 	0185
		LCALL 	5F8H 			//006E 	35F8
		MOVLP 	0H 			//006F 	0180
		STR 	AH 			//0070 	108A
		MOVIW 	0H[1] 			//0071 	0F40
		CALLW 					//0072 	100A
		MOVLP 	0H 			//0073 	0180
		RET 					//0074 	1008
		STR 	5AH 			//0075 	10DA

		//;motor_driver.c: 51: if (!motor) return;
		LDR 	5AH, 0H 			//0076 	185A
		BTSC 	3H, 2H 			//0077 	2903
		RET 					//0078 	1008

		//;motor_driver.c: 52: if (motor->hw_stop) motor->hw_stop();
		LCALL 	33FH 			//0079 	333F
		MOVLP 	0H 			//007A 	0180
		BTSC 	3H, 2H 			//007B 	2903
		LJUMP 	83H 			//007C 	3883
		LDR 	5AH, 0H 			//007D 	185A
		LCALL 	345H 			//007E 	3345
		STR 	AH 			//007F 	108A
		MOVIW 	0H[1] 			//0080 	0F40
		CALLW 					//0081 	100A
		MOVLP 	0H 			//0082 	0180

		//;motor_driver.c: 53: motor->current_state = MOTOR_ST_UNKNOWN;
		LDR 	5AH, 0H 			//0083 	185A
		STR 	6H 			//0084 	1086
		CLRF 	7H 			//0085 	1187
		CLRF 	1H 			//0086 	1181

		//;motor_driver.c: 54: motor->running_ms = 0;
		INCR 	5AH, 0H 		//0087 	1A5A
		LJUMP 	EDH 			//0088 	38ED

		//;app.c: 66: g_pairedCode[0] = rf_data[0];
		LDR 	2EH, 0H 			//0089 	182E
		STR 	2BH 			//008A 	10AB

		//;app.c: 67: g_pairedCode[1] = rf_data[1];
		LDR 	2FH, 0H 			//008B 	182F
		STR 	2CH 			//008C 	10AC

		//;app.c: 68: g_pairedCode[2] = rf_data[2];
		LDR 	30H, 0H 			//008D 	1830
		STR 	2DH 			//008E 	10AD

		//;app.c: 69: hal_eeprom_write(0x00U, g_pairedCode[0]);
		LDR 	2BH, 0H 			//008F 	182B
		STR 	58H 			//0090 	10D8
		LDWI 	0H 			//0091 	0000
		LCALL 	B0H 			//0092 	30B0
		MOVLP 	0H 			//0093 	0180

		//;app.c: 70: hal_eeprom_write(0x00U + 1U, g_pairedCode[1]);
		MOVLB 	0H 			//0094 	1020
		LDR 	2CH, 0H 			//0095 	182C
		STR 	58H 			//0096 	10D8
		LDWI 	1H 			//0097 	0001
		LCALL 	B0H 			//0098 	30B0
		MOVLP 	0H 			//0099 	0180

		//;app.c: 71: hal_eeprom_write(0x00U + 2U, g_pairedCode[2]);
		MOVLB 	0H 			//009A 	1020
		LDR 	2DH, 0H 			//009B 	182D
		STR 	58H 			//009C 	10D8
		LDWI 	2H 			//009D 	0002
		LCALL 	B0H 			//009E 	30B0
		MOVLP 	0H 			//009F 	0180

		//;app.c: 72: hal_eeprom_write(0x03U, 0x5AU);
		LDWI 	5AH 			//00A0 	005A
		MOVLB 	0H 			//00A1 	1020
		STR 	58H 			//00A2 	10D8
		LDWI 	3H 			//00A3 	0003
		LCALL 	B0H 			//00A4 	30B0
		MOVLP 	0H 			//00A5 	0180

		//;app.c: 73: LED_StartBlink(&g_led2, 5000, 100);
		LDWI 	88H 			//00A6 	0088
		MOVLB 	0H 			//00A7 	1020
		STR 	58H 			//00A8 	10D8
		LDWI 	13H 			//00A9 	0013
		STR 	59H 			//00AA 	10D9
		LDWI 	64H 			//00AB 	0064
		STR 	5AH 			//00AC 	10DA
		LDWI 	B5H 			//00AD 	00B5
		CLRF 	5BH 			//00AE 	11DB
		LJUMP 	D9H 			//00AF 	38D9
		STR 	59H 			//00B0 	10D9

		//;hal_eeprom.c: 76: while (GIE) {
		BTSS 	BH, 7H 			//00B1 	2F8B
		LJUMP 	B7H 			//00B2 	38B7

		//;hal_eeprom.c: 77: GIE = 0;
		BCR 	BH, 7H 			//00B3 	238B

		//;hal_eeprom.c: 78: __nop();
		NOP 					//00B4 	1000

		//;hal_eeprom.c: 79: __nop();
		NOP 					//00B5 	1000
		LJUMP 	B1H 			//00B6 	38B1

		//;hal_eeprom.c: 80: }
		//;hal_eeprom.c: 82: EEADRL = addr;
		MOVLB 	0H 			//00B7 	1020
		LDR 	59H, 0H 			//00B8 	1859
		MOVLB 	3H 			//00B9 	1023
		STR 	11H 			//00BA 	1091

		//;hal_eeprom.c: 83: EEDATL = data;
		MOVLB 	0H 			//00BB 	1020
		LDR 	58H, 0H 			//00BC 	1858
		MOVLB 	3H 			//00BD 	1023
		STR 	13H 			//00BE 	1093

		//;hal_eeprom.c: 84: CFGS = 0;
		BCR 	15H, 6H 			//00BF 	2315

		//;hal_eeprom.c: 85: EEPGD = 0;
		BCR 	15H, 7H 			//00C0 	2395

		//;hal_eeprom.c: 86: EEIF = 0;
		BCR 	BH, 2H 			//00C1 	210B

		//;hal_eeprom.c: 87: WREN = 1;
		BSR 	15H, 2H 			//00C2 	2515

		//;hal_eeprom.c: 89: Unlock_Flash();
		LCALL 	CFH 			//00C3 	30CF
		MOVLP 	0H 			//00C4 	0180

		//;hal_eeprom.c: 90: __nop();
		NOP 					//00C5 	1000

		//;hal_eeprom.c: 91: __nop();
		NOP 					//00C6 	1000

		//;hal_eeprom.c: 92: __nop();
		NOP 					//00C7 	1000

		//;hal_eeprom.c: 93: __nop();
		NOP 					//00C8 	1000

		//;hal_eeprom.c: 95: while (WR);
		MOVLB 	3H 			//00C9 	1023
		BTSC 	15H, 1H 		//00CA 	2895
		LJUMP 	C9H 			//00CB 	38C9

		//;hal_eeprom.c: 96: WREN = 0;
		BCR 	15H, 2H 			//00CC 	2115

		//;hal_eeprom.c: 97: GIE = 1;
		BSR 	BH, 7H 			//00CD 	278B
		RET 					//00CE 	1008
		LDWI 	3H 			//00CF 	0003
		STR 	8H 			//00D0 	1088
		LDWI 	55H 			//00D1 	0055
		STR 	16H 			//00D2 	1096
		LDWI 	AAH 			//00D3 	00AA
		STR 	16H 			//00D4 	1096
		BSR 	15H, 1H 			//00D5 	2495
		NOP 					//00D6 	1000
		NOP 					//00D7 	1000
		RET 					//00D8 	1008
		STR 	5CH 			//00D9 	10DC

		//;led_driver.c: 31: if (!led) return;
		LDR 	5CH, 0H 			//00DA 	185C
		BTSC 	3H, 2H 			//00DB 	2903
		RET 					//00DC 	1008

		//;led_driver.c: 32: led->remain_blink_ms = total_ms;
		STR 	6H 			//00DD 	1086
		CLRF 	7H 			//00DE 	1187
		LDR 	58H, 0H 			//00DF 	1858
		MOVWI 	0H[1] 			//00E0 	0FC0
		LDR 	59H, 0H 			//00E1 	1859
		MOVWI 	1H[1] 			//00E2 	0FC1

		//;led_driver.c: 33: led->blink_interval_ms = interval_ms;
		LDR 	5CH, 0H 			//00E3 	185C
		ADDWI 	4H 			//00E4 	0E04
		STR 	6H 			//00E5 	1086
		LDR 	5AH, 0H 			//00E6 	185A
		MOVWI 	0H[1] 			//00E7 	0FC0
		LDR 	5BH, 0H 			//00E8 	185B
		MOVWI 	1H[1] 			//00E9 	0FC1

		//;led_driver.c: 34: led->toggle_tick = 0;
		LDR 	5CH, 0H 			//00EA 	185C
		ADDWI 	2H 			//00EB 	0E02
		LJUMP 	EDH 			//00EC 	38ED
		STR 	6H 			//00ED 	1086
		LDWI 	0H 			//00EE 	0000
		MOVWI 	0H[1] 			//00EF 	0FC0
		MOVWI 	1H[1] 			//00F0 	0FC1
		RET 					//00F1 	1008
		LDWI 	88H 			//00F2 	0088
		STR 	58H 			//00F3 	10D8
		LDWI 	13H 			//00F4 	0013
		STR 	59H 			//00F5 	10D9
		LDWI 	32H 			//00F6 	0032
		STR 	5AH 			//00F7 	10DA
		RET 					//00F8 	1008

		//;hal_gpio.c: 176: UART_WiFi_ISR();
		LCALL 	2BEH 			//00F9 	32BE
		MOVLP 	0H 			//00FA 	0180

		//;hal_gpio.c: 179: if (T1UIE && T1UIF) {
		MOVLB 	4H 			//00FB 	1024
		BTSC 	15H, 0H 		//00FC 	2815
		BTSS 	16H, 0H 		//00FD 	2C16
		LJUMP 	102H 			//00FE 	3902

		//;hal_gpio.c: 180: T1UIF = 1;
		BSR 	16H, 0H 			//00FF 	2416

		//;hal_gpio.c: 181: RF433_ISR();
		LCALL 	207H 			//0100 	3207
		MOVLP 	0H 			//0101 	0180

		//;hal_gpio.c: 182: }
		//;hal_gpio.c: 185: if (T4UIE && T4UIF) {
		MOVLB 	2H 			//0102 	1022
		BTSC 	12H, 0H 		//0103 	2812
		BTSS 	13H, 0H 		//0104 	2C13
		RET 					//0105 	1008

		//;hal_gpio.c: 186: T4UIF = 1;
		BSR 	13H, 0H 			//0106 	2413

		//;hal_gpio.c: 187: g_timer_ms++;
		MOVLB 	0H 			//0107 	1020
		INCR 	37H, 1H 		//0108 	1AB7
		BTSC 	3H, 2H 			//0109 	2903
		INCR 	38H, 1H 		//010A 	1AB8

		//;hal_gpio.c: 188: App_Input_1ms();
		LCALL 	115H 			//010B 	3115
		MOVLP 	0H 			//010C 	0180

		//;hal_gpio.c: 189: Motor_Timer_Task(&g_motor);
		LDWI 	3FH 			//010D 	003F
		LCALL 	1B8H 			//010E 	31B8
		MOVLP 	0H 			//010F 	0180

		//;hal_gpio.c: 190: LED_Process_1ms(&g_led1);
		LDWI 	4CH 			//0110 	004C
		LCALL 	159H 			//0111 	3159
		MOVLP 	0H 			//0112 	0180

		//;hal_gpio.c: 191: LED_Process_1ms(&g_led2);
		LDWI 	B5H 			//0113 	00B5
		LJUMP 	159H 			//0114 	3959

		//;app_input.c: 38: if ((PA1 == 0)) {
		BTSC 	CH, 1H 			//0115 	288C
		LJUMP 	127H 			//0116 	3927

		//;app_input.c: 39: s_keyHoldMs++;
		INCR 	33H, 1H 		//0117 	1AB3
		BTSC 	3H, 2H 			//0118 	2903
		INCR 	34H, 1H 		//0119 	1AB4

		//;app_input.c: 40: if (s_keyHoldMs == 2000U && s_keyLast == 1) {
		LDWI 	D0H 			//011A 	00D0
		XORWR 	33H, 0H 		//011B 	1633
		LDWI 	7H 			//011C 	0007
		BTSC 	3H, 2H 			//011D 	2903
		XORWR 	34H, 0H 		//011E 	1634
		BTSS 	3H, 2H 			//011F 	2D03
		LJUMP 	13DH 			//0120 	393D
		DECRSZ 	65H, 0H 		//0121 	1B65
		LJUMP 	13DH 			//0122 	393D

		//;app_input.c: 41: g_event = EV_LONG_KEY;
		LDWI 	8H 			//0123 	0008
		STR 	3AH 			//0124 	10BA

		//;app_input.c: 42: s_keyLast = 0;
		CLRF 	65H 			//0125 	11E5
		LJUMP 	13DH 			//0126 	393D

		//;app_input.c: 45: if (s_keyHoldMs > 50U &&
		//;app_input.c: 46: s_keyHoldMs < 2000U &&
		//;app_input.c: 47: s_keyLast == 1) {
		LDWI 	0H 			//0127 	0000
		SUBWR 	34H, 0H 		//0128 	1234
		LDWI 	33H 			//0129 	0033
		BTSC 	3H, 2H 			//012A 	2903
		SUBWR 	33H, 0H 		//012B 	1233
		BTSS 	3H, 0H 			//012C 	2C03
		LJUMP 	139H 			//012D 	3939
		LDWI 	7H 			//012E 	0007
		SUBWR 	34H, 0H 		//012F 	1234
		LDWI 	D0H 			//0130 	00D0
		BTSC 	3H, 2H 			//0131 	2903
		SUBWR 	33H, 0H 		//0132 	1233
		BTSC 	3H, 0H 			//0133 	2803
		LJUMP 	139H 			//0134 	3939
		DECRSZ 	65H, 0H 		//0135 	1B65
		LJUMP 	139H 			//0136 	3939

		//;app_input.c: 48: g_event = EV_SHORT_KEY;
		LDWI 	9H 			//0137 	0009
		STR 	3AH 			//0138 	10BA

		//;app_input.c: 49: }
		//;app_input.c: 50: s_keyHoldMs = 0;
		CLRF 	33H 			//0139 	11B3
		CLRF 	34H 			//013A 	11B4

		//;app_input.c: 51: s_keyLast = 1;
		CLRF 	65H 			//013B 	11E5
		INCR 	65H, 1H 		//013C 	1AE5

		//;app_input.c: 52: }
		//;app_input.c: 55: if (g_state == STATE_433_DUIMA) {
		LDWI 	4H 			//013D 	0004
		XORWR 	39H, 0H 		//013E 	1639
		BTSS 	3H, 2H 			//013F 	2D03
		LJUMP 	150H 			//0140 	3950

		//;app_input.c: 56: s_duimaTimer++;
		INCR 	31H, 1H 		//0141 	1AB1
		BTSC 	3H, 2H 			//0142 	2903
		INCR 	32H, 1H 		//0143 	1AB2

		//;app_input.c: 57: if (s_duimaTimer >= 10000U) {
		LDWI 	27H 			//0144 	0027
		SUBWR 	32H, 0H 		//0145 	1232
		LDWI 	10H 			//0146 	0010
		BTSC 	3H, 2H 			//0147 	2903
		SUBWR 	31H, 0H 		//0148 	1231
		BTSS 	3H, 0H 			//0149 	2C03
		LJUMP 	152H 			//014A 	3952
		LDWI 	CH 			//014B 	000C

		//;app_input.c: 58: s_duimaTimer = 0;
		CLRF 	31H 			//014C 	11B1
		CLRF 	32H 			//014D 	11B2

		//;app_input.c: 59: g_event = EV_TIM_10S_OVER;
		STR 	3AH 			//014E 	10BA
		LJUMP 	152H 			//014F 	3952

		//;app_input.c: 62: s_duimaTimer = 0;
		CLRF 	31H 			//0150 	11B1
		CLRF 	32H 			//0151 	11B2

		//;app_input.c: 63: }
		//;app_input.c: 66: if (PA4 == 0 && !g_power_cut) {
		BTSS 	CH, 4H 			//0152 	2E0C
		BTSC 	7AH, 0H 		//0153 	287A
		RET 					//0154 	1008
		LDWI 	6H 			//0155 	0006

		//;app_input.c: 67: g_power_cut = 1;
		BSR 	7AH, 0H 			//0156 	247A

		//;app_input.c: 68: g_event = EV_CUTOFF;
		STR 	3AH 			//0157 	10BA
		RET 					//0158 	1008
		STR 	76H 			//0159 	10F6

		//;led_driver.c: 39: if (!led || led->remain_blink_ms == 0) return;
		LDR 	76H, 0H 			//015A 	1876
		BTSC 	3H, 2H 			//015B 	2903
		RET 					//015C 	1008
		STR 	6H 			//015D 	1086
		CLRF 	7H 			//015E 	1187
		MOVIW 	FSR1++ 		//015F 	1016
		IORWR 	1H, 0H 		//0160 	1401
		BTSC 	3H, 2H 			//0161 	2903
		RET 					//0162 	1008

		//;led_driver.c: 41: led->remain_blink_ms--;
		LDR 	76H, 0H 			//0163 	1876
		STR 	6H 			//0164 	1086
		LDWI 	1H 			//0165 	0001
		CLRF 	7H 			//0166 	1187
		SUBWR 	1H, 1H 		//0167 	1281
		LDWI 	0H 			//0168 	0000
		ADDFSR 	1H, 1H 		//0169 	0141
		SUBWFB 	1H, 1H 		//016A 	0B81
		ADDFSR 	1H, 3FH 		//016B 	017F

		//;led_driver.c: 42: led->toggle_tick++;
		LDR 	76H, 0H 			//016C 	1876
		ADDWI 	2H 			//016D 	0E02
		LCALL 	34AH 			//016E 	334A
		MOVLP 	0H 			//016F 	0180
		BTSC 	3H, 0H 			//0170 	2803
		INCR 	1H, 1H 			//0171 	1A81

		//;led_driver.c: 44: if (led->toggle_tick >= led->blink_interval_ms) {
		LDR 	76H, 0H 			//0172 	1876
		ADDWI 	4H 			//0173 	0E04
		STR 	6H 			//0174 	1086
		CLRF 	7H 			//0175 	1187
		MOVIW 	0H[1] 			//0176 	0F40
		STR 	72H 			//0177 	10F2
		MOVIW 	1H[1] 			//0178 	0F41
		STR 	73H 			//0179 	10F3
		LDR 	76H, 0H 			//017A 	1876
		ADDWI 	2H 			//017B 	0E02
		STR 	6H 			//017C 	1086
		MOVIW 	0H[1] 			//017D 	0F40
		STR 	74H 			//017E 	10F4
		MOVIW 	1H[1] 			//017F 	0F41
		STR 	75H 			//0180 	10F5
		LDR 	73H, 0H 			//0181 	1873
		SUBWR 	75H, 0H 		//0182 	1275
		BTSS 	3H, 2H 			//0183 	2D03
		LJUMP 	187H 			//0184 	3987
		LDR 	72H, 0H 			//0185 	1872
		SUBWR 	74H, 0H 		//0186 	1274

		//;led_driver.c: 45: led->toggle_tick = 0;
		LDR 	76H, 0H 			//0187 	1876
		BTSS 	3H, 0H 			//0188 	2C03
		LJUMP 	19EH 			//0189 	399E
		ADDWI 	2H 			//018A 	0E02
		LCALL 	339H 			//018B 	3339
		MOVLP 	0H 			//018C 	0180

		//;led_driver.c: 46: if (led->hw_toggle) led->hw_toggle();
		LDR 	76H, 0H 			//018D 	1876
		ADDWI 	AH 			//018E 	0E0A
		STR 	6H 			//018F 	1086
		MOVIW 	FSR1++ 		//0190 	1016
		IORWR 	1H, 0H 		//0191 	1401
		BTSC 	3H, 2H 			//0192 	2903
		LJUMP 	19DH 			//0193 	399D
		LDR 	76H, 0H 			//0194 	1876
		ADDWI 	AH 			//0195 	0E0A
		STR 	6H 			//0196 	1086
		CLRF 	7H 			//0197 	1187
		MOVIW 	1H[1] 			//0198 	0F41
		STR 	AH 			//0199 	108A
		MOVIW 	0H[1] 			//019A 	0F40
		CALLW 					//019B 	100A
		MOVLP 	1H 			//019C 	0181

		//;led_driver.c: 47: }
		//;led_driver.c: 49: if (led->remain_blink_ms == 0) {
		LDR 	76H, 0H 			//019D 	1876
		STR 	6H 			//019E 	1086
		CLRF 	7H 			//019F 	1187
		MOVIW 	FSR1++ 		//01A0 	1016
		IORWR 	1H, 0H 		//01A1 	1401
		BTSS 	3H, 2H 			//01A2 	2D03
		RET 					//01A3 	1008

		//;led_driver.c: 50: led->toggle_tick = 0;
		LDR 	76H, 0H 			//01A4 	1876
		ADDWI 	2H 			//01A5 	0E02
		LCALL 	339H 			//01A6 	3339
		MOVLP 	0H 			//01A7 	0180

		//;led_driver.c: 51: if (led->hw_off) led->hw_off();
		LDR 	76H, 0H 			//01A8 	1876
		ADDWI 	8H 			//01A9 	0E08
		STR 	6H 			//01AA 	1086
		MOVIW 	FSR1++ 		//01AB 	1016
		IORWR 	1H, 0H 		//01AC 	1401
		BTSC 	3H, 2H 			//01AD 	2903
		RET 					//01AE 	1008
		LDR 	76H, 0H 			//01AF 	1876
		MOVLP 	5H 			//01B0 	0185
		LCALL 	5F8H 			//01B1 	35F8
		MOVLP 	0H 			//01B2 	0180
		STR 	AH 			//01B3 	108A
		MOVIW 	0H[1] 			//01B4 	0F40
		CALLW 					//01B5 	100A
		MOVLP 	1H 			//01B6 	0181
		RET 					//01B7 	1008
		STR 	79H 			//01B8 	10F9

		//;motor_driver.c: 59: if (!(motor->current_state == MOTOR_ST_OPENING ||
		//;motor_driver.c: 60: motor->current_state == MOTOR_ST_CLOSING))
		STR 	6H 			//01B9 	1086
		LDWI 	3H 			//01BA 	0003
		CLRF 	7H 			//01BB 	1187
		XORWR 	1H, 0H 		//01BC 	1601
		BTSC 	3H, 2H 			//01BD 	2903
		LJUMP 	1C5H 			//01BE 	39C5
		LDR 	79H, 0H 			//01BF 	1879
		STR 	6H 			//01C0 	1086
		LDWI 	4H 			//01C1 	0004
		XORWR 	1H, 0H 		//01C2 	1601
		BTSS 	3H, 2H 			//01C3 	2D03
		RET 					//01C4 	1008

		//;motor_driver.c: 63: motor->running_ms++;
		INCR 	79H, 0H 		//01C5 	1A79
		LCALL 	34AH 			//01C6 	334A
		MOVLP 	0H 			//01C7 	0180
		BTSC 	3H, 0H 			//01C8 	2803
		INCR 	1H, 1H 			//01C9 	1A81

		//;motor_driver.c: 65: if (PB0 == 0 || PA0 == 0) {
		BTSS 	DH, 0H 			//01CA 	2C0D
		LJUMP 	1CEH 			//01CB 	39CE
		BTSC 	CH, 0H 			//01CC 	280C
		LJUMP 	1D0H 			//01CD 	39D0

		//;motor_driver.c: 66: Motor_Arrived(motor);
		LDR 	79H, 0H 			//01CE 	1879
		LJUMP 	2EEH 			//01CF 	3AEE

		//;motor_driver.c: 67: } else if (motor->running_ms >= 5000) {
		INCR 	79H, 0H 		//01D0 	1A79
		STR 	6H 			//01D1 	1086
		CLRF 	7H 			//01D2 	1187
		MOVIW 	0H[1] 			//01D3 	0F40
		STR 	77H 			//01D4 	10F7
		MOVIW 	1H[1] 			//01D5 	0F41
		STR 	78H 			//01D6 	10F8
		LDWI 	13H 			//01D7 	0013
		SUBWR 	78H, 0H 		//01D8 	1278
		LDWI 	88H 			//01D9 	0088
		BTSC 	3H, 2H 			//01DA 	2903
		SUBWR 	77H, 0H 		//01DB 	1277
		BTSS 	3H, 0H 			//01DC 	2C03
		RET 					//01DD 	1008

		//;motor_driver.c: 68: Motor_Stop_And_Clear(motor);
		LDR 	79H, 0H 			//01DE 	1879
		LCALL 	1F3H 			//01DF 	31F3
		MOVLP 	0H 			//01E0 	0180

		//;motor_driver.c: 69: if (motor->on_jammed_error) motor->on_jammed_error();
		LDR 	79H, 0H 			//01E1 	1879
		ADDWI 	9H 			//01E2 	0E09
		STR 	6H 			//01E3 	1086
		CLRF 	7H 			//01E4 	1187
		MOVIW 	FSR1++ 		//01E5 	1016
		IORWR 	1H, 0H 		//01E6 	1401
		BTSC 	3H, 2H 			//01E7 	2903
		RET 					//01E8 	1008
		LDR 	79H, 0H 			//01E9 	1879
		ADDWI 	9H 			//01EA 	0E09
		STR 	6H 			//01EB 	1086
		CLRF 	7H 			//01EC 	1187
		MOVIW 	1H[1] 			//01ED 	0F41
		STR 	AH 			//01EE 	108A
		MOVIW 	0H[1] 			//01EF 	0F40
		CALLW 					//01F0 	100A
		MOVLP 	1H 			//01F1 	0181
		RET 					//01F2 	1008
		STR 	74H 			//01F3 	10F4

		//;motor_driver.c: 51: if (!motor) return;
		LDR 	74H, 0H 			//01F4 	1874
		BTSC 	3H, 2H 			//01F5 	2903
		RET 					//01F6 	1008

		//;motor_driver.c: 52: if (motor->hw_stop) motor->hw_stop();
		LCALL 	33FH 			//01F7 	333F
		MOVLP 	0H 			//01F8 	0180
		BTSC 	3H, 2H 			//01F9 	2903
		LJUMP 	201H 			//01FA 	3A01
		LDR 	74H, 0H 			//01FB 	1874
		LCALL 	345H 			//01FC 	3345
		STR 	AH 			//01FD 	108A
		MOVIW 	0H[1] 			//01FE 	0F40
		CALLW 					//01FF 	100A
		MOVLP 	2H 			//0200 	0182

		//;motor_driver.c: 53: motor->current_state = MOTOR_ST_UNKNOWN;
		LDR 	74H, 0H 			//0201 	1874
		STR 	6H 			//0202 	1086
		CLRF 	7H 			//0203 	1187
		CLRF 	1H 			//0204 	1181

		//;motor_driver.c: 54: motor->running_ms = 0;
		INCR 	74H, 0H 		//0205 	1A74
		LJUMP 	EDH 			//0206 	38ED

		//;rf433.c: 90: if (PB7 == 0) {
		MOVLB 	0H 			//0207 	1020
		BTSC 	DH, 7H 			//0208 	2B8D
		LJUMP 	20DH 			//0209 	3A0D

		//;rf433.c: 91: ll_w++;
		INCR 	25H, 1H 		//020A 	1AA5

		//;rf433.c: 92: (flag &= ~0x02);
		BCR 	20H, 1H 			//020B 	20A0

		//;rf433.c: 93: } else {
		LJUMP 	278H 			//020C 	3A78

		//;rf433.c: 95: hh_w++;
		INCR 	24H, 1H 		//020D 	1AA4

		//;rf433.c: 96: if (!((flag & 0x02))) {
		BTSC 	20H, 1H 		//020E 	28A0
		LJUMP 	278H 			//020F 	3A78

		//;rf433.c: 98: if ((hh_w >= 2 && hh_w <= 5) && (ll_w >= 15 && ll_w <= 25)) {
		LDWI 	2H 			//0210 	0002
		SUBWR 	24H, 0H 		//0211 	1224
		BTSS 	3H, 0H 			//0212 	2C03
		LJUMP 	225H 			//0213 	3A25
		LDWI 	6H 			//0214 	0006
		SUBWR 	24H, 0H 		//0215 	1224
		BTSC 	3H, 0H 			//0216 	2803
		LJUMP 	225H 			//0217 	3A25
		LDWI 	FH 			//0218 	000F
		SUBWR 	25H, 0H 		//0219 	1225
		BTSS 	3H, 0H 			//021A 	2C03
		LJUMP 	225H 			//021B 	3A25
		LDWI 	1AH 			//021C 	001A
		SUBWR 	25H, 0H 		//021D 	1225
		BTSC 	3H, 0H 			//021E 	2803
		LJUMP 	225H 			//021F 	3A25

		//;rf433.c: 100: if (pre_cnt < 255) pre_cnt++;
		INCR 	2AH, 0H 		//0220 	1A2A
		BTSC 	3H, 2H 			//0221 	2903
		LJUMP 	274H 			//0222 	3A74
		INCR 	2AH, 1H 		//0223 	1AAA

		//;rf433.c: 102: } else if (
		LJUMP 	274H 			//0224 	3A74

		//;rf433.c: 103: (pre_cnt >= 5)
		//;rf433.c: 104: &&
		//;rf433.c: 105: (hh_w >= 2 && hh_w <= 5) && (ll_w >= 80 && ll_w <= 165)
		//;rf433.c: 106: ) {
		LDWI 	5H 			//0225 	0005
		SUBWR 	2AH, 0H 		//0226 	122A
		BTSS 	3H, 0H 			//0227 	2C03
		LJUMP 	240H 			//0228 	3A40
		LDWI 	2H 			//0229 	0002
		SUBWR 	24H, 0H 		//022A 	1224
		BTSS 	3H, 0H 			//022B 	2C03
		LJUMP 	240H 			//022C 	3A40
		LDWI 	6H 			//022D 	0006
		SUBWR 	24H, 0H 		//022E 	1224
		BTSC 	3H, 0H 			//022F 	2803
		LJUMP 	240H 			//0230 	3A40
		LDWI 	50H 			//0231 	0050
		SUBWR 	25H, 0H 		//0232 	1225
		BTSS 	3H, 0H 			//0233 	2C03
		LJUMP 	240H 			//0234 	3A40
		LDWI 	A6H 			//0235 	00A6
		SUBWR 	25H, 0H 		//0236 	1225
		BTSC 	3H, 0H 			//0237 	2803
		LJUMP 	240H 			//0238 	3A40

		//;rf433.c: 109: (flag |= 0x04);
		BSR 	20H, 2H 			//0239 	2520

		//;rf433.c: 110: pre_cnt = 0;
		CLRF 	2AH 			//023A 	11AA

		//;rf433.c: 112: ma_x = 0;
		CLRF 	29H 			//023B 	11A9

		//;rf433.c: 113: t_code1 = 0; t_code2 = 0; t_code3 = 0;
		CLRF 	26H 			//023C 	11A6
		CLRF 	27H 			//023D 	11A7
		CLRF 	28H 			//023E 	11A8

		//;rf433.c: 114: } else if (((flag & 0x04)) && (ll_w >= 7 && ll_w <= 13)) {
		LJUMP 	274H 			//023F 	3A74
		BTSS 	20H, 2H 		//0240 	2D20
		LJUMP 	253H 			//0241 	3A53
		LDWI 	7H 			//0242 	0007
		SUBWR 	25H, 0H 		//0243 	1225
		BTSS 	3H, 0H 			//0244 	2C03
		LJUMP 	253H 			//0245 	3A53
		LDWI 	EH 			//0246 	000E
		SUBWR 	25H, 0H 		//0247 	1225
		BTSC 	3H, 0H 			//0248 	2803
		LJUMP 	253H 			//0249 	3A53
		LDWI 	18H 			//024A 	0018

		//;rf433.c: 116: ma_x++;
		INCR 	29H, 1H 		//024B 	1AA9

		//;rf433.c: 117: if (ma_x > 23) {
		SUBWR 	29H, 0H 		//024C 	1229
		BTSC 	3H, 0H 			//024D 	2803

		//;rf433.c: 118: if (!(flag & 0x01)) save_code();
		BTSC 	20H, 0H 		//024E 	2820
		LJUMP 	274H 			//024F 	3A74
		LCALL 	28DH 			//0250 	328D
		MOVLP 	0H 			//0251 	0180
		LJUMP 	274H 			//0252 	3A74
		BTSS 	20H, 2H 		//0253 	2D20
		LJUMP 	26DH 			//0254 	3A6D
		LDWI 	2H 			//0255 	0002
		SUBWR 	25H, 0H 		//0256 	1225
		BTSS 	3H, 0H 			//0257 	2C03
		LJUMP 	26DH 			//0258 	3A6D
		LDWI 	8H 			//0259 	0008
		SUBWR 	25H, 0H 		//025A 	1225
		BTSC 	3H, 0H 			//025B 	2803
		LJUMP 	26DH 			//025C 	3A6D

		//;rf433.c: 122: if (ma_x <= 23) {
		LDWI 	18H 			//025D 	0018
		SUBWR 	29H, 0H 		//025E 	1229
		BTSC 	3H, 0H 			//025F 	2803
		LJUMP 	274H 			//0260 	3A74

		//;rf433.c: 123: set_bit(ma_x);
		LDR 	29H, 0H 			//0261 	1829
		LCALL 	29AH 			//0262 	329A
		MOVLP 	0H 			//0263 	0180

		//;rf433.c: 124: if (ma_x == 23) {
		LDWI 	17H 			//0264 	0017
		XORWR 	29H, 0H 		//0265 	1629
		BTSC 	3H, 2H 			//0266 	2903

		//;rf433.c: 125: if (!(flag & 0x01)) save_code();
		BTSC 	20H, 0H 		//0267 	2820
		LJUMP 	26BH 			//0268 	3A6B
		LCALL 	28DH 			//0269 	328D
		MOVLP 	0H 			//026A 	0180

		//;rf433.c: 126: }
		//;rf433.c: 127: ma_x++;
		INCR 	29H, 1H 		//026B 	1AA9
		LJUMP 	274H 			//026C 	3A74

		//;rf433.c: 131: pre_cnt = 0;
		CLRF 	2AH 			//026D 	11AA

		//;rf433.c: 132: ma_x = 0; (flag &= ~0x04);
		CLRF 	29H 			//026E 	11A9
		BCR 	20H, 2H 			//026F 	2120

		//;rf433.c: 133: t_code1 = 0; t_code2 = 0; t_code3 = 0;
		CLRF 	26H 			//0270 	11A6
		CLRF 	27H 			//0271 	11A7
		CLRF 	28H 			//0272 	11A8

		//;rf433.c: 134: ll_w = 0;
		CLRF 	25H 			//0273 	11A5

		//;rf433.c: 135: }
		//;rf433.c: 136: ll_w = 0;
		CLRF 	25H 			//0274 	11A5

		//;rf433.c: 137: hh_w = 1;
		CLRF 	24H 			//0275 	11A4
		INCR 	24H, 1H 		//0276 	1AA4

		//;rf433.c: 138: }
		//;rf433.c: 139: (flag |= 0x02);
		BSR 	20H, 1H 			//0277 	24A0

		//;rf433.c: 140: }
		//;rf433.c: 143: if ((flag & 0x01)) {
		BTSS 	20H, 0H 		//0278 	2C20
		LJUMP 	28AH 			//0279 	3A8A

		//;rf433.c: 144: s--;
		LDWI 	1H 			//027A 	0001
		SUBWR 	35H, 1H 		//027B 	12B5
		LDWI 	0H 			//027C 	0000
		SUBWFB 	36H, 1H 		//027D 	0BB6

		//;rf433.c: 145: if (!s) {
		LDR 	35H, 0H 			//027E 	1835
		IORWR 	36H, 0H 		//027F 	1436
		BTSC 	3H, 2H 			//0280 	2903

		//;rf433.c: 146: (flag &= ~0x01);
		BCR 	20H, 0H 			//0281 	2020

		//;rf433.c: 147: }
		//;rf433.c: 149: rf_data[0] = a_code1;
		LDR 	21H, 0H 			//0282 	1821
		STR 	2EH 			//0283 	10AE

		//;rf433.c: 150: rf_data[1] = a_code2;
		LDR 	22H, 0H 			//0284 	1822
		STR 	2FH 			//0285 	10AF

		//;rf433.c: 151: rf_data[2] = a_code3;
		LDR 	23H, 0H 			//0286 	1823
		STR 	30H 			//0287 	10B0

		//;rf433.c: 152: rf_data_ready = 1;
		LDWI 	1H 			//0288 	0001
		STR 	3BH 			//0289 	10BB

		//;rf433.c: 153: }
		//;rf433.c: 156: T1UIF = 1;
		MOVLB 	4H 			//028A 	1024
		BSR 	16H, 0H 			//028B 	2416
		RET 					//028C 	1008

		//;rf433.c: 78: a_code1 = t_code1;
		LDR 	26H, 0H 			//028D 	1826
		STR 	21H 			//028E 	10A1

		//;rf433.c: 79: a_code2 = t_code2;
		LDR 	27H, 0H 			//028F 	1827
		STR 	22H 			//0290 	10A2

		//;rf433.c: 80: a_code3 = t_code3;
		LDR 	28H, 0H 			//0291 	1828
		STR 	23H 			//0292 	10A3
		LDWI 	E8H 			//0293 	00E8

		//;rf433.c: 81: (flag |= 0x01);
		BSR 	20H, 0H 			//0294 	2420
		BCR 	20H, 2H 			//0295 	2120

		//;rf433.c: 83: s = 1000;
		STR 	35H 			//0296 	10B5
		LDWI 	3H 			//0297 	0003
		STR 	36H 			//0298 	10B6
		RET 					//0299 	1008
		STR 	77H 			//029A 	10F7

		//;rf433.c: 70: unsigned char mask = (unsigned char)(0x80 >> (bit_idx & 0x07));
		ANDWI 	7H 			//029B 	0907
		STR 	72H 			//029C 	10F2
		LDWI 	80H 			//029D 	0080
		INCR 	72H, 1H 		//029E 	1AF2
		STR 	73H 			//029F 	10F3
		LDWI 	0H 			//02A0 	0000
		STR 	74H 			//02A1 	10F4
		LJUMP 	2A6H 			//02A2 	3AA6
		RLR 	74H, 0H 			//02A3 	1D74
		RRR 	74H, 1H 			//02A4 	1CF4
		RRR 	73H, 1H 			//02A5 	1CF3
		DECRSZ 	72H, 1H 		//02A6 	1BF2
		LJUMP 	2A3H 			//02A7 	3AA3
		LDR 	73H, 0H 			//02A8 	1873
		STR 	76H 			//02A9 	10F6

		//;rf433.c: 71: if (bit_idx < 8) t_code1 |= mask;
		LDWI 	8H 			//02AA 	0008
		SUBWR 	77H, 0H 		//02AB 	1277
		BTSC 	3H, 0H 			//02AC 	2803
		LJUMP 	2B2H 			//02AD 	3AB2
		LDR 	76H, 0H 			//02AE 	1876
		MOVLB 	0H 			//02AF 	1020
		IORWR 	26H, 1H 		//02B0 	14A6
		RET 					//02B1 	1008

		//;rf433.c: 72: else if (bit_idx < 16) t_code2 |= (unsigned char)(0x80 >> ((bit_idx - 8) &
		//+                           0x07));
		LDWI 	10H 			//02B2 	0010
		SUBWR 	77H, 0H 		//02B3 	1277
		BTSC 	3H, 0H 			//02B4 	2803
		LJUMP 	2BAH 			//02B5 	3ABA
		LDWI 	F8H 			//02B6 	00F8
		LCALL 	327H 			//02B7 	3327
		IORWR 	27H, 1H 		//02B8 	14A7
		RET 					//02B9 	1008

		//;rf433.c: 73: else t_code3 |= (unsigned char)(0x80 >> ((bit_idx - 16) & 0x07));
		LDWI 	F0H 			//02BA 	00F0
		LCALL 	327H 			//02BB 	3327
		IORWR 	28H, 1H 		//02BC 	14A8
		RET 					//02BD 	1008

		//;uart_wifi.c: 37: if (URRXNE && RXNEF) {
		MOVLB 	9H 			//02BE 	1029
		BTSC 	EH, 0H 			//02BF 	280E
		BTSS 	12H, 0H 		//02C0 	2C12
		LJUMP 	2DAH 			//02C1 	3ADA

		//;uart_wifi.c: 38: uint8_t byte = URDATAL;
		LDR 	CH, 0H 			//02C2 	180C
		STR 	72H 			//02C3 	10F2

		//;uart_wifi.c: 39: if (rx_len < 10) {
		LDWI 	AH 			//02C4 	000A
		SUBWR 	7BH, 0H 		//02C5 	127B
		BTSC 	3H, 0H 			//02C6 	2803
		LJUMP 	2CFH 			//02C7 	3ACF

		//;uart_wifi.c: 40: rx_buf[rx_len++] = byte;
		LDR 	7BH, 0H 			//02C8 	187B
		ADDWI 	ABH 			//02C9 	0EAB
		STR 	6H 			//02CA 	1086
		CLRF 	7H 			//02CB 	1187
		LDR 	72H, 0H 			//02CC 	1872
		STR 	1H 			//02CD 	1081
		INCR 	7BH, 1H 		//02CE 	1AFB

		//;uart_wifi.c: 41: }
		//;uart_wifi.c: 43: if (byte == '\n' || rx_len >= 10) {
		LDWI 	AH 			//02CF 	000A
		XORWR 	72H, 0H 		//02D0 	1672
		BTSC 	3H, 2H 			//02D1 	2903
		LJUMP 	2D7H 			//02D2 	3AD7
		LDWI 	AH 			//02D3 	000A
		SUBWR 	7BH, 0H 		//02D4 	127B
		BTSS 	3H, 0H 			//02D5 	2C03
		LJUMP 	2DAH 			//02D6 	3ADA

		//;uart_wifi.c: 44: rx_flag = 1;
		LDWI 	1H 			//02D7 	0001
		MOVLB 	0H 			//02D8 	1020
		STR 	3EH 			//02D9 	10BE

		//;uart_wifi.c: 45: }
		//;uart_wifi.c: 46: }
		//;uart_wifi.c: 48: if (TCEN && TCF) {
		MOVLB 	9H 			//02DA 	1029
		BTSC 	EH, 5H 			//02DB 	2A8E
		BTSS 	1CH, 0H 		//02DC 	2C1C
		RET 					//02DD 	1008

		//;uart_wifi.c: 49: TCF = 1;
		BSR 	1CH, 0H 			//02DE 	241C

		//;uart_wifi.c: 50: if (tx_idx < tx_total) {
		MOVLB 	0H 			//02DF 	1020
		LDR 	3DH, 0H 			//02E0 	183D
		SUBWR 	3CH, 0H 		//02E1 	123C
		BTSC 	3H, 0H 			//02E2 	2803
		RET 					//02E3 	1008

		//;uart_wifi.c: 51: URDATAL = tx_buf[tx_idx++];
		LDR 	3CH, 0H 			//02E4 	183C
		ADDWI 	A0H 			//02E5 	0EA0
		STR 	6H 			//02E6 	1086
		CLRF 	7H 			//02E7 	1187
		LDR 	1H, 0H 			//02E8 	1801
		MOVLB 	9H 			//02E9 	1029
		STR 	CH 			//02EA 	108C
		MOVLB 	0H 			//02EB 	1020
		INCR 	3CH, 1H 		//02EC 	1ABC
		RET 					//02ED 	1008
		STR 	74H 			//02EE 	10F4

		//;motor_driver.c: 39: if (!motor) return;
		LDR 	74H, 0H 			//02EF 	1874
		BTSC 	3H, 2H 			//02F0 	2903
		RET 					//02F1 	1008

		//;motor_driver.c: 40: if (motor->hw_stop) motor->hw_stop();
		LCALL 	33FH 			//02F2 	333F
		MOVLP 	0H 			//02F3 	0180
		BTSC 	3H, 2H 			//02F4 	2903
		LJUMP 	2FCH 			//02F5 	3AFC
		LDR 	74H, 0H 			//02F6 	1874
		LCALL 	345H 			//02F7 	3345
		STR 	AH 			//02F8 	108A
		MOVIW 	0H[1] 			//02F9 	0F40
		CALLW 					//02FA 	100A
		MOVLP 	2H 			//02FB 	0182

		//;motor_driver.c: 41: if (motor->current_state == MOTOR_ST_OPENING)
		LDR 	74H, 0H 			//02FC 	1874
		STR 	6H 			//02FD 	1086
		LDWI 	3H 			//02FE 	0003
		CLRF 	7H 			//02FF 	1187
		XORWR 	1H, 0H 		//0300 	1601
		BTSS 	3H, 2H 			//0301 	2D03
		LJUMP 	308H 			//0302 	3B08

		//;motor_driver.c: 42: motor->current_state = MOTOR_ST_OPENED;
		LDR 	74H, 0H 			//0303 	1874
		STR 	6H 			//0304 	1086
		CLRF 	1H 			//0305 	1181
		INCR 	1H, 1H 			//0306 	1A81
		LJUMP 	313H 			//0307 	3B13

		//;motor_driver.c: 43: else if (motor->current_state == MOTOR_ST_CLOSING)
		LDR 	74H, 0H 			//0308 	1874
		STR 	6H 			//0309 	1086
		LDWI 	4H 			//030A 	0004
		CLRF 	7H 			//030B 	1187
		XORWR 	1H, 0H 		//030C 	1601
		BTSS 	3H, 2H 			//030D 	2D03
		LJUMP 	313H 			//030E 	3B13

		//;motor_driver.c: 44: motor->current_state = MOTOR_ST_CLOSED;
		LDR 	74H, 0H 			//030F 	1874
		STR 	6H 			//0310 	1086
		LDWI 	2H 			//0311 	0002
		STR 	1H 			//0312 	1081

		//;motor_driver.c: 45: motor->running_ms = 0;
		INCR 	74H, 0H 		//0313 	1A74
		LCALL 	339H 			//0314 	3339
		MOVLP 	0H 			//0315 	0180

		//;motor_driver.c: 46: if (motor->on_arrived) motor->on_arrived();
		LDR 	74H, 0H 			//0316 	1874
		ADDWI 	BH 			//0317 	0E0B
		STR 	6H 			//0318 	1086
		MOVIW 	FSR1++ 		//0319 	1016
		IORWR 	1H, 0H 		//031A 	1401
		BTSC 	3H, 2H 			//031B 	2903
		RET 					//031C 	1008
		LDR 	74H, 0H 			//031D 	1874
		ADDWI 	BH 			//031E 	0E0B
		STR 	6H 			//031F 	1086
		CLRF 	7H 			//0320 	1187
		MOVIW 	1H[1] 			//0321 	0F41
		STR 	AH 			//0322 	108A
		MOVIW 	0H[1] 			//0323 	0F40
		CALLW 					//0324 	100A
		MOVLP 	3H 			//0325 	0183
		RET 					//0326 	1008
		ADDWR 	77H, 0H 		//0327 	1777
		STR 	72H 			//0328 	10F2
		ANDWI 	7H 			//0329 	0907
		STR 	73H 			//032A 	10F3
		LDWI 	80H 			//032B 	0080
		INCR 	73H, 1H 		//032C 	1AF3
		STR 	74H 			//032D 	10F4
		LDWI 	0H 			//032E 	0000
		STR 	75H 			//032F 	10F5
		LJUMP 	334H 			//0330 	3B34
		RLR 	75H, 0H 			//0331 	1D75
		RRR 	75H, 1H 			//0332 	1CF5
		RRR 	74H, 1H 			//0333 	1CF4
		DECRSZ 	73H, 1H 		//0334 	1BF3
		LJUMP 	331H 			//0335 	3B31
		LDR 	74H, 0H 			//0336 	1874
		MOVLB 	0H 			//0337 	1020
		RET 					//0338 	1008
		STR 	6H 			//0339 	1086
		LDWI 	0H 			//033A 	0000
		CLRF 	7H 			//033B 	1187
		MOVWI 	0H[1] 			//033C 	0FC0
		MOVWI 	1H[1] 			//033D 	0FC1
		RET 					//033E 	1008
		ADDWI 	7H 			//033F 	0E07
		STR 	6H 			//0340 	1086
		CLRF 	7H 			//0341 	1187
		MOVIW 	FSR1++ 		//0342 	1016
		IORWR 	1H, 0H 		//0343 	1401
		RET 					//0344 	1008
		ADDWI 	7H 			//0345 	0E07
		STR 	6H 			//0346 	1086
		CLRF 	7H 			//0347 	1187
		MOVIW 	1H[1] 			//0348 	0F41
		RET 					//0349 	1008
		STR 	6H 			//034A 	1086
		LDWI 	1H 			//034B 	0001
		CLRF 	7H 			//034C 	1187
		ADDWR 	1H, 1H 		//034D 	1781
		ADDFSR 	1H, 1H 		//034E 	0141
		RET 					//034F 	1008
		LDWI 	3FH 			//0350 	003F
		LCALL 	36CH 			//0351 	336C
		MOVLP 	3H 			//0352 	0183
		LDWI 	4CH 			//0353 	004C
		LJUMP 	519H 			//0354 	3D19
		LDWI 	3FH 			//0355 	003F
		LCALL 	390H 			//0356 	3390
		MOVLP 	3H 			//0357 	0183
		LDWI 	4CH 			//0358 	004C
		LJUMP 	519H 			//0359 	3D19

		//;app.c: 54: if (g_motor.current_state == MOTOR_ST_OPENED ||
		//;app.c: 55: g_motor.current_state == MOTOR_ST_OPENING||
		//;app.c: 56: g_motor.current_state == MOTOR_ST_UNKNOWN ) {
		DECR 	3FH, 0H 		//035A 	133F
		BTSC 	3H, 2H 			//035B 	2903
		LJUMP 	363H 			//035C 	3B63
		LDWI 	3H 			//035D 	0003
		XORWR 	3FH, 0H 		//035E 	163F
		BTSS 	3H, 2H 			//035F 	2D03
		LDR 	3FH, 0H 			//0360 	183F
		BTSS 	3H, 2H 			//0361 	2D03
		LJUMP 	367H 			//0362 	3B67

		//;app.c: 57: Motor_Close(&g_motor);
		LDWI 	3FH 			//0363 	003F
		LCALL 	36CH 			//0364 	336C
		MOVLP 	3H 			//0365 	0183

		//;app.c: 58: } else {
		LJUMP 	36AH 			//0366 	3B6A

		//;app.c: 59: Motor_Open(&g_motor);
		LDWI 	3FH 			//0367 	003F
		LCALL 	390H 			//0368 	3390
		MOVLP 	3H 			//0369 	0183

		//;app.c: 60: }
		//;app.c: 61: LED_On(&g_led1);
		LDWI 	4CH 			//036A 	004C
		LJUMP 	519H 			//036B 	3D19
		STR 	5AH 			//036C 	10DA

		//;motor_driver.c: 30: if (!motor) return;
		LDR 	5AH, 0H 			//036D 	185A
		BTSC 	3H, 2H 			//036E 	2903
		RET 					//036F 	1008

		//;motor_driver.c: 31: if (motor->current_state == MOTOR_ST_CLOSED) return;
		STR 	6H 			//0370 	1086
		LDWI 	2H 			//0371 	0002
		CLRF 	7H 			//0372 	1187
		XORWR 	1H, 0H 		//0373 	1601
		BTSC 	3H, 2H 			//0374 	2903
		RET 					//0375 	1008

		//;motor_driver.c: 32: motor->current_state = MOTOR_ST_CLOSING;
		LDR 	5AH, 0H 			//0376 	185A
		STR 	6H 			//0377 	1086
		LDWI 	4H 			//0378 	0004
		STR 	1H 			//0379 	1081

		//;motor_driver.c: 33: motor->running_ms = 0;
		INCR 	5AH, 0H 		//037A 	1A5A
		STR 	6H 			//037B 	1086
		LDWI 	0H 			//037C 	0000
		MOVWI 	0H[1] 			//037D 	0FC0
		MOVWI 	1H[1] 			//037E 	0FC1

		//;motor_driver.c: 34: if (motor->hw_close) motor->hw_close();
		LDR 	5AH, 0H 			//037F 	185A
		ADDWI 	5H 			//0380 	0E05
		STR 	6H 			//0381 	1086
		MOVIW 	FSR1++ 		//0382 	1016
		IORWR 	1H, 0H 		//0383 	1401
		BTSC 	3H, 2H 			//0384 	2903
		RET 					//0385 	1008
		LDR 	5AH, 0H 			//0386 	185A
		ADDWI 	5H 			//0387 	0E05
		STR 	6H 			//0388 	1086
		CLRF 	7H 			//0389 	1187
		MOVIW 	1H[1] 			//038A 	0F41
		STR 	AH 			//038B 	108A
		MOVIW 	0H[1] 			//038C 	0F40
		CALLW 					//038D 	100A
		MOVLP 	3H 			//038E 	0183
		RET 					//038F 	1008
		STR 	5AH 			//0390 	10DA

		//;motor_driver.c: 21: if (!motor) return;
		LDR 	5AH, 0H 			//0391 	185A
		BTSC 	3H, 2H 			//0392 	2903
		RET 					//0393 	1008

		//;motor_driver.c: 22: if (motor->current_state == MOTOR_ST_OPENED) return;
		STR 	6H 			//0394 	1086
		CLRF 	7H 			//0395 	1187
		DECRSZ 	1H, 0H 		//0396 	1B01
		LJUMP 	399H 			//0397 	3B99
		RET 					//0398 	1008

		//;motor_driver.c: 23: motor->current_state = MOTOR_ST_OPENING;
		LDR 	5AH, 0H 			//0399 	185A
		STR 	6H 			//039A 	1086
		LDWI 	3H 			//039B 	0003
		CLRF 	7H 			//039C 	1187
		STR 	1H 			//039D 	1081

		//;motor_driver.c: 24: motor->running_ms = 0;
		INCR 	5AH, 0H 		//039E 	1A5A
		STR 	6H 			//039F 	1086
		LDWI 	0H 			//03A0 	0000
		MOVWI 	0H[1] 			//03A1 	0FC0
		MOVWI 	1H[1] 			//03A2 	0FC1

		//;motor_driver.c: 25: if (motor->hw_open) motor->hw_open();
		LDR 	5AH, 0H 			//03A3 	185A
		ADDWI 	3H 			//03A4 	0E03
		STR 	6H 			//03A5 	1086
		MOVIW 	FSR1++ 		//03A6 	1016
		IORWR 	1H, 0H 		//03A7 	1401
		BTSC 	3H, 2H 			//03A8 	2903
		RET 					//03A9 	1008
		LDR 	5AH, 0H 			//03AA 	185A
		ADDWI 	3H 			//03AB 	0E03
		STR 	6H 			//03AC 	1086
		CLRF 	7H 			//03AD 	1187
		MOVIW 	1H[1] 			//03AE 	0F41
		STR 	AH 			//03AF 	108A
		MOVIW 	0H[1] 			//03B0 	0F40
		CALLW 					//03B1 	100A
		MOVLP 	3H 			//03B2 	0183
		RET 					//03B3 	1008
		LDWI 	1H 			//03B4 	0001
		STR 	65H 			//03B5 	10E5
		LDWI 	2BH 			//03B6 	002B
		CLRF 	7AH 			//03B7 	11FA
		CLRF 	7BH 			//03B8 	11FB
		STR 	4H 			//03B9 	1084
		LDWI 	0H 			//03BA 	0000
		STR 	5H 			//03BB 	1085
		LDWI 	2DH 			//03BC 	002D
		MOVLP 	6H 			//03BD 	0186
		LCALL 	664H 			//03BE 	3664
		MOVLP 	3H 			//03BF 	0183
		LDWI 	A0H 			//03C0 	00A0
		STR 	4H 			//03C1 	1084
		LDWI 	0H 			//03C2 	0000
		STR 	5H 			//03C3 	1085
		LDWI 	21H 			//03C4 	0021
		MOVLP 	6H 			//03C5 	0186
		LCALL 	664H 			//03C6 	3664
		MOVLP 	3H 			//03C7 	0183
		BCR 	7EH, 0H 			//03C8 	207E
		MOVLB 	0H 			//03C9 	1020
		LJUMP 	3CBH 			//03CA 	3BCB

		//;main.c: 30: hal_gpio_init();
		LCALL 	5A9H 			//03CB 	35A9
		MOVLP 	3H 			//03CC 	0183

		//;main.c: 31: UART_WiFi_Init();
		LCALL 	599H 			//03CD 	3599
		MOVLP 	3H 			//03CE 	0183

		//;main.c: 32: RF433_Init();
		LCALL 	576H 			//03CF 	3576
		MOVLP 	3H 			//03D0 	0183

		//;main.c: 33: hal_tim4_init();
		LCALL 	5D1H 			//03D1 	35D1
		MOVLP 	3H 			//03D2 	0183

		//;main.c: 34: App_Init();
		LCALL 	3D8H 			//03D3 	33D8
		MOVLP 	3H 			//03D4 	0183

		//;main.c: 38: App_Run();
		LCALL 	4A4H 			//03D5 	34A4
		MOVLP 	3H 			//03D6 	0183
		LJUMP 	3D5H 			//03D7 	3BD5

		//;app.c: 189: LED_Init(&g_led1, hal_led1_on, hal_led1_off, hal_led1_tog);
		LDWI 	7BH 			//03D8 	007B
		MOVLB 	0H 			//03D9 	1020
		STR 	58H 			//03DA 	10D8
		LDWI 	6H 			//03DB 	0006
		STR 	59H 			//03DC 	10D9
		LDWI 	52H 			//03DD 	0052
		STR 	5AH 			//03DE 	10DA
		LDWI 	6H 			//03DF 	0006
		STR 	5BH 			//03E0 	10DB
		LDWI 	6AH 			//03E1 	006A
		STR 	5CH 			//03E2 	10DC
		LDWI 	6H 			//03E3 	0006
		STR 	5DH 			//03E4 	10DD
		LDWI 	4CH 			//03E5 	004C
		LCALL 	43BH 			//03E6 	343B
		MOVLP 	3H 			//03E7 	0183

		//;app.c: 190: LED_Init(&g_led2, hal_led2_on, hal_led2_off, hal_led2_tog);
		LDWI 	7DH 			//03E8 	007D
		STR 	58H 			//03E9 	10D8
		LDWI 	6H 			//03EA 	0006
		STR 	59H 			//03EB 	10D9
		LDWI 	5BH 			//03EC 	005B
		STR 	5AH 			//03ED 	10DA
		LDWI 	6H 			//03EE 	0006
		STR 	5BH 			//03EF 	10DB
		LDWI 	6EH 			//03F0 	006E
		STR 	5CH 			//03F1 	10DC
		LDWI 	6H 			//03F2 	0006
		STR 	5DH 			//03F3 	10DD
		LDWI 	B5H 			//03F4 	00B5
		LCALL 	43BH 			//03F5 	343B
		MOVLP 	3H 			//03F6 	0183

		//;app.c: 191: Motor_Init(&g_motor, hal_motor_open, hal_motor_close, hal_motor_stop,
		//;app.c: 192: on_motor_jammed, on_motor_arrived);
		LDWI 	72H 			//03F7 	0072
		STR 	58H 			//03F8 	10D8
		LDWI 	6H 			//03F9 	0006
		STR 	59H 			//03FA 	10D9
		LDWI 	75H 			//03FB 	0075
		STR 	5AH 			//03FC 	10DA
		LDWI 	6H 			//03FD 	0006
		STR 	5BH 			//03FE 	10DB
		LDWI 	48H 			//03FF 	0048
		STR 	5CH 			//0400 	10DC
		LDWI 	6H 			//0401 	0006
		STR 	5DH 			//0402 	10DD
		LDWI 	EH 			//0403 	000E
		STR 	5EH 			//0404 	10DE
		LDWI 	0H 			//0405 	0000
		STR 	5FH 			//0406 	10DF
		LDWI 	78H 			//0407 	0078
		STR 	60H 			//0408 	10E0
		LDWI 	6H 			//0409 	0006
		STR 	61H 			//040A 	10E1
		LDWI 	3FH 			//040B 	003F
		LCALL 	468H 			//040C 	3468
		MOVLP 	3H 			//040D 	0183

		//;app.c: 194: if (hal_eeprom_read(0x03U) == 0x5AU) {
		LDWI 	3H 			//040E 	0003
		LCALL 	423H 			//040F 	3423
		MOVLP 	3H 			//0410 	0183
		XORWI 	5AH 			//0411 	0A5A
		BTSS 	3H, 2H 			//0412 	2D03
		LJUMP 	41FH 			//0413 	3C1F

		//;app.c: 195: g_pairedCode[0] = hal_eeprom_read(0x00U);
		LDWI 	0H 			//0414 	0000
		LCALL 	423H 			//0415 	3423
		MOVLP 	3H 			//0416 	0183
		STR 	2BH 			//0417 	10AB

		//;app.c: 196: g_pairedCode[1] = hal_eeprom_read(0x00U + 1U);
		LDWI 	1H 			//0418 	0001
		LCALL 	423H 			//0419 	3423
		MOVLP 	3H 			//041A 	0183
		STR 	2CH 			//041B 	10AC

		//;app.c: 197: g_pairedCode[2] = hal_eeprom_read(0x00U + 2U);
		LDWI 	2H 			//041C 	0002
		LCALL 	423H 			//041D 	3423
		STR 	2DH 			//041E 	10AD
		LDWI 	1H 			//041F 	0001

		//;app.c: 198: }
		//;app.c: 200: g_state = STATE_IDLE;
		CLRF 	39H 			//0420 	11B9

		//;app.c: 201: g_event = EV_START;
		STR 	3AH 			//0421 	10BA
		RET 					//0422 	1008
		STR 	58H 			//0423 	10D8

		//;hal_eeprom.c: 45: unsigned char data;
		//;hal_eeprom.c: 47: while (GIE) {
		BTSS 	BH, 7H 			//0424 	2F8B
		LJUMP 	42AH 			//0425 	3C2A

		//;hal_eeprom.c: 48: GIE = 0;
		BCR 	BH, 7H 			//0426 	238B

		//;hal_eeprom.c: 49: __nop();
		NOP 					//0427 	1000

		//;hal_eeprom.c: 50: __nop();
		NOP 					//0428 	1000
		LJUMP 	424H 			//0429 	3C24

		//;hal_eeprom.c: 51: }
		//;hal_eeprom.c: 53: EEADRL = addr;
		MOVLB 	0H 			//042A 	1020
		LDR 	58H, 0H 			//042B 	1858
		MOVLB 	3H 			//042C 	1023
		STR 	11H 			//042D 	1091

		//;hal_eeprom.c: 54: CFGS = 0;
		BCR 	15H, 6H 			//042E 	2315

		//;hal_eeprom.c: 55: EEPGD = 0;
		BCR 	15H, 7H 			//042F 	2395

		//;hal_eeprom.c: 56: RD = 1;
		BSR 	15H, 0H 			//0430 	2415

		//;hal_eeprom.c: 57: __nop();
		NOP 					//0431 	1000

		//;hal_eeprom.c: 58: __nop();
		NOP 					//0432 	1000

		//;hal_eeprom.c: 59: __nop();
		NOP 					//0433 	1000

		//;hal_eeprom.c: 60: __nop();
		NOP 					//0434 	1000

		//;hal_eeprom.c: 61: data = EEDATL;
		MOVLB 	3H 			//0435 	1023
		LDR 	13H, 0H 			//0436 	1813
		MOVLB 	0H 			//0437 	1020
		STR 	59H 			//0438 	10D9

		//;hal_eeprom.c: 62: GIE = 1;
		BSR 	BH, 7H 			//0439 	278B

		//;hal_eeprom.c: 64: return data;
		RET 					//043A 	1008
		STR 	60H 			//043B 	10E0

		//;led_driver.c: 6: led->remain_blink_ms = 0;
		MOVLP 	3H 			//043C 	0183
		LCALL 	339H 			//043D 	3339
		MOVLP 	3H 			//043E 	0183

		//;led_driver.c: 7: led->toggle_tick = 0;
		LDR 	60H, 0H 			//043F 	1860
		ADDWI 	2H 			//0440 	0E02

		//;led_driver.c: 8: led->blink_interval_ms = 0;
		LCALL 	5F2H 			//0441 	35F2
		MOVLP 	3H 			//0442 	0183
		ADDWI 	4H 			//0443 	0E04

		//;led_driver.c: 9: led->hw_on = on;
		LCALL 	5F2H 			//0444 	35F2
		MOVLP 	3H 			//0445 	0183
		ADDWI 	6H 			//0446 	0E06
		STR 	6H 			//0447 	1086
		LDR 	58H, 0H 			//0448 	1858
		MOVWI 	0H[1] 			//0449 	0FC0
		LDR 	59H, 0H 			//044A 	1859
		MOVWI 	1H[1] 			//044B 	0FC1

		//;led_driver.c: 10: led->hw_off = off;
		LDR 	60H, 0H 			//044C 	1860
		ADDWI 	8H 			//044D 	0E08
		STR 	6H 			//044E 	1086
		LDR 	5AH, 0H 			//044F 	185A
		MOVWI 	0H[1] 			//0450 	0FC0
		LDR 	5BH, 0H 			//0451 	185B
		MOVWI 	1H[1] 			//0452 	0FC1

		//;led_driver.c: 11: led->hw_toggle = toggle;
		LDR 	60H, 0H 			//0453 	1860
		ADDWI 	AH 			//0454 	0E0A
		STR 	6H 			//0455 	1086
		LDR 	5CH, 0H 			//0456 	185C
		MOVWI 	0H[1] 			//0457 	0FC0
		LDR 	5DH, 0H 			//0458 	185D
		MOVWI 	1H[1] 			//0459 	0FC1

		//;led_driver.c: 12: if (led->hw_off) led->hw_off();
		LDR 	60H, 0H 			//045A 	1860
		ADDWI 	8H 			//045B 	0E08
		STR 	6H 			//045C 	1086
		MOVIW 	FSR1++ 		//045D 	1016
		IORWR 	1H, 0H 		//045E 	1401
		BTSC 	3H, 2H 			//045F 	2903
		RET 					//0460 	1008
		LDR 	60H, 0H 			//0461 	1860
		LCALL 	5F8H 			//0462 	35F8
		STR 	AH 			//0463 	108A
		MOVIW 	0H[1] 			//0464 	0F40
		CALLW 					//0465 	100A
		MOVLP 	4H 			//0466 	0184
		RET 					//0467 	1008
		STR 	64H 			//0468 	10E4

		//;motor_driver.c: 9: motor->current_state = MOTOR_ST_UNKNOWN;
		STR 	6H 			//0469 	1086
		CLRF 	7H 			//046A 	1187
		CLRF 	1H 			//046B 	1181

		//;motor_driver.c: 10: motor->running_ms = 0;
		INCR 	64H, 0H 		//046C 	1A64
		STR 	6H 			//046D 	1086
		LDWI 	0H 			//046E 	0000
		MOVWI 	0H[1] 			//046F 	0FC0
		MOVWI 	1H[1] 			//0470 	0FC1

		//;motor_driver.c: 11: motor->hw_open = hw_open;
		LDR 	64H, 0H 			//0471 	1864
		ADDWI 	3H 			//0472 	0E03
		STR 	6H 			//0473 	1086
		LDR 	58H, 0H 			//0474 	1858
		MOVWI 	0H[1] 			//0475 	0FC0
		LDR 	59H, 0H 			//0476 	1859
		MOVWI 	1H[1] 			//0477 	0FC1

		//;motor_driver.c: 12: motor->hw_close = hw_close;
		LDR 	64H, 0H 			//0478 	1864
		ADDWI 	5H 			//0479 	0E05
		STR 	6H 			//047A 	1086
		LDR 	5AH, 0H 			//047B 	185A
		MOVWI 	0H[1] 			//047C 	0FC0
		LDR 	5BH, 0H 			//047D 	185B
		MOVWI 	1H[1] 			//047E 	0FC1

		//;motor_driver.c: 13: motor->hw_stop = hw_stop;
		LDR 	64H, 0H 			//047F 	1864
		ADDWI 	7H 			//0480 	0E07
		STR 	6H 			//0481 	1086
		LDR 	5CH, 0H 			//0482 	185C
		MOVWI 	0H[1] 			//0483 	0FC0
		LDR 	5DH, 0H 			//0484 	185D
		MOVWI 	1H[1] 			//0485 	0FC1

		//;motor_driver.c: 14: motor->on_jammed_error = on_error;
		LDR 	64H, 0H 			//0486 	1864
		ADDWI 	9H 			//0487 	0E09
		STR 	6H 			//0488 	1086
		LDR 	5EH, 0H 			//0489 	185E
		MOVWI 	0H[1] 			//048A 	0FC0
		LDR 	5FH, 0H 			//048B 	185F
		MOVWI 	1H[1] 			//048C 	0FC1

		//;motor_driver.c: 15: motor->on_arrived = on_arrived;
		LDR 	64H, 0H 			//048D 	1864
		ADDWI 	BH 			//048E 	0E0B
		STR 	6H 			//048F 	1086
		LDR 	60H, 0H 			//0490 	1860
		MOVWI 	0H[1] 			//0491 	0FC0
		LDR 	61H, 0H 			//0492 	1861
		MOVWI 	1H[1] 			//0493 	0FC1

		//;motor_driver.c: 16: if (motor->hw_stop) motor->hw_stop();
		LDR 	64H, 0H 			//0494 	1864
		ADDWI 	7H 			//0495 	0E07
		STR 	6H 			//0496 	1086
		MOVIW 	FSR1++ 		//0497 	1016
		IORWR 	1H, 0H 		//0498 	1401
		BTSC 	3H, 2H 			//0499 	2903
		RET 					//049A 	1008
		LDR 	64H, 0H 			//049B 	1864
		MOVLP 	3H 			//049C 	0183
		LCALL 	345H 			//049D 	3345
		MOVLP 	3H 			//049E 	0183
		STR 	AH 			//049F 	108A
		MOVIW 	0H[1] 			//04A0 	0F40
		CALLW 					//04A1 	100A
		MOVLP 	4H 			//04A2 	0184
		RET 					//04A3 	1008

		//;app.c: 212: unsigned char i;
		//;app.c: 213: SystemEvent_t ev;
		//;app.c: 216: if (rx_flag) {
		LDR 	3EH, 0H 			//04A4 	183E
		BTSC 	3H, 2H 			//04A5 	2903
		LJUMP 	4ACH 			//04A6 	3CAC

		//;app.c: 217: LED_On(&g_led1);
		LDWI 	4CH 			//04A7 	004C
		LCALL 	519H 			//04A8 	3519
		MOVLP 	3H 			//04A9 	0183

		//;app.c: 218: parse_wifi_frame();
		LCALL 	556H 			//04AA 	3556
		MOVLP 	3H 			//04AB 	0183

		//;app.c: 219: }
		//;app.c: 222: if (rf_data_ready) {
		MOVLB 	0H 			//04AC 	1020
		LDR 	3BH, 0H 			//04AD 	183B
		BTSC 	3H, 2H 			//04AE 	2903
		LJUMP 	4B2H 			//04AF 	3CB2

		//;app.c: 224: parse_rf433();
		LCALL 	531H 			//04B0 	3531
		MOVLP 	3H 			//04B1 	0183

		//;app.c: 225: }
		//;app.c: 228: if (g_event == EV_NONE) return;
		LDR 	3AH, 0H 			//04B2 	183A
		BTSC 	3H, 2H 			//04B3 	2903
		RET 					//04B4 	1008

		//;app.c: 230: ev = g_event;
		LDR 	3AH, 0H 			//04B5 	183A
		STR 	60H 			//04B6 	10E0

		//;app.c: 231: g_event = EV_NONE;
		CLRF 	3AH 			//04B7 	11BA

		//;app.c: 233: for (i = 0; i < (sizeof(transitions) / sizeof(Transition_t)); i++) {
		CLRF 	61H 			//04B8 	11E1

		//;app.c: 234: if (transitions[i].current == g_state && transitions[i].event == ev) {
		LCALL 	5E2H 			//04B9 	35E2
		MOVLP 	3H 			//04BA 	0183
		LCALL 	504H 			//04BB 	3504
		MOVLP 	3H 			//04BC 	0183
		LDR 	59H, 0H 			//04BD 	1859
		STR 	5H 			//04BE 	1085
		LDR 	58H, 0H 			//04BF 	1858
		STR 	4H 			//04C0 	1084
		LDWI 	FDH 			//04C1 	00FD
		ADDWR 	4H, 1H 		//04C2 	1784
		LDWI 	85H 			//04C3 	0085
		ADDWFC 	5H, 1H 		//04C4 	0D85
		LDR 	0H, 0H 			//04C5 	1800
		XORWR 	39H, 0H 		//04C6 	1639
		BTSS 	3H, 2H 			//04C7 	2D03
		LJUMP 	4FEH 			//04C8 	3CFE
		LCALL 	5E2H 			//04C9 	35E2
		MOVLP 	3H 			//04CA 	0183
		LCALL 	504H 			//04CB 	3504
		MOVLP 	3H 			//04CC 	0183
		LDR 	59H, 0H 			//04CD 	1859
		STR 	5H 			//04CE 	1085
		LDR 	58H, 0H 			//04CF 	1858
		STR 	4H 			//04D0 	1084
		LDWI 	FEH 			//04D1 	00FE
		ADDWR 	4H, 1H 		//04D2 	1784
		LDWI 	85H 			//04D3 	0085
		ADDWFC 	5H, 1H 		//04D4 	0D85
		LDR 	0H, 0H 			//04D5 	1800
		XORWR 	60H, 0H 		//04D6 	1660
		BTSS 	3H, 2H 			//04D7 	2D03
		LJUMP 	4FEH 			//04D8 	3CFE

		//;app.c: 235: g_state = transitions[i].next;
		LCALL 	5E2H 			//04D9 	35E2
		MOVLP 	3H 			//04DA 	0183
		LCALL 	504H 			//04DB 	3504
		MOVLP 	3H 			//04DC 	0183
		LDR 	59H, 0H 			//04DD 	1859
		STR 	5H 			//04DE 	1085
		LDR 	58H, 0H 			//04DF 	1858
		STR 	4H 			//04E0 	1084
		LDWI 	FFH 			//04E1 	00FF
		ADDWR 	4H, 1H 		//04E2 	1784
		LDWI 	85H 			//04E3 	0085
		ADDWFC 	5H, 1H 		//04E4 	0D85
		LDR 	0H, 0H 			//04E5 	1800
		STR 	39H 			//04E6 	10B9

		//;app.c: 236: if (transitions[i].action) transitions[i].action();
		LCALL 	5E2H 			//04E7 	35E2
		MOVLP 	3H 			//04E8 	0183
		LCALL 	504H 			//04E9 	3504
		MOVLP 	3H 			//04EA 	0183
		LCALL 	5E9H 			//04EB 	35E9
		MOVLP 	3H 			//04EC 	0183
		MOVIW 	FSR0++ 		//04ED 	1012
		STR 	5EH 			//04EE 	10DE
		MOVIW 	FSR0++ 		//04EF 	1012
		IORWR 	5EH, 1H 		//04F0 	14DE
		BTSC 	3H, 2H 			//04F1 	2903
		RET 					//04F2 	1008
		LCALL 	5E2H 			//04F3 	35E2
		MOVLP 	3H 			//04F4 	0183
		LCALL 	504H 			//04F5 	3504
		MOVLP 	3H 			//04F6 	0183
		LCALL 	5E9H 			//04F7 	35E9
		MOVIW 	1H[0] 			//04F8 	0F01
		STR 	AH 			//04F9 	108A
		MOVIW 	0H[0] 			//04FA 	0F00
		CALLW 					//04FB 	100A
		MOVLP 	4H 			//04FC 	0184
		RET 					//04FD 	1008
		LDWI 	FH 			//04FE 	000F
		INCR 	61H, 1H 		//04FF 	1AE1
		SUBWR 	61H, 0H 		//0500 	1261
		BTSC 	3H, 0H 			//0501 	2803
		RET 					//0502 	1008
		LJUMP 	4B9H 			//0503 	3CB9
		CLRF 	5CH 			//0504 	11DC
		CLRF 	5DH 			//0505 	11DD
		BTSS 	58H, 0H 		//0506 	2C58
		LJUMP 	50CH 			//0507 	3D0C
		LDR 	5AH, 0H 			//0508 	185A
		ADDWR 	5CH, 1H 		//0509 	17DC
		LDR 	5BH, 0H 			//050A 	185B
		ADDWFC 	5DH, 1H 		//050B 	0DDD
		LSLF 	5AH, 1H 		//050C 	05DA
		RLR 	5BH, 1H 			//050D 	1DDB
		LSRF 	59H, 1H 		//050E 	06D9
		RRR 	58H, 1H 			//050F 	1CD8
		LDR 	58H, 0H 			//0510 	1858
		IORWR 	59H, 0H 		//0511 	1459
		BTSS 	3H, 2H 			//0512 	2D03
		LJUMP 	506H 			//0513 	3D06
		LDR 	5DH, 0H 			//0514 	185D
		STR 	59H 			//0515 	10D9
		LDR 	5CH, 0H 			//0516 	185C
		STR 	58H 			//0517 	10D8
		RET 					//0518 	1008
		STR 	5AH 			//0519 	10DA

		//;led_driver.c: 17: if (!led) return;
		LDR 	5AH, 0H 			//051A 	185A
		BTSC 	3H, 2H 			//051B 	2903
		RET 					//051C 	1008

		//;led_driver.c: 18: led->remain_blink_ms = 0;
		MOVLP 	3H 			//051D 	0183
		LCALL 	339H 			//051E 	3339
		MOVLP 	3H 			//051F 	0183

		//;led_driver.c: 19: if (led->hw_on) led->hw_on();
		LDR 	5AH, 0H 			//0520 	185A
		ADDWI 	6H 			//0521 	0E06
		STR 	6H 			//0522 	1086
		MOVIW 	FSR1++ 		//0523 	1016
		IORWR 	1H, 0H 		//0524 	1401
		BTSC 	3H, 2H 			//0525 	2903
		RET 					//0526 	1008
		LDR 	5AH, 0H 			//0527 	185A
		ADDWI 	6H 			//0528 	0E06
		STR 	6H 			//0529 	1086
		CLRF 	7H 			//052A 	1187
		MOVIW 	1H[1] 			//052B 	0F41
		STR 	AH 			//052C 	108A
		MOVIW 	0H[1] 			//052D 	0F40
		CALLW 					//052E 	100A
		MOVLP 	5H 			//052F 	0185
		RET 					//0530 	1008

		//;app.c: 160: unsigned char cmd = rf_data[2] & 0x0FU;
		LDR 	30H, 0H 			//0531 	1830
		STR 	5AH 			//0532 	10DA
		LDWI 	FH 			//0533 	000F
		ANDWR 	5AH, 1H 		//0534 	15DA

		//;app.c: 163: if (g_state == STATE_433_DUIMA) {
		LDWI 	4H 			//0535 	0004
		XORWR 	39H, 0H 		//0536 	1639
		BTSS 	3H, 2H 			//0537 	2D03
		LJUMP 	53DH 			//0538 	3D3D

		//;app.c: 164: if (cmd == 0x01U) {
		DECRSZ 	5AH, 0H 		//0539 	1B5A
		LJUMP 	554H 			//053A 	3D54

		//;app.c: 165: g_event = EV_433_DUIMA;
		LDWI 	AH 			//053B 	000A
		LJUMP 	553H 			//053C 	3D53

		//;app.c: 169: if (rf_data[0] == g_pairedCode[0] &&
		//;app.c: 170: rf_data[1] == g_pairedCode[1] &&
		//;app.c: 171: (rf_data[2] & 0xF0U) == (g_pairedCode[2] & 0xF0U) &&
		//;app.c: 172: cmd == 0x02U) {
		LDR 	2EH, 0H 			//053D 	182E
		XORWR 	2BH, 0H 		//053E 	162B
		BTSS 	3H, 2H 			//053F 	2D03
		LJUMP 	554H 			//0540 	3D54
		LDR 	2FH, 0H 			//0541 	182F
		XORWR 	2CH, 0H 		//0542 	162C
		BTSS 	3H, 2H 			//0543 	2D03
		LJUMP 	554H 			//0544 	3D54
		LDWI 	F0H 			//0545 	00F0
		ANDWR 	2DH, 0H 		//0546 	152D
		STR 	58H 			//0547 	10D8
		LDWI 	F0H 			//0548 	00F0
		ANDWR 	30H, 0H 		//0549 	1530
		STR 	59H 			//054A 	10D9
		XORWR 	58H, 0H 		//054B 	1658
		BTSS 	3H, 2H 			//054C 	2D03
		LJUMP 	554H 			//054D 	3D54
		LDWI 	2H 			//054E 	0002
		XORWR 	5AH, 0H 		//054F 	165A
		BTSS 	3H, 2H 			//0550 	2D03
		LJUMP 	554H 			//0551 	3D54

		//;app.c: 173: g_event = EV_433_LEAK;
		LDWI 	5H 			//0552 	0005
		STR 	3AH 			//0553 	10BA

		//;app.c: 174: }
		//;app.c: 175: }
		//;app.c: 176: rf_data_ready = 0;
		CLRF 	3BH 			//0554 	11BB
		RET 					//0555 	1008

		//;app.c: 134: if (rx_len < 1) return;
		LDR 	7BH, 0H 			//0556 	187B
		BTSC 	3H, 2H 			//0557 	2903
		RET 					//0558 	1008
		LJUMP 	562H 			//0559 	3D62
		LDWI 	2H 			//055A 	0002
		LJUMP 	55FH 			//055B 	3D5F
		LDWI 	3H 			//055C 	0003
		LJUMP 	55FH 			//055D 	3D5F
		LDWI 	4H 			//055E 	0004
		MOVLB 	0H 			//055F 	1020
		STR 	3AH 			//0560 	10BA
		LJUMP 	56EH 			//0561 	3D6E
		MOVLB 	1H 			//0562 	1021
		LDR 	2BH, 0H 			//0563 	182B
		XORWI 	1H 			//0564 	0A01
		BTSC 	3H, 2H 			//0565 	2903
		LJUMP 	55AH 			//0566 	3D5A
		XORWI 	3H 			//0567 	0A03
		BTSC 	3H, 2H 			//0568 	2903
		LJUMP 	55CH 			//0569 	3D5C
		XORWI 	FDH 			//056A 	0AFD
		BTSC 	3H, 2H 			//056B 	2903
		LJUMP 	55EH 			//056C 	3D5E
		LJUMP 	56EH 			//056D 	3D6E

		//;app.c: 144: URIER &= 0xFE;
		MOVLB 	9H 			//056E 	1029
		BCR 	EH, 0H 			//056F 	200E

		//;app.c: 145: rx_len = 0;
		CLRF 	7BH 			//0570 	11FB

		//;app.c: 146: rx_flag = 0;
		MOVLB 	0H 			//0571 	1020
		CLRF 	3EH 			//0572 	11BE

		//;app.c: 147: URIER |= 0x01;
		MOVLB 	9H 			//0573 	1029
		BSR 	EH, 0H 			//0574 	240E
		RET 					//0575 	1008

		//;rf433.c: 43: flag = 0;
		MOVLB 	0H 			//0576 	1020
		CLRF 	20H 			//0577 	11A0

		//;rf433.c: 44: hh_w = 0; ll_w = 0;
		CLRF 	24H 			//0578 	11A4
		CLRF 	25H 			//0579 	11A5

		//;rf433.c: 45: t_code1 = 0; t_code2 = 0; t_code3 = 0;
		CLRF 	26H 			//057A 	11A6
		CLRF 	27H 			//057B 	11A7
		CLRF 	28H 			//057C 	11A8

		//;rf433.c: 46: ma_x = 0; s = 0;
		CLRF 	29H 			//057D 	11A9
		CLRF 	35H 			//057E 	11B5
		CLRF 	36H 			//057F 	11B6

		//;rf433.c: 47: pre_cnt = 0;
		CLRF 	2AH 			//0580 	11AA

		//;rf433.c: 54: PCKEN |= 0B00000010;
		MOVLB 	1H 			//0581 	1021
		BSR 	1AH, 1H 			//0582 	249A

		//;rf433.c: 55: CKOCON = 0B00100000;
		LDWI 	20H 			//0583 	0020
		STR 	15H 			//0584 	1095

		//;rf433.c: 56: TCKSRC = 0B00000011;
		LDWI 	3H 			//0585 	0003
		MOVLB 	6H 			//0586 	1026
		STR 	1FH 			//0587 	109F

		//;rf433.c: 57: TIM1CR1 = 0B10000100;
		LDWI 	84H 			//0588 	0084
		MOVLB 	4H 			//0589 	1024
		STR 	11H 			//058A 	1091

		//;rf433.c: 58: TIM1SR1 = 0;
		CLRF 	16H 			//058B 	1196

		//;rf433.c: 59: TIM1IER = 0B00000001;
		LDWI 	1H 			//058C 	0001
		STR 	15H 			//058D 	1095

		//;rf433.c: 60: T1UIE = 1;
		BSR 	15H, 0H 			//058E 	2415

		//;rf433.c: 61: TIM1ARRH = 0x0B;
		LDWI 	BH 			//058F 	000B
		MOVLB 	5H 			//0590 	1025
		STR 	10H 			//0591 	1090

		//;rf433.c: 62: TIM1ARRL = 0x3F;
		LDWI 	3FH 			//0592 	003F
		STR 	11H 			//0593 	1091

		//;rf433.c: 63: TIM1CR1 = 0B10000101;
		LDWI 	85H 			//0594 	0085
		MOVLB 	4H 			//0595 	1024
		STR 	11H 			//0596 	1091

		//;rf433.c: 64: GIE = 1;
		BSR 	BH, 7H 			//0597 	278B
		RET 					//0598 	1008

		//;uart_wifi.c: 14: PCKEN |= 0B00100000;
		MOVLB 	1H 			//0599 	1021
		BSR 	1AH, 5H 			//059A 	269A

		//;uart_wifi.c: 15: URIER = 0B00100001;
		LDWI 	21H 			//059B 	0021
		MOVLB 	9H 			//059C 	1029
		STR 	EH 			//059D 	108E

		//;uart_wifi.c: 16: URLCR = 0B00000001;
		LDWI 	1H 			//059E 	0001
		STR 	FH 			//059F 	108F

		//;uart_wifi.c: 17: URMCR = 0B00011000;
		LDWI 	18H 			//05A0 	0018
		STR 	11H 			//05A1 	1091

		//;uart_wifi.c: 18: URDLL = 52;
		LDWI 	34H 			//05A2 	0034
		STR 	14H 			//05A3 	1094

		//;uart_wifi.c: 19: URDLH = 0;
		CLRF 	15H 			//05A4 	1195

		//;uart_wifi.c: 20: TCF = 1;
		BSR 	1CH, 0H 			//05A5 	241C

		//;uart_wifi.c: 21: INTCON = 0B11000000;
		LDWI 	C0H 			//05A6 	00C0
		STR 	BH 			//05A7 	108B
		RET 					//05A8 	1008

		//;hal_gpio.c: 41: OSCCON = 0B01100001;
		LDWI 	61H 			//05A9 	0061
		MOVLB 	1H 			//05AA 	1021
		STR 	19H 			//05AB 	1099

		//;hal_gpio.c: 43: INTCON = 0;
		CLRF 	BH 			//05AC 	118B

		//;hal_gpio.c: 45: PORTA = 0B00000000;
		MOVLB 	0H 			//05AD 	1020
		CLRF 	CH 			//05AE 	118C

		//;hal_gpio.c: 46: TRISA = 0B10010011;
		LDWI 	93H 			//05AF 	0093
		MOVLB 	1H 			//05B0 	1021
		STR 	CH 			//05B1 	108C

		//;hal_gpio.c: 47: PORTB = 0B00000000;
		MOVLB 	0H 			//05B2 	1020
		CLRF 	DH 			//05B3 	118D

		//;hal_gpio.c: 48: TRISB = 0B10000001;
		LDWI 	81H 			//05B4 	0081
		MOVLB 	1H 			//05B5 	1021
		STR 	DH 			//05B6 	108D

		//;hal_gpio.c: 49: PORTC = 0B00000000;
		MOVLB 	0H 			//05B7 	1020
		CLRF 	EH 			//05B8 	118E

		//;hal_gpio.c: 50: TRISC = 0B00000000;
		MOVLB 	1H 			//05B9 	1021
		CLRF 	EH 			//05BA 	118E

		//;hal_gpio.c: 52: WPUA = 0B00000011;
		LDWI 	3H 			//05BB 	0003
		MOVLB 	3H 			//05BC 	1023
		STR 	CH 			//05BD 	108C

		//;hal_gpio.c: 53: WPUB = 0B10000001;
		LDWI 	81H 			//05BE 	0081
		STR 	DH 			//05BF 	108D

		//;hal_gpio.c: 54: WPUC = 0B00000000;
		CLRF 	EH 			//05C0 	118E

		//;hal_gpio.c: 55: WPDA = 0B10000000;
		LDWI 	80H 			//05C1 	0080
		MOVLB 	4H 			//05C2 	1024
		STR 	CH 			//05C3 	108C

		//;hal_gpio.c: 56: WPDB = 0B00000000;
		CLRF 	DH 			//05C4 	118D

		//;hal_gpio.c: 57: WPDC = 0B00000000;
		CLRF 	EH 			//05C5 	118E

		//;hal_gpio.c: 59: PSRC0 = 0B11111111;
		LDWI 	FFH 			//05C6 	00FF
		MOVLB 	2H 			//05C7 	1022
		STR 	1AH 			//05C8 	109A

		//;hal_gpio.c: 60: PSRC1 = 0B11111111;
		STR 	1BH 			//05C9 	109B

		//;hal_gpio.c: 61: PSRC2 = 0B11111111;
		STR 	1CH 			//05CA 	109C

		//;hal_gpio.c: 62: PSINK0 = 0B11111111;
		MOVLB 	3H 			//05CB 	1023
		STR 	1AH 			//05CC 	109A

		//;hal_gpio.c: 63: PSINK1 = 0B11111111;
		STR 	1BH 			//05CD 	109B

		//;hal_gpio.c: 64: PSINK2 = 0B11111111;
		STR 	1CH 			//05CE 	109C

		//;hal_gpio.c: 66: ANSELA = 0B00000000;
		CLRF 	17H 			//05CF 	1197
		RET 					//05D0 	1008

		//;hal_gpio.c: 78: PCKEN |= 0B00001000;
		MOVLB 	1H 			//05D1 	1021
		BSR 	1AH, 3H 			//05D2 	259A

		//;hal_gpio.c: 79: TIM4CR1 = 0B00000101;
		LDWI 	5H 			//05D3 	0005
		MOVLB 	2H 			//05D4 	1022
		STR 	11H 			//05D5 	1091

		//;hal_gpio.c: 80: TIM4IER = 0B00000001;
		LDWI 	1H 			//05D6 	0001
		STR 	12H 			//05D7 	1092

		//;hal_gpio.c: 81: TIM4SR = 0;
		CLRF 	13H 			//05D8 	1193

		//;hal_gpio.c: 82: TIM4EGR = 0;
		CLRF 	14H 			//05D9 	1194

		//;hal_gpio.c: 83: TIM4CNTR = 0;
		CLRF 	15H 			//05DA 	1195

		//;hal_gpio.c: 84: TIM4PSCR = 6;
		LDWI 	6H 			//05DB 	0006
		STR 	16H 			//05DC 	1096

		//;hal_gpio.c: 85: TIM4ARR = 124;
		LDWI 	7CH 			//05DD 	007C
		STR 	17H 			//05DE 	1097

		//;hal_gpio.c: 86: INTCON |= 0B11000000;
		LDWI 	C0H 			//05DF 	00C0
		IORWR 	BH, 1H 		//05E0 	148B
		RET 					//05E1 	1008
		LDR 	61H, 0H 			//05E2 	1861
		STR 	58H 			//05E3 	10D8
		LDWI 	5H 			//05E4 	0005
		CLRF 	59H 			//05E5 	11D9
		STR 	5AH 			//05E6 	10DA
		CLRF 	5BH 			//05E7 	11DB
		RET 					//05E8 	1008
		LDR 	59H, 0H 			//05E9 	1859
		STR 	5H 			//05EA 	1085
		LDR 	58H, 0H 			//05EB 	1858
		STR 	4H 			//05EC 	1084
		LDWI 	0H 			//05ED 	0000
		ADDWR 	4H, 1H 		//05EE 	1784
		LDWI 	86H 			//05EF 	0086
		ADDWFC 	5H, 1H 		//05F0 	0D85
		RET 					//05F1 	1008
		STR 	6H 			//05F2 	1086
		LDWI 	0H 			//05F3 	0000
		MOVWI 	0H[1] 			//05F4 	0FC0
		MOVWI 	1H[1] 			//05F5 	0FC1
		LDR 	60H, 0H 			//05F6 	1860
		RET 					//05F7 	1008
		ADDWI 	8H 			//05F8 	0E08
		STR 	6H 			//05F9 	1086
		CLRF 	7H 			//05FA 	1187
		MOVIW 	1H[1] 			//05FB 	0F41
		RET 					//05FC 	1008
		RETW 	0H 			//05FD 	0400
		RETW 	1H 			//05FE 	0401
		RETW 	1H 			//05FF 	0401
		RETW 	57H 			//0600 	0457
		RETW 	0H 			//0601 	0400
		RETW 	1H 			//0602 	0401
		RETW 	2H 			//0603 	0402
		RETW 	3H 			//0604 	0403
		RETW 	55H 			//0605 	0455
		RETW 	3H 			//0606 	0403
		RETW 	1H 			//0607 	0401
		RETW 	3H 			//0608 	0403
		RETW 	3H 			//0609 	0403
		RETW 	50H 			//060A 	0450
		RETW 	3H 			//060B 	0403
		RETW 	1H 			//060C 	0401
		RETW 	5H 			//060D 	0405
		RETW 	3H 			//060E 	0403
		RETW 	50H 			//060F 	0450
		RETW 	3H 			//0610 	0403
		RETW 	1H 			//0611 	0401
		RETW 	6H 			//0612 	0406
		RETW 	3H 			//0613 	0403
		RETW 	50H 			//0614 	0450
		RETW 	3H 			//0615 	0403
		RETW 	1H 			//0616 	0401
		RETW 	8H 			//0617 	0408
		RETW 	4H 			//0618 	0404
		RETW 	2DH 			//0619 	042D
		RETW 	0H 			//061A 	0400
		RETW 	1H 			//061B 	0401
		RETW 	9H 			//061C 	0409
		RETW 	3H 			//061D 	0403
		RETW 	5AH 			//061E 	045A
		RETW 	3H 			//061F 	0403
		RETW 	3H 			//0620 	0403
		RETW 	7H 			//0621 	0407
		RETW 	1H 			//0622 	0401
		RETW 	39H 			//0623 	0439
		RETW 	0H 			//0624 	0400
		RETW 	3H 			//0625 	0403
		RETW 	BH 			//0626 	040B
		RETW 	2H 			//0627 	0402
		RETW 	39H 			//0628 	0439
		RETW 	0H 			//0629 	0400
		RETW 	3H 			//062A 	0403
		RETW 	6H 			//062B 	0406
		RETW 	3H 			//062C 	0403
		RETW 	50H 			//062D 	0450
		RETW 	3H 			//062E 	0403
		RETW 	3H 			//062F 	0403
		RETW 	5H 			//0630 	0405
		RETW 	3H 			//0631 	0403
		RETW 	50H 			//0632 	0450
		RETW 	3H 			//0633 	0403
		RETW 	4H 			//0634 	0404
		RETW 	CH 			//0635 	040C
		RETW 	1H 			//0636 	0401
		RETW 	41H 			//0637 	0441
		RETW 	0H 			//0638 	0400
		RETW 	4H 			//0639 	0404
		RETW 	AH 			//063A 	040A
		RETW 	1H 			//063B 	0401
		RETW 	89H 			//063C 	0489
		RETW 	0H 			//063D 	0400
		RETW 	2H 			//063E 	0402
		RETW 	9H 			//063F 	0409
		RETW 	1H 			//0640 	0401
		RETW 	4EH 			//0641 	044E
		RETW 	0H 			//0642 	0400
		RETW 	2H 			//0643 	0402
		RETW 	4H 			//0644 	0404
		RETW 	1H 			//0645 	0401
		RETW 	4EH 			//0646 	044E
		RETW 	0H 			//0647 	0400
		BTSS 	7EH, 0H 		//0648 	2C7E
		LJUMP 	64BH 			//0649 	3E4B
		LJUMP 	64EH 			//064A 	3E4E
		BCR 	DH, 2H 			//064B 	210D
		BCR 	DH, 1H 			//064C 	208D
		RET 					//064D 	1008
		MOVLB 	0H 			//064E 	1020
		BCR 	DH, 2H 			//064F 	210D
		BCR 	DH, 1H 			//0650 	208D
		RET 					//0651 	1008
		BTSS 	7EH, 0H 		//0652 	2C7E
		LJUMP 	655H 			//0653 	3E55
		LJUMP 	658H 			//0654 	3E58
		MOVLB 	0H 			//0655 	1020
		BCR 	CH, 2H 			//0656 	210C
		RET 					//0657 	1008
		MOVLB 	0H 			//0658 	1020
		BCR 	CH, 2H 			//0659 	210C
		RET 					//065A 	1008
		BTSS 	7EH, 0H 		//065B 	2C7E
		LJUMP 	65EH 			//065C 	3E5E
		LJUMP 	661H 			//065D 	3E61
		MOVLB 	0H 			//065E 	1020
		BCR 	DH, 6H 			//065F 	230D
		RET 					//0660 	1008
		MOVLB 	0H 			//0661 	1020
		BCR 	DH, 6H 			//0662 	230D
		RET 					//0663 	1008
		CLRWDT 			//0664 	1064
		CLRF 	0H 			//0665 	1180
		ADDFSR 	0H, 1H 		//0666 	0101
		DECRSZ 	9H, 1H 		//0667 	1B89
		LJUMP 	665H 			//0668 	3E65
		RETW 	0H 			//0669 	0400
		MOVLB 	0H 			//066A 	1020
		LDWI 	4H 			//066B 	0004
		XORWR 	CH, 1H 		//066C 	168C
		RET 					//066D 	1008
		MOVLB 	0H 			//066E 	1020
		LDWI 	40H 			//066F 	0040
		XORWR 	DH, 1H 		//0670 	168D
		RET 					//0671 	1008
		BSR 	DH, 2H 			//0672 	250D
		BCR 	DH, 1H 			//0673 	208D
		RET 					//0674 	1008
		BCR 	DH, 2H 			//0675 	210D
		BSR 	DH, 1H 			//0676 	248D
		RET 					//0677 	1008
		LDWI 	7H 			//0678 	0007
		STR 	3AH 			//0679 	10BA
		RET 					//067A 	1008
		BSR 	CH, 2H 			//067B 	250C
		RET 					//067C 	1008
		BSR 	DH, 6H 			//067D 	270D
		RET 					//067E 	1008
			END
