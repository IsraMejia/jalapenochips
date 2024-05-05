como convierto este codigo a micropython para un ESP32.
Dame el codigo traducido a micropython completo, explicado linea a linea con comentarios.
Despues de eso explicame a detalle como ejecutarlo desde la terminal de vsc en windows
int pinZumbador =4;

int canal = 0;  
int frecuencia = 2000;
int resolucion = 8;

void setup(){
    Serial.begin(115200); // Inicializa el puerto serie salida pwm
    ledcSetup(canal, frecuencia, resolucion);   // Configura el canal
    ledcAttachPin(pinZumbador, canal); // Asigna el pin del zumbador al canal

}

void loop(){
    int frecuenciaIncrementa = 0;
    for (int i = 0; i < 10; i++){ 
        ledcWriteTone(0, frecuenciaIncrementa); // Escribe la frecuencia en el canal
        frecuenciaIncrementa = frecuenciaIncrementa + 30;
        delay(1000);
    }
}


 