PROCESSOR 16F877A
    INCLUDE <P16F877A.INC>

    __CONFIG _CP_OFF & _WDT_OFF & _BODEN_OFF & _PWRTE_ON & _XT_OSC & _WRT_OFF & _LVP_OFF & _CPD_OFF

; Definición de variables y constantes
BOTON_PULSADO   EQU     0x20    ; Bandera para indicar que se presionó el botón
TIEMPO_ESPERA   EQU     D'200'  ; Valor para esperar 1 segundo (200 x 5ms)

; Vectores de interrupción
 ORG     0x0004
 GOTO    INT_BOTON   ; Rutina de interrupción del botón

; Código principal
 ORG     0x0000
 GOTO    INICIO

INICIO:
 BANKSEL TRISC       ; Selecciona el banco de registros para TRISC
 MOVLW   b'00000001' ; Configura RC1 como entrada (botón)
 MOVWF   TRISC       ; Configura RC2 y RC3 como salidas (zumbador y LED)

 BANKSEL PORTC       ; Selecciona el banco de registros para PORTC
 CLRF    PORTC       ; Apaga el zumbador y el LED

 BSF     INTCON, GIE ; Habilita interrupciones globales
 BSF     INTCON, RBIF; Establece la bandera de interrupción en RB
 BSF     INTCON, RBIE; Habilita interrupciones en RB

Bucle_Principal:
 GOTO    Bucle_Principal ; Bucle principal

; Rutina de interrupción del botón
INT_BOTON:
 BCF     INTCON, RBIF; Limpia la bandera de interrupción en RB
 BSF     BOTON_PULSADO, 0 ; Establece la bandera de botón presionado
 CALL    ENCENDER_ZUMBADOR_Y_LED ; Llama a la subrutina
 RETURN

; Subrutina para encender el zumbador y el LED durante 1 segundo
ENCENDER_ZUMBADOR_Y_LED:
 BSF     PORTC, 1    ; Enciende el zumbador (RC2)
 BSF     PORTC, 2    ; Enciende el LED (RC3)
 MOVLW   TIEMPO_ESPERA ; Carga el valor de tiempo de espera
 MOVWF   TIEMPO_ESPERA_TEMP ; Guarda el valor en una variable temporal
ESPERA:
 DECFSZ  TIEMPO_ESPERA_TEMP, F ; Decrementa el contador de tiempo
 GOTO    ESPERA      ; Repite si no se ha alcanzado el tiempo
 BCF     PORTC, 1    ; Apaga el zumbador
 BCF     PORTC, 2    ; Apaga el LED
 BCF     BOTON_PULSADO, 0 ; Limpia la bandera de botón presionado
 RETURN

 END

#claude