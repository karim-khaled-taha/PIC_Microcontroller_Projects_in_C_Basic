// new
//global varaibles
int y;
int ERROR ;
char txt [1000];
unsigned short kp;
char pw[5];
char input_pw[5]={0};
char mode = 0;
char index = 0;
char state = 0;
void Mode_A();
void lockSystem(unsigned short delayTime);
unsigned short incorrectAttempts = 0;


// Lcd pinout settings
sbit LCD_RS at RC0_bit;
sbit LCD_EN at RC1_bit;
sbit LCD_D4 at RC2_bit;
sbit LCD_D5 at RB4_bit;
sbit LCD_D6 at RB5_bit;
sbit LCD_D7 at RB6_bit;
// Pin direction
sbit LCD_RS_Direction at TRISC0_bit;
sbit LCD_EN_Direction at TRISC1_bit;
sbit LCD_D4_Direction at TRISC2_bit;
sbit LCD_D5_Direction at TRISB4_bit;
sbit LCD_D6_Direction at TRISB5_bit;
sbit LCD_D7_Direction at TRISB6_bit;

char  keypadPort at PORTD;
void mode_c();

void main()
{   Keypad_Init();                           // Initialize Keypad
    UART1_Init(9615);
    Delay_ms(100);
    lcd_init();
    Lcd_cmd(_LCD_CLEAR);
    lcd_cmd(_lcd_cursor_off);
    trisb.rb0=0; // led ldr output
    TRISB7_bit = 1;
    TRISA3_bit = 1;                                  // set RB0 pin as input

      Lcd_Out(1,1,"Press the buttom");

  while(1){
    if (PORTB.RB7==1) {               // Detect logical one
           while (PORTB.RB7==1){}
         Lcd_Cmd(_LCD_CLEAR);                     // Clear display
        if(mode == 3){
                 mode = 0;
        }
        mode++;
        if(mode == 1){
           Lcd_Out(1,1,"Mode 1: ");
           Lcd_Out(2,1,"Calculator");
        }
        else if(mode == 2){
          // UART1_Write_Text("Mode 2");
           Lcd_Out(1,1,"Mode 2: ");
           Lcd_Out(2,1,"Server Alarm");
        }
        else if(mode == 3){
          // UART1_Write_Text("Mode 3");
           Lcd_Out(1,1,"Mode 3:");
           Lcd_Out(2,1,"LDR");
        }
        Delay_ms(1000);
        Lcd_Cmd(_LCD_CLEAR);
    }

    if(mode == 1){
       Mode_A();
    }
    else if(mode == 2){
       Lcd_Out(1,1,"Mode 2: ");
        Lcd_Out(2,4," Running! ");
       UART1_Write('2');


    }
    else if(mode == 3){
    Lcd_Out(1,1,"Mode 3:");
    UART1_Write('3');
    mode_c();
    delay_ms(600);
    }
    }

    }
