#pragma orgall 0x0005

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

int i = 0; // Declaramos la variable i como global

void main() {
    TRISB = 0;      // Configuramos el puerto B como salida
    TRISA = 0x3F;   // Cinco unos para configurar el puerto A
    ADCON1 = 6;     // Configura entradas digitales en el puerto A y E
    PORTB = 0;      // Inicialmente apagado

    while (1) {
        if (PORTA == 0x00) {
            // Todos los LEDs apagados
            PORTB = 0x00;
        } else if (PORTA == 0x01) {
            // Todos los LEDs encendidos
            PORTB = 0xFF;
        } else if (PORTA == 0x02) {
            // Corrimiento del bit m�s significativo hacia la derecha
            PORTB = 0x80; // Estado inicial del corrimiento 10000000
            i = 0; // Inicializamos i a 0
            for (i = 0; i < 7; i++) {
                PORTB = (PORTB >> 1) | ((PORTB & 0x01) << 7);
                delay_ms(500);
            } // Fin del corrimiento 00000001
            i = 0; // Restablecemos i a 0
        } else if (PORTA == 0x03) {
            // Corrimiento del bit menos significativo hacia la izquierda
            PORTB = 0x01; // Estado inicial del corrimiento 00000001
            i = 0; // Inicializamos i a 0
            for (i = 0; i < 7; i++) {
                PORTB = (PORTB << 1) | ((PORTB & 0x80) >> 7);
                delay_ms(500);
            } // Fin del corrimiento 10000000
            i = 0; // Restablecemos i a 0
        } else if (PORTA == 0x04) {
            // Corrimiento del bit m�s significativo hacia la derecha y a la izquierda

            // Corrimiento del bit m�s significativo hacia la derecha
            PORTB = 0x80; // Estado inicial del corrimiento 10000000
            i = 0; // Inicializamos i a 0
            for (i = 0; i < 7; i++) {
                PORTB = (PORTB >> 1) | ((PORTB & 0x01) << 7);
                delay_ms(500);
            } // Fin del corrimiento 00000001

            // Corrimiento del bit menos significativo hacia la izquierda
            PORTB = 0x01; // Estado inicial del corrimiento 00000001
            i = 0; // Inicializamos i a 0 
            for (i = 0; i < 7; i++) {
                PORTB = (PORTB << 1) | ((PORTB & 0x80) >> 7);
                delay_ms(500);
            } // Fin del corrimiento 10000000
            i = 0; // Restablecemos i a 0
        } else if (PORTA == 0x05) {
            // Apagar y encender todos los bits.
            PORTB = 0x00;
            delay_ms(500);
            PORTB = 0xFF;
            delay_ms(500);
        } else {
            // Todos los LEDs apagados
            PORTB = 0x00;
        }
    }
}
