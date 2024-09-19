#line 1 "D:/3rd Biomedical year/semester 1/micro c________+/Projects/FINAL_PROJECT/Final_v0.6-20231218T233540Z-001/Final_v0.6/UART_TX.c"

char uart_rd;
int x_ADC ;


unsigned char binary_pattern[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
unsigned char display1[10]= {0xBF,0x86,0xDB,0xCF,0xE6,0xED,0xFD,0x87,0xFF,0xE7};


unsigned int a1,a2,a3,a4;
int adc_value;
unsigned int number;
long tlong;
unsigned int voltage;

 ADC_Init();


void get_digits()
 {
 a1 = ((voltage/100u)%10u); ;
 a2 = ((voltage/10u)%10u);
 a3 = (voltage%10u);
 a4 = (( voltage / 1000u));
 }


void display_voltage()
 {

 PORTB = binary_pattern[a1];
 PORTD.RD0 = 0;
 delay_ms(3);
 PORTD.RD0 = 1;
 PORTB = binary_pattern[a2];
 PORTD.RD1 = 0;
 delay_ms(3);
 PORTD.RD1 = 1;
 PORTB = display1[a3];
 PORTD.RD2 = 0;
 delay_ms(3);
 PORTD.RD2 = 1;
 PORTB=binary_pattern[a4];
 PORTD.RD3 = 0;
 delay_ms(3);
 PORTD.RD3 = 1;
 }


void main()
{

 int x;

 TRISD.RD0 = 0 ;
 TRISD.RD1 =0 ;
 TRISD.RD2 =0 ;
 TRISD.RD3 =0;

 TRISC.RC0=0;
 TRISC.RC1=0;

 TRISD.RD4 = 0;
 TRISD.RD5 = 0;
 TRISD.RD6 = 0;
 TRISD.RD7 = 0;
 TRISD.RA0 = 1;

 TRISC.RC0 = 0;

 PORTB=0x00;
 TRISB=0x00;
 PWM1_Init(5000);


 PORTD.RD0 = 1;
 PORTD.RD1 = 1;
 PORTD.RD2 = 1;
 PORTD.RD3 = 1;

 UART1_init(9615);
 Delay_ms(100);
 ADC_Init();
 while(1)
 {
 uart_rd = UART1_Read();
 if(uart_rd == '2'){
 adc_value = ADC_Read(0);
 tlong = (float)adc_value*4.88768555;
 tlong = tlong /10;
 voltage = tlong;

 get_digits();
 display_voltage();

 if (voltage > 50) {
 PWM1_Start();
 PWM1_Set_Duty(255);
 PORTC.RC0 = 1;
 Delay_ms(100);

 LATD.RD4 = 1;
 LATD.RD5 = 1;
 Delay_ms(100);
 LATD.RD4 = 0;
 LATD.RD5 = 0;
 } else if (voltage < 30) {
 PWM1_Start();
 PWM1_Set_Duty(0);
 PORTC.RC0 = 0;
 Delay_ms(100);
 LATD.RD4 = 1;
 Delay_ms(500);
 LATD.RD4 = 0;
 } else if ((voltage >= 30) && (voltage <= 50)) {
 PWM1_Start();
 PWM1_Set_Duty(127);
 PORTC.RC0 = 1;

 LATD.RD4 = 1;
 Delay_ms(500);
 LATD.RD4 = 0;
 LATD.RD5 = 1;
 Delay_ms(500);
 LATD.RD5 = 0;
 } ;
 }
 else if (uart_rd == '3'){
 PWM1_Set_Duty(0);
 PORTC.RC0 = 0;
 x = ADC_Read(1);
 x_ADC = 100-x/10.23;
 UART1_Write(x_ADC);
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
