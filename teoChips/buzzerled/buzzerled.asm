; Configuración del microcontrolador
    processor 16f877a
    include <p16f877.inc>

; Definición de constantes
    CBLOCK  0x20
        BOTON_ESTADO  ; Variable para almacenar el estado del botón
        CONTADOR     ; Variable para el contador de tiempo
    ENDC

; Inicio del programa
    ORG     0x00
    GOTO    INICIO

; Rutina de interrupción (si es necesaria)
; INTERRUPT_VECTOR
;   BTFSS   INTCON,RBIF    ; Verificar si la interrupción es por el cambio de estado en RB
;   GOTO    FIN_INTERRUPCIÓN
;   BCF     INTCON,RBIF    ; Limpiar el flag de interrupción
;   MOVLW   0x01
;   MOVWF   BOTON_ESTADO   ; Activar la bandera de presión del botón
; FIN_INTERRUPCIÓN:
;   RETFIE

; Rutina principal
INICIO:
    BANKSEL TRISA        ; Seleccionar el banco de registros
    CLRF    TRISB        ; Configurar el puerto B como salida
    MOVLW   0x10         ; Configurar RB4 como entrada
    IORWF   TRISB,F

    BANKSEL PORTB        ; Seleccionar el banco de registros
    CLRF    PORTB        ; Inicializar el puerto B en 0

    CLRF    BOTON_ESTADO ; Inicializar la variable de estado del botón

LOOP:
    BTFSC   PORTB,4       ; Verificar si el botón está presionado
    GOTO    BOTÓN_PRESIONADO
    GOTO    LOOP

BOTÓN_PRESIONADO:
    MOVLW   0x01
    MOVWF   BOTON_ESTADO  ; Activar la bandera de presión del botón
    CALL    ENCENDER_LED_Y_BUZZER
    CALL    APAGAR_LED_Y_BUZZER
    GOTO    LOOP

ENCENDER_LED_Y_BUZZER:
    BSF     PORTB,0       ; Encender el LED
    BSF     PORTB,1       ; Encender el buzzer
    MOVLW   0x64         ; Cargar el valor inicial del contador (100 decisegundos = 2 segundos)
    MOVWF   CONTADOR
ESPERAR:
    DECFSZ  CONTADOR,F    ; Decrementar el contador
    GOTO    ESPERAR
    RETURN

APAGAR_LED_Y_BUZZER:
    BCF     PORTB,0       ; Apagar el LED
    BCF     PORTB,1       ; Apagar el buzzer
    RETURN

    END