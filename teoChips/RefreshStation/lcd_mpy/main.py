from machine import Pin, I2C
import utime
from lcd_api import LcdApi
from i2c_lcd import I2cLcd

# Dirección I2C del LCD
I2C_ADDR = 0x27  # Asegúrate de que esta es la dirección correcta
I2C_NUM_ROWS = 2
I2C_NUM_COLS = 16

# Configuración de los pines I2C
i2c = I2C(1, scl=Pin(2), sda=Pin(15), freq=400000)

# Inicializar el LCD
try:
    lcd = I2cLcd(i2c, I2C_ADDR, I2C_NUM_ROWS, I2C_NUM_COLS)
    lcd.backlight_on()
    lcd.putstr("Hola Mundo!")
except Exception as e:
    print("Error al inicializar el LCD:", e)

def setup():
    try:
        lcd.backlight_on()
        lcd.putstr("Hola Mundo!")
    except Exception as e:
        print("Error en setup:", e)

def loop():
    # No hace nada en el loop para evitar parpadeos
    lcd.putstr("Hola Mundo!")
    pass

setup()
while True:
    loop()
