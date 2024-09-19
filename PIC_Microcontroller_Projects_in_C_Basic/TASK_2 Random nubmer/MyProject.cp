#line 1 "D:/3rd Biomedical year/micro c/Projects/TASK_2 Random nubmer/MyProject.c"
int main() {

 char i = 0;
 char randomValue;
 char led[] = {0B00001000, 0B00010100, 0B00011100, 0B01100011, 0B01101011, 0B01110111 };
 TRISD = 0;
 LATD=0B11111111;
 delay_ms(3000);
 LATD = 0;
 while (1) {
 i+=1;
 if (i == 6){
 i =0;
 }
 if (PORTB.RB7 == 1) {
 randomValue = led[i];

 LATD = randomValue ;

 delay_ms(3000);
 LATD = 0;
 i = 0;
 }

 }

}
