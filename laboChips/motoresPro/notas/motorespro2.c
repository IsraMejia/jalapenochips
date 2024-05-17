// Definición de los pines asociados a los motores
#define MOTOR_M1_PIN_A 0 // Pin asociado al motor M1 (bit 0)
#define MOTOR_M1_PIN_B 1 // Pin asociado al motor M1 (bit 1)
#define MOTOR_M2_PIN_A 2 // Pin asociado al motor M2 (bit 2)
#define MOTOR_M2_PIN_B 3 // Pin asociado al motor M2 (bit 3)

void main() {
    // Configuración de puertos
    TRISA = 0xFF; // Configura el puerto A como entrada
    TRISB = 0x00; // Configura el puerto B como salida
    ADCON1 = 0x06; // Configura puertos A y E como digitales

    while (1) {
        // Lee los primeros 4 bits de PORTA
        unsigned char portA = PORTA & 0x0F;

        switch (portA) {
            case 0x00:
                // Paro ambos motores
                PORTB = 0x00;
                break;
            case 0x01:
                // Paro M1 y giro horario M2
                PORTB = (1 << MOTOR_M2_PIN_A);
                break;
            case 0x02:
                // Paro M1 y giro antihorario M2
                PORTB = (1 << MOTOR_M2_PIN_B);
                break;
            case 0x03:
                // Giro horario M1 y paro M2
                PORTB = (1 << MOTOR_M1_PIN_A);
                break;
            case 0x04:
                // Giro antihorario M1 y paro M2
                PORTB = (1 << MOTOR_M1_PIN_B);
                break;
            case 0x05:
                // Giro horario en ambos motores
                PORTB = (1 << MOTOR_M1_PIN_A) | (1 << MOTOR_M2_PIN_A);
                break;
            case 0x06:
                // Giro antihorario en ambos motores
                PORTB = (1 << MOTOR_M1_PIN_B) | (1 << MOTOR_M2_PIN_B);
                break;
            case 0x07:
                // Giro horario M1 y antihorario M2
                PORTB = (1 << MOTOR_M1_PIN_A) | (1 << MOTOR_M2_PIN_B);
                break;
            case 0x08:
                // Giro antihorario M1 y horario M2
                PORTB = (1 << MOTOR_M1_PIN_B) | (1 << MOTOR_M2_PIN_A);
                break;
            default:
                // Paro ambos motores por defecto
                PORTB = 0x00;
                break;
        }

        // Retardo
        Delay_ms(500); // Retardo de 500 ms
    }
}
