
   #pragma orgall 0x0005
  void main(){ 
       /*empezar co la configuracion de los modulos primero

         MOVLW 0
         BSF STATUS, RPO ; b1
         CLRF TRISB
       */
       
       TRISB=0;//CONFIGURAMOS EL PUERTO CERO COMO SALIDA
       TRISA=0X3F;// CINCO UNOS
       ADCON1=6; // PARA CONFIGURA ENTRADAS DIGITALES EN EL PUERTO A Y E
       PORTB=0; // ESTA APAGADO
       
       
       if( PORTA==0x00){
           PORTB=0x00;
        }else if (PORTA==0x01){
            PORTB=0xFF;
        }else if (PORTA==0x02){
               TRISB=(TRISB>> 1|((TRISB & 0X01)<<7;
        }else if (PORTA=0x03){
        

            //PORTB=0x80;
            //PORTB=0X40;

        }else if(PORTA=0X02){
        

       /*

         BSF STATUS, RPO ; b0
         CLRF PORTB
       */

       
      // TRISB,B0=0 // BCF  TRISB, 0 -> SOLO EL BIT CERO DEL  TRISB
      
      for(; ;){
      /*
         PORTB=-PORTB;
         delay_ms(500); // para que podamos ver el cambio */
         
          PORTB=PORTA;
         
 
     }
     
    /* PARPADEO:
       conf PORTB,1
       CALL RETARDO
      GOTO PARTPADEO */
   }
 
 
 
 
