
from machine import Pin, PWM
import time

pinBoton = 2  # Pin del botón
pinZumbador = 4  # Pin del zumbador 
pinLED = 5  # Pin del LED
frecuencia = 500
resolucion = 8

# Configuración inicial del zumbador
pwm = PWM(Pin(pinZumbador))
pwm.freq(frecuencia)
pwm.duty(0)

# Función para manejar la interrupción del botón
def boton_pulsado(pin):
    pwm.duty(255)  # Establece el ciclo de trabajo del zumbador al máximo
    Pin(pinLED, Pin.OUT).on()  # Enciende el LED
    time.sleep(1)  # Espera 1 segundo
    pwm.duty(0)  # Apaga el zumbador después de 1 segundo
    Pin(pinLED, Pin.OUT).off()  # Apaga el LED

# Configura el pin del botón como entrada con pull-up interno
pin_boton = Pin(pinBoton, Pin.IN, Pin.PULL_UP)

# Configura la interrupción para detectar flanco de bajada (pulsación del botón)
pin_boton.irq(trigger=Pin.IRQ_FALLING, handler=boton_pulsado)


#ampy --port COM6 run esp32boton.py
