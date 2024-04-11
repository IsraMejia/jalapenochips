class p16f877a:
    def __init__(self):
        self.boton0 = 0
        self.boton1 = 0
        self.boton2 = 0
        self.boton3 = 0
        self.boton4 = 0
        self.boton5 = 0
        self.boton6 = 0
        self.boton7 = 0
        self.boton8 = 0
        self.tecla9 = 0
        self.led1 = 0
        self.led2 = 0
        self.buzzer = 0
        self.cuenta_vidas = 0

    def pantalla_lcd_bienvenida(self):
        print('''
        _____________________________
        |                           |
        |     Bienvenido al juego   |
        |  Presione boton 0 para    |
        |         iniciar           |
        _____________________________
        ''')

    def pantalla_lcd_muestra_jugadores(self):
        print('''
        _____________________________
        |                           |
        |  1.Erandi       4.Martin  |
        |  2.Isra         5.Jugador |
        |  3.Marisol                |
        _____________________________
        ''')

    def pantalla_lcd_jugador(self, jugador, cuenta_vidas):
        print(f'''
        _____________________________
        |                           |
        |  {jugador}                |
        | Vidas consumidas: {cuenta_vidas}      |
        |                           |
        _____________________________
        ''')

    def muestra_partida(self, jugador):
        self.cuenta_vidas = 0
        boton6_anterior = self.boton6
        tecla9_anterior = self.tecla9
    
        while self.boton6 != 1:  # Mientras no se presione el boton 6 (Acabar intento)
            if self.tecla9 == 1 and self.tecla9 != tecla9_anterior:  # Si se presiona la tecla 9 (toco el cable pierde una vida) y el estado ha cambiado
                self.cuenta_vidas += 1   # Se consume una vida y se muestra en pantalla
                self.pantalla_lcd_jugador(jugador, self.cuenta_vidas)
                tecla9_anterior = self.tecla9  # Actualizamos el estado anterior de tecla9
            elif self.boton6 == 1 :#and self.boton6 != boton6_anterior:  # Si se presiona el boton 6 y el estado ha cambiado
                self.pantalla_lcd_jugador(jugador, self.cuenta_vidas)
                boton6_anterior = self.boton6  # Actualizamos el estado anterior de boton6

    def boton_seleccionado(self, boton):
        self.boton0 = self.boton1 = self.boton2 = self.boton3 = self.boton4 = self.boton5 = self.boton6 = self.boton7 = self.boton8 = 0
        if boton >= 0 and boton <= 8:
            if boton == 0:
                self.boton0 = 1
            elif boton == 1:
                self.boton1 = 1
            elif boton == 2:
                self.boton2 = 1
            elif boton == 3:
                self.boton3 = 1
            elif boton == 4:
                self.boton4 = 1
            elif boton == 5:
                self.boton5 = 1
            elif boton == 6:
                self.boton6 = 1
            elif boton == 7:
                self.boton7 = 1
            elif boton == 8:
                self.boton8 = 1
        else:
            print('Boton no válido')
    
    def seleccion_botones(self):
        pass

    def juego(self):
        print('\n\n\nInicio del juego')
        menu_botones = ''' Presione botones para interactuar con el juego
        Boton 0: Start
        Boton 1: Jugar Player 1
        Boton 2: Jugar Player 2
        Boton 3: Jugar Player 3
        Boton 4: Jugar Player 4
        Boton 5: Jugar Player 5
        Boton 6: Acabar intento
        Boton 7: Fin de juego
        Tecla 9: consume una vida el jugador actual (toco el cable)
        '''
        self.pantalla_lcd_bienvenida()
        while self.boton0 == 0:  # Si se presiona el boton 0 (Start)
            boton = int(input(menu_botones))
            print(f'\tSelecciono boton: {boton}')
            self.boton_seleccionado(boton)
            if self.boton0 == 1:
                print('START: Inicio del juego\n')
                self.pantalla_lcd_muestra_jugadores()
        

        while self.boton7 != 1:
            boton = int(input(menu_botones))
            print(f'\tSelecciono boton: {boton}')
            self.boton_seleccionado(boton)

            if self.boton1 == 1:
                print('Jugador 1 seleccionado')
                self.muestra_partida('Erandi')

            elif self.boton2 == 1:
                print('Jugador 2 seleccionado')
                self.muestra_partida('Isra')

            elif self.boton3 == 1:
                print('Jugador 3 seleccionado')
                self.muestra_partida('Marisol')

            elif self.boton4 == 1:
                print('Jugador 4 seleccionado')
                self.muestra_partida('Martin')

            elif self.boton5 == 1:
                print('Jugador 5 seleccionado')
                self.muestra_partida('Jugador')

            elif self.boton6 == 1:
                print('Intento finalizado')
            elif self.boton7 == 1:
                print('Fin de juego')
            elif self.boton8 == 1:
                print('Boton no válido')
            else: 
                print('Boton no válido')
            print('\n\n')

# Ejemplo de uso
p16f877a_obj = p16f877a()
p16f877a_obj.juego()