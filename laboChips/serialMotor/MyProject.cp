#line 1 "C:/Users/IsraCode/Documents/FI/2024-2/micros/jalapenochips/laboChips/serialMotor/MyProject.c"
char recibe_byte() {
 while (PIR1.RCIF == 0);
 return RCREG;
}

void main() {
 char dato;
 char dir;
 int vueltas = 0;
 char valores[4] = {0xC0, 0x60, 0x30, 0x90};
 int i;
 int n;
 TRISB = 0;


 SPBRG = 129;
 TXSTA.BRGH = 1;


 TXSTA.SYNC = 0;
 RCSTA.SPEN = 1;


 TXSTA.TXEN = 1;
 RCSTA.CREN = 1;

 while (1) {
 dato = recibe_byte();

 if (dato == '1') {
 for (i = 0; i < 4; i++) {
 PORTB = valores[i];
 Delay_ms(5);
 }
 } else if (dato == '2') {
 for (i = 3; i > -1; i--) {
 PORTB = valores[i];
 Delay_ms(5);
 }
 } else if (dato == '3') {
 dir = recibe_byte();
 vueltas = recibe_byte() - 48;
 if (dir == '1') {
 for (n = 0; n < 520 * vueltas; n++) {
 for (i = 0; i < 4; i++) {
 PORTB = valores[i];
 Delay_ms(5);
 }
 }
 } else if (dir == '2') {
 for (n = 0; n < 520 * vueltas; n++) {
 for (i = 3; i > -1; i--) {
 PORTB = valores[i];
 Delay_ms(5);
 }
 }
 }
 }
 }
}
