#include <Wire.h>
#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27, 16, 2);  // Dirección I2C, columnas y filas del LCD

void setup() {
  Wire.begin(15, 2); // SDA en GPIO 15 y SCL en GPIO 2
  lcd.begin(16, 2);      // Inicializar el LCD con 16 columnas y 2 filas
  lcd.backlight();       // Encender la luz de fondo del LCD
  lcd.print("Hola Mundo!"); // Imprimir mensaje en la primera línea del LCD
}

void loop() {
  static int counter = 0;
  lcd.setCursor(0, 1);   // Colocar el cursor en la segunda línea
  lcd.print("Contador: ");
  lcd.print(counter);
  counter++;
  delay(1000);           // Esperar 1 segundo antes de actualizar el contador
}