void Mode_A() {
   float num_1 = 0;
    float num_2 = 0;
    char op = 0;
    float result = 0;
    unsigned short kp = 0; // Reset key code variable

    Lcd_Cmd(_LCD_CLEAR);   // Clear LCD display

    if (state == 0) {

        // Setting new password
        Lcd_Out(1, 1, "Set New Password:");
        index = 0;

        while (index < 4) {
            kp = Keypad_Key_Click(); // Store key code in kp variable

            // Map keypad keys to numbers (0-9)
            switch (kp) {
                case 1: kp = '7'; break;
                case 2: kp = '4'; break;
                case 3: kp = '1'; break;
                case 5: kp = '8'; break;
                case 6: kp = '5'; break;
                case 7: kp = '2'; break;
                case 8: kp = '0'; break;
                case 9: kp = '9'; break;
                case 10: kp = '6'; break;
                case 11: kp = '3'; break;
                case 12: kp = '='; break;
                default: continue; // Skip other keys
            }

            if (kp >= '0' && kp <= '9') {
                pw[index] = kp; // Store numeric password
                Lcd_Chr(2, index + 1, '*'); // Display '*' for each entered character
                index++;
            }
        }

        Delay_ms(700); // Delay to see the entered password briefly
        Lcd_Cmd(_LCD_CLEAR);
        Lcd_Out(1, 1, "Password Set!");
        Delay_ms(1000);
        Lcd_Cmd(_LCD_CLEAR);

        state = 1; // Switch to password entering mode
    }
    else if (state == 1) {
        Lcd_Out(1, 1, "Enter Password :");
        index = 0;


        while (index < 4) {
            kp = Keypad_Key_Click(); // Store key code in kp variable

            // Map keypad keys to numbers (0-9)
            switch (kp) {
                case 1: kp = '7'; break;
                case 2: kp = '4'; break;
                case 3: kp = '1'; break;
                case 5: kp = '8'; break;
                case 6: kp = '5'; break;
                case 7: kp = '2'; break;
                case 8: kp = '0'; break;
                case 9: kp = '9'; break;
                case 10: kp = '6'; break;
                case 11: kp = '3'; break;
                case 12: kp = '='; break;
                default: continue; // Skip other keys
            }

            if (kp >= '0' && kp <= '9') {
                input_pw[index] = kp; // Store numeric input
                Lcd_Chr(2, index + 1, '*'); // Display '*' for each entered character
                index++;
            }

            if (kp == '=') {
                break;
            }
        }

        // Compare input password with stored password
        if (strncmp(input_pw, pw, 4) == 0) {
            Lcd_Out(2, 1, "Correct PW!");
            Delay_ms(1000);
            Lcd_Cmd(_LCD_CLEAR);
            state = 2; // Switch to calculator mode
            incorrectAttempts = 0; // Reset incorrect attempts counter on successful login
        } else {
            Lcd_Out(2, 1, "Incorrect PW!");
            Delay_ms(1000);
            Lcd_Cmd(_LCD_CLEAR);
            memset(input_pw, 0, sizeof(input_pw));
            index = 0; // Reset the input index
            incorrectAttempts++;

            
             if (incorrectAttempts <= 3){
              Lcd_Cmd(_LCD_CLEAR);
              Lcd_Out(2, 4, "try again!");
              Delay_ms(1500);
              Lcd_Cmd(_LCD_CLEAR);

             }
             else if (incorrectAttempts <= 4) {
                lockSystem((incorrectAttempts-3) * 60); // Lock system for an increasing time

            } else if (incorrectAttempts >= 5) {

                lockSystem(0); // Lock the system indefinitely
            }


        }
    }
    else if (state == 2) {
         Lcd_Out(1, 1, "Number1: ");


        do {
             if (PORTB.RB7==1)
         {
            return ;
        }
          kp = Keypad_Key_Click();             // Store key code in kp variable
        }
        while (!kp);

        switch (kp) {
          case  1: kp = 7; break; // 1        // Uncomment this block for keypad4x4
          case  2: kp = 4; break; // 2
          case  3: kp = 1; break; // 3
          case  5: kp = 8; break; // 4
          case  6: kp = 5; break; // 5
          case  7: kp = 2; break; // 6
          case  8: kp = 0; break; // B
          case  9: kp = 9; break; // 7
          case 10: kp = 6; break; // 8
          case 11: kp = 3; break; // 9
          default: return;
        }
        num_1 = kp;
        Bytetostr(kp,txt);
        Lcd_Chr(2, index+1, kp+'0');      // '0' to convert from int to character ascii

        Lcd_Out(1, 1, "Enter Op");

        do{
             if (PORTB.RB7==1)
         {
            return ;
        }
         op = Keypad_Key_Click();             // Store key code in kp variable
        }

        while (!op);
          switch (op) {
          case 13: op = '/'; break; // *
          case 14: op = 'x'; break; // 0
          case 15: op = '-'; break; // #
          case 16: op = '+'; break; // D
          default: return;}

        Lcd_Chr(2, index+2, op);


        Lcd_Out(1, 1, "Number2:");

        do
          {
             if (PORTB.RB7==1)
         {
            return ;
        }
          kp = Keypad_Key_Click();             // Store key code in kp variable
        }

        while (!kp);

        switch (kp) {
          case  1: kp = 7; break; // 1        // Uncomment this block for keypad4x4
          case  2: kp = 4; break; // 2
          case  3: kp = 1; break; // 3
          case  5: kp = 8; break; // 4
          case  6: kp = 5; break; // 5
          case  7: kp = 2; break; // 6
          case  8: kp = 0; break; // B
          case  9: kp = 9; break; // 7
          case 10: kp = 6; break; // 8
          case 11: kp = 3; break; // 9
          default: return;
        }
        num_2 = kp;
        Lcd_Chr(2, index+3, kp+'0');

        switch (op) {
          case '/': result = num_1 / num_2;

        if (num_2 == 0) {
        // Clear the LCD and display "ERROR" if num_2 is zero (division by zero)
        Lcd_Cmd(_LCD_CLEAR);
        Lcd_Out(2, 6, "ERROR");
        }else
        {
        Lcd_Chr(2, index+4, '=');
        sprintf(txt, "%.1f", result);
        Lcd_Out(2, 9, txt);

        }

           break; // *
          case 'x': result = num_1 * num_2;
            Lcd_Out(1,1," Result ");
           Lcd_Chr(2, index+4, '=');
        sprintf(txt, "%.1f", result);
        Lcd_Out(2, 9, txt);
           break; // 0
          case '-': result = num_1 - num_2; 
            Lcd_Out(1,1," Result ");
           Lcd_Chr(2, index+4, '=');
        sprintf(txt, "%.1f", result);
        Lcd_Out(2, 9, txt);
          break; // #
          case '+': result = num_1 + num_2;
            Lcd_Out(1,1," Result ");
           Lcd_Chr(2, index+4, '=');
        sprintf(txt, "%.1f", result);
        Lcd_Out(2, 9, txt);
          break; // D
          default: 
          
          return;
        }
          Delay_ms(1000);
        Lcd_Cmd(_LCD_CLEAR);

    }
}
void mode_c(){
if( UART1_Data_Ready() == 1)
       {
       lcd_out(1,8,"LDR= ")  ;
        y = UART1_Read();
        inttostr(y , txt ) ;
        lcd_out(1,11,txt);
        if (y<=50){

              lcd_out(2,1,"Night  ");
              latb.rb0 = 1;

              }

        if (y>=50)  {

            lcd_out(2,1,"Morning");
           latb.rb0 = 0;
                  }
         delay_ms(10);
       }
}

void lockSystem(unsigned short delayTime) {
    unsigned short i;
    for (i = delayTime; i > 0; i--) {
        Lcd_Cmd(_LCD_CLEAR);
        sprintf(txt, "Locked: %d sec", i);
        Lcd_Out(1, 1, txt);
        Delay_ms(1000);
    }

    if (delayTime == 0) {
        // Clear the LCD once
         Lcd_Cmd(_LCD_CLEAR);

          // Enter an infinite loop to display "System Locked!" and send '4' via UART
         while (1) {
         Lcd_Out(1, 1, "System Locked!");
         Lcd_Out(2, 5, "Alarm!");
         UART1_Write('4'); // Send '4' via UART

         // Optional delay to prevent UART flooding
         Delay_ms(1000);
        }
            UART1_Write('4'); // Send '4' via UART



     }
  }