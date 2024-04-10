processor 16f877a
include <
.inc>

Hexadecimal equ 0x20 ; Direcci�n de memoria donde se almacena el n�mero hexadecimal
Decimal equ 0x21 ; Direcci�n de memoria donde se almacena el n�mero decimal
Cont_centenas equ 0x22 ; Direcci�n de memoria donde se almacena el contador de centenas
Cont_decenas equ 0x23 ; Direcci�n de memoria donde se almacena el contador de decenas
Cont_unidades equ 0x24 ; Direcci�n de memoria donde se almacena el contador de unidades

org 0
goto inicio

org 5
inicio:
    ; Inicializar los registros
    clrf Decimal
    clrf Cont_centenas
    clrf Cont_decenas
    clrf Cont_unidades
    movlw Hexadecimal
    movwf FSR ; FSR apunta a la direcci�n de memoria del n�mero hexadecimal

recorrer_cada_dig_hexa:
    movf INDF, w ; Leer el d�gito hexadecimal actual
    call Conversion_decimal ; Llamar a la funci�n de conversi�n
    incf FSR, f ; Apuntar al siguiente d�gito hexadecimal
    btfsc STATUS, Z ; Verificar si se lleg� al final del n�mero hexadecimal
    goto Respuesta ; Si se lleg� al final, saltar a la funci�n Respuesta
    goto recorrer_cada_dig_hexa ; Repetir el proceso para el siguiente d�gito

Conversion_decimal:
    movlw 0x10 ; Constante 16 (base hexadecimal)
    subwf w, w ; w = w - 0x10
    btfss STATUS, C ; Verificar si el resultado es negativo
    incf Cont_unidades, f ; Si el resultado es positivo, incrementar el contador de unidades
    btfsc STATUS, C ; Verificar si el resultado es negativo
    incf Cont_decenas, f ; Si el resultado es negativo, incrementar el contador de decenas
    return

Respuesta:
    movf Cont_centenas, w
    movwf Decimal
    movf Cont_decenas, w
    swapf w, f ; Intercambiar nibbles (decenas y unidades)
    addwf Decimal, f ; Sumar las decenas a las centenas
    movf Cont_unidades, w
    addwf Decimal, f ; Sumar las unidades al n�mero decimal
    return

Terminados:
    sleep
    end