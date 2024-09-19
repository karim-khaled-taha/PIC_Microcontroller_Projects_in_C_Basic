int main() {

         char i = 0;
         char randomValue;
         char led[] = {0B00001000, 0B00010100, 0B00011100, 0B01100011, 0B01101011, 0B01110111 };  // Array for LED patterns
        TRISD = 0;  // Configure PORTD as an output
              LATD=0B11111111;
                    delay_ms(3000);
                        LATD = 0;
    while (1) {
                 i+=1; // incrment for i usulally
       if (i == 6){   // to set range between 0 and 5
       i =0;
       }
        if (PORTB.RB7 == 1) {
             randomValue = led[i]; // set a random number from array  0 to 5

             LATD = randomValue ;  // Set the corresponding LED pattern      '

            delay_ms(500);
            LATD = 0;
            i = 0;
        }

    }

}