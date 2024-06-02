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

    // Paso 1: Configuración de baudaje a 9600
    SPBRG = 129;
    TXSTA.BRGH = 1;
     
    // Paso 2: Habilitar modo asíncrono y encender la USART
    TXSTA.SYNC = 0; // Modo asíncrono
    RCSTA.SPEN = 1;
     
    // Paso 3: Habilitar transmisión y recepción
    TXSTA.TXEN = 1;
    RCSTA.CREN = 1;
     
    while (1) {
        dato = recibe_byte();
        while (PIR1.RCIF == 0) {
            if (dato == '1') {
                for (i = 0; i < 4; i++) {
                    PORTB = valores[i];
                    delay_ms(5);
                }
            }
           
            if (dato == '2') {
                for (i = 3; i > -1; i--) {
                    PORTB = valores[i];
                    delay_ms(5);
                }
            }
           
            if (dato == '3') {
                dir = recibe_byte();
                vueltas = recibe_byte() - 48;
                if (dir == '1') {
                    for (n = 0; n < 520 * vueltas; n++) {
                        for (i = 0; i < 4; i++) {
                            PORTB = valores[i];
                            delay_ms(5);
                        }
                    }
                }
            
                if (dir == '2') {
                    for (n = 0; n < 520 * vueltas; n++) {
                        for (i = 3; i > -1; i--) {
                            PORTB = valores[i];
                            delay_ms(5);
                        }
                    }
                }
            }
        } 
    }
}
