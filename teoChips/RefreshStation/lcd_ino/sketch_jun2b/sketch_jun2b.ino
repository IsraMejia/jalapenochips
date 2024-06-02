#include <Wire.h>
#include <LiquidCrystal_I2C.h>

// Dirección I2C del módulo, generalmente es 0x27 o 0x3F
LiquidCrystal_I2C lcd(0x27, 16, 2);

// Definir pines para los botones y los LEDs
const int buttonPinOn = 2;
const int buttonPinOff = 3;
const int buttonPinAtomizar = 4;
const int buttonPinServir = 5;
const int buttonPinStopAgua = 6;
const int ledPin = 9; // Cambiado a un pin PWM
const int ledAtomizarPin = 10;
const int ledAguaPin = 11;

// Variable de control para el estado del ventilador
bool ventiladorEncendido = false;
int velocidad = 0; // Variable para contar las veces que se presiona el botón de encendido
bool sirviendoAgua = false;
unsigned long tiempoInicioServir = 0;

void setup() {
  Wire.begin(); // Inicia la comunicación I2C

  // Inicializar el LCD con 16 columnas y 2 filas
  lcd.begin(16, 2);
  lcd.backlight();  // Encender la luz de fondo

  // Inicializar los botones y los LEDs
  pinMode(buttonPinOn, INPUT_PULLUP); // Configura el pin del botón como entrada con resistencia pull-up interna
  pinMode(buttonPinOff, INPUT_PULLUP); // Configura el pin del segundo botón como entrada con resistencia pull-up interna
  pinMode(buttonPinAtomizar, INPUT_PULLUP); // Configura el pin del tercer botón como entrada con resistencia pull-up interna
  pinMode(buttonPinServir, INPUT_PULLUP); // Configura el pin del cuarto botón como entrada con resistencia pull-up interna
  pinMode(buttonPinStopAgua, INPUT_PULLUP); // Configura el pin del quinto botón como entrada con resistencia pull-up interna
  pinMode(ledPin, OUTPUT); // Configura el pin del LED como salida
  pinMode(ledAtomizarPin, OUTPUT); // Configura el pin del segundo LED como salida
  pinMode(ledAguaPin, OUTPUT); // Configura el pin del tercer LED como salida

  // Mostrar el estado inicial del ventilador en el LCD
  actualizarPantalla();
}

void loop() {
  // Leer el estado del botón para encender el ventilador
  if (digitalRead(buttonPinOn) == LOW) {
    delay(200); // Debounce
    if (digitalRead(buttonPinOn) == LOW) {
      if (!ventiladorEncendido) {
        // Encender el ventilador por primera vez
        ventiladorEncendido = true;
        velocidad = 1; // Empezar con velocidad 1
      } else {
        // Incrementar la velocidad del ventilador
        if (velocidad < 3) {
          velocidad++;
        }
      }
      // Actualizar el estado del LED
      actualizarLed();
      // Actualizar el mensaje en la pantalla LCD
      actualizarPantalla();
      // Esperar a que se suelte el botón
      while (digitalRead(buttonPinOn) == LOW);
    }
  }

  // Leer el estado del botón para apagar el ventilador
  if (digitalRead(buttonPinOff) == LOW) {
    delay(200); // Debounce
    if (digitalRead(buttonPinOff) == LOW) {
      // Apagar el ventilador
      ventiladorEncendido = false;
      velocidad = 0; // Reiniciar la velocidad
      // Actualizar el estado del LED
      actualizarLed();
      // Actualizar el mensaje en la pantalla LCD
      actualizarPantalla();
      // Esperar a que se suelte el botón
      while (digitalRead(buttonPinOff) == LOW);
    }
  }

  // Leer el estado del botón para atomizar agua
  if (digitalRead(buttonPinAtomizar) == LOW) {
    delay(200); // Debounce
    if (digitalRead(buttonPinAtomizar) == LOW) {
      // Mostrar mensaje de atomización y encender LED
      lcd.clear();
      lcd.setCursor(0, 0);
      lcd.print("atomizar awa");
      digitalWrite(ledAtomizarPin, HIGH);
      delay(1000); // Mantener el mensaje y el LED encendido por 1 segundo
      digitalWrite(ledAtomizarPin, LOW);
      // Volver a mostrar el estado del ventilador
      actualizarPantalla();
      // Esperar a que se suelte el botón
      while (digitalRead(buttonPinAtomizar) == LOW);
    }
  }

  // Leer el estado del botón para servir agua
  if (digitalRead(buttonPinServir) == LOW) {
    delay(200); // Debounce
    if (digitalRead(buttonPinServir) == LOW) {
      // Mostrar mensaje de servir agua y encender LED
      lcd.clear();
      lcd.setCursor(0, 0);
      lcd.print("sirviendo 100ml");
      digitalWrite(ledAguaPin, HIGH);
      sirviendoAgua = true;
      tiempoInicioServir = millis(); // Registrar el tiempo de inicio
      // Esperar a que se suelte el botón
      while (digitalRead(buttonPinServir) == LOW);
    }
  }

  // Leer el estado del botón para detener el servicio de agua
  if (digitalRead(buttonPinStopAgua) == LOW) {
    delay(200); // Debounce
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
      // Ajustar la luminosidad del LED en función del tiempo transcurrido
      int brillo = map(tiempoTranscurrido, 0, 4000, 85, 255); // Mapear el tiempo a brillo
      analogWrite(ledAguaPin, brillo);
    }
  }
}

void actualizarPantalla() {
  lcd.clear(); // Limpiar la pantalla LCD
  lcd.setCursor(0, 0); // Posicionar el cursor en la primera columna, primera fila
  if (ventiladorEncendido) {
    lcd.print("Ventilador On"); // Imprimir en la primera fila
    lcd.setCursor(0, 1); // Posicionar el cursor en la primera columna, segunda fila
    lcd.print("v= "); // Imprimir en la segunda fila
    lcd.print(velocidad); // Imprimir la velocidad actual
  } else {
    lcd.print("Ventilador"); // Imprimir en la primera fila 
    lcd.setCursor(0, 1); // Posicionar el cursor en la primera columna, segunda fila
    lcd.print("apagado"); // Imprimir en la segunda fila
  }
}

void actualizarLed() {
  if (ventiladorEncendido) {
    // Ajustar el brillo del LED en función de la velocidad
    int brillo = map(velocidad, 1, 3, 85, 255); // Mapear velocidad 1-3 a brillo 85-255
    analogWrite(ledPin, brillo);
  } else {
    // Apagar el LED
    analogWrite(ledPin, 0);
  }
}
