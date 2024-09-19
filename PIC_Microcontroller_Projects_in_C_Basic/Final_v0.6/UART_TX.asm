
_get_digits:

;UART_TX.c,19 :: 		void get_digits()
;UART_TX.c,21 :: 		a1 = ((voltage/100u)%10u); ; // holds 100's digit
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _voltage+0, 0 
	MOVWF       R0 
	MOVF        _voltage+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16X16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _a1+0 
	MOVF        R1, 0 
	MOVWF       _a1+1 
;UART_TX.c,22 :: 		a2 =  ((voltage/10u)%10u); // holds 10th digit
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _voltage+0, 0 
	MOVWF       R0 
	MOVF        _voltage+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Div_16X16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _a2+0 
	MOVF        R1, 0 
	MOVWF       _a2+1 
;UART_TX.c,23 :: 		a3 =  (voltage%10u); // holds unit digit value
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVF        _voltage+0, 0 
	MOVWF       R0 
	MOVF        _voltage+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R9, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _a3+0 
	MOVF        R1, 0 
	MOVWF       _a3+1 
;UART_TX.c,24 :: 		a4 =  (( voltage / 1000u));  // holds 1000's digit
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVF        _voltage+0, 0 
	MOVWF       R0 
	MOVF        _voltage+1, 0 
	MOVWF       R1 
	CALL        _Div_16X16_U+0, 0
	MOVF        R0, 0 
	MOVWF       _a4+0 
	MOVF        R1, 0 
	MOVWF       _a4+1 
;UART_TX.c,25 :: 		}
L_end_get_digits:
	RETURN      0
; end of _get_digits

_display_voltage:

;UART_TX.c,28 :: 		void display_voltage()
;UART_TX.c,31 :: 		PORTB = binary_pattern[a1];     // send unit place data to 1st digit
	MOVLW       _binary_pattern+0
	ADDWF       _a1+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_binary_pattern+0)
	ADDWFC      _a1+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTB+0 
;UART_TX.c,32 :: 		PORTD.RD0 = 0;   //  turn on 1st display unit
	BCF         PORTD+0, 0 
;UART_TX.c,33 :: 		delay_ms(3);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_display_voltage0:
	DECFSZ      R13, 1, 1
	BRA         L_display_voltage0
	DECFSZ      R12, 1, 1
	BRA         L_display_voltage0
	NOP
;UART_TX.c,34 :: 		PORTD.RD0 = 1;   //  turn off 1st display unit
	BSF         PORTD+0, 0 
;UART_TX.c,35 :: 		PORTB = binary_pattern[a2];  // send 100's place data to 3rd digit
	MOVLW       _binary_pattern+0
	ADDWF       _a2+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_binary_pattern+0)
	ADDWFC      _a2+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTB+0 
;UART_TX.c,36 :: 		PORTD.RD1 = 0;    //  turn on 2rd display unit
	BCF         PORTD+0, 1 
;UART_TX.c,37 :: 		delay_ms(3);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_display_voltage1:
	DECFSZ      R13, 1, 1
	BRA         L_display_voltage1
	DECFSZ      R12, 1, 1
	BRA         L_display_voltage1
	NOP
;UART_TX.c,38 :: 		PORTD.RD1 = 1;  //  turn off 2rd display unit
	BSF         PORTD+0, 1 
;UART_TX.c,39 :: 		PORTB = display1[a3];  // send 10th place data to 2nd digit
	MOVLW       _display1+0
	ADDWF       _a3+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_display1+0)
	ADDWFC      _a3+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTB+0 
;UART_TX.c,40 :: 		PORTD.RD2 = 0;  //  turn on 3nd display unit
	BCF         PORTD+0, 2 
;UART_TX.c,41 :: 		delay_ms(3);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_display_voltage2:
	DECFSZ      R13, 1, 1
	BRA         L_display_voltage2
	DECFSZ      R12, 1, 1
	BRA         L_display_voltage2
	NOP
;UART_TX.c,42 :: 		PORTD.RD2 = 1;   //  turn off 3nd display unit
	BSF         PORTD+0, 2 
;UART_TX.c,43 :: 		PORTB=binary_pattern[a4];  // send 1000's place data to fourth digit
	MOVLW       _binary_pattern+0
	ADDWF       _a4+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_binary_pattern+0)
	ADDWFC      _a4+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTB+0 
