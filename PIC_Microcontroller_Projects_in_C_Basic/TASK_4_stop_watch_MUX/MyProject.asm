
_main:

;MyProject.c,1 :: 		void main() {
;MyProject.c,2 :: 		char state = 0;
	MOVLW       ?ICSmain_state_L0+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICSmain_state_L0+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICSmain_state_L0+0)
	MOVWF       TBLPTRU 
	MOVLW       main_state_L0+0
	MOVWF       FSR1 
	MOVLW       hi_addr(main_state_L0+0)
	MOVWF       FSR1H 
	MOVLW       32
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
;MyProject.c,12 :: 		TRISD = 0;
	CLRF        TRISD+0 
;MyProject.c,13 :: 		TRISB.RB0 = 0;
	BCF         TRISB+0, 0 
;MyProject.c,14 :: 		TRISB.RB1 = 0;
	BCF         TRISB+0, 1 
;MyProject.c,15 :: 		TRISB.RB2 = 0;
	BCF         TRISB+0, 2 
;MyProject.c,16 :: 		TRISC.RC7 = 1;
	BSF         TRISC+0, 7 
;MyProject.c,17 :: 		TRISB.RB7 = 1;
	BSF         TRISB+0, 7 
;MyProject.c,18 :: 		TRISA.RA0 = 0;
	BCF         TRISA+0, 0 
;MyProject.c,19 :: 		TRISA.RA1 = 0;
	BCF         TRISA+0, 1 
;MyProject.c,21 :: 		while (1) {
L_main0:
;MyProject.c,22 :: 		if (state && PORTB.RB6) {
	MOVF        main_state_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main4
	BTFSS       PORTB+0, 6 
	GOTO        L_main4
L__main19:
;MyProject.c,23 :: 		sec1 = 0;
	CLRF        main_sec1_L0+0 
;MyProject.c,24 :: 		sec2 = 0;
	CLRF        main_sec2_L0+0 
;MyProject.c,25 :: 		min = 0;
	CLRF        main_min_L0+0 
;MyProject.c,26 :: 		LATD = seg_sec1[sec1];
	MOVLW       main_seg_sec1_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_seg_sec1_L0+0)
	MOVWF       FSR0H 
	MOVF        main_sec1_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       LATD+0 
;MyProject.c,27 :: 		LATD = seg_sec2[sec2];
	MOVLW       main_seg_sec2_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_seg_sec2_L0+0)
	MOVWF       FSR0H 
	MOVF        main_sec2_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       LATD+0 
;MyProject.c,28 :: 		LATD = seg_min[min];
	MOVLW       main_seg_min_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_seg_min_L0+0)
	MOVWF       FSR0H 
	MOVF        main_min_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       LATD+0 
;MyProject.c,29 :: 		}
L_main4:
;MyProject.c,31 :: 		if (PORTB.RB7 == 1) { // when pressing the button 1
	BTFSS       PORTB+0, 7 
	GOTO        L_main5
;MyProject.c,32 :: 		while (sec2 <= 10) { // start count
L_main6:
	MOVF        main_sec2_L0+0, 0 
	SUBLW       10
	BTFSS       STATUS+0, 0 
	GOTO        L_main7
;MyProject.c,34 :: 		LATB.RB0 = 0;
	BCF         LATB+0, 0 
;MyProject.c,35 :: 		LATB.RB1 = 1;
	BSF         LATB+0, 1 
;MyProject.c,36 :: 		LATB.RB2 = 1;
	BSF         LATB+0, 2 
;MyProject.c,37 :: 		LATD = seg_sec2[sec2];
	MOVLW       main_seg_sec2_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_seg_sec2_L0+0)
	MOVWF       FSR0H 
	MOVF        main_sec2_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       LATD+0 
;MyProject.c,38 :: 		delay_ms(10);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	NOP
	NOP
;MyProject.c,41 :: 		LATB.RB0 = 1;
	BSF         LATB+0, 0 
;MyProject.c,42 :: 		LATB.RB1 = 0;
	BCF         LATB+0, 1 
;MyProject.c,43 :: 		LATB.RB2 = 1;
	BSF         LATB+0, 2 
;MyProject.c,44 :: 		LATD = seg_sec1[sec1];
	MOVLW       main_seg_sec1_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_seg_sec1_L0+0)
	MOVWF       FSR0H 
	MOVF        main_sec1_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       LATD+0 
;MyProject.c,45 :: 		delay_ms(10);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	NOP
	NOP
;MyProject.c,48 :: 		LATB.RB0 = 1;
	BSF         LATB+0, 0 
;MyProject.c,49 :: 		LATB.RB1 = 1;
	BSF         LATB+0, 1 
