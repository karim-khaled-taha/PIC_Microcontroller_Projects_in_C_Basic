#line 1 "D:/3rd Biomedical year/semester 1/micro c________+/Projects/TASK_4_stop watch/stop_watch.c"
void main() {
 char state= 0 ;
 char mask ;
 char sec2 ;
 char sec1 =0 ;
 char min =0;

 char seg_sec2 [11]={63,63,6,91,79,102,109,125,7,127,111};
 char seg_sec1 []={63,6,91,79,102,109,63};
 char seg_min [10]={63,6,91,79,102,109,125,7,127,111};
 trisd=0;
 trisb=0;
 trisc=0;
 TRISc.RC7= 1 ;
 TRISB.RB7= 1 ;
 TRISD.RD7= 1 ;
 trisa.RA0=0;

 while(1)
 {
 if (state && PORTD.RD7) {
 sec1 = 0;
 sec2 = 0;
 min = 0;
 LATB = seg_sec1[sec1];
 LATC = seg_sec2[sec2];
 LATD = seg_min[min];
 }
 if (PORTB.RB7 == 1 )
 {

 while (sec2 <= 10)
 {
 sec2++;
 LATD = seg_sec2[sec2];
 delay_ms(200);

 if (sec2 == 10)
 {
 sec2 = 0;
 sec1++;
 LATB = seg_sec1[sec1];

 }
 if(sec1 == 6 && sec2== 0 )
 {
 sec1= 0 ;
 min++;
 LATC = seg_min[min];
 }


 if (min == 10 ){
 min =0;
 }

 if (PORTC.RC7 == 1 )
 {
 state= 1;
 break;


 }
 }
 }

 LATB = seg_sec1[sec1];
 LATD = seg_sec2[sec2];
 LATC = seg_min[min];
 }







 }
