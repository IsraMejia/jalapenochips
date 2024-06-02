    processor 16f877
    include <p16f877.inc>

VAL: EQU 0x20

    ORG 0
    GOTO INICIO

INICIO:
    ; a. Limpiar el puerto A (CLRF PORTA)
    CLRF PORTA
    ; b. Cambiar al banco uno
    BSF STATUS, RP0
    BCF STATUS, RP1
    ; c. Definir el puerto A para entradas analógicas, escribir 00 al registro ADCON1
    CLRF TRISB
    CLRF ADCON1
    ; d. Regresar al banco cero
    BCF STATUS, RP0
    ; e. Configurar ADCON0: fuente de reloj, canal de entrada, encender A/D
    MOVLW B'11000001'  ; Selecciona el canal 0 y enciende el módulo A/D
    MOVWF ADCON0

REPETIR:
    ; f. Iniciar la conversión (GO/DONE# = 1)
    BSF ADCON0, 2      ; Inicia la conversión A/D
    ; g. Generar un retardo de 20 microsegundos
    CALL RETARDO
    
ESPERAR:
    ; h. Esperar a que GO/DONE# sea igual a cero
    BTSC ADCON0, 2
    GOTO ESPERAR
    ; i. Leer el resultado de ADRESH
    MOVF ADRESH, W
    MOVWF PORTB
    GOTO REPETIR

RETARDO:
    MOVLW 0x30
    MOVWF VAL
LOOP:
    DECFSZ VAL, F
    GOTO LOOP
    RETURN

    END
