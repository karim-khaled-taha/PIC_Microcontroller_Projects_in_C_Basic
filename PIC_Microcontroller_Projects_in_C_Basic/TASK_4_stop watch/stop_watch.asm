
_main:

;stop_watch.c,1 :: 		void main() {
;stop_watch.c,2 :: 		char state= 0 ;
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
	MOVLW       31
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
;stop_watch.c,11 :: 		trisd=0;
	CLRF        TRISD+0 
;stop_watch.c,12 :: 		trisb=0;
	CLRF        TRISB+0 
;stop_watch.c,13 :: 		trisc=0;
	CLRF        TRISC+0 
;stop_watch.c,14 :: 		TRISc.RC7= 1 ;
	BSF         TRISC+0, 7 
;stop_watch.c,15 :: 		TRISB.RB7= 1 ;
	BSF         TRISB+0, 7 
;stop_watch.c,16 :: 		TRISD.RD7= 1 ;
	BSF         TRISD+0, 7 
;stop_watch.c,17 :: 		trisa.RA0=0;
	BCF         TRISA+0, 0 
;stop_watch.c,19 :: 		while(1)
L_main0:
;stop_watch.c,21 :: 		if (state && PORTD.RD7) {
	MOVF        main_state_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main4
	BTFSS       PORTD+0, 7 
	GOTO        L_main4
L__main16:
;stop_watch.c,22 :: 		sec1 = 0;
	CLRF        main_sec1_L0+0 
;stop_watch.c,23 :: 		sec2 = 0;
	CLRF        R1 
;stop_watch.c,24 :: 		min = 0;
	CLRF        main_min_L0+0 
;stop_watch.c,25 :: 		LATB = seg_sec1[sec1];
	MOVLW       main_seg_sec1_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_seg_sec1_L0+0)
	MOVWF       FSR0H 
	MOVF        main_sec1_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       LATB+0 
;stop_watch.c,26 :: 		LATC = seg_sec2[sec2];
	MOVLW       main_seg_sec2_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_seg_sec2_L0+0)
	MOVWF       FSR0H 
	MOVF        R1, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       LATC+0 
;stop_watch.c,27 :: 		LATD = seg_min[min];
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
;stop_watch.c,28 :: 		}
L_main4:
;stop_watch.c,29 :: 		if (PORTB.RB7 == 1  )
	BTFSS       PORTB+0, 7 
	GOTO        L_main5
;stop_watch.c,32 :: 		while (sec2 <= 10)
L_main6:
	MOVF        R1, 0 
	SUBLW       10
	BTFSS       STATUS+0, 0 
	GOTO        L_main7
;stop_watch.c,34 :: 		sec2++;  // Increment the loop variable
	INCF        R1, 1 
;stop_watch.c,35 :: 		LATD = seg_sec2[sec2];
	MOVLW       main_seg_sec2_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_seg_sec2_L0+0)
	MOVWF       FSR0H 
	MOVF        R1, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       LATD+0 
;stop_watch.c,36 :: 		delay_ms(200);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	DECFSZ      R11, 1, 1
	BRA         L_main8
	NOP
;stop_watch.c,38 :: 		if (sec2 == 10)
	MOVF        R1, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_main9
;stop_watch.c,40 :: 		sec2 = 0;
	CLRF        R1 
;stop_watch.c,41 :: 		sec1++;
	INCF        main_sec1_L0+0, 1 
;stop_watch.c,42 :: 		LATB = seg_sec1[sec1];
	MOVLW       main_seg_sec1_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_seg_sec1_L0+0)
	MOVWF       FSR0H 
	MOVF        main_sec1_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       LATB+0 
;stop_watch.c,44 :: 		}
L_main9:
;stop_watch.c,45 :: 		if(sec1 == 6 && sec2== 0 )
	MOVF        main_sec1_L0+0, 0 
	XORLW       6
	BTFSS       STATUS+0, 2 
	GOTO        L_main12
	MOVF        R1, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main12
L__main15:
;stop_watch.c,47 :: 		sec1= 0 ;
	CLRF        main_sec1_L0+0 
;stop_watch.c,48 :: 		min++;
	INCF        main_min_L0+0, 1 
;stop_watch.c,49 :: 		LATC = seg_min[min];
	MOVLW       main_seg_min_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_seg_min_L0+0)
	MOVWF       FSR0H 
	MOVF        main_min_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       LATC+0 
;stop_watch.c,50 :: 		}
L_main12:
;stop_watch.c,53 :: 		if (min == 10 ){
	MOVF        main_min_L0+0, 0 
	XORLW       10
	BTFSS       STATUS+0, 2 
	GOTO        L_main13
;stop_watch.c,54 :: 		min =0;
	CLRF        main_min_L0+0 
;stop_watch.c,55 :: 		}
L_main13:
;stop_watch.c,57 :: 		if (PORTC.RC7 == 1  )
	BTFSS       PORTC+0, 7 
	GOTO        L_main14
;stop_watch.c,59 :: 		state= 1;
	MOVLW       1
	MOVWF       main_state_L0+0 
;stop_watch.c,60 :: 		break;
	GOTO        L_main7
;stop_watch.c,63 :: 		}
L_main14:
;stop_watch.c,64 :: 		}
	GOTO        L_main6
L_main7:
;stop_watch.c,65 :: 		}
L_main5:
;stop_watch.c,67 :: 		LATB = seg_sec1[sec1];
	MOVLW       main_seg_sec1_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_seg_sec1_L0+0)
	MOVWF       FSR0H 
	MOVF        main_sec1_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       LATB+0 
;stop_watch.c,68 :: 		LATD = seg_sec2[sec2];
	MOVLW       main_seg_sec2_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_seg_sec2_L0+0)
	MOVWF       FSR0H 
	MOVF        R1, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       LATD+0 
;stop_watch.c,69 :: 		LATC = seg_min[min];
	MOVLW       main_seg_min_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_seg_min_L0+0)
	MOVWF       FSR0H 
	MOVF        main_min_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       LATC+0 
;stop_watch.c,70 :: 		}
	GOTO        L_main0
;stop_watch.c,78 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