;UART_TX.c,44 :: 		PORTD.RD3 = 0;  //  turn on fourth display unit
	BCF         PORTD+0, 3 
;UART_TX.c,45 :: 		delay_ms(3);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_display_voltage3:
	DECFSZ      R13, 1, 1
	BRA         L_display_voltage3
	DECFSZ      R12, 1, 1
	BRA         L_display_voltage3
	NOP
;UART_TX.c,46 :: 		PORTD.RD3 = 1;  //  turn off fourth display unit
	BSF         PORTD+0, 3 
;UART_TX.c,47 :: 		}
L_end_display_voltage:
	RETURN      0
; end of _display_voltage

_main:

;UART_TX.c,50 :: 		void main()
;UART_TX.c,55 :: 		TRISD.RD0 = 0 ;    // controll of 7 seg
	BCF         TRISD+0, 0 
;UART_TX.c,56 :: 		TRISD.RD1 =0  ;
	BCF         TRISD+0, 1 
;UART_TX.c,57 :: 		TRISD.RD2 =0 ;
	BCF         TRISD+0, 2 
;UART_TX.c,58 :: 		TRISD.RD3 =0;
	BCF         TRISD+0, 3 
;UART_TX.c,60 :: 		TRISC.RC0=0;
	BCF         TRISC+0, 0 
;UART_TX.c,61 :: 		TRISC.RC1=0;
	BCF         TRISC+0, 1 
;UART_TX.c,63 :: 		TRISD.RD4 = 0;    // Configure RD4 as an output pin of led
	BCF         TRISD+0, 4 
;UART_TX.c,64 :: 		TRISD.RD5 = 0;    // Configure RD3 as an output pin of buzzer
	BCF         TRISD+0, 5 
;UART_TX.c,65 :: 		TRISD.RD6 = 0;    // Configure RD4 as an output pin of led
	BCF         TRISD+0, 6 
;UART_TX.c,66 :: 		TRISD.RD7 = 0;    // Configure RD3 as an output pin of buzzer
	BCF         TRISD+0, 7 
;UART_TX.c,67 :: 		TRISD.RA0 = 1;    // Configure RA0 as an input pin for lm35
	BSF         TRISD+0, 0 
;UART_TX.c,69 :: 		TRISC.RC0 = 0;    // Configure RC0 as an output pin
	BCF         TRISC+0, 0 
;UART_TX.c,71 :: 		PORTB=0x00;   // initialize PORTD pins to active low
	CLRF        PORTB+0 
;UART_TX.c,72 :: 		TRISB=0x00;// Set PORTB as a output port
	CLRF        TRISB+0 
;UART_TX.c,73 :: 		PWM1_Init(5000);  // Initialize PWM1 module at 5KHz
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       199
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;UART_TX.c,76 :: 		PORTD.RD0 = 1;
	BSF         PORTD+0, 0 
;UART_TX.c,77 :: 		PORTD.RD1 = 1;
	BSF         PORTD+0, 1 
;UART_TX.c,78 :: 		PORTD.RD2 = 1;
	BSF         PORTD+0, 2 
;UART_TX.c,79 :: 		PORTD.RD3 = 1;
	BSF         PORTD+0, 3 
;UART_TX.c,81 :: 		UART1_init(9615);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       103
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;UART_TX.c,82 :: 		Delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	NOP
	NOP
