// P4 SERIAL

char recibe_byte(){

     while(PIR1.RCIF == 0);
     return RCREG;
}

void main(){

     char dato;
     
     char dir;
     
     int vueltas = 0;
     
     char valores[4] = {0xC0, 0x60, 0x30, 0x90};
     int i;
     int n;
     TRISB = 0;

     // paso 1: conf de baudaje 9600
     SPBRG = 129;
     TXSTA.BRGH = 1;
     
     // paso 2: habilitar modo asincrono y enecender la USART
     TXSTA.SYNC = 0; //modo asincrono
     RCSTA.SPEN = 1;
     
     // paso 4: habilitar transmision y recepcion
     TXSTA.TXEN = 1;
     RCSTA.CREN = 1;
     
     while (1){
           dato = recibe_byte();
           while(PIR1.RCIF == 0){
           if (dato == '1'){
              for(i=0; i < 4; i ++){
              PORTB = valores[i];
              delay_ms(5);
            }
           }
           
           if (dato == '2'){
              for(i=3; i > -1; i --){
              PORTB = valores[i];
              delay_ms(5);
            }
           }
           
           if (dato == '3'){
              dir = recibe_byte();
              vueltas = recibe_byte() - 48;
              if (dir == '1'){
              for(n = 0; n < 520 * vueltas; n++){
              for(i=0; i < 4; i ++){
              PORTB = valores[i];
              delay_ms(5);
            }
            }
            }
            
            if (dir == '2'){
              for(n = 0; n < 520 * vueltas; n++){
              for(i=3; i > -1; i --){
              PORTB = valores[i];
              delay_ms(5);
            }
            }
            }
           }
           
           }
           
           /*
           for(n = 0; n < 520; n++){


            for(i=0; i < 4; i ++){
            PORTB = valores[i];
            delay_ms(8);
            }


            for(i=3; i > -1; i --){
            PORTB = valores[i];
            delay_ms(8);
            }  */

}
     }
     



