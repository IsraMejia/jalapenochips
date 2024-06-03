#include <Wire.h>
#include <LiquidCrystal_I2C.h>
#include <Servo.h>

// Dirección I2C del módulo, generalmente es 0x27 o 0x3F
LiquidCrystal_I2C lcd(0x27, 16, 2);

// Definir pines para los botones y los LEDs
const int buttonPinOn = 2;          // Pin para el botón de encendido del ventilador
const int buttonPinOff = 3;         // Pin para el botón de apagado del ventilador
const int buttonPinAtomizar = 4;    // Pin para el botón de atomizar agua
const int buttonPinServir = 5;      // Pin para el botón de servir agua
const int buttonPinStopAgua = 7;    // Pin para el botón de detener el servicio de agua
const int ledVentilador = 9;        // Pin PWM para el LED del ventilador
const int pinVentilador = 13;        // Pin PWM para el LED del ventilador
const int ledAtomizarPin = 10;      // Pin para el LED de atomizar agua
const int ledAguaPin = 11;          // Pin PWM para el LED de servir agua
const int servoPin = 12;            // Pin para el servo del atomizador

Servo myServo;

// Variables de control
bool ventiladorEncendido = false;   // Estado del ventilador
bool sirviendoAgua = false;         // Estado del servicio de agua
bool atomizando = false;            // Estado del atomizador
unsigned long tiempoInicioVentilador = 0; // Tiempo de inicio del ciclo del ventilador
unsigned long tiempoTotalVentilador = 15000; // Duración total de funcionamiento del ventilador
unsigned long tiempoTranscurridoVentilador = 0; // Tiempo transcurrido del ventilador
unsigned long tiempoInicioServir = 0; // Tiempo de inicio del servicio de agua

void setup() {
  Wire.begin(); // Inicia la comunicación I2C

  // Inicializar el LCD con 16 columnas y 2 filas
  lcd.begin(16, 2);
  lcd.backlight(); // Encender la luz de fondo del LCD

  // Configurar los pines de los botones como entradas con resistencia pull-up interna
  pinMode(buttonPinOn, INPUT_PULLUP);
  pinMode(buttonPinOff, INPUT_PULLUP);
  pinMode(buttonPinAtomizar, INPUT_PULLUP);
  pinMode(buttonPinServir, INPUT_PULLUP);
  pinMode(buttonPinStopAgua, INPUT_PULLUP);

  // Configurar los pines de los LEDs como salidas
  pinMode(ledVentilador, OUTPUT);
   pinMode(pinVentilador, OUTPUT);
  pinMode(ledAtomizarPin, OUTPUT);
  pinMode(ledAguaPin, OUTPUT);

  // Configurar el pin del servo
  myServo.attach(servoPin);
  myServo.write(90); // Inicializa el servo en una posición neutra

  // Mostrar el estado inicial del ventilador en el LCD
  actualizarPantalla();
}

void loop() {
  // Verificar si el botón de encendido del ventilador está presionado
  if (digitalRead(buttonPinOn) == LOW) {
    delay(200); // Debounce para evitar múltiples lecturas
    if (digitalRead(buttonPinOn) == LOW) {
      encenderVentilador();
      // Esperar a que se suelte el botón
      while (digitalRead(buttonPinOn) == LOW);
    }
  }

  // Verificar si el botón de apagado del ventilador está presionado
  if (digitalRead(buttonPinOff) == LOW) {
    delay(200); // Debounce para evitar múltiples lecturas
    if (digitalRead(buttonPinOff) == LOW) {
      apagarVentilador();
      // Esperar a que se suelte el botón
      while (digitalRead(buttonPinOff) == LOW);
    }
  }

  // Verificar si el botón de atomizar agua está presionado
  if (digitalRead(buttonPinAtomizar) == LOW) {
    delay(200); // Debounce para evitar múltiples lecturas
    if (digitalRead(buttonPinAtomizar) == LOW) {
      // Interrumpir la tarea actual y atomizar agua
      atomizarAgua();
      // Volver a la tarea anterior
      continuarTareaAnterior();
      // Esperar a que se suelte el botón
      while (digitalRead(buttonPinAtomizar) == LOW);
    }
  }

  // Verificar si el botón de servir agua está presionado
  if (digitalRead(buttonPinServir) == LOW) {
    delay(200); // Debounce para evitar múltiples lecturas
    if (digitalRead(buttonPinServir) == LOW) {
      // Mostrar mensaje de servir agua y encender LED de agua
      lcd.clear();
      lcd.setCursor(0, 0);
      lcd.print("sirviendo 100ml");
      sirviendoAgua = true;
      tiempoInicioServir = millis(); // Registrar el tiempo de inicio del servicio de agua
      // Esperar a que se suelte el botón
      while (digitalRead(buttonPinServir) == LOW);
    }
  }

  // Verificar si el botón de detener el servicio de agua está presionado
  if (digitalRead(buttonPinStopAgua) == LOW) {
    delay(200); // Debounce para evitar múltiples lecturas
    if (digitalRead(buttonPinStopAgua) == LOW) {
      // Si está sirviendo agua, detener el proceso
      if (sirviendoAgua) {
        lcd.clear();
        lcd.setCursor(0, 0);
        lcd.print("stop agua");
        digitalWrite(ledAguaPin, LOW);
        delay(1000); // Mostrar el mensaje por 1 segundo
        sirviendoAgua = false;
        actualizarPantalla(); // Volver a mostrar el estado del ventilador
      }
      // Esperar a que se suelte el botón
      while (digitalRead(buttonPinStopAgua) == LOW);
    }
  }

  // Controlar la duración del servicio de agua
  if (sirviendoAgua) {
    unsigned long tiempoActual = millis();
    unsigned long tiempoTranscurrido = tiempoActual - tiempoInicioServir;
    if (tiempoTranscurrido >= 5000) {
      // Detener el servicio de agua después de 5 segundos
      digitalWrite(ledAguaPin, LOW);
      sirviendoAgua = false;
      actualizarPantalla();
    } else {
      // Ajustar la luminosidad del LED de agua en función del tiempo transcurrido
      int brillo = map(tiempoTranscurrido, 0, 4000, 85, 255); // Mapear el tiempo a brillo
      analogWrite(ledAguaPin, brillo);
    }
  }

  // Continuar con el ciclo del ventilador si está encendido
  if (ventiladorEncendido) {
    continuarCicloVentilador();
  }
}

