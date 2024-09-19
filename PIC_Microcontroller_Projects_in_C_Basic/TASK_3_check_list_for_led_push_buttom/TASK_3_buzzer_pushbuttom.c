int main() {

          TRISC=0;   // def out
          TRISA.RA0=0; // def out
          TRISb.RB6=1;  // def input
          TRISb.RB7=1;  // def input

    while (1) {

    if (PORTB.RB6 == 1){        // when prees on button
              while (PORTB.RB6 = 1){};
               LATC=LATC<<1;   // ste port c = 1

            if (LATC==0)       // if all pins in port c = 0
          {

          LATC=0B0000001;   // return and set first pin = 1

          }
         delay_ms(500);
         
           if (LATC.RC7==1){ // check if the end of led hight turn on buzzer
              LATA.RA0 =1;
              delay_ms(500);
           }else {
                 LATA.RA0 =0;
           }
      }
      if (PORTB.RB7 == 1){
      while (PORTB.RB7 = 1){};
                 LATC=LATC>>1;

            if (LATC==0)
          {
          LATC=0B10000000;
          }
         delay_ms(500);
                  if (LATC.RC0==1){
              LATA.RA0 =1;
              delay_ms(500);
           }else {
                 LATA.RA0 =0;
           }
      }
    }
}
