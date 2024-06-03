#include <Servo.h>

const int motorPin = 9;
const int ledPin = 13;
const int enceder_ventilador = 2;
const int enceder_atomizador = 4;
const int servoPin = 10;

Servo myServo;

void setup() {
  pinMode(motorPin, OUTPUT);
  pinMode(ledPin, OUTPUT);
  pinMode(enceder_ventilador, INPUT_PULLUP); // Usa la resistencia pull-up interna
  pinMode(enceder_atomizador, INPUT_PULLUP); // Usa la resistencia pull-up interna
  myServo.attach(servoPin);

  // Inicializa el servo en una posición neutra
  myServo.write(90);
}

void loop() { 
  if(digitalRead(enceder_atomizador) == LOW){
    atomizar_agua();
  }

  // Verificar si el botón está presionado
  if (digitalRead(enceder_ventilador) == LOW) { // El botón está presionado cuando el pin está LOW
    encender_ventilador();     // Apaga el LED
  }
}

void encender_ventilador(){
  digitalWrite(ledPin, HIGH);        // Enciende el LED
    
    int elapsedTime = 0;
    do {
      digitalWrite(motorPin, HIGH);    // Enciende el motor
      delay(500);                     // Mantén el motor encendido por 1 segundo
      digitalWrite(motorPin, LOW);     // Apaga el motor
      elapsedTime += 1;                // Incrementa el tiempo transcurrido en 1 segundo
      if(digitalRead(enceder_atomizador) == LOW){
        atomizar_agua();
      }      
      // Aquí podrías añadir un delay si quieres esperar un tiempo específico antes de volver a encender el motor.
      // delay(500); // Espera 500 ms (medio segundo) antes de volver a encender el motor, por ejemplo.
    } while (elapsedTime < 15);        // Repite hasta que se acumulen 15 segundos de motor encendido

  digitalWrite(ledPin, LOW);         // Apaga el LED

}

void atomizar_agua(){
  digitalWrite(ledPin, HIGH);        // Enciende el LED
  myServo.write(190);                  // Mueve el servo a la posición 0 grados
  delay(800);                         // Mantén el servo en esta posición por 1 segundo
  myServo.write(90);                 // Regresa el servo a la posición 90 grados (neutral)
  digitalWrite(ledPin, LOW);         // Apaga el LED
  
}