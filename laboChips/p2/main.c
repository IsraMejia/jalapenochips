
   #pragma orgall 0x0005
  void main(){  
       
       TRISB=0;//CONFIGURAMOS EL PUERTO CERO COMO SALIDA
       TRISA=0X3F;// CINCO UNOS
       ADCON1=6; // PARA CONFIGURA ENTRADAS DIGITALES EN EL PUERTO A Y E
       PORTB=0; // ESTA APAGADO 
       
       if( PORTA ==0x00){
          //Todos los leds apagados
           PORTB=0x00;
        }else if (PORTA==0x01){
            //Todos los leds encendidos 
            PORTB=0xFF;
        }else if (PORTA==0x02){
            //Corrimiento del bit más significativo hacia la derecha 
            //PORTB=(PORTB>> 1||((PORTB & 0X01)<<7;

            PORTB = PORTB & 0X80; // Estado inicial del corrimiento 10000000
            for(int i =0; i<7 ; i++ ){
                PORTB>> 1;
                delay_ms(500);
            } //Fin del corrimiento 00000001

        }else if (PORTA=0x03){
            //Corrimiento del bit menos significativo hacia la izquierda
            //PORTB=(PORTB<< 1||((PORTB & 0X80)>>7;

            PORTB = PORTB & 0X01; // Estado inicial del corrimiento 00000001
            for(int i =0; i<7 ; i++ ){
                PORTB << 1;
                delay_ms(500);
            } //Fin del corrimiento 10000000

        }else if(PORTA=0X04){
            //Corrimiento del bit más significativo hacia la derecha y a la izquierda
            //PORTB=(PORTB>> 1||((PORTB & 0X01)<<7;
            //PORTB=(PORTB<< 1||((PORTB & 0X80)>>7;

            //Corrimiento del bit menos significativo hacia la derecha  
            PORTB = PORTB & 0X80; // Estado inicial del corrimiento 10000000
            for(int i =0; i<7 ; i++ ){
                PORTB>> 1;
                delay_ms(500);
            } //Fin del corrimiento 00000001

            //Corrimiento del bit menos significativo hacia la izquierda
            PORTB = PORTB & 0X01; // Estado inicial del corrimiento 00000001
            for(int i =0; i<7 ; i++ ){
                PORTB << 1;
                delay_ms(500);
            } //Fin del corrimiento 10000000

        }else if(PORTA=0X05){
            //Apagar y encender todos los bits.
            PORTB=0x00;
            delay_ms(500);
            PORTB=0xFF;
            delay_ms(500);
        }else {
            //Todos los leds apagados
            PORTB=0x00;
        }

       
   }
 
 
 
 