;UART_TX.c,83 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;UART_TX.c,84 :: 		while(1)
L_main5:
;UART_TX.c,86 :: 		uart_rd = UART1_Read();     // read the received data,
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _uart_rd+0 
;UART_TX.c,87 :: 		if(uart_rd == '2'){
	MOVF        R0, 0 
	XORLW       50
	BTFSS       STATUS+0, 2 
	GOTO        L_main7
;UART_TX.c,88 :: 		adc_value = ADC_Read(0);  // read data from channel 0
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _adc_value+0 
	MOVF        R1, 0 
	MOVWF       _adc_value+1 
;UART_TX.c,89 :: 		tlong = (float)adc_value*4.88768555; //converts voltage into temperature
	CALL        _int2double+0, 0
	MOVLW       236
	MOVWF       R4 
	MOVLW       103
	MOVWF       R5 
	MOVLW       28
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2longint+0, 0
	MOVF        R0, 0 
	MOVWF       _tlong+0 
	MOVF        R1, 0 
	MOVWF       _tlong+1 
	MOVF        R2, 0 
	MOVWF       _tlong+2 
	MOVF        R3, 0 
	MOVWF       _tlong+3 
;UART_TX.c,90 :: 		tlong = tlong /10;
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Div_32x32_S+0, 0
	MOVF        R0, 0 
	MOVWF       _tlong+0 
	MOVF        R1, 0 
	MOVWF       _tlong+1 
	MOVF        R2, 0 
	MOVWF       _tlong+2 
	MOVF        R3, 0 
	MOVWF       _tlong+3 
;UART_TX.c,91 :: 		voltage = tlong;
	MOVF        R0, 0 
	MOVWF       _voltage+0 
	MOVF        R1, 0 
	MOVWF       _voltage+1 
;UART_TX.c,93 :: 		get_digits();   // call function to split data
	CALL        _get_digits+0, 0
;UART_TX.c,94 :: 		display_voltage(); //call display_data() function to output value to seven segment
	CALL        _display_voltage+0, 0
;UART_TX.c,96 :: 		if (voltage > 50) {
	MOVLW       0
	MOVWF       R0 
	MOVF        _voltage+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main32
	MOVF        _voltage+0, 0 
	SUBLW       50
L__main32:
	BTFSC       STATUS+0, 0 
	GOTO        L_main8
;UART_TX.c,97 :: 		PWM1_Start();                    // Start PWM1
	CALL        _PWM1_Start+0, 0
;UART_TX.c,98 :: 		PWM1_Set_Duty(255);              // Set the duty cycle of PWM1 to maximum (full on)
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;UART_TX.c,99 :: 		PORTC.RC0 = 1;                   // Set bit 0 of PORTC to '1'
	BSF         PORTC+0, 0 
;UART_TX.c,100 :: 		Delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	NOP
	NOP
;UART_TX.c,102 :: 		LATD.RD4 = 1;                    // Set led to '1'
	BSF         LATD+0, 4 
;UART_TX.c,103 :: 		LATD.RD5 = 1;                    // Set buzzer to '1'
	BSF         LATD+0, 5 
;UART_TX.c,104 :: 		Delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	NOP
	NOP
;UART_TX.c,105 :: 		LATD.RD4 = 0;                    // Set led to '0'
	BCF         LATD+0, 4 
;UART_TX.c,106 :: 		LATD.RD5 = 0;                    // Set bit RD3 to '0'
	BCF         LATD+0, 5 
;UART_TX.c,107 :: 		} else if (voltage < 30) {
	GOTO        L_main11
L_main8:
	MOVLW       0
	SUBWF       _voltage+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main33
	MOVLW       30
	SUBWF       _voltage+0, 0 
L__main33:
	BTFSC       STATUS+0, 0 
	GOTO        L_main12
;UART_TX.c,108 :: 		PWM1_Start();                    // Start PWM1
	CALL        _PWM1_Start+0, 0
;UART_TX.c,109 :: 		PWM1_Set_Duty(0);                // Set the duty cycle of PWM1 to minimum (full off)
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;UART_TX.c,110 :: 		PORTC.RC0 = 0;                    // Set motor off
	BCF         PORTC+0, 0 
;UART_TX.c,111 :: 		Delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main13:
	DECFSZ      R13, 1, 1
	BRA         L_main13
	DECFSZ      R12, 1, 1
	BRA         L_main13
	NOP
	NOP
;UART_TX.c,112 :: 		LATD.RD4 = 1;                    // Set led to '1'
	BSF         LATD+0, 4 
;UART_TX.c,113 :: 		Delay_ms(500);
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
;UART_TX.c,114 :: 		LATD.RD4 = 0;                   // Set led to '0'
	BCF         LATD+0, 4 
;UART_TX.c,115 :: 		} else if ((voltage >= 30) && (voltage <= 50)) {
	GOTO        L_main15
L_main12:
	MOVLW       0
	SUBWF       _voltage+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main34
	MOVLW       30
	SUBWF       _voltage+0, 0 
L__main34:
	BTFSS       STATUS+0, 0 
	GOTO        L_main18
	MOVLW       0
	MOVWF       R0 
	MOVF        _voltage+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main35
	MOVF        _voltage+0, 0 
	SUBLW       50
L__main35:
	BTFSS       STATUS+0, 0 
	GOTO        L_main18
L__main28:
;UART_TX.c,116 :: 		PWM1_Start();                    // Start PWM1
	CALL        _PWM1_Start+0, 0
;UART_TX.c,117 :: 		PWM1_Set_Duty(127);              // Set the duty cycle of PWM1 to approximately half
	MOVLW       127
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;UART_TX.c,118 :: 		PORTC.RC0 = 1;                   // Set bit 0 of PORTC to '1'
	BSF         PORTC+0, 0 
;UART_TX.c,120 :: 		LATD.RD4 = 1;
	BSF         LATD+0, 4 
;UART_TX.c,121 :: 		Delay_ms(500);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main19:
	DECFSZ      R13, 1, 1
	BRA         L_main19
	DECFSZ      R12, 1, 1
	BRA         L_main19
	DECFSZ      R11, 1, 1
	BRA         L_main19
	NOP
	NOP
;UART_TX.c,122 :: 		LATD.RD4 = 0;                    // Set led to '0'                 // Set led to '1'
	BCF         LATD+0, 4 
;UART_TX.c,123 :: 		LATD.RD5 = 1;                     // Set buzzer to '1'
	BSF         LATD+0, 5 
;UART_TX.c,124 :: 		Delay_ms(500);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main20:
	DECFSZ      R13, 1, 1
	BRA         L_main20
	DECFSZ      R12, 1, 1
	BRA         L_main20
	DECFSZ      R11, 1, 1
	BRA         L_main20
	NOP
	NOP
;UART_TX.c,125 :: 		LATD.RD5 = 0;                     // Set buzzer to '0'
	BCF         LATD+0, 5 
;UART_TX.c,126 :: 		} ;
L_main18:
L_main15:
L_main11:
;UART_TX.c,127 :: 		}
	GOTO        L_main21
