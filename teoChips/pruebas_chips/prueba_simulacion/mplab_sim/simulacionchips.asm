processor pic16f877a
include <p16f877a.inc>

valor1 equ h'21'
valor2 equ h'22'
valor3 equ h'23'
cte1 equ 20h
cte2 equ 50h
cte3 equ 60h

    ORG 0
    GOTO INICIO

    ORG 5
INICIO: 
    SABIENDO que para el pic 16f887a se usa  EL SIGiguiente codigo para definir que es un puerto de salida:
    BSF STATUS, RPO
    BCF STATUS, RP1

    MOVLW H'0'  ; CARGA EL VALOR 0 EN W
    MOVWF TRISC ; CONFIGURA PUERTO C COMO SALIDA  

    Esto significa que todos los pines del puerto B seran de un uso exclusivo de salida?
    Digamos que 
    el pin rc1 en el pin 16 sea de entrada
    el pin rc2 en el pin 17 sea de salida 
    el pin rc3 rn el pin 18 sea un pin de entrada 
    
    es posible? como hago eso?
    BCF STATUS, RPO ; REGRESA A BANK 0
    CLRF PORTB 
