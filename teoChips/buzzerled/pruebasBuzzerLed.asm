processor pic16f877a
include <p16f877a.inc>

; Definicion de variables y constantes
pinBoton    equ RB0    ; Puerto de entrada para el boton pulsado (RC1)
pinZumbador equ RB1    ; Puerto de salida para el zumbador (RC2)
pinLED      equ RB2    ; Puerto de salida para el LED (RC3)

org 0
goto inicio
org 5

inicio:
    ; Configuracion inicial de puertos
    clrf PORTB          ; Limpia el puerto B
    bsf STATUS, 5       ; Cambia al banco de registros 1
    movlw 0x00          ; Configura todos los pines de PORTB como salidas
    movwf TRISB         ; Registro TRISB como salidas
    bcf STATUS, 5       ; Vuelve al banco de registros 0

    ; Configura el pin del boton como entrada con pull-up interno
    bsf STATUS, 5       ; Cambia al banco de registros 1
    movlw 0b00000001    ; Configura RC1 (pinBoton) como entrada y los otros pines como salida
    movwf TRISC         ; Registro TRISC como entrada para RC1 y salidas para RC2 y RC3
    bcf STATUS, 5       ; Vuelve al banco de registros 0

    ; Bucle principal
bucle:
    goto bucle

; Funcion de manejo de interrupcion para el boton pulsado
org 4
    movlw 0xFF          ; Establece el puerto B como entradas para evitar cambios
    movwf PORTB
    bcf INTCON, RBIF    ; Limpia la bandera de interrupcion del puerto B
    btfss PORTB, pinBoton  ; Verifica si el boton ha sido pulsado
    goto fin_interrupcion  ; Si no se ha pulsado, termina la interrupcion
    bsf PORTB, pinZumbador  ; Enciende el zumbador
    bsf PORTB, pinLED      ; Enciende el LED
    call espera_1_segundo  ; Espera 1 segundo
    bcf PORTB, pinZumbador  ; Apaga el zumbador despues de 1 segundo
    bcf PORTB, pinLED      ; Apaga el LED despues de 1 segundo

fin_interrupcion:
    retfie

; Subrutina para esperar 1 segundo
espera_1_segundo:
    movlw d'250'        ; Carga el valor 250 en W para aproximadamente 1 segundo (4MHz)
    movwf COUNT1        ; Asigna el valor a un contador
delay_1_segundo_loop:
    decfsz COUNT1, f    ; Decrementa el contador y salta si es cero
    goto delay_1_segundo_loop  ; Continua el bucle si el contador no es cero
    return

end
