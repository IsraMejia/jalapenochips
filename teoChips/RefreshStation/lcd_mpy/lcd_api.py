# lcd_api.py
class LcdApi:
    def __init__(self, num_lines, num_columns):
        self.num_lines = num_lines
        self.num_columns = num_columns
        self.cursor_x = 0
        self.cursor_y = 0
        self.backlight = True

    def clear(self):
        raise NotImplementedError

    def home(self):
        raise NotImplementedError

    def move_to(self, cursor_x, cursor_y):
        if cursor_x != self.cursor_x or cursor_y != self.cursor_y:
            self.cursor_x = cursor_x
            self.cursor_y = cursor_y
            self.move_to_pos(cursor_x, cursor_y)

    def move_to_pos(self, cursor_x, cursor_y):
        raise NotImplementedError

    def putstr(self, string):
        for char in string:
            if char == '\n':
                self.cursor_x = 0
                self.cursor_y += 1
                if self.cursor_y >= self.num_lines:
                    self.cursor_y = 0
            else:
                self.putchar(char)
                self.cursor_x += 1
                if self.cursor_x >= self.num_columns:
                    self.cursor_x = 0
                    self.cursor_y += 1
                    if self.cursor_y >= self.num_lines:
                        self.cursor_y = 0

    def putchar(self, char):
        raise NotImplementedError

    def backlight_on(self):
        self.backlight = True
        self.set_backlight(True)

    def backlight_off(self):
        self.backlight = False
        self.set_backlight(False)

    def set_backlight(self, state):
        raise NotImplementedError
