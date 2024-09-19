//global
char uart_rd;
int x_ADC ;

// This array stores binary bit pattern that will be send to PORTD
unsigned char binary_pattern[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F}; // without Dp turn
unsigned char display1[10]= {0xBF,0x86,0xDB,0xCF,0xE6,0xED,0xFD,0x87,0xFF,0xE7};    // with dp turn on

// variables to store digits, digital value and output voltage
unsigned int a1,a2,a3,a4; // temporary variables to store data of adc
int adc_value; //store output value from Analog Read functoion
unsigned int number;
long tlong;
unsigned int voltage;

     ADC_Init();

 // this function retrive each digita that will displayed on device
void get_digits()
  {
           a1 = ((voltage/100u)%10u); ; // holds 100's digit
           a2 =  ((voltage/10u)%10u); // holds 10th digit
           a3 =  (voltage%10u); // holds unit digit value
           a4 =  (( voltage / 1000u));  // holds 1000's digit
   }

// this function displays measured voltage on seven-segments
void display_voltage()
 {

            PORTB = binary_pattern[a1];     // send unit place data to 1st digit
             PORTD.RD0 = 0;   //  turn on 1st display unit
            delay_ms(3);
             PORTD.RD0 = 1;   //  turn off 1st display unit
            PORTB = binary_pattern[a2];  // send 100's place data to 3rd digit
            PORTD.RD1 = 0;    //  turn on 2rd display unit
            delay_ms(3);
            PORTD.RD1 = 1;  //  turn off 2rd display unit
            PORTB = display1[a3];  // send 10th place data to 2nd digit
            PORTD.RD2 = 0;  //  turn on 3nd display unit
            delay_ms(3);
            PORTD.RD2 = 1;   //  turn off 3nd display unit
            PORTB=binary_pattern[a4];  // send 1000's place data to fourth digit
            PORTD.RD3 = 0;  //  turn on fourth display unit
            delay_ms(3);
            PORTD.RD3 = 1;  //  turn off fourth display unit
   }


void main()
{

   int x;
   
      TRISD.RD0 = 0 ;    // controll of 7 seg
      TRISD.RD1 =0  ;
      TRISD.RD2 =0 ;
      TRISD.RD3 =0;
      
      TRISC.RC0=0;
      TRISC.RC1=0;
      
    TRISD.RD4 = 0;    // Configure RD4 as an output pin of led
    TRISD.RD5 = 0;    // Configure RD3 as an output pin of buzzer
     TRISD.RD6 = 0;    // Configure RD4 as an output pin of led
    TRISD.RD7 = 0;    // Configure RD3 as an output pin of buzzer
    TRISD.RA0 = 1;    // Configure RA0 as an input pin for lm35

    TRISC.RC0 = 0;    // Configure RC0 as an output pin

    PORTB=0x00;   // initialize PORTD pins to active low
    TRISB=0x00;// Set PORTB as a output port
     PWM1_Init(5000);  // Initialize PWM1 module at 5KHz

  // set control pins pins initially active high
    PORTD.RD0 = 1;
    PORTD.RD1 = 1;
    PORTD.RD2 = 1;
    PORTD.RD3 = 1;

      UART1_init(9615);
      Delay_ms(100);
      ADC_Init();
      while(1)
      {
      uart_rd = UART1_Read();     // read the received data,
      if(uart_rd == '2'){
         adc_value = ADC_Read(0);  // read data from channel 0
           tlong = (float)adc_value*4.88768555; //converts voltage into temperature
           tlong = tlong /10;
           voltage = tlong;

              get_digits();   // call function to split data
            display_voltage(); //call display_data() function to output value to seven segment

              if (voltage > 50) {
            PWM1_Start();                    // Start PWM1
            PWM1_Set_Duty(255);              // Set the duty cycle of PWM1 to maximum (full on)
            PORTC.RC0 = 1;                   // Set bit 0 of PORTC to '1'
            Delay_ms(100);

            LATD.RD4 = 1;                    // Set led to '1'
            LATD.RD5 = 1;                    // Set buzzer to '1'
            Delay_ms(100);
            LATD.RD4 = 0;                    // Set led to '0'
            LATD.RD5 = 0;                    // Set bit RD3 to '0'
        } else if (voltage < 30) {
            PWM1_Start();                    // Start PWM1
            PWM1_Set_Duty(0);                // Set the duty cycle of PWM1 to minimum (full off)
            PORTC.RC0 = 0;                    // Set motor off
            Delay_ms(100);
            LATD.RD4 = 1;                    // Set led to '1'
            Delay_ms(500);
            LATD.RD4 = 0;                   // Set led to '0'
        } else if ((voltage >= 30) && (voltage <= 50)) {
            PWM1_Start();                    // Start PWM1
            PWM1_Set_Duty(127);              // Set the duty cycle of PWM1 to approximately half
            PORTC.RC0 = 1;                   // Set bit 0 of PORTC to '1'

            LATD.RD4 = 1;  
            Delay_ms(500); 
              LATD.RD4 = 0;                    // Set led to '0'                 // Set led to '1'
            LATD.RD5 = 1;                     // Set buzzer to '1'
            Delay_ms(500);
            LATD.RD5 = 0;                     // Set buzzer to '0'
        } ;
      }
      else if (uart_rd == '3'){
       PWM1_Set_Duty(0);                // Set the duty cycle of PWM1 to minimum (full off)
              PORTC.RC0 = 0;                   // Set motor off
       x = ADC_Read(1);
          x_ADC = 100-x/10.23;
        UART1_Write(x_ADC); // send to the pic_1 the value of LDR
        delay_ms(10);
      } else if (uart_rd == '4'){
              LATD.RD6 = 1;
              Delay_ms(1000);
              LATD.RD6 = 0;
              
              LATD.RD7 = 1;
      }
    }
       delay_ms(1000);
}