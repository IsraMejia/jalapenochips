processor 16f877a
include <p16f877.inc>

Hexadecimal equ 0x20 ; Direccion de memoria donde se almacena el numero hexadecimal
Decimal equ 0x21 ; Direccion de memoria donde se almacena el numero decimal
Cont_centenas equ 0x22 ; Direccion de memoria donde se almacena el contador de centenas
Cont_decenas equ 0x23 ; Direccion de memoria donde se almacena el contador de decenas
Cont_unidades equ 0x24 ; Direccion de memoria donde se almacena el contador de unidades

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
    movwf FSR ; FSR apunta a la direccion de memoria del numero hexadecimal

recorrer_cada_dig_hexa:
    movf INDF, w ; Leer el digito hexadecimal actual
    call Conversion_decimal ; Llamar a la funcion de conversion
    incf FSR, f ; Apuntar al siguiente digito hexadecimal
    btfsc STATUS, Z ; Verificar si se llego al final del numero hexadecimal
    goto Respuesta ; Si se llego al final, saltar a la funcion Respuesta
    goto recorrer_cada_dig_hexa ; Repetir el proceso para el siguiente digito

Conversion_decimal:
    movlw 0x10 ; Constante 16 (base hexadecimal)
    subwf w, f ; w = w - 0x10
    btfsc STATUS, C ; Verificar si el resultado es negativo
    incf Cont_unidades, f ; Si el resultado es positivo, incrementar el contador de unidades
    btfss STATUS, C ; Verificar si el resultado es negativo
    incf Cont_decenas, f ; Si el resultado es negativo, incrementar el contador de decenas
    return

Respuesta:
    movf Cont_centenas, w
    movwf Decimal
    movf Cont_decenas, w
    swapf w, f ; Intercambiar nibbles (decenas y unidades)
    addwf Decimal, f ; Sumar las decenas a las centenas
    movf Cont_unidades, w
    addwf Decimal, f ; Sumar las unidades al numero decimal
    return

Terminados:
    sleep
    end