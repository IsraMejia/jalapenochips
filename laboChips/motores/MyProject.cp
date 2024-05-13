#line 1 "C:/Users/IsraCode/Documents/FI/2024-2/micros/jalapenochips/laboChips/motores/MyProject.c"
#pragma orgall 0x0005
#line 3 "C:/Users/IsraCode/Documents/FI/2024-2/micros/jalapenochips/laboChips/motores/MyProject.c"
void delay_ms(unsigned int milliseconds) {
 unsigned int count;
 while (milliseconds > 0) {
 count = 500;
 while (count > 0) {
 count--;
 }
 milliseconds--;
 }
}

void main(){
 TRISB = 0;
 TRISA = 0x3F;
 ADCON1 = 6;
 PORTB = 0;

 while (1) {
 if (PORTA == 0x00) {

 PORTB = 0x00;
 } else if (PORTA == 0x01) {

 PORTB = 0xFF;
 } else if (PORTA == 0x02) {

 PORTB = 0x80;
 for (int i = 0; i < 7; i++) {
 PORTB = (PORTB >> 1) | ((PORTB & 0x01) << 7);
 delay_ms(500);
 }
 } else if (PORTA == 0x03) {

 PORTB = 0x01;
 for (int i = 0; i < 7; i++) {
 PORTB = (PORTB << 1) | ((PORTB & 0x80) >> 7);
 delay_ms(500);
 }
 } else if (PORTA == 0x04) {



 PORTB = 0x80;
 for (int i = 0; i < 7; i++) {
 PORTB = (PORTB >> 1) | ((PORTB & 0x01) << 7);
 delay_ms(500);
 }


 PORTB = 0x01;
 for (int i = 0; i < 7; i++) {
 PORTB = (PORTB << 1) | ((PORTB & 0x80) >> 7);
 delay_ms(500);
 }
 } else if (PORTA == 0x05) {

 PORTB = 0x00;
 delay_ms(500);
 PORTB = 0xFF;
 delay_ms(500);
 } else {

 PORTB = 0x00;
 }
 }
}
