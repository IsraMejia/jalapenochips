processor 16f877a ; Especifica el procesador a utilizar (16F877A)
include <p16f877.inc> ; Incluye el archivo de definición del procesador

; este programa codifica un mensaje haciendo un xor
; con una clave de 8 bits
clave equ 0x20 ; Define la clave de codificación como 0x20 (espacio en ASCII)
inicio_mensaje equ 0x21 ; Define la dirección de inicio del mensaje como 0x21

org 0 ; Establece la dirección de inicio del programa en 0
goto inicio ; Salta a la etiqueta 'inicio'

org 5 ; Establece la siguiente dirección de inicio en 5

inicio:
    ; Carga la dirección de inicio del mensaje en FSR
    movlw inicio_mensaje ; Carga el valor de inicio_mensaje en W
    movwf FSR ; Mueve el valor de W al registro FSR

recorre_mensaje:
    ; realizamos la codificacion
    movf clave, W ; Mueve el valor de clave a W
    xorwf INDF, W ; Realiza la operación XOR entre clave y el valor apuntado por FSR, y lo almacena en W
    movwf INDF ; Mueve el valor de W al valor apuntado por FSR (codifica el carácter)

    ; Incrementa el puntero al siguiente caracter del mensaje
    incf FSR, F ; Incrementa el valor de FSR para apuntar al siguiente carácter del mensaje

    ; Preguntamos si se encuentra $ en esa localidad
    movlw 0x24 ; Carga el valor 0x24 (carácter '$' en ASCII) en W
    cpfsgt INDF ; Compara si el valor apuntado por FSR es mayor que el valor en W (0x24)
    bra recorre_mensaje ; Si el valor apuntado por FSR es mayor que 0x24, salta a 'recorre_mensaje'

    ; Si es '$', termina el bucle
    ; No se ejecuta ninguna instrucción aquí, simplemente continúa al siguiente bloque

fin:
    ; Termina el programa
    END