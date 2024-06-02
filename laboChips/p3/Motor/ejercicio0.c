int i = 0; // Declaramos la variable i como global

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
                PORTC.F2 = 0; // Disable Motor 2
                PORTC.F1 = 0; // Disable Motor 1

                PORTB.F3 = 0;
                PORTB.F2 = 0; 
                PORTB.F1 = 0;
                PORTB.F0 = 0;

                
                Delay_ms(100); // Retardo para observar el efecto
            }
            i=0;
        } else if (porta_value == 0x01) {
            // Parar Motor 1, Motor 2 horario
            for (i = 0; i < 10; i++) {
                PORTC.F2 = 1; // Disable Motor 2                
                PORTC.F1 = 0; // Disable Motor 1

                PORTB.F3 = 0;
                PORTB.F2 = 0;
                PORTB.F1 = 0;
                PORTB.F0 = 1;
                Delay_ms(100); // Retardo para observar el efecto
            }
            i=0;
        } else if (porta_value == 0x02) {
            // Parar Motor 1, Motor 2 antihorario
            for (i = 0; i < 10; i++) {
                PORTC.F2 = 1; // Disable Motor 2                
                PORTC.F1 = 0; // Disable Motor 1

                PORTB.F3 = 0;
                PORTB.F2 = 0; 
                PORTB.F1 = 1;
                PORTB.F0 = 0;
                
                Delay_ms(100); // Retardo para observar el efecto
            }
            i=0;
        } else if (porta_value == 0x03) {
            // Motor 1 horario, Parar Motor 2
            for (i = 0; i < 10; i++) {
                PORTC.F2 = 0; // Disable Motor 2
                PORTC.F1 = 1; // Disable Motor 1

                PORTB.F3 = 0;
                PORTB.F2 = 0;                
                PORTB.F1 = 1;
                PORTB.F0 = 1;

                Delay_ms(100); // Retardo para observar el efecto
            }
            i=0;
        } else if (porta_value == 0x04) {
            // Motor 1 antihorario, Parar Motor 2
            for (i = 0; i < 10; i++) {
                PORTC.F2 = 0; // Disable Motor 2
                PORTC.F1 = 1; // Disable Motor 1

                PORTB.F3 = 0;
                PORTB.F2 = 1;                
                PORTB.F1 = 0;
                PORTB.F0 = 0;
                
                Delay_ms(100); // Retardo para observar el efecto
            }
            i=0;
        } else if (porta_value == 0x05) {
            // Motor 1 horario, Motor 2 horario
            for (i = 0; i < 10; i++) {
                PORTC.F2 = 1; // Disable Motor 2
                PORTC.F1 = 1; // Disable Motor 1

                PORTB.F3 = 0;
                PORTB.F2 = 1;                
                PORTB.F1 = 0;
                PORTB.F0 = 1;

                Delay_ms(100); // Retardo para observar el efecto
            }
            i=0;
        } else if (porta_value == 0x06) {
            // Motor 1 antihorario, Motor 2 antihorario
            for (i = 0; i < 10; i++) {
                PORTC.F2 = 1; // Disable Motor 2
                PORTC.F1 = 1; // Disable Motor 1

                PORTB.F3 = 0;
                PORTB.F2 = 1;                
                PORTB.F1 = 1;
                PORTB.F0 = 0;
                Delay_ms(100); // Retardo para observar el efecto
            }
            i=0;
        } else if (porta_value == 0x07) {
            // Motor 1 horario, Motor 2 antihorario
            for (i = 0; i < 10; i++) {
                PORTC.F2 = 1; // Disable Motor 2
                PORTC.F1 = 1; // Disable Motor 1

                PORTB.F3 = 0;
                PORTB.F2 = 1;                
                PORTB.F1 = 1;
                PORTB.F0 = 1;
                Delay_ms(100); // Retardo para observar el efecto
            }
            i=0;
        } else if (porta_value == 0x08) {
            // Motor 1 antihorario, Motor 2 horario
            for (i = 0; i < 10; i++) {
                PORTC.F2 = 1; // Disable Motor 2
                PORTC.F1 = 1; // Disable Motor 1

                PORTB.F3 = 1;
                PORTB.F2 = 0;                
                PORTB.F1 = 0;
                PORTB.F0 = 0;
                Delay_ms(100); // Retardo para observar el efecto
            }
            i=0;
        } else {
            // Caso no definido: Parar ambos motores
            for (i = 0; i < 10; i++) {
                PORTC.F1 = 0; // Disable Motor 1
                PORTC.F2 = 0; // Disable Motor 2

                PORTB.F1 = 0;
                PORTB.F0 = 0;                 
                PORTB.F3 = 0;
                PORTB.F2 = 0; 
                Delay_ms(100); // Retardo para observar el efecto
            }
            i=0;
        }
    }
}