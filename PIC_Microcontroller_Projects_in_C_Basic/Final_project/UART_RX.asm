
_main:

;UART_RX.c,35 :: 		void main()
;UART_RX.c,36 :: 		{   Keypad_Init();                           // Initialize Keypad
	CALL        _Keypad_Init+0, 0
;UART_RX.c,37 :: 		UART1_Init(9615);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;UART_RX.c,38 :: 		Delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	NOP
	NOP
;UART_RX.c,39 :: 		lcd_init();
	CALL        _Lcd_Init+0, 0
;UART_RX.c,40 :: 		Lcd_cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UART_RX.c,41 :: 		lcd_cmd(_lcd_cursor_off);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UART_RX.c,42 :: 		trisb.rb0=0; // led ldr output
	BCF         TRISB+0, 0 
;UART_RX.c,43 :: 		TRISB7_bit = 1;
	BSF         TRISB7_bit+0, BitPos(TRISB7_bit+0) 
;UART_RX.c,44 :: 		TRISA3_bit = 1;                                  // set RB0 pin as input
	BSF         TRISA3_bit+0, BitPos(TRISA3_bit+0) 
;UART_RX.c,46 :: 		Lcd_Out(1,1,"Press the buttom");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_UART_RX+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_UART_RX+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,48 :: 		while(1){
L_main1:
;UART_RX.c,49 :: 		if (PORTB.RB7==1) {               // Detect logical one
	BTFSS       PORTB+0, 7 
	GOTO        L_main3
;UART_RX.c,50 :: 		while (PORTB.RB7==1){}
L_main4:
	BTFSS       PORTB+0, 7 
	GOTO        L_main5
	GOTO        L_main4
L_main5:
;UART_RX.c,51 :: 		Lcd_Cmd(_LCD_CLEAR);                     // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UART_RX.c,52 :: 		if(mode == 3){
	MOVF        _mode+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
;UART_RX.c,53 :: 		mode = 0;
	CLRF        _mode+0 
;UART_RX.c,54 :: 		}
L_main6:
;UART_RX.c,55 :: 		mode++;
	INCF        _mode+0, 1 
;UART_RX.c,56 :: 		if(mode == 1){
	MOVF        _mode+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main7
;UART_RX.c,57 :: 		Lcd_Out(1,1,"Mode 1: ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_UART_RX+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_UART_RX+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,58 :: 		Lcd_Out(2,1,"Calculator");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_UART_RX+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_UART_RX+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,59 :: 		}
	GOTO        L_main8
L_main7:
;UART_RX.c,60 :: 		else if(mode == 2){
	MOVF        _mode+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main9
;UART_RX.c,62 :: 		Lcd_Out(1,1,"Mode 2: ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_UART_RX+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_UART_RX+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,63 :: 		Lcd_Out(2,1,"Server Alarm");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_UART_RX+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_UART_RX+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,64 :: 		}
	GOTO        L_main10
L_main9:
;UART_RX.c,65 :: 		else if(mode == 3){
	MOVF        _mode+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main11
;UART_RX.c,67 :: 		Lcd_Out(1,1,"Mode 3:");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_UART_RX+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_UART_RX+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,68 :: 		Lcd_Out(2,1,"LDR");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_UART_RX+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_UART_RX+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,69 :: 		}
L_main11:
L_main10:
L_main8:
;UART_RX.c,70 :: 		Delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main12:
	DECFSZ      R13, 1, 1
	BRA         L_main12
	DECFSZ      R12, 1, 1
	BRA         L_main12
	DECFSZ      R11, 1, 1
	BRA         L_main12
	NOP
	NOP
;UART_RX.c,71 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UART_RX.c,72 :: 		}
L_main3:
;UART_RX.c,74 :: 		if(mode == 1){
	MOVF        _mode+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main13
;UART_RX.c,75 :: 		Mode_A();
	CALL        _Mode_A+0, 0
;UART_RX.c,76 :: 		}
	GOTO        L_main14
L_main13:
;UART_RX.c,77 :: 		else if(mode == 2){
	MOVF        _mode+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main15
;UART_RX.c,78 :: 		Lcd_Out(1,1,"Mode 2: ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr8_UART_RX+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr8_UART_RX+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,79 :: 		Lcd_Out(2,4," Running! ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr9_UART_RX+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr9_UART_RX+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,80 :: 		UART1_Write('2');
	MOVLW       50
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;UART_RX.c,83 :: 		}
	GOTO        L_main16
L_main15:
;UART_RX.c,84 :: 		else if(mode == 3){
	MOVF        _mode+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_main17
;UART_RX.c,85 :: 		Lcd_Out(1,1,"Mode 3:");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr10_UART_RX+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr10_UART_RX+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,86 :: 		UART1_Write('3');
	MOVLW       51
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;UART_RX.c,87 :: 		mode_c();
	CALL        _mode_c+0, 0
;UART_RX.c,88 :: 		delay_ms(600);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main18:
	DECFSZ      R13, 1, 1
	BRA         L_main18
	DECFSZ      R12, 1, 1
	BRA         L_main18
	DECFSZ      R11, 1, 1
	BRA         L_main18
	NOP
	NOP
;UART_RX.c,89 :: 		}
L_main17:
L_main16:
L_main14:
;UART_RX.c,90 :: 		}
	GOTO        L_main1
;UART_RX.c,92 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_Mode_A:

;UART_RX.c,93 :: 		void Mode_A() {
;UART_RX.c,94 :: 		float num_1 = 0;
	CLRF        Mode_A_num_1_L0+0 
	CLRF        Mode_A_num_1_L0+1 
	CLRF        Mode_A_num_1_L0+2 
	CLRF        Mode_A_num_1_L0+3 
	CLRF        Mode_A_num_2_L0+0 
	CLRF        Mode_A_num_2_L0+1 
	CLRF        Mode_A_num_2_L0+2 
	CLRF        Mode_A_num_2_L0+3 
	CLRF        Mode_A_op_L0+0 
	CLRF        Mode_A_result_L0+0 
	CLRF        Mode_A_result_L0+1 
	CLRF        Mode_A_result_L0+2 
	CLRF        Mode_A_result_L0+3 
	CLRF        Mode_A_kp_L0+0 
;UART_RX.c,100 :: 		Lcd_Cmd(_LCD_CLEAR);   // Clear LCD display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UART_RX.c,102 :: 		if (state == 0) {
	MOVF        _state+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Mode_A19
;UART_RX.c,105 :: 		Lcd_Out(1, 1, "Set New Password:");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr11_UART_RX+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr11_UART_RX+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,106 :: 		index = 0;
	CLRF        _index+0 
;UART_RX.c,108 :: 		while (index < 4) {
L_Mode_A20:
	MOVLW       4
	SUBWF       _index+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Mode_A21
;UART_RX.c,109 :: 		kp = Keypad_Key_Click(); // Store key code in kp variable
	CALL        _Keypad_Key_Click+0, 0
	MOVF        R0, 0 
	MOVWF       Mode_A_kp_L0+0 
;UART_RX.c,112 :: 		switch (kp) {
	GOTO        L_Mode_A22
;UART_RX.c,113 :: 		case 1: kp = '7'; break;
L_Mode_A24:
	MOVLW       55
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A23
;UART_RX.c,114 :: 		case 2: kp = '4'; break;
L_Mode_A25:
	MOVLW       52
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A23
;UART_RX.c,115 :: 		case 3: kp = '1'; break;
L_Mode_A26:
	MOVLW       49
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A23
;UART_RX.c,116 :: 		case 5: kp = '8'; break;
L_Mode_A27:
	MOVLW       56
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A23
;UART_RX.c,117 :: 		case 6: kp = '5'; break;
L_Mode_A28:
	MOVLW       53
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A23
;UART_RX.c,118 :: 		case 7: kp = '2'; break;
L_Mode_A29:
	MOVLW       50
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A23
;UART_RX.c,119 :: 		case 8: kp = '0'; break;
L_Mode_A30:
	MOVLW       48
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A23
;UART_RX.c,120 :: 		case 9: kp = '9'; break;
L_Mode_A31:
	MOVLW       57
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A23
;UART_RX.c,121 :: 		case 10: kp = '6'; break;
L_Mode_A32:
	MOVLW       54
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A23
;UART_RX.c,122 :: 		case 11: kp = '3'; break;
L_Mode_A33:
	MOVLW       51
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A23
;UART_RX.c,123 :: 		case 12: kp = '='; break;
L_Mode_A34:
	MOVLW       61
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A23
;UART_RX.c,124 :: 		default: continue; // Skip other keys
L_Mode_A35:
	GOTO        L_Mode_A20
;UART_RX.c,125 :: 		}
L_Mode_A22:
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A24
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A25
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A26
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A27
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A28
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A29
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A30
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A31
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A32
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       11
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A33
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       12
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A34
	GOTO        L_Mode_A35
L_Mode_A23:
;UART_RX.c,127 :: 		if (kp >= '0' && kp <= '9') {
	MOVLW       48
	SUBWF       Mode_A_kp_L0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_Mode_A38
	MOVF        Mode_A_kp_L0+0, 0 
	SUBLW       57
	BTFSS       STATUS+0, 0 
	GOTO        L_Mode_A38
L__Mode_A143:
;UART_RX.c,128 :: 		pw[index] = kp; // Store numeric password
	MOVLW       _pw+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_pw+0)
	MOVWF       FSR1H 
	MOVF        _index+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVF        Mode_A_kp_L0+0, 0 
	MOVWF       POSTINC1+0 
;UART_RX.c,129 :: 		Lcd_Chr(2, index + 1, '*'); // Display '*' for each entered character
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _index+0, 0 
	ADDLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       42
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;UART_RX.c,130 :: 		index++;
	INCF        _index+0, 1 
;UART_RX.c,131 :: 		}
L_Mode_A38:
;UART_RX.c,132 :: 		}
	GOTO        L_Mode_A20
L_Mode_A21:
;UART_RX.c,134 :: 		Delay_ms(700); // Delay to see the entered password briefly
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       142
	MOVWF       R12, 0
	MOVLW       18
	MOVWF       R13, 0
L_Mode_A39:
	DECFSZ      R13, 1, 1
	BRA         L_Mode_A39
	DECFSZ      R12, 1, 1
	BRA         L_Mode_A39
	DECFSZ      R11, 1, 1
	BRA         L_Mode_A39
	NOP
;UART_RX.c,135 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UART_RX.c,136 :: 		Lcd_Out(1, 1, "Password Set!");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr12_UART_RX+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr12_UART_RX+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,137 :: 		Delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_Mode_A40:
	DECFSZ      R13, 1, 1
	BRA         L_Mode_A40
	DECFSZ      R12, 1, 1
	BRA         L_Mode_A40
	DECFSZ      R11, 1, 1
	BRA         L_Mode_A40
	NOP
	NOP
;UART_RX.c,138 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UART_RX.c,140 :: 		state = 1; // Switch to password entering mode
	MOVLW       1
	MOVWF       _state+0 
;UART_RX.c,141 :: 		}
	GOTO        L_Mode_A41
L_Mode_A19:
;UART_RX.c,142 :: 		else if (state == 1) {
	MOVF        _state+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Mode_A42
;UART_RX.c,143 :: 		Lcd_Out(1, 1, "Enter Password :");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr13_UART_RX+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr13_UART_RX+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,144 :: 		index = 0;
	CLRF        _index+0 
;UART_RX.c,147 :: 		while (index < 4) {
L_Mode_A43:
	MOVLW       4
	SUBWF       _index+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_Mode_A44
;UART_RX.c,148 :: 		kp = Keypad_Key_Click(); // Store key code in kp variable
	CALL        _Keypad_Key_Click+0, 0
	MOVF        R0, 0 
	MOVWF       Mode_A_kp_L0+0 
;UART_RX.c,151 :: 		switch (kp) {
	GOTO        L_Mode_A45
;UART_RX.c,152 :: 		case 1: kp = '7'; break;
L_Mode_A47:
	MOVLW       55
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A46
;UART_RX.c,153 :: 		case 2: kp = '4'; break;
L_Mode_A48:
	MOVLW       52
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A46
;UART_RX.c,154 :: 		case 3: kp = '1'; break;
L_Mode_A49:
	MOVLW       49
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A46
;UART_RX.c,155 :: 		case 5: kp = '8'; break;
L_Mode_A50:
	MOVLW       56
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A46
;UART_RX.c,156 :: 		case 6: kp = '5'; break;
L_Mode_A51:
	MOVLW       53
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A46
;UART_RX.c,157 :: 		case 7: kp = '2'; break;
L_Mode_A52:
	MOVLW       50
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A46
;UART_RX.c,158 :: 		case 8: kp = '0'; break;
L_Mode_A53:
	MOVLW       48
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A46
;UART_RX.c,159 :: 		case 9: kp = '9'; break;
L_Mode_A54:
	MOVLW       57
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A46
;UART_RX.c,160 :: 		case 10: kp = '6'; break;
L_Mode_A55:
	MOVLW       54
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A46
;UART_RX.c,161 :: 		case 11: kp = '3'; break;
L_Mode_A56:
	MOVLW       51
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A46
;UART_RX.c,162 :: 		case 12: kp = '='; break;
L_Mode_A57:
	MOVLW       61
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A46
;UART_RX.c,163 :: 		default: continue; // Skip other keys
L_Mode_A58:
	GOTO        L_Mode_A43
;UART_RX.c,164 :: 		}
L_Mode_A45:
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A47
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A48
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A49
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A50
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A51
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A52
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A53
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A54
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A55
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       11
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A56
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       12
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A57
	GOTO        L_Mode_A58
L_Mode_A46:
;UART_RX.c,166 :: 		if (kp >= '0' && kp <= '9') {
	MOVLW       48
	SUBWF       Mode_A_kp_L0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_Mode_A61
	MOVF        Mode_A_kp_L0+0, 0 
	SUBLW       57
	BTFSS       STATUS+0, 0 
	GOTO        L_Mode_A61
L__Mode_A142:
;UART_RX.c,167 :: 		input_pw[index] = kp; // Store numeric input
	MOVLW       _input_pw+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_input_pw+0)
	MOVWF       FSR1H 
	MOVF        _index+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVF        Mode_A_kp_L0+0, 0 
	MOVWF       POSTINC1+0 
;UART_RX.c,168 :: 		Lcd_Chr(2, index + 1, '*'); // Display '*' for each entered character
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _index+0, 0 
	ADDLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       42
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;UART_RX.c,169 :: 		index++;
	INCF        _index+0, 1 
;UART_RX.c,170 :: 		}
L_Mode_A61:
;UART_RX.c,172 :: 		if (kp == '=') {
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       61
	BTFSS       STATUS+0, 2 
	GOTO        L_Mode_A62
;UART_RX.c,173 :: 		break;
	GOTO        L_Mode_A44
;UART_RX.c,174 :: 		}
L_Mode_A62:
;UART_RX.c,175 :: 		}
	GOTO        L_Mode_A43
L_Mode_A44:
;UART_RX.c,178 :: 		if (strncmp(input_pw, pw, 4) == 0) {
	MOVLW       _input_pw+0
	MOVWF       FARG_strncmp_s1+0 
	MOVLW       hi_addr(_input_pw+0)
	MOVWF       FARG_strncmp_s1+1 
	MOVLW       _pw+0
	MOVWF       FARG_strncmp_s2+0 
	MOVLW       hi_addr(_pw+0)
	MOVWF       FARG_strncmp_s2+1 
	MOVLW       4
	MOVWF       FARG_strncmp_len+0 
	CALL        _strncmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Mode_A146
	MOVLW       0
	XORWF       R0, 0 
L__Mode_A146:
	BTFSS       STATUS+0, 2 
	GOTO        L_Mode_A63
;UART_RX.c,179 :: 		Lcd_Out(2, 1, "Correct PW!");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr14_UART_RX+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr14_UART_RX+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,180 :: 		Delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_Mode_A64:
	DECFSZ      R13, 1, 1
	BRA         L_Mode_A64
	DECFSZ      R12, 1, 1
	BRA         L_Mode_A64
	DECFSZ      R11, 1, 1
	BRA         L_Mode_A64
	NOP
	NOP
;UART_RX.c,181 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UART_RX.c,182 :: 		state = 2; // Switch to calculator mode
	MOVLW       2
	MOVWF       _state+0 
;UART_RX.c,183 :: 		incorrectAttempts = 0; // Reset incorrect attempts counter on successful login
	CLRF        _incorrectAttempts+0 
;UART_RX.c,184 :: 		} else {
	GOTO        L_Mode_A65
L_Mode_A63:
;UART_RX.c,185 :: 		Lcd_Out(2, 1, "Incorrect PW!");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr15_UART_RX+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr15_UART_RX+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,186 :: 		Delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_Mode_A66:
	DECFSZ      R13, 1, 1
	BRA         L_Mode_A66
	DECFSZ      R12, 1, 1
	BRA         L_Mode_A66
	DECFSZ      R11, 1, 1
	BRA         L_Mode_A66
	NOP
	NOP
;UART_RX.c,187 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UART_RX.c,188 :: 		memset(input_pw, 0, sizeof(input_pw));
	MOVLW       _input_pw+0
	MOVWF       FARG_memset_p1+0 
	MOVLW       hi_addr(_input_pw+0)
	MOVWF       FARG_memset_p1+1 
	CLRF        FARG_memset_character+0 
	MOVLW       5
	MOVWF       FARG_memset_n+0 
	MOVLW       0
	MOVWF       FARG_memset_n+1 
	CALL        _memset+0, 0
;UART_RX.c,189 :: 		index = 0; // Reset the input index
	CLRF        _index+0 
;UART_RX.c,190 :: 		incorrectAttempts++;
	INCF        _incorrectAttempts+0, 1 
;UART_RX.c,193 :: 		if (incorrectAttempts <= 3){
	MOVF        _incorrectAttempts+0, 0 
	SUBLW       3
	BTFSS       STATUS+0, 0 
	GOTO        L_Mode_A67
;UART_RX.c,194 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UART_RX.c,195 :: 		Lcd_Out(2, 4, "try again!");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr16_UART_RX+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr16_UART_RX+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,196 :: 		Delay_ms(1500);
	MOVLW       8
	MOVWF       R11, 0
	MOVLW       157
	MOVWF       R12, 0
	MOVLW       5
	MOVWF       R13, 0
L_Mode_A68:
	DECFSZ      R13, 1, 1
	BRA         L_Mode_A68
	DECFSZ      R12, 1, 1
	BRA         L_Mode_A68
	DECFSZ      R11, 1, 1
	BRA         L_Mode_A68
	NOP
	NOP
;UART_RX.c,197 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UART_RX.c,199 :: 		}
	GOTO        L_Mode_A69
L_Mode_A67:
;UART_RX.c,200 :: 		else if (incorrectAttempts <= 4) {
	MOVF        _incorrectAttempts+0, 0 
	SUBLW       4
	BTFSS       STATUS+0, 0 
	GOTO        L_Mode_A70
;UART_RX.c,201 :: 		lockSystem((incorrectAttempts-3) * 60); // Lock system for an increasing time
	MOVLW       3
	SUBWF       _incorrectAttempts+0, 0 
	MOVWF       FARG_lockSystem_delayTime+0 
	MOVLW       60
	MULWF       FARG_lockSystem_delayTime+0 
	MOVF        PRODL+0, 0 
	MOVWF       FARG_lockSystem_delayTime+0 
	CALL        _lockSystem+0, 0
;UART_RX.c,203 :: 		} else if (incorrectAttempts >= 5) {
	GOTO        L_Mode_A71
L_Mode_A70:
	MOVLW       5
	SUBWF       _incorrectAttempts+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_Mode_A72
;UART_RX.c,205 :: 		lockSystem(0); // Lock the system indefinitely
	CLRF        FARG_lockSystem_delayTime+0 
	CALL        _lockSystem+0, 0
;UART_RX.c,206 :: 		}
L_Mode_A72:
L_Mode_A71:
L_Mode_A69:
;UART_RX.c,209 :: 		}
L_Mode_A65:
;UART_RX.c,210 :: 		}
	GOTO        L_Mode_A73
L_Mode_A42:
;UART_RX.c,211 :: 		else if (state == 2) {
	MOVF        _state+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_Mode_A74
;UART_RX.c,212 :: 		Lcd_Out(1, 1, "Number1: ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr17_UART_RX+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr17_UART_RX+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,215 :: 		do {
L_Mode_A75:
;UART_RX.c,216 :: 		if (PORTB.RB7==1)
	BTFSS       PORTB+0, 7 
	GOTO        L_Mode_A78
;UART_RX.c,218 :: 		return ;
	GOTO        L_end_Mode_A
;UART_RX.c,219 :: 		}
L_Mode_A78:
;UART_RX.c,220 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable
	CALL        _Keypad_Key_Click+0, 0
	MOVF        R0, 0 
	MOVWF       Mode_A_kp_L0+0 
;UART_RX.c,222 :: 		while (!kp);
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A75
;UART_RX.c,224 :: 		switch (kp) {
	GOTO        L_Mode_A79
;UART_RX.c,225 :: 		case  1: kp = 7; break; // 1        // Uncomment this block for keypad4x4
L_Mode_A81:
	MOVLW       7
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A80
;UART_RX.c,226 :: 		case  2: kp = 4; break; // 2
L_Mode_A82:
	MOVLW       4
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A80
;UART_RX.c,227 :: 		case  3: kp = 1; break; // 3
L_Mode_A83:
	MOVLW       1
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A80
;UART_RX.c,228 :: 		case  5: kp = 8; break; // 4
L_Mode_A84:
	MOVLW       8
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A80
;UART_RX.c,229 :: 		case  6: kp = 5; break; // 5
L_Mode_A85:
	MOVLW       5
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A80
;UART_RX.c,230 :: 		case  7: kp = 2; break; // 6
L_Mode_A86:
	MOVLW       2
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A80
;UART_RX.c,231 :: 		case  8: kp = 0; break; // B
L_Mode_A87:
	CLRF        Mode_A_kp_L0+0 
	GOTO        L_Mode_A80
;UART_RX.c,232 :: 		case  9: kp = 9; break; // 7
L_Mode_A88:
	MOVLW       9
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A80
;UART_RX.c,233 :: 		case 10: kp = 6; break; // 8
L_Mode_A89:
	MOVLW       6
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A80
;UART_RX.c,234 :: 		case 11: kp = 3; break; // 9
L_Mode_A90:
	MOVLW       3
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A80
;UART_RX.c,235 :: 		default: return;
L_Mode_A91:
	GOTO        L_end_Mode_A
;UART_RX.c,236 :: 		}
L_Mode_A79:
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A81
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A82
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A83
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A84
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A85
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A86
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A87
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A88
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A89
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       11
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A90
	GOTO        L_Mode_A91
L_Mode_A80:
;UART_RX.c,237 :: 		num_1 = kp;
	MOVF        Mode_A_kp_L0+0, 0 
	MOVWF       R0 
	CALL        _byte2double+0, 0
	MOVF        R0, 0 
	MOVWF       Mode_A_num_1_L0+0 
	MOVF        R1, 0 
	MOVWF       Mode_A_num_1_L0+1 
	MOVF        R2, 0 
	MOVWF       Mode_A_num_1_L0+2 
	MOVF        R3, 0 
	MOVWF       Mode_A_num_1_L0+3 
;UART_RX.c,238 :: 		Bytetostr(kp,txt);
	MOVF        Mode_A_kp_L0+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _txt+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;UART_RX.c,239 :: 		Lcd_Chr(2, index+1, kp+'0');      // '0' to convert from int to character ascii
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _index+0, 0 
	ADDLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       Mode_A_kp_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;UART_RX.c,241 :: 		Lcd_Out(1, 1, "Enter Op");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr18_UART_RX+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr18_UART_RX+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,243 :: 		do{
L_Mode_A92:
;UART_RX.c,244 :: 		if (PORTB.RB7==1)
	BTFSS       PORTB+0, 7 
	GOTO        L_Mode_A95
;UART_RX.c,246 :: 		return ;
	GOTO        L_end_Mode_A
;UART_RX.c,247 :: 		}
L_Mode_A95:
;UART_RX.c,248 :: 		op = Keypad_Key_Click();             // Store key code in kp variable
	CALL        _Keypad_Key_Click+0, 0
	MOVF        R0, 0 
	MOVWF       Mode_A_op_L0+0 
;UART_RX.c,251 :: 		while (!op);
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A92
;UART_RX.c,252 :: 		switch (op) {
	GOTO        L_Mode_A96
;UART_RX.c,253 :: 		case 13: op = '/'; break; // *
L_Mode_A98:
	MOVLW       47
	MOVWF       Mode_A_op_L0+0 
	GOTO        L_Mode_A97
;UART_RX.c,254 :: 		case 14: op = 'x'; break; // 0
L_Mode_A99:
	MOVLW       120
	MOVWF       Mode_A_op_L0+0 
	GOTO        L_Mode_A97
;UART_RX.c,255 :: 		case 15: op = '-'; break; // #
L_Mode_A100:
	MOVLW       45
	MOVWF       Mode_A_op_L0+0 
	GOTO        L_Mode_A97
;UART_RX.c,256 :: 		case 16: op = '+'; break; // D
L_Mode_A101:
	MOVLW       43
	MOVWF       Mode_A_op_L0+0 
	GOTO        L_Mode_A97
;UART_RX.c,257 :: 		default: return;}
L_Mode_A102:
	GOTO        L_end_Mode_A
L_Mode_A96:
	MOVF        Mode_A_op_L0+0, 0 
	XORLW       13
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A98
	MOVF        Mode_A_op_L0+0, 0 
	XORLW       14
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A99
	MOVF        Mode_A_op_L0+0, 0 
	XORLW       15
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A100
	MOVF        Mode_A_op_L0+0, 0 
	XORLW       16
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A101
	GOTO        L_Mode_A102
L_Mode_A97:
;UART_RX.c,259 :: 		Lcd_Chr(2, index+2, op);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       2
	ADDWF       _index+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        Mode_A_op_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;UART_RX.c,262 :: 		Lcd_Out(1, 1, "Number2:");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr19_UART_RX+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr19_UART_RX+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,264 :: 		do
L_Mode_A103:
;UART_RX.c,266 :: 		if (PORTB.RB7==1)
	BTFSS       PORTB+0, 7 
	GOTO        L_Mode_A106
;UART_RX.c,268 :: 		return ;
	GOTO        L_end_Mode_A
;UART_RX.c,269 :: 		}
L_Mode_A106:
;UART_RX.c,270 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable
	CALL        _Keypad_Key_Click+0, 0
	MOVF        R0, 0 
	MOVWF       Mode_A_kp_L0+0 
;UART_RX.c,273 :: 		while (!kp);
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A103
;UART_RX.c,275 :: 		switch (kp) {
	GOTO        L_Mode_A107
;UART_RX.c,276 :: 		case  1: kp = 7; break; // 1        // Uncomment this block for keypad4x4
L_Mode_A109:
	MOVLW       7
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A108
;UART_RX.c,277 :: 		case  2: kp = 4; break; // 2
L_Mode_A110:
	MOVLW       4
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A108
;UART_RX.c,278 :: 		case  3: kp = 1; break; // 3
L_Mode_A111:
	MOVLW       1
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A108
;UART_RX.c,279 :: 		case  5: kp = 8; break; // 4
L_Mode_A112:
	MOVLW       8
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A108
;UART_RX.c,280 :: 		case  6: kp = 5; break; // 5
L_Mode_A113:
	MOVLW       5
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A108
;UART_RX.c,281 :: 		case  7: kp = 2; break; // 6
L_Mode_A114:
	MOVLW       2
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A108
;UART_RX.c,282 :: 		case  8: kp = 0; break; // B
L_Mode_A115:
	CLRF        Mode_A_kp_L0+0 
	GOTO        L_Mode_A108
;UART_RX.c,283 :: 		case  9: kp = 9; break; // 7
L_Mode_A116:
	MOVLW       9
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A108
;UART_RX.c,284 :: 		case 10: kp = 6; break; // 8
L_Mode_A117:
	MOVLW       6
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A108
;UART_RX.c,285 :: 		case 11: kp = 3; break; // 9
L_Mode_A118:
	MOVLW       3
	MOVWF       Mode_A_kp_L0+0 
	GOTO        L_Mode_A108
;UART_RX.c,286 :: 		default: return;
L_Mode_A119:
	GOTO        L_end_Mode_A
;UART_RX.c,287 :: 		}
L_Mode_A107:
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A109
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A110
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A111
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A112
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A113
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A114
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A115
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A116
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A117
	MOVF        Mode_A_kp_L0+0, 0 
	XORLW       11
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A118
	GOTO        L_Mode_A119
L_Mode_A108:
;UART_RX.c,288 :: 		num_2 = kp;
	MOVF        Mode_A_kp_L0+0, 0 
	MOVWF       R0 
	CALL        _byte2double+0, 0
	MOVF        R0, 0 
	MOVWF       Mode_A_num_2_L0+0 
	MOVF        R1, 0 
	MOVWF       Mode_A_num_2_L0+1 
	MOVF        R2, 0 
	MOVWF       Mode_A_num_2_L0+2 
	MOVF        R3, 0 
	MOVWF       Mode_A_num_2_L0+3 
;UART_RX.c,289 :: 		Lcd_Chr(2, index+3, kp+'0');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       3
	ADDWF       _index+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       48
	ADDWF       Mode_A_kp_L0+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;UART_RX.c,291 :: 		switch (op) {
	GOTO        L_Mode_A120
;UART_RX.c,292 :: 		case '/': result = num_1 / num_2;
L_Mode_A122:
	MOVF        Mode_A_num_2_L0+0, 0 
	MOVWF       R4 
	MOVF        Mode_A_num_2_L0+1, 0 
	MOVWF       R5 
	MOVF        Mode_A_num_2_L0+2, 0 
	MOVWF       R6 
	MOVF        Mode_A_num_2_L0+3, 0 
	MOVWF       R7 
	MOVF        Mode_A_num_1_L0+0, 0 
	MOVWF       R0 
	MOVF        Mode_A_num_1_L0+1, 0 
	MOVWF       R1 
	MOVF        Mode_A_num_1_L0+2, 0 
	MOVWF       R2 
	MOVF        Mode_A_num_1_L0+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       Mode_A_result_L0+0 
	MOVF        R1, 0 
	MOVWF       Mode_A_result_L0+1 
	MOVF        R2, 0 
	MOVWF       Mode_A_result_L0+2 
	MOVF        R3, 0 
	MOVWF       Mode_A_result_L0+3 
;UART_RX.c,294 :: 		if (num_2 == 0) {
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	MOVF        Mode_A_num_2_L0+0, 0 
	MOVWF       R0 
	MOVF        Mode_A_num_2_L0+1, 0 
	MOVWF       R1 
	MOVF        Mode_A_num_2_L0+2, 0 
	MOVWF       R2 
	MOVF        Mode_A_num_2_L0+3, 0 
	MOVWF       R3 
	CALL        _Equals_Double+0, 0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A123
;UART_RX.c,296 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UART_RX.c,297 :: 		Lcd_Out(2, 6, "ERROR");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr20_UART_RX+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr20_UART_RX+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,298 :: 		}else
	GOTO        L_Mode_A124
L_Mode_A123:
;UART_RX.c,300 :: 		Lcd_Chr(2, index+4, '=');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       4
	ADDWF       _index+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       61
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;UART_RX.c,301 :: 		sprintf(txt, "%.1f", result);
	MOVLW       _txt+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_21_UART_RX+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_21_UART_RX+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_21_UART_RX+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        Mode_A_result_L0+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        Mode_A_result_L0+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        Mode_A_result_L0+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        Mode_A_result_L0+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;UART_RX.c,302 :: 		Lcd_Out(2, 9, txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,304 :: 		}
L_Mode_A124:
;UART_RX.c,306 :: 		break; // *
	GOTO        L_Mode_A121
;UART_RX.c,307 :: 		case 'x': result = num_1 * num_2;
L_Mode_A125:
	MOVF        Mode_A_num_1_L0+0, 0 
	MOVWF       R0 
	MOVF        Mode_A_num_1_L0+1, 0 
	MOVWF       R1 
	MOVF        Mode_A_num_1_L0+2, 0 
	MOVWF       R2 
	MOVF        Mode_A_num_1_L0+3, 0 
	MOVWF       R3 
	MOVF        Mode_A_num_2_L0+0, 0 
	MOVWF       R4 
	MOVF        Mode_A_num_2_L0+1, 0 
	MOVWF       R5 
	MOVF        Mode_A_num_2_L0+2, 0 
	MOVWF       R6 
	MOVF        Mode_A_num_2_L0+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       Mode_A_result_L0+0 
	MOVF        R1, 0 
	MOVWF       Mode_A_result_L0+1 
	MOVF        R2, 0 
	MOVWF       Mode_A_result_L0+2 
	MOVF        R3, 0 
	MOVWF       Mode_A_result_L0+3 
;UART_RX.c,308 :: 		Lcd_Out(1,1," Result ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr22_UART_RX+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr22_UART_RX+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,309 :: 		Lcd_Chr(2, index+4, '=');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       4
	ADDWF       _index+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       61
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;UART_RX.c,310 :: 		sprintf(txt, "%.1f", result);
	MOVLW       _txt+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_23_UART_RX+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_23_UART_RX+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_23_UART_RX+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        Mode_A_result_L0+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        Mode_A_result_L0+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        Mode_A_result_L0+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        Mode_A_result_L0+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;UART_RX.c,311 :: 		Lcd_Out(2, 9, txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,312 :: 		break; // 0
	GOTO        L_Mode_A121
;UART_RX.c,313 :: 		case '-': result = num_1 - num_2;
L_Mode_A126:
	MOVF        Mode_A_num_2_L0+0, 0 
	MOVWF       R4 
	MOVF        Mode_A_num_2_L0+1, 0 
	MOVWF       R5 
	MOVF        Mode_A_num_2_L0+2, 0 
	MOVWF       R6 
	MOVF        Mode_A_num_2_L0+3, 0 
	MOVWF       R7 
	MOVF        Mode_A_num_1_L0+0, 0 
	MOVWF       R0 
	MOVF        Mode_A_num_1_L0+1, 0 
	MOVWF       R1 
	MOVF        Mode_A_num_1_L0+2, 0 
	MOVWF       R2 
	MOVF        Mode_A_num_1_L0+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       Mode_A_result_L0+0 
	MOVF        R1, 0 
	MOVWF       Mode_A_result_L0+1 
	MOVF        R2, 0 
	MOVWF       Mode_A_result_L0+2 
	MOVF        R3, 0 
	MOVWF       Mode_A_result_L0+3 
;UART_RX.c,314 :: 		Lcd_Out(1,1," Result ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr24_UART_RX+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr24_UART_RX+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,315 :: 		Lcd_Chr(2, index+4, '=');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       4
	ADDWF       _index+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       61
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;UART_RX.c,316 :: 		sprintf(txt, "%.1f", result);
	MOVLW       _txt+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_25_UART_RX+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_25_UART_RX+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_25_UART_RX+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        Mode_A_result_L0+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        Mode_A_result_L0+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        Mode_A_result_L0+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        Mode_A_result_L0+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;UART_RX.c,317 :: 		Lcd_Out(2, 9, txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,318 :: 		break; // #
	GOTO        L_Mode_A121
;UART_RX.c,319 :: 		case '+': result = num_1 + num_2;
L_Mode_A127:
	MOVF        Mode_A_num_1_L0+0, 0 
	MOVWF       R0 
	MOVF        Mode_A_num_1_L0+1, 0 
	MOVWF       R1 
	MOVF        Mode_A_num_1_L0+2, 0 
	MOVWF       R2 
	MOVF        Mode_A_num_1_L0+3, 0 
	MOVWF       R3 
	MOVF        Mode_A_num_2_L0+0, 0 
	MOVWF       R4 
	MOVF        Mode_A_num_2_L0+1, 0 
	MOVWF       R5 
	MOVF        Mode_A_num_2_L0+2, 0 
	MOVWF       R6 
	MOVF        Mode_A_num_2_L0+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       Mode_A_result_L0+0 
	MOVF        R1, 0 
	MOVWF       Mode_A_result_L0+1 
	MOVF        R2, 0 
	MOVWF       Mode_A_result_L0+2 
	MOVF        R3, 0 
	MOVWF       Mode_A_result_L0+3 
;UART_RX.c,320 :: 		Lcd_Out(1,1," Result ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr26_UART_RX+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr26_UART_RX+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,321 :: 		Lcd_Chr(2, index+4, '=');
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       4
	ADDWF       _index+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       61
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;UART_RX.c,322 :: 		sprintf(txt, "%.1f", result);
	MOVLW       _txt+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_27_UART_RX+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_27_UART_RX+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_27_UART_RX+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        Mode_A_result_L0+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        Mode_A_result_L0+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        Mode_A_result_L0+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        Mode_A_result_L0+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;UART_RX.c,323 :: 		Lcd_Out(2, 9, txt);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,324 :: 		break; // D
	GOTO        L_Mode_A121
;UART_RX.c,325 :: 		default:
L_Mode_A128:
;UART_RX.c,327 :: 		return;
	GOTO        L_end_Mode_A
;UART_RX.c,328 :: 		}
L_Mode_A120:
	MOVF        Mode_A_op_L0+0, 0 
	XORLW       47
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A122
	MOVF        Mode_A_op_L0+0, 0 
	XORLW       120
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A125
	MOVF        Mode_A_op_L0+0, 0 
	XORLW       45
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A126
	MOVF        Mode_A_op_L0+0, 0 
	XORLW       43
	BTFSC       STATUS+0, 2 
	GOTO        L_Mode_A127
	GOTO        L_Mode_A128
L_Mode_A121:
;UART_RX.c,329 :: 		Delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_Mode_A129:
	DECFSZ      R13, 1, 1
	BRA         L_Mode_A129
	DECFSZ      R12, 1, 1
	BRA         L_Mode_A129
	DECFSZ      R11, 1, 1
	BRA         L_Mode_A129
	NOP
	NOP
;UART_RX.c,330 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UART_RX.c,332 :: 		}
L_Mode_A74:
L_Mode_A73:
L_Mode_A41:
;UART_RX.c,333 :: 		}
L_end_Mode_A:
	RETURN      0
; end of _Mode_A

_mode_c:

;UART_RX.c,334 :: 		void mode_c(){
;UART_RX.c,335 :: 		if( UART1_Data_Ready() == 1)
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_mode_c130
;UART_RX.c,337 :: 		lcd_out(1,8,"LDR= ")  ;
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr28_UART_RX+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr28_UART_RX+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,338 :: 		y = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _y+0 
	MOVLW       0
	MOVWF       _y+1 
;UART_RX.c,339 :: 		inttostr(y , txt ) ;
	MOVF        _y+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _y+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;UART_RX.c,340 :: 		lcd_out(1,11,txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       11
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,341 :: 		if (y<=50){
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _y+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mode_c148
	MOVF        _y+0, 0 
	SUBLW       50
L__mode_c148:
	BTFSS       STATUS+0, 0 
	GOTO        L_mode_c131
;UART_RX.c,343 :: 		lcd_out(2,1,"Night  ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr29_UART_RX+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr29_UART_RX+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,344 :: 		latb.rb0 = 1;
	BSF         LATB+0, 0 
;UART_RX.c,346 :: 		}
L_mode_c131:
;UART_RX.c,348 :: 		if (y>=50)  {
	MOVLW       128
	XORWF       _y+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__mode_c149
	MOVLW       50
	SUBWF       _y+0, 0 
L__mode_c149:
	BTFSS       STATUS+0, 0 
	GOTO        L_mode_c132
;UART_RX.c,350 :: 		lcd_out(2,1,"Morning");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr30_UART_RX+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr30_UART_RX+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,351 :: 		latb.rb0 = 0;
	BCF         LATB+0, 0 
;UART_RX.c,352 :: 		}
L_mode_c132:
;UART_RX.c,353 :: 		delay_ms(10);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_mode_c133:
	DECFSZ      R13, 1, 1
	BRA         L_mode_c133
	DECFSZ      R12, 1, 1
	BRA         L_mode_c133
	NOP
	NOP
;UART_RX.c,354 :: 		}
L_mode_c130:
;UART_RX.c,355 :: 		}
L_end_mode_c:
	RETURN      0
; end of _mode_c

_lockSystem:

;UART_RX.c,357 :: 		void lockSystem(unsigned short delayTime) {
;UART_RX.c,359 :: 		for (i = delayTime; i > 0; i--) {
	MOVF        FARG_lockSystem_delayTime+0, 0 
	MOVWF       lockSystem_i_L0+0 
L_lockSystem134:
	MOVF        lockSystem_i_L0+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_lockSystem135
;UART_RX.c,360 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UART_RX.c,361 :: 		sprintf(txt, "Locked: %d sec", i);
	MOVLW       _txt+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_31_UART_RX+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_31_UART_RX+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_31_UART_RX+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        lockSystem_i_L0+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	CALL        _sprintf+0, 0
;UART_RX.c,362 :: 		Lcd_Out(1, 1, txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,363 :: 		Delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_lockSystem137:
	DECFSZ      R13, 1, 1
	BRA         L_lockSystem137
	DECFSZ      R12, 1, 1
	BRA         L_lockSystem137
	DECFSZ      R11, 1, 1
	BRA         L_lockSystem137
	NOP
	NOP
;UART_RX.c,359 :: 		for (i = delayTime; i > 0; i--) {
	DECF        lockSystem_i_L0+0, 1 
;UART_RX.c,364 :: 		}
	GOTO        L_lockSystem134
L_lockSystem135:
;UART_RX.c,366 :: 		if (delayTime == 0) {
	MOVF        FARG_lockSystem_delayTime+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_lockSystem138
;UART_RX.c,368 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UART_RX.c,371 :: 		while (1) {
L_lockSystem139:
;UART_RX.c,372 :: 		Lcd_Out(1, 1, "System Locked!");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr32_UART_RX+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr32_UART_RX+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,373 :: 		Lcd_Out(2, 5, "Alarm!");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr33_UART_RX+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr33_UART_RX+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART_RX.c,374 :: 		UART1_Write('4'); // Send '4' via UART
	MOVLW       52
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;UART_RX.c,377 :: 		Delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_lockSystem141:
	DECFSZ      R13, 1, 1
	BRA         L_lockSystem141
	DECFSZ      R12, 1, 1
	BRA         L_lockSystem141
	DECFSZ      R11, 1, 1
	BRA         L_lockSystem141
	NOP
	NOP
;UART_RX.c,378 :: 		}
	GOTO        L_lockSystem139
;UART_RX.c,383 :: 		}
L_lockSystem138:
;UART_RX.c,384 :: 		}
L_end_lockSystem:
	RETURN      0
; end of _lockSystem
