Como modificarias el siguiente codigo para que al presionar el boton del pin dos,
el zumbador del pin 4 suene por un segundo 
y el led del pin D5 encienda tambien por un segundo al mismo tiempo que suena el zumbador.

from machine import Pin, PWM
import time

pinBoton = 2  # Pin del botón
pinZumbador = 4  # Pin del zumbador 
frecuencia = 100
resolucion = 8

# Configuración inicial del zumbador
pwm = PWM(Pin(pinZumbador))
pwm.freq(frecuencia)
pwm.duty(0)

# Función para manejar la interrupción del botón
def boton_pulsado(pin):
    pwm.duty(255)  # Establece el ciclo de trabajo al máximo
    time.sleep(1)  # Espera 1 segundo
    pwm.duty(0)  # Apaga el zumbador después de 1 segundo

# Configura el pin del botón como entrada con pull-up interno
pin_boton = Pin(pinBoton, Pin.IN, Pin.PULL_UP)

# Configura la interrupción para detectar flanco de bajada (pulsación del botón)
pin_boton.irq(trigger=Pin.IRQ_FALLING, handler=boton_pulsado)


#ampy --port COM6 run esp32boton.py
