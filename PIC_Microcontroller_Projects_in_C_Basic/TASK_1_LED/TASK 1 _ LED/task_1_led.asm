
_main:

;task_1_led.c,3 :: 		void main() {
;task_1_led.c,4 :: 		TRISC = 0B00000000;  // Set all pins on PORTC as outputs
	CLRF        TRISC+0 
;task_1_led.c,5 :: 		LATC = 0B00000001;  // Initialize PORTC to 0b00000001
	MOVLW       1
	MOVWF       LATC+0 
;task_1_led.c,7 :: 		while (1) {
L_main0:
;task_1_led.c,9 :: 		while (i < 8) {
L_main2:
	MOVLW       8
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;task_1_led.c,10 :: 		LATC = 1 << i; // shift 1
	MOVF        _i+0, 0 
	MOVWF       R1 
	MOVLW       1
	MOVWF       R0 
	MOVF        R1, 0 
L__main6:
	BZ          L__main7
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L__main6
L__main7:
	MOVF        R0, 0 
	MOVWF       LATC+0 
;task_1_led.c,11 :: 		delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
	NOP
;task_1_led.c,12 :: 		i++;
	INCF        _i+0, 1 
;task_1_led.c,13 :: 		}
	GOTO        L_main2
L_main3:
;task_1_led.c,16 :: 		i = 0;
	CLRF        _i+0 
;task_1_led.c,17 :: 		LATC = 0B00000001;
	MOVLW       1
	MOVWF       LATC+0 
;task_1_led.c,18 :: 		}
	GOTO        L_main0
;task_1_led.c,19 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