L_main7:
;UART_TX.c,128 :: 		else if (uart_rd == '3'){
	MOVF        _uart_rd+0, 0 
	XORLW       51
	BTFSS       STATUS+0, 2 
	GOTO        L_main22
;UART_TX.c,129 :: 		PWM1_Set_Duty(0);                // Set the duty cycle of PWM1 to minimum (full off)
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;UART_TX.c,130 :: 		PORTC.RC0 = 0;                   // Set motor off
	BCF         PORTC+0, 0 
;UART_TX.c,131 :: 		x = ADC_Read(1);
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;UART_TX.c,132 :: 		x_ADC = 100-x/10.23;
	CALL        _int2double+0, 0
	MOVLW       20
	MOVWF       R4 
	MOVLW       174
	MOVWF       R5 
	MOVLW       35
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       72
	MOVWF       R2 
	MOVLW       133
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2int+0, 0
	MOVF        R0, 0 
	MOVWF       _x_ADC+0 
	MOVF        R1, 0 
	MOVWF       _x_ADC+1 
;UART_TX.c,133 :: 		UART1_Write(x_ADC); // send to the pic_1 the value of LDR
	MOVF        R0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;UART_TX.c,134 :: 		delay_ms(10);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_main23:
	DECFSZ      R13, 1, 1
	BRA         L_main23
	DECFSZ      R12, 1, 1
	BRA         L_main23
	NOP
	NOP
;UART_TX.c,135 :: 		} else if (uart_rd == '4'){
	GOTO        L_main24
L_main22:
	MOVF        _uart_rd+0, 0 
	XORLW       52
	BTFSS       STATUS+0, 2 
	GOTO        L_main25
;UART_TX.c,136 :: 		LATD.RD6 = 1;
	BSF         LATD+0, 6 
;UART_TX.c,137 :: 		Delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main26:
	DECFSZ      R13, 1, 1
	BRA         L_main26
	DECFSZ      R12, 1, 1
	BRA         L_main26
	DECFSZ      R11, 1, 1
	BRA         L_main26
	NOP
	NOP
;UART_TX.c,138 :: 		LATD.RD6 = 0;
	BCF         LATD+0, 6 
;UART_TX.c,140 :: 		LATD.RD7 = 1;
	BSF         LATD+0, 7 
;UART_TX.c,141 :: 		}
L_main25:
L_main24:
L_main21:
;UART_TX.c,142 :: 		}
	GOTO        L_main5
;UART_TX.c,143 :: 		delay_ms(1000);
L_main27:
	DECFSZ      R13, 1, 1
	BRA         L_main27
	DECFSZ      R12, 1, 1
	BRA         L_main27
	DECFSZ      R11, 1, 1
	BRA         L_main27
	NOP
	NOP
;UART_TX.c,144 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
