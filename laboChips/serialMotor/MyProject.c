char recibe_byte() {
    while (PIR1.RCIF == 0);  // Esperar hasta que se reciba un byte
    return RCREG;            // Leer el byte recibido
}

void main() {
    char dato;
    char dir;
    int vueltas = 0;
    char valores[4] = {0xC0, 0x60, 0x30, 0x90};
    int i;
    int n;
    TRISB = 0;

    // Configuración de baudrate a 9600
    SPBRG = 129;
    TXSTA.BRGH = 1;

    // Habilitar modo asíncrono y encender la USART
    TXSTA.SYNC = 0;  // Modo asíncrono
    RCSTA.SPEN = 1;

    // Habilitar transmisión y recepción
    TXSTA.TXEN = 1;
    RCSTA.CREN = 1;

    while (1) {
        dato = recibe_byte();  // Recibir un byte del puerto serial

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
            dir = recibe_byte();  // Recibir la dirección
            vueltas = recibe_byte() - 48;  // Recibir el número de vueltas y convertir a entero
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
