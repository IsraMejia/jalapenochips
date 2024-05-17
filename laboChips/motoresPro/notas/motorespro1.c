void main() {
    // Configurar puerto A como entrada
    TRISA = 0x3F;
    ADCON1 = 0x06;

    // Configurar puerto B y C como salida
    TRISB = 0x00;
    TRISC.F1 = 0;
    TRISC.F2 = 0;

    while (1) {
        // Obtener el valor del puerto A
        unsigned char porta_value = PORTA & 0x3F; // Sólo los primeros 6 bits son relevantes

        // Configuración según el valor de PORTA
        switch (porta_value) {
            case 0x00:
                // Parar ambos motores
                PORTC.F1 = 0; // Disable Motor 1
                PORTB.F1 = 0;
                PORTB.F0 = 0;

                PORTC.F2 = 0; // Disable Motor 2
                PORTB.F3 = 0;
                PORTB.F2 = 0;
                break;

            case 0x01:
                // Parar Motor 1, Motor 2 horario
                PORTC.F1 = 0; // Disable Motor 1
                PORTB.F1 = 0;
                PORTB.F0 = 0;

                PORTC.F2 = 1; // Enable Motor 2
                PORTB.F3 = 0; // DIR1 M2
                PORTB.F2 = 1; // DIR2 M2
                break;

            case 0x02:
                // Motor 1 horario, Parar Motor 2
                PORTC.F1 = 1; // Enable Motor 1
                PORTB.F1 = 0; // DIR1 M1
                PORTB.F0 = 1; // DIR2 M1

                PORTC.F2 = 0; // Disable Motor 2
                PORTB.F3 = 0;
                PORTB.F2 = 0;
                break;

            case 0x03:
                // Motor 1 antihorario, Parar Motor 2
                PORTC.F1 = 1; // Enable Motor 1
                PORTB.F1 = 1; // DIR1 M1
                PORTB.F0 = 0; // DIR2 M1

                PORTC.F2 = 0; // Disable Motor 2
                PORTB.F3 = 0;
                PORTB.F2 = 0;
                break;

            case 0x04:
                // Parar Motor 1, Motor 2 horario
                PORTC.F1 = 0; // Disable Motor 1
                PORTB.F1 = 0;
                PORTB.F0 = 0;

                PORTC.F2 = 1; // Enable Motor 2
                PORTB.F3 = 0; // DIR1 M2
                PORTB.F2 = 1; // DIR2 M2
                break;

            case 0x05:
                // Motor 1 horario, Motor 2 horario
                PORTC.F1 = 1; // Enable Motor 1
                PORTB.F1 = 0; // DIR1 M1
                PORTB.F0 = 1; // DIR2 M1

                PORTC.F2 = 1; // Enable Motor 2
                PORTB.F3 = 0; // DIR1 M2
                PORTB.F2 = 1; // DIR2 M2
                break;

            case 0x06:
                // Motor 1 antihorario, Motor 2 antihorario
                PORTC.F1 = 1; // Enable Motor 1
                PORTB.F1 = 1; // DIR1 M1
                PORTB.F0 = 0; // DIR2 M1

                PORTC.F2 = 1; // Enable Motor 2
                PORTB.F3 = 1; // DIR1 M2
                PORTB.F2 = 0; // DIR2 M2
                break;

            case 0x07:
                // Motor 1 horario, Parar Motor 2
                PORTC.F1 = 1; // Enable Motor 1
                PORTB.F1 = 0; // DIR1 M1
                PORTB.F0 = 1; // DIR2 M1

                PORTC.F2 = 0; // Disable Motor 2
                PORTB.F3 = 0;
                PORTB.F2 = 0;
                break;

            case 0x08:
                // Parar Motor 1, Motor 2 antihorario
                PORTC.F1 = 0; // Disable Motor 1
                PORTB.F1 = 0;
                PORTB.F0 = 0;

                PORTC.F2 = 1; // Enable Motor 2
                PORTB.F3 = 1; // DIR1 M2
                PORTB.F2 = 0; // DIR2 M2
                break;

            default:
                // Caso no definido: Parar ambos motores
                PORTC.F1 = 0; // Disable Motor 1
                PORTB.F1 = 0;
                PORTB.F0 = 0;

                PORTC.F2 = 0; // Disable Motor 2
                PORTB.F3 = 0;
                PORTB.F2 = 0;
                break;
        }
    }
}
//ci