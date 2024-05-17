en base a la siguiente asignacion de pines:
        
        PORTC.F1 = PORTA.F2;
        PORTB.F1 = PORTA.F1;
        PORTB.F0 = PORTA.F0;

        // motor 2
        PORTC.F2 = PORTA.F5;
        PORTB.F3 = PORTA.F4;
        PORTB.F2 = PORTA.F3;

Modifica el codigo para que haga cada uno de los casos de la tabla que te pasare en una imagen


int i; // Declaramos la variable i como global

void main() {
    // Configurar puerto A como entrada
    TRISA = 0xFF;
    ADCON1 = 0x06;

    // Configurar puerto B y C como salida
    TRISB = 0x00;
    TRISC.F1 = 0;
    TRISC.F2 = 0;

    while (1) {
        // Obtener el valor del puerto A
        unsigned char porta_value = PORTA & 0x0F;  // Solo los primeros 4 bits son relevantes

        if (porta_value == 0x00) {
            // Parar ambos motores
            for (i = 0; i < 10; i++) {
                PORTC.F1 = 0; // Disable Motor 1
                PORTB.F1 = 0;
                PORTB.F0 = 0;

                PORTC.F2 = 0; // Disable Motor 2
                PORTB.F3 = 0;
                PORTB.F2 = 0;
                Delay_ms(100); // Retardo para observar el efecto
            }
        } else if (porta_value == 0x01) {
            // Parar Motor 1, Motor 2 horario
            for (i = 0; i < 10; i++) {
                PORTC.F1 = 0; // Disable Motor 1
                PORTB.F1 = 0;
                PORTB.F0 = 0;

                PORTC.F2 = 1; // Enable Motor 2
                PORTB.F3 = 0; // DIR1 M2
                PORTB.F2 = 1; // DIR2 M2
                Delay_ms(100); // Retardo para observar el efecto
            }
        } else if (porta_value == 0x02) {
            // Parar Motor 1, Motor 2 antihorario
            for (i = 0; i < 10; i++) {
                PORTC.F1 = 0; // Disable Motor 1
                PORTB.F1 = 0;
                PORTB.F0 = 0;

                PORTC.F2 = 1; // Enable Motor 2
                PORTB.F3 = 1; // DIR1 M2
                PORTB.F2 = 0; // DIR2 M2
                Delay_ms(100); // Retardo para observar el efecto
            }
        } else if (porta_value == 0x03) {
            // Motor 1 horario, Parar Motor 2
            for (i = 0; i < 10; i++) {
                PORTC.F1 = 1; // Enable Motor 1
                PORTB.F1 = 0; // DIR1 M1
                PORTB.F0 = 1; // DIR2 M1

                PORTC.F2 = 0; // Disable Motor 2
                PORTB.F3 = 0;
                PORTB.F2 = 0;
                Delay_ms(100); // Retardo para observar el efecto
            }
        } else if (porta_value == 0x04) {
            // Motor 1 antihorario, Parar Motor 2
            for (i = 0; i < 10; i++) {
                PORTC.F1 = 1; // Enable Motor 1
                PORTB.F1 = 1; // DIR1 M1
                PORTB.F0 = 0; // DIR2 M1

                PORTC.F2 = 0; // Disable Motor 2
                PORTB.F3 = 0;
                PORTB.F2 = 0;
                Delay_ms(100); // Retardo para observar el efecto
            }
        } else if (porta_value == 0x05) {
            // Motor 1 horario, Motor 2 horario
            for (i = 0; i < 10; i++) {
                PORTC.F1 = 1; // Enable Motor 1
                PORTB.F1 = 0; // DIR1 M1
                PORTB.F0 = 1; // DIR2 M1

                PORTC.F2 = 1; // Enable Motor 2
                PORTB.F3 = 0; // DIR1 M2
                PORTB.F2 = 1; // DIR2 M2
                Delay_ms(100); // Retardo para observar el efecto
            }
        } else if (porta_value == 0x06) {
            // Motor 1 antihorario, Motor 2 antihorario
            for (i = 0; i < 10; i++) {
                PORTC.F1 = 1; // Enable Motor 1
                PORTB.F1 = 1; // DIR1 M1
                PORTB.F0 = 0; // DIR2 M1

                PORTC.F2 = 1; // Enable Motor 2
                PORTB.F3 = 1; // DIR1 M2
                PORTB.F2 = 0; // DIR2 M2
                Delay_ms(100); // Retardo para observar el efecto
            }
        } else if (porta_value == 0x07) {
            // Motor 1 horario, Motor 2 antihorario
            for (i = 0; i < 10; i++) {
                PORTC.F1 = 1; // Enable Motor 1
                PORTB.F1 = 0; // DIR1 M1
                PORTB.F0 = 1; // DIR2 M1

                PORTC.F2 = 1; // Enable Motor 2
                PORTB.F3 = 1; // DIR1 M2
                PORTB.F2 = 0; // DIR2 M2
                Delay_ms(100); // Retardo para observar el efecto
            }
        } else if (porta_value == 0x08) {
            // Motor 1 antihorario, Motor 2 horario
            for (i = 0; i < 10; i++) {
                PORTC.F1 = 1; // Enable Motor 1
                PORTB.F1 = 1; // DIR1 M1
                PORTB.F0 = 0; // DIR2 M1

                PORTC.F2 = 1; // Enable Motor 2
                PORTB.F3 = 0; // DIR1 M2
                PORTB.F2 = 1; // DIR2 M2
                Delay_ms(100); // Retardo para observar el efecto
            }
        } else {
            // Caso no definido: Parar ambos motores
            for (i = 0; i < 10; i++) {
                PORTC.F1 = 0; // Disable Motor 1
                PORTB.F1 = 0;
                PORTB.F0 = 0;

                PORTC.F2 = 0; // Disable Motor 2
                PORTB.F3 = 0;
                PORTB.F2 = 0;
                Delay_ms(100); // Retardo para observar el efecto
            }
        }
    }
}