;MyProject.c,50 :: 		LATB.RB2 = 0;
	BCF         LATB+0, 2 
;MyProject.c,51 :: 		LATD = seg_min[min];
	MOVLW       main_seg_min_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_seg_min_L0+0)
	MOVWF       FSR0H 
	MOVF        main_min_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       LATD+0 
;MyProject.c,52 :: 		delay_ms(10);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	NOP
	NOP
;MyProject.c,54 :: 		delay_ms(80); // Adjust for the remaining time
	MOVLW       104
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
	NOP
;MyProject.c,56 :: 		sec2++; // Increment sec2
	INCF        main_sec2_L0+0, 1 
;MyProject.c,57 :: 		if (sec2 == 10) {
	MOVF        main_sec2_L0+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_main12
;MyProject.c,58 :: 		sec2 = 0;
	CLRF        main_sec2_L0+0 
;MyProject.c,59 :: 		sec1++; // Increment sec1
	INCF        main_sec1_L0+0, 1 
;MyProject.c,60 :: 		if (sec1 == 6) {
	MOVF        main_sec1_L0+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_main13
;MyProject.c,61 :: 		sec1 = 0;
	CLRF        main_sec1_L0+0 
;MyProject.c,62 :: 		min++; // Increment min
	INCF        main_min_L0+0, 1 
;MyProject.c,63 :: 		if (min == 10) {
	MOVF        main_min_L0+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_main14
;MyProject.c,64 :: 		min = 0;
	CLRF        main_min_L0+0 
;MyProject.c,65 :: 		}
L_main14:
;MyProject.c,66 :: 		}
L_main13:
;MyProject.c,67 :: 		}
L_main12:
;MyProject.c,69 :: 		if (PORTC.RC7 == 1) {
	BTFSS       PORTC+0, 7 
	GOTO        L_main15
;MyProject.c,70 :: 		state = 1;
	MOVLW       1
	MOVWF       main_state_L0+0 
;MyProject.c,71 :: 		break; // stop
	GOTO        L_main7
;MyProject.c,72 :: 		}
L_main15:
;MyProject.c,73 :: 		}
	GOTO        L_main6
L_main7:
;MyProject.c,74 :: 		}
L_main5:
;MyProject.c,76 :: 		LATB.RB0 = 0;
	BCF         LATB+0, 0 
;MyProject.c,77 :: 		LATB.RB1 = 1;
	BSF         LATB+0, 1 
;MyProject.c,78 :: 		LATB.RB2 = 1;
	BSF         LATB+0, 2 
;MyProject.c,79 :: 		LATD = seg_sec2[sec2];
	MOVLW       main_seg_sec2_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_seg_sec2_L0+0)
	MOVWF       FSR0H 
	MOVF        main_sec2_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       LATD+0 
;MyProject.c,80 :: 		delay_ms(10);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_main16:
	DECFSZ      R13, 1, 1
	BRA         L_main16
	DECFSZ      R12, 1, 1
	BRA         L_main16
	NOP
	NOP
;MyProject.c,82 :: 		LATB.RB0 = 1;
	BSF         LATB+0, 0 
;MyProject.c,83 :: 		LATB.RB1 = 0;
	BCF         LATB+0, 1 
;MyProject.c,84 :: 		LATB.RB2 = 1;
	BSF         LATB+0, 2 
;MyProject.c,85 :: 		LATD = seg_sec1[sec1];
	MOVLW       main_seg_sec1_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_seg_sec1_L0+0)
	MOVWF       FSR0H 
	MOVF        main_sec1_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       LATD+0 
;MyProject.c,86 :: 		delay_ms(10);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_main17:
	DECFSZ      R13, 1, 1
	BRA         L_main17
	DECFSZ      R12, 1, 1
	BRA         L_main17
	NOP
	NOP
;MyProject.c,88 :: 		LATB.RB0 = 1;
	BSF         LATB+0, 0 
;MyProject.c,89 :: 		LATB.RB1 = 1;
	BSF         LATB+0, 1 
;MyProject.c,90 :: 		LATB.RB2 = 0;
	BCF         LATB+0, 2 
;MyProject.c,91 :: 		LATD = seg_min[min];
	MOVLW       main_seg_min_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_seg_min_L0+0)
	MOVWF       FSR0H 
	MOVF        main_min_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       LATD+0 
;MyProject.c,92 :: 		delay_ms(10);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_main18:
	DECFSZ      R13, 1, 1
	BRA         L_main18
	DECFSZ      R12, 1, 1
	BRA         L_main18
	NOP
	NOP
;MyProject.c,93 :: 		}
	GOTO        L_main0
;MyProject.c,94 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
