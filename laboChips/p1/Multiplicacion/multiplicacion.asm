processor 16f877a
include <p16f877a.inc>

; Definicion de variables y constantes
mul1 equ 0x20
mul2 equ 0x21
contador equ 0x24
resultado equ 0x27
resultadoh equ 0x28

org 0
goto inicio

org 5
revisa_contador:
    decfsz contador, F ; Decrementa el contador y salta si es cero
    goto sigue_ciclo ; Salta si el contador no es cero
    goto terminar ; Sale de la rutina cuando el contador es cero

sigue_ciclo:
    call suma ; Llama a la rutina de suma si contador no es cero
    goto revisa_contador ; Continua el ciclo mientras el contador no sea cero

suma:
    bcf STATUS, C ; Limpia el bit de acarreo antes de la suma
    movf mul2, W ; Mueve el valor de mul2 a W
    addwf resultado, F ; Suma mul2 a resultado (parte baja)
    btfsc STATUS, C ; Verifica el bit de acarreo
    incf resultadoh, F ; Incrementa resultadoh si hay acarreo
    return

inicio:
    movf mul1, W ; Mueve el valor de mul1 a W
    movwf contador ; Guarda mul1 en contador
    incf contador, F    ; Suma 1 al valor de contador
    clrf resultado ; Limpia resultado
    clrf resultadoh ; Limpia resultadoh
    goto revisa_contador ; Salta a revisa_contador

terminar:
    sleep ; Pone el microcontrolador en modo de bajo consumo y detiene la ejecucion

END