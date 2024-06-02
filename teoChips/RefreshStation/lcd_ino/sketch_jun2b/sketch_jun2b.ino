#include <Wire.h>
#include <LiquidCrystal_I2C.h>

// Dirección I2C del módulo, generalmente es 0x27 o 0x3F
LiquidCrystal_I2C lcd(0x27, 16, 2);

// Definir pines para el botón y el LED
const int buttonPin = 2;
const int ledPin = 13;

void setup() {
  Wire.begin(); // Inicia la comunicación I2C

  // Inicializar el LCD con 16 columnas y 2 filas
  lcd.begin(16, 2);
  lcd.backlight();  // Encender la luz de fondo

  // Inicializar el botón y el LED
  pinMode(buttonPin, INPUT_PULLUP); // Configura el pin del botón como entrada con resistencia pull-up interna
  pinMode(ledPin, OUTPUT); // Configura el pin del LED como salida

  // Imprimir mensajes en el LCD
  lcd.setCursor(0, 0); // Posicionar el cursor en la primera columna, primera fila
  lcd.print("Hola, Mundo!"); // Imprimir en la primera fila
  lcd.setCursor(0, 1); // Posicionar el cursor en la primera columna, segunda fila
  lcd.print("LCD con I2C"); // Imprimir en la segunda fila
}

void loop() {
  // Leer el estado del botón
  int buttonState = digitalRead(buttonPin);

  if (buttonState == LOW) { // Si el botón está presionado
    digitalWrite(ledPin, HIGH); // Encender el LED
    lcd.clear(); // Limpiar la pantalla LCD
    lcd.setCursor(0, 0); // Posicionar el cursor en la primera columna, primera fila
    lcd.print("Ventilador"); // Imprimir en la primera fila
    lcd.setCursor(0, 1); // Posicionar el cursor en la primera columna, segunda fila
    lcd.print("encendido"); // Imprimir en la segunda fila
  } else {
    digitalWrite(ledPin, LOW); // Apagar el LED
    lcd.clear(); // Limpiar la pantalla LCD
    lcd.setCursor(0, 0); // Posicionar el cursor en la primera columna, primera fila
    lcd.print("Hola, Mundo!"); // Imprimir en la primera fila
    lcd.setCursor(0, 1); // Posicionar el cursor en la primera columna, segunda fila
    lcd.print("LCD con I2C"); // Imprimir en la segunda fila
  }
}
