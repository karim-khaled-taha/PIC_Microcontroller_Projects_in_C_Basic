#line 1 "D:/3rd Biomedical year/micro c/Projects/TASK_3_buzzer_push buttom/TASK_3_buzzer_pushbuttom.c"
int main() {

 TRISC=0;
 TRISA.RA0=0;
 TRISb.RB6=1;
 TRISb.RB7=1;

 while (1) {

 if (PORTB.RB6 == 1){
 while (PORTB.RB6 = 1){};
 LATC=LATC<<1;

 if (LATC==0)
 {

 LATC=0B0000001;

 }
 delay_ms(500);

 if (LATC.RC7==1){
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
