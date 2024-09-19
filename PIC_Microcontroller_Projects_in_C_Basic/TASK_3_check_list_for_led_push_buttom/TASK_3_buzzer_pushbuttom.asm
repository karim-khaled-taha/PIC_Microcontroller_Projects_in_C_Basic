
_main:

;TASK_3_buzzer_pushbuttom.c,1 :: 		int main() {
;TASK_3_buzzer_pushbuttom.c,3 :: 		TRISC=0;   // def out
	CLRF        TRISC+0 
;TASK_3_buzzer_pushbuttom.c,4 :: 		TRISA.RA0=0; // def out
	BCF         TRISA+0, 0 
;TASK_3_buzzer_pushbuttom.c,5 :: 		TRISb.RB6=1;  // def input
	BSF         TRISB+0, 6 
;TASK_3_buzzer_pushbuttom.c,6 :: 		TRISb.RB7=1;  // def input
	BSF         TRISB+0, 7 
;TASK_3_buzzer_pushbuttom.c,8 :: 		while (1) {
L_main0:
;TASK_3_buzzer_pushbuttom.c,10 :: 		if (PORTB.RB6 == 1){        // when prees on button
	BTFSS       PORTB+0, 6 
	GOTO        L_main2
;TASK_3_buzzer_pushbuttom.c,11 :: 		while (PORTB.RB6 = 1){};
L_main3:
	BSF         PORTB+0, 6 
	BTFSS       PORTB+0, 6 
	GOTO        L_main4
	GOTO        L_main3
L_main4:
;TASK_3_buzzer_pushbuttom.c,12 :: 		LATC=LATC<<1;   // ste port c = 1
	MOVF        LATC+0, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVF        R0, 0 
	MOVWF       LATC+0 
;TASK_3_buzzer_pushbuttom.c,14 :: 		if (LATC==0)       // if all pins in port c = 0
	MOVF        LATC+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
;TASK_3_buzzer_pushbuttom.c,17 :: 		LATC=0B0000001;   // return and set first pin = 1
	MOVLW       1
	MOVWF       LATC+0 
;TASK_3_buzzer_pushbuttom.c,19 :: 		}
L_main5:
;TASK_3_buzzer_pushbuttom.c,20 :: 		delay_ms(500);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
	NOP
;TASK_3_buzzer_pushbuttom.c,22 :: 		if (LATC.RC7==1){ // check if the end of led hight turn on buzzer
	BTFSS       LATC+0, 7 
	GOTO        L_main7
;TASK_3_buzzer_pushbuttom.c,23 :: 		LATA.RA0 =1;
	BSF         LATA+0, 0 
;TASK_3_buzzer_pushbuttom.c,24 :: 		delay_ms(500);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	DECFSZ      R11, 1, 1
	BRA         L_main8
	NOP
	NOP
;TASK_3_buzzer_pushbuttom.c,25 :: 		}else {
	GOTO        L_main9
L_main7:
;TASK_3_buzzer_pushbuttom.c,26 :: 		LATA.RA0 =0;
	BCF         LATA+0, 0 
;TASK_3_buzzer_pushbuttom.c,27 :: 		}
L_main9:
;TASK_3_buzzer_pushbuttom.c,28 :: 		}
L_main2:
;TASK_3_buzzer_pushbuttom.c,29 :: 		if (PORTB.RB7 == 1){
	BTFSS       PORTB+0, 7 
	GOTO        L_main10
;TASK_3_buzzer_pushbuttom.c,30 :: 		while (PORTB.RB7 = 1){};
L_main11:
	BSF         PORTB+0, 7 
	BTFSS       PORTB+0, 7 
	GOTO        L_main12
	GOTO        L_main11
L_main12:
;TASK_3_buzzer_pushbuttom.c,31 :: 		LATC=LATC>>1;
	MOVF        LATC+0, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVF        R0, 0 
	MOVWF       LATC+0 
;TASK_3_buzzer_pushbuttom.c,33 :: 		if (LATC==0)
	MOVF        LATC+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main13
;TASK_3_buzzer_pushbuttom.c,35 :: 		LATC=0B10000000;
	MOVLW       128
	MOVWF       LATC+0 
;TASK_3_buzzer_pushbuttom.c,36 :: 		}
L_main13:
;TASK_3_buzzer_pushbuttom.c,37 :: 		delay_ms(500);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main14:
	DECFSZ      R13, 1, 1
	BRA         L_main14
	DECFSZ      R12, 1, 1
	BRA         L_main14
	DECFSZ      R11, 1, 1
	BRA         L_main14
	NOP
	NOP
;TASK_3_buzzer_pushbuttom.c,38 :: 		if (LATC.RC0==1){
	BTFSS       LATC+0, 0 
	GOTO        L_main15
;TASK_3_buzzer_pushbuttom.c,39 :: 		LATA.RA0 =1;
	BSF         LATA+0, 0 
;TASK_3_buzzer_pushbuttom.c,40 :: 		delay_ms(500);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main16:
	DECFSZ      R13, 1, 1
	BRA         L_main16
	DECFSZ      R12, 1, 1
	BRA         L_main16
	DECFSZ      R11, 1, 1
	BRA         L_main16
	NOP
	NOP
;TASK_3_buzzer_pushbuttom.c,41 :: 		}else {
	GOTO        L_main17
L_main15:
;TASK_3_buzzer_pushbuttom.c,42 :: 		LATA.RA0 =0;
	BCF         LATA+0, 0 
;TASK_3_buzzer_pushbuttom.c,43 :: 		}
L_main17:
;TASK_3_buzzer_pushbuttom.c,44 :: 		}
L_main10:
;TASK_3_buzzer_pushbuttom.c,45 :: 		}
	GOTO        L_main0
;TASK_3_buzzer_pushbuttom.c,46 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
