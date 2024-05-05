from machine import Pin, PWM
import time

pinZumbador = 4
canal = 0
frecuencia = 2000
resolucion = 8

# Configuración inicial
pwm = PWM(Pin(pinZumbador))
pwm.freq(frecuencia)  # Configura la frecuencia del PWM
pwm.duty(0)  # Establece el ciclo de trabajo en 0 inicialmente

# Bucle principal
for i in range(10):
    pwm.duty(255 * i // 10)  # Incrementa el ciclo de trabajo gradualmente
    time.sleep(1)  # Espera 1 segundo



#ampy --port COM6 run esp32buzzer.py
#