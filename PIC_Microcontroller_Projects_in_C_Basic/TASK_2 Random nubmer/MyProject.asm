
_main:

;MyProject.c,1 :: 		int main() {
;MyProject.c,3 :: 		char i = 0;
	CLRF        main_i_L0+0 
	MOVLW       8
	MOVWF       main_led_L0+0 
	MOVLW       20
	MOVWF       main_led_L0+1 
	MOVLW       28
	MOVWF       main_led_L0+2 
	MOVLW       99
	MOVWF       main_led_L0+3 
	MOVLW       107
	MOVWF       main_led_L0+4 
	MOVLW       119
	MOVWF       main_led_L0+5 
;MyProject.c,6 :: 		TRISD = 0;  // Configure PORTD as an output
	CLRF        TRISD+0 
;MyProject.c,7 :: 		LATD=0B11111111;
	MOVLW       255
	MOVWF       LATD+0 
;MyProject.c,8 :: 		delay_ms(3000);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
	NOP
;MyProject.c,9 :: 		LATD = 0;
	CLRF        LATD+0 
;MyProject.c,10 :: 		while (1) {
L_main1:
;MyProject.c,11 :: 		i+=1; // incrment for i usulally
	INCF        main_i_L0+0, 1 
;MyProject.c,12 :: 		if (i == 6){   // to set range between 0 and 5
	MOVF        main_i_L0+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
;MyProject.c,13 :: 		i =0;
	CLRF        main_i_L0+0 
;MyProject.c,14 :: 		}
L_main3:
;MyProject.c,15 :: 		if (PORTB.RB7 == 1) {
	BTFSS       PORTB+0, 7 
	GOTO        L_main4
;MyProject.c,16 :: 		randomValue = led[i]; // set a random number from array  0 to 5
	MOVLW       main_led_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_led_L0+0)
	MOVWF       FSR0H 
	MOVF        main_i_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       LATD+0 
;MyProject.c,18 :: 		LATD = randomValue ;  // Set the corresponding LED pattern      '
;MyProject.c,20 :: 		delay_ms(3000);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
	NOP
;MyProject.c,21 :: 		LATD = 0;
	CLRF        LATD+0 
;MyProject.c,22 :: 		i = 0;
	CLRF        main_i_L0+0 
;MyProject.c,23 :: 		}
L_main4:
;MyProject.c,25 :: 		}
	GOTO        L_main1
;MyProject.c,27 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
