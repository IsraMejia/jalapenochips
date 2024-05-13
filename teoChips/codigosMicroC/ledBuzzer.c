#define pinBoton    PORTCbits.RC1    // Puerto de entrada para el boton pulsado (RC1)
#define pinZumbador PORTCbits.RC2    // Puerto de salida para el zumbador (RC2)
#define pinLED      PORTCbits.RC3    // Puerto de salida para el LED (RC3)

void main() {
    // Configuración inicial de pines
    TRISC = 0b00000010; // Configura todos los pines de PORTC como salidas excepto RC1

    while(1) {
        // Bucle para verificar el estado del boton
        while(PORTCbits.RC1 == 0); // Verifica si el botón ha sido pulsado

        // Enciende el zumbador y el LED
        pinZumbador = 1;
        pinLED = 1;

        // Espera 1 segundo
        espera_1_segundo();

        // Apaga el zumbador y el LED
        pinZumbador = 0;
        pinLED = 0;
    }
}

// Subrutina para esperar 1 segundo
void espera_1_segundo() {
    int i;
    for(i = 0; i < 250; i++) {
        ciclo_retardo();
    }
}

// Subrutina para generar un retardo
void ciclo_retardo() {
    int i;
    for(i = 0; i < 250; i++);
}
