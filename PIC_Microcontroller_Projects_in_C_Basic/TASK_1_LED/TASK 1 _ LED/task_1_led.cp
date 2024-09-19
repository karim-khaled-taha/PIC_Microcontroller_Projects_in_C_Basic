#line 1 "D:/3rd Biomedical year/micro c/TASK_1_LED/TASK 1 _ LED/task_1_led.c"
char i;

void main() {
 TRISC = 0B00000000;
 LATC = 0B00000001;

 while (1) {

 while (i < 8) {
 LATC = 1 << i;
 delay_ms(1000);
 i++;
 }


 i = 0;
 LATC = 0B00000001;
 }
}
