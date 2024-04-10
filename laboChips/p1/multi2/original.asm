El siguiente codigo es un ejemplo de como se puede realizar una multiplicacion de 
dos numeros de 8 bits en un microcontrolador PIC 16F877A, 
el cual se realiza mediante sumas sucesivas, 
el codigo esta escrito en lenguaje ensamblador y se puede compilar con el 
software MPLAB IDE.
Tiene el fallo que cuando llega el contador a 0, se realiza una suma continua sumando en lugar de terminar el programa

Por favor soluciona este fallo del contador, puede estar en cualquier parte del codigo:

processor 16f877a

include <p16f877.inc>

; Definici�n de variables y constantes
mul1        equ 0x20
mul2        equ 0x21
contador    equ 0x24
resultado   equ 0x27
resultadoh  equ 0x28

org 0
goto inicio

org 5

revisa_contador:
    decfsz contador, F      ; Decrementa el contador y salta si es cero
    call suma               ; Llama a la rutina de suma si contador no es cero
    decfsz contador, F      ; Decrementa el contador y salta si es cero
    goto revisa_contador    ; Contin�a el ciclo mientras el contador no sea cero
    return

suma:
    bcf STATUS, C           ; Limpia el bit de acarreo antes de la suma
    movf mul2, W            ; Mueve el valor de mul2 a W
    addwf resultado, F      ; Suma mul2 a resultado (parte baja)
    btfsc STATUS, C         ; Verifica el bit de acarreo
    incf resultadoh, F      ; Incrementa resultadoh si hay acarreo
    return

inicio:
    movf mul1, W            ; Mueve el valor de mul1 a W
    movwf contador          ; Guarda mul1 en contador
    clrf resultado          ; Limpia resultado
    clrf resultadoh         ; Limpia resultadoh
    goto revisa_contador    ; Salta a revisa_contador

END