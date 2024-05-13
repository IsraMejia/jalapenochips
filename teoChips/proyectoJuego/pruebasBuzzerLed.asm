; Procesador utilizado
processor PIC16f877A
include <p16f877A.inc>

; Definici?n de variables y constantes
pinBoton    equ RC1    ; Puerto de entrada para el boton pulsado (RC1)
pinZumbador equ RC2    ; Puerto de salida para el zumbador (RC2)
pinLED      equ RC3    ; Puerto de salida para el LED (RC3)
COUNT equ 0x25

; Direccion de inicio del programa
org 0H

; Vector de reset que dirige a la etiqueta 'inicio'
goto inicio

; Direcci?n de la interrupci?n
org 4 
    ; En este espacio se manejaria la interrupcion del boton, pero se ha omitido en este ejemplo

; Definicion de la etiqueta de inicio del programa
inicio:
    ; Configuracion inicial de puertos
    clrf PORTC              ; Limpia el puerto C
    bsf STATUS, RP0         ; Cambia al banco de registros 1
    BCF STATUS, RP1         ; Cambia al banco de registros 1
    movlw B'00000010'       ; Configura todos los pines de PORTC como salidas
                            ; excepto el pin del boton (RC1)
    movwf TRISC             ; Registro TRISB como salidas
    bcf STATUS, RP0         ; Vuelve al banco de registros 0 
    goto bucle_boton        ; Se llama el bucle_boton para detectar el boton pulsado y actuar en ello

; Bucle para verificar el estado del boton
bucle_boton:
    ; Verifica si el boton ha sido pulsado (si esta en 0)
    btfsc PORTC, pinBoton  
    goto bucle_boton       ; Si no se ha pulsado, vuelve a revisar el boton

    ; Enciende el zumbador y el LED
    bsf PORTC, pinZumbador 
    bsf PORTC, pinLED      
    call espera_1_segundo  ; Espera 1 segundo
    bcf PORTC, pinZumbador ; Apaga el zumbador despues de 1 segundo
    bcf PORTC, pinLED      ; Apaga el LED despues de 1 segundo
    goto bucle_boton       ; Vuelve al inicio del bucle_boton principal

; Subrutina para esperar 1 segundo
espera_1_segundo:
    ; Carga el valor 250 en W
    movlw d'250'        
    movwf COUNT          ; Asigna el valor a un contador

ciclo_retardo:
    ; Decrementa el contador y salta si es cero
    decfsz COUNT, f     
    goto ciclo_retardo  ; Continua el bucle si el contador no es cero
    retlw 0             ; Retorna al finalizar el retardo
end

;ci 