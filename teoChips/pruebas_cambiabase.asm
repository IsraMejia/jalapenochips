processor 16f877a
include <p16f877.inc>

Hexadecimal equ 0x20 ; Dirección de memoria donde se almacena el número hexadecimal
Decimal equ 0x21 ; Dirección de memoria donde se almacena el número decimal
Cont_centenas equ 0x22 ; Dirección de memoria donde se almacena el contador de centenas
Cont_decenas equ 0x23 ; Dirección de memoria donde se almacena el contador de decenas
Cont_unidades equ 0x24 ; Dirección de memoria donde se almacena el contador de unidades

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
    movwf FSR ; FSR apunta a la dirección de memoria del número hexadecimal

recorrer_cada_dig_hexa:
    movf INDF, w ; Leer el dígito hexadecimal actual
    call Conversion_decimal ; Llamar a la función de conversión
    incf FSR, f ; Apuntar al siguiente dígito hexadecimal
    btfsc STATUS, Z ; Verificar si se llegó al final del número hexadecimal
    goto Respuesta ; Si se llegó al final, saltar a la función Respuesta
    goto recorrer_cada_dig_hexa ; Repetir el proceso para el siguiente dígito

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
    addwf Decimal, f ; Sumar las unidades al número decimal
    return

Terminados:
    sleep
    end