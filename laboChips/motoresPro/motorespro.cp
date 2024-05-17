#line 1 "C:/Users/IsraCode/Documents/FI/2024-2/micros/jalapenochips/laboChips/motoresPro/motorespro.c"
void main() {

 TRISA = 0x3F;
 ADCON1 = 0x06;


 TRISB = 0x00;
 TRISC.F1 = 0;
 TRISC.F2 = 0;

 while (1) {

 unsigned char porta_value = PORTA & 0x3F;


 switch (porta_value) {
 case 0x00:

 PORTC.F1 = 0;
 PORTB.F1 = 0;
 PORTB.F0 = 0;

 PORTC.F2 = 0;
 PORTB.F3 = 0;
 PORTB.F2 = 0;
 break;

 case 0x01:

 PORTC.F1 = 0;
 PORTB.F1 = 0;
 PORTB.F0 = 0;

 PORTC.F2 = 1;
 PORTB.F3 = 0;
 PORTB.F2 = 1;
 break;

 case 0x02:

 PORTC.F1 = 1;
 PORTB.F1 = 0;
 PORTB.F0 = 1;

 PORTC.F2 = 0;
 PORTB.F3 = 0;
 PORTB.F2 = 0;
 break;

 case 0x03:

 PORTC.F1 = 1;
 PORTB.F1 = 1;
 PORTB.F0 = 0;

 PORTC.F2 = 0;
 PORTB.F3 = 0;
 PORTB.F2 = 0;
 break;

 case 0x04:

 PORTC.F1 = 0;
 PORTB.F1 = 0;
 PORTB.F0 = 0;

 PORTC.F2 = 1;
 PORTB.F3 = 0;
 PORTB.F2 = 1;
 break;

 case 0x05:

 PORTC.F1 = 1;
 PORTB.F1 = 0;
 PORTB.F0 = 1;

 PORTC.F2 = 1;
 PORTB.F3 = 0;
 PORTB.F2 = 1;
 break;

 case 0x06:

 PORTC.F1 = 1;
 PORTB.F1 = 1;
 PORTB.F0 = 0;

 PORTC.F2 = 1;
 PORTB.F3 = 1;
 PORTB.F2 = 0;
 break;

 case 0x07:

 PORTC.F1 = 1;
 PORTB.F1 = 0;
 PORTB.F0 = 1;

 PORTC.F2 = 0;
 PORTB.F3 = 0;
 PORTB.F2 = 0;
 break;

 case 0x08:

 PORTC.F1 = 0;
 PORTB.F1 = 0;
 PORTB.F0 = 0;

 PORTC.F2 = 1;
 PORTB.F3 = 1;
 PORTB.F2 = 0;
 break;

 default:

 PORTC.F1 = 0;
 PORTB.F1 = 0;
 PORTB.F0 = 0;

 PORTC.F2 = 0;
 PORTB.F3 = 0;
 PORTB.F2 = 0;
 break;
 }
 }
}
