
; mas o menos funcional

processor 16f877a ; La directiva 'processor' debe estar en la columna 2 o posterior

include <p16f877.inc>

; Definici?n de variables y constantes
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
    call suma                ; Llama a la rutina de suma si contador no es cero
    ;decfsz contador, F      ; Decrementa el contador y salta si es cero
    goto revisa_contador    ; Contin?a el ciclo mientras el contador no sea cero
    return

suma:
    movf mul2, W            ; Mueve el valor de mul2 a W
    addwf resultado, F      ; Suma mul2 a resultado (parte baja)
    btfsc STATUS, C         ; Verifica el bit de acarreo
    incf resultadoh, F      ; Incrementa resultadoh si hay acarreo
    return                  ; Retorna

inicio:
    movf mul1, W            ; Mueve el valor de mul1 a W
    movwf contador          ; Guarda mul1 en contador
    clrf resultado          ; Limpia resultado
    clrf resultadoh         ; Limpia resultadoh
    goto revisa_contador    ; Salta a revisa_contador
     
END



;

Este programa hace un conjunto de sumas para simular la multiplicacion de mul1 por mul2.
La varibale contador nos sirve para ir llevando la cuenta de las sumas necesarias para esta tarea.
El problema es que cuando el valor de contador decrementa a 0 en lugar de terminar la ejecucion, el el siguiente ciclo aumenta a 255 y sigue con la ejecucion en un bucle infinito.
Como resulverias el problema:

processor 16f877a  

include <p16f877.inc>

; Definici?n de variables y constantes
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
    call suma                ; Llama a la rutina de suma si contador no es cero
    decfsz contador, F      ; Decrementa el contador y salta si es cero
    goto revisa_contador    ; Contin?a el ciclo mientras el contador no sea cero
    return

suma:
    movf mul2, W            ; Mueve el valor de mul2 a W
    addwf resultado, F      ; Suma mul2 a resultado (parte baja)
    btfsc STATUS, C         ; Verifica el bit de acarreo
    incf resultadoh, F      ; Incrementa resultadoh si hay acarreo
    return                  ; Retorna

inicio:
    movf mul1, W            ; Mueve el valor de mul1 a W
    movwf contador          ; Guarda mul1 en contador
    clrf resultado          ; Limpia resultado
    clrf resultadoh         ; Limpia resultadoh
    goto revisa_contador    ; Salta a revisa_contador
     
END



 ;
;ajustando el valor de acarreo antes de cada suma
processor 16f877a

include <p16f877.inc>

; Definición de variables y constantes
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
    goto revisa_contador    ; Continúa el ciclo mientras el contador no sea cero
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



