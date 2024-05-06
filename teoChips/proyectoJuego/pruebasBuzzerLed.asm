# Codigo ASM para el microcontrolador PIC16F877A que 
# enciende un zumbador y un LED durante 1 segundo cuando se pulsa un boton.
# El codigo utiliza una interrupcion externa para detectar el boton pulsado 
# y una subrutina de espera para esperar 1 segundo antes de apagar el zumbador 
# y el LED. Se esta usando para hacer el build MPLAB V8.92 

processor pic16f877a
include <p16f877a.inc> 

; Definicion de variables y constantes
pinBoton    equ RC1    ; Puerto de entrada para el boton pulsado (RC1)
pinZumbador equ RC2    ; Puerto de salida para el zumbador (RC2)
pinLED      equ RC3    ; Puerto de salida para el LED (RC3)


org 0H ;Carga al vector RESET la direccion de la etiqueta inicio
goto inicio

org 5H; Direccion de inicio del programa
inicio:
    ; Configuracion inicial de puertos
    clrf PORTC          ; Limpia el puerto C
    bsf STATUS, RP0     ; Cambia al banco de registros 1
    BCF STATUS, RP1     ; Cambia al banco de registros 1
    movlw B'00000010'   ; Configura todos los pines de PORTC como salidas
                        ; excepto el pin del boton (RC1)
    movwf TRISC         ; Registro TRISB como salidas
    bcf STATUS, RP0     ; Vuelve al banco de registros 0 
    goto bucle_boton ; se llama el bucle_boton para detectar el boton pulsado y actuar en ello
 
 
bucle_boton:
 
    ; Ejemplo: si se presiona el botón, enciende el LED y el zumbador durante un segundo
    btfsc PORTC, pinBoton  ; Verifica si el botón ha sido pulsado (si está en 0)
    goto bucle_boton  ; Si no se ha pulsado, vuelve a revisar el botón

    bsf PORTC, pinZumbador  ; Enciende el zumbador
    bsf PORTC, pinLED      ; Enciende el LED
    call espera_1_segundo  ; Espera 1 segundo
    bcf PORTC, pinZumbador  ; Apaga el zumbador después de 1 segundo
    bcf PORTC, pinLED      ; Apaga el LED después de 1 segundo

    goto bucle_boton  ; Vuelve al inicio del bucle_boton principal
 
; Funcion de manejo de interrupcion para el boton pulsado
;org 4
espera_1_segundo:
    movlw d'250'        ; Se carga el valor 250 en W
    movwf COUNT         ; Se asigna el valor a un contador

    ; Subrutina para generar un retardo de aproximadamente 1 segundo
    movlw d'250'        ; Valor para un retardo de aproximadamente 1 segundo
    movwf COUNT         ; Asigna el valor a COUNT
    call ciclo_retardo  ; Llama a la subrutina de retardo

ciclo_retardo:
    decfsz COUNT, f     ; Decrementa el contador y salta si es cero
    goto ciclo_retardo  ; Continúa el bucle si el contador no es cero
    retlw 0             ; Retorna al finalizar el retardo

  