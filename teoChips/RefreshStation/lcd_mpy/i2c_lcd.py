# i2c_lcd.py
import time
from lcd_api import LcdApi

class I2cLcd(LcdApi):
    def __init__(self, i2c, i2c_addr, num_lines, num_columns):
        self.i2c = i2c
        self.i2c_addr = i2c_addr
        self.num_lines = num_lines
        self.num_columns = num_columns
        self.backlight = True
        super().__init__(num_lines, num_columns)
        self.init_lcd()

    def init_lcd(self):
        self._write_byte(0x33)
        time.sleep_ms(5)
        self._write_byte(0x32)
        time.sleep_ms(5)
        self._write_byte(0x28)
        time.sleep_ms(5)
        self._write_byte(0x0C)
        time.sleep_ms(5)
        self._write_byte(0x06)
        time.sleep_ms(5)
        self._write_byte(0x01)
        time.sleep_ms(5)
        self.clear()

    def clear(self):
        self._write_byte(0x01)
        self.move_to(0, 0)

    def home(self):
        self._write_byte(0x02)
        self.move_to(0, 0)

    def move_to_pos(self, cursor_x, cursor_y):
        addr = 0x80 | (cursor_y * 0x40 + cursor_x)
        self._write_byte(addr)

    def putchar(self, char):
        self._write_byte(ord(char), rs=True)

    def set_backlight(self, state):
        pass  # Implement backlight control if needed

    def _write_byte(self, byte, rs=False):
        if rs:
            byte |= 0x01
        else:
            byte &= 0xFE
        self.i2c.writeto(self.i2c_addr, bytes([byte]))
        time.sleep_ms(1)