// Función para encender el ventilador
void encenderVentilador() {
  ventiladorEncendido = true;
  tiempoInicioVentilador = millis();
  tiempoTranscurridoVentilador = 0; // Reiniciar el tiempo transcurrido
  actualizarPantalla();
}

// Función para apagar el ventilador
void apagarVentilador() {
  ventiladorEncendido = false;
  digitalWrite(ledVentilador, LOW); // Apagar el LED del ventilador
  actualizarPantalla();
}

// Función para continuar con el ciclo del ventilador
void continuarCicloVentilador() {
  unsigned long tiempoActual = millis();
  unsigned long tiempoTranscurrido = tiempoActual - tiempoInicioVentilador;
  tiempoTranscurridoVentilador += tiempoTranscurrido;
  tiempoInicioVentilador = tiempoActual;

  if (tiempoTranscurridoVentilador >= tiempoTotalVentilador) {
    // Completar el tiempo total de 15 segundos
    digitalWrite(ledVentilador, LOW);
    digitalWrite(pinVentilador, LOW);
    ventiladorEncendido = false;
    actualizarPantalla();
  } else {
    // Continuar con el ciclo del ventilador
    digitalWrite(ledVentilador, HIGH); 
    digitalWrite(pinVentilador, HIGH);
    delay(500);
  }
}

// Función para actualizar la pantalla LCD
void actualizarPantalla() {
  lcd.clear(); // Limpiar la pantalla LCD
  lcd.setCursor(0, 0); // Posicionar el cursor en la primera columna, primera fila
  if (ventiladorEncendido) {
    lcd.print("Ventilador On"); // Imprimir estado del ventilador en la primera fila
    lcd.setCursor(0, 1); // Posicionar el cursor en la primera columna, segunda fila
    lcd.print("Encendido"); // Imprimir "Encendido" en la segunda fila
  } else {
    lcd.print("Ventilador Off"); // Imprimir estado del ventilador en la primera fila
    lcd.setCursor(0, 1); // Posicionar el cursor en la primera columna, segunda fila
    lcd.print("Apagado"); // Imprimir "Apagado" en la segunda fila
  }
}

// Función para atomizar agua
void atomizarAgua() {
  atomizando = true;
  digitalWrite(ledAtomizarPin, HIGH); // Encender el LED del atomizador
  myServo.write(180); // Girar el servo para atomizar
  delay(1000); // Atomizar durante 1 segundo
  myServo.write(90); // Volver a la posición inicial
  digitalWrite(ledAtomizarPin, LOW); // Apagar el LED del atomizador
  atomizando = false;
}

// Función para continuar con la tarea anterior después de atomizar agua
void continuarTareaAnterior() {
  if (ventiladorEncendido) {
    continuarCicloVentilador();
  } else if (sirviendoAgua) {
    // Si estaba sirviendo agua, continuar sirviendo agua
    digitalWrite(ledAguaPin, HIGH); // Encender el LED de agua
  }
}
