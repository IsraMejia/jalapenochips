from machine import Pin, I2C
import utime

# Configuración de los pines I2C
i2c = I2C(1, scl=Pin(2), sda=Pin(15), freq=400000)

# Escanear dispositivos I2C
devices = i2c.scan()

if len(devices) == 0:
    print("No I2C devices found.")
else:
    print("I2C devices found:", [hex(device) for device in devices])
