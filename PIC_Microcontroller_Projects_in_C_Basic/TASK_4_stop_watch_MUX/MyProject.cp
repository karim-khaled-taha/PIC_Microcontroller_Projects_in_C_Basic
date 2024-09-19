#line 1 "D:/3rd Biomedical year/semester 1/micro c________+/Projects/stop watch using  multiplexing/MyProject.c"
void main() {
 char state = 0;
 char sec2 = 0;
 char sec1 = 0;
 char min = 0;
 char i = 0;
 char seg_sec2[11] = {63, 63, 6, 91, 79, 102, 109, 125, 7, 127, 111};
 char seg_sec1[7] = {63, 6, 91, 79, 102, 109, 63};
 char seg_min[10] = {191, 134, 219, 207, 230, 237, 253, 135, 255, 239};


 TRISD = 0;
 TRISB.RB0 = 0;
 TRISB.RB1 = 0;
 TRISB.RB2 = 0;
 TRISC.RC7 = 1;
 TRISB.RB7 = 1;
 TRISA.RA0 = 0;
 TRISA.RA1 = 0;

 while (1) {
 if (state && PORTB.RB6) {
 sec1 = 0;
 sec2 = 0;
 min = 0;
 LATD = seg_sec1[sec1];
 LATD = seg_sec2[sec2];
 LATD = seg_min[min];
 }

 if (PORTB.RB7 == 1) {
 while (sec2 <= 10) {

 LATB.RB0 = 0;
 LATB.RB1 = 1;
 LATB.RB2 = 1;
 LATD = seg_sec2[sec2];
 delay_ms(10);


 LATB.RB0 = 1;
 LATB.RB1 = 0;
 LATB.RB2 = 1;
 LATD = seg_sec1[sec1];
 delay_ms(10);


 LATB.RB0 = 1;
 LATB.RB1 = 1;
 LATB.RB2 = 0;
 LATD = seg_min[min];
 delay_ms(10);

 delay_ms(80);

 sec2++;
 if (sec2 == 10) {
 sec2 = 0;
 sec1++;
 if (sec1 == 6) {
 sec1 = 0;
 min++;
 if (min == 10) {
 min = 0;
 }
 }
 }

 if (PORTC.RC7 == 1) {
 state = 1;
 break;
 }
 }
 }

 LATB.RB0 = 0;
 LATB.RB1 = 1;
 LATB.RB2 = 1;
 LATD = seg_sec2[sec2];
 delay_ms(10);

 LATB.RB0 = 1;
 LATB.RB1 = 0;
 LATB.RB2 = 1;
 LATD = seg_sec1[sec1];
 delay_ms(10);

 LATB.RB0 = 1;
 LATB.RB1 = 1;
 LATB.RB2 = 0;
 LATD = seg_min[min];
 delay_ms(10);
 }
}
