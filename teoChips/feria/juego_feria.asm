 processor 16f877 
include<p16f877.inc>

; VARIABLES PARA JUEGO
 
valor equ h'20'
valor1 equ h'21'
valor2 equ h'22'

num_jugadores equ 0x23
cont_jugador equ 0x24

cont_jugador_temp equ 0x56

cont_vidas_usadas equ 0x25
cont1 equ 0x27
cont2 equ 0x28
cont3 equ 0x29
apuntador_cont equ 0x2c

; VARIABLES PARA CONVERSION DE HEX A DECIMAL

hex0 equ 0x2d ; registro a convertir a decimal

dec0 equ 0x33 ; registros donde se guardara el numero decimal
dec1 equ 0x32
dec2 equ 0x31

temp1 equ 0x52 ; registros utilizados en las operaciones
temp2 equ 0x53
cont1_dec equ 0x54

; VARIABLES PARA OBTENER MINIMO DE TOQUES
cont_vidas_usadas_temp equ 0x41
minimo equ 0x42
indice_minimo equ 0x43



org 0
goto inicio
org 5

inicio:
clrf PORTA
clrf PORTB
clrf PORTD
clrf PORTE

clrf cont_vidas_usadas
clrf cont1
clrf cont2
clrf cont3

bsf STATUS,5
bcf STATUS,6

movlw 0x00
movwf TRISB
movlw 0x07
movwf ADCON1
movlw 0x00 
movwf TRISA
movlw b'00000111'
movwf TRISD
movlw b'001'
movwf TRISE

bcf STATUS,5
call inicia_lcd
movlw 0x80
call comando

nombres:

; Erandi
MOVLW 0X01
CALL comando
MOVLW 0X80 
CALL comando
MOVLW A' ' 	
CALL datos 
MOVLW A'E' 	
CALL datos 
MOVLW A'r' 
CALL datos 
MOVLW A'a' 
CALL datos 
MOVLW A'n' 
CALL datos 
MOVLW A'd' 
CALL datos 
MOVLW A'i' 
CALL datos 
MOVLW A' ' 
CALL datos 
CALL ret1s

; Israel
MOVLW 0X01 
CALL comando
MOVLW 0X80 
CALL comando
MOVLW A' ' 	
CALL datos  
MOVLW A'I' 
CALL datos 
MOVLW A's' 
CALL datos 
MOVLW A'r' 
CALL datos 
MOVLW A'a' 
CALL datos 
MOVLW A'e' 
CALL datos 
MOVLW A'l' 
CALL datos 
MOVLW 0XC0 
CALL comando 
CALL ret1s

; JESUS VAZQUEZ
MOVLW 0X01 
CALL comando
MOVLW 0X80 
CALL comando
MOVLW A' ' 	
CALL datos
MOVLW A'M' 
CALL datos 
MOVLW A'a' 
CALL datos 
MOVLW A'r' 
CALL datos 
MOVLW A't' 
CALL datos
MOVLW A'i' 
CALL datos 
MOVLW A'n' 
CALL datos  
CALL ret1s

jugadores:
MOVLW 0X01
CALL comando
MOVLW 0X80 
CALL comando
MOVLW A' ' 	
CALL datos 
MOVLW A'J' 
CALL datos 
MOVLW A'U' 
CALL datos 
MOVLW A'G' 
CALL datos 
MOVLW A'A' 
CALL datos 
MOVLW A'D' 
CALL datos 
MOVLW A'O' 
CALL datos 
MOVLW A'R' 
CALL datos 
MOVLW A'E'  
CALL datos 
MOVLW A'S'  
CALL datos 
MOVLW A' '  
CALL datos 

movf PORTD, w
movwf num_jugadores
addlw 30
CALL datos 
CALL ret1s
;CALL ret1s
;CALL ret1s

inicio_juego:
movf num_jugadores, w
sublw 0x0

btfsc STATUS, Z
goto fin_juego
;movf cont1, w
;addlw 30
;CALL datos
clrf cont_jugador

movlw 0x26
movwf apuntador_cont

bcf STATUS,IRP



nuevo_jugador:

clrf cont_vidas_usadas

incf apuntador_cont
incf cont_jugador

movf apuntador_cont, w
movwf FSR

ciclo_juego:
MOVLW 0X01 
CALL comando
MOVLW 0X80 
CALL comando 
MOVLW A' '
CALL datos
MOVLW A'J' 
CALL datos 

;MOVLW A'1' 
;CALL datos

movf cont_jugador, w
addlw 30
call datos

 
MOVLW A':' 
CALL datos 
MOVLW A' '
CALL datos

call imprime_toques_dec

btfsc PORTD, 2
goto fin_recorrido


btfsc PORTE, 0
goto si

; NO toca el cable
bcf PORTE, 1

ret1:
goto ciclo_juego

si:
; SI toca el cable
bsf PORTE, 1
incf cont_vidas_usadas

MOVLW 0X01 
CALL comando
MOVLW 0X80 
CALL comando 
MOVLW A' '
CALL datos
MOVLW A'J' 
CALL datos 

movf cont_jugador, w
addlw 30
call datos

MOVLW A':' 
CALL datos 
MOVLW A' '
CALL datos

call imprime_toques_dec

call ret1s
call ret1s

goto ret1


fin_recorrido:
movf cont_vidas_usadas, w
movwf INDF

MOVLW 0X01 
CALL comando
MOVLW 0X80 
CALL comando 
MOVLW A' '
CALL datos
MOVLW A'J' 
CALL datos 

movf cont_jugador, w
addlw 30
call datos

MOVLW A':' 
CALL datos 
MOVLW A' '
CALL datos
MOVLW A'T' 
CALL datos 
MOVLW A'O' 
CALL datos 
MOVLW A'Q' 
CALL datos
MOVLW A'U' 
CALL datos 
MOVLW A'E' 
CALL datos 
MOVLW A'S' 
CALL datos
MOVLW A':' 
CALL datos
MOVLW A' '
CALL datos

call imprime_toques_dec

call ret1s
call ret1s

movf cont_jugador, w
movwf cont_jugador_temp
movf num_jugadores, w
subwf cont_jugador_temp

btfss STATUS, Z
goto nuevo_jugador

fin_juego:
MOVLW 0X01 
CALL comando
MOVLW 0X80 
CALL comando 
MOVLW A' '
CALL datos
MOVLW A'F' 
CALL datos 
MOVLW A'I' 
CALL datos 
MOVLW A'N' 
CALL datos 
MOVLW A' '
CALL datos
MOVLW A'J' 
CALL datos 
MOVLW A'U' 
CALL datos 
MOVLW A'E' 
CALL datos
MOVLW A'G' 
CALL datos 
MOVLW A'O' 
CALL datos
MOVLW 0XC0 
CALL comando

MOVLW A' '
CALL datos

movf cont1, w
movwf cont_vidas_usadas
call imprime_toques_dec

MOVLW A' '
CALL datos

movf cont2, w
movwf cont_vidas_usadas
call imprime_toques_dec

MOVLW A' '
CALL datos

movf cont3, w
movwf cont_vidas_usadas
call imprime_toques_dec

call ret1s
call ret1s
call ret1s


ganador:

call obtener_minimo

MOVLW 0X01 
CALL comando
MOVLW 0X80 
CALL comando 
MOVLW A' '
CALL datos
MOVLW A'G' 
CALL datos 
MOVLW A'A' 
CALL datos 
MOVLW A'N' 
CALL datos 
MOVLW A'A'
CALL datos
MOVLW A'D' 
CALL datos 
MOVLW A'O' 
CALL datos 
MOVLW A'R' 
CALL datos
MOVLW A':' 
CALL datos 
MOVLW A' ' 
CALL datos
MOVLW A'J' 
CALL datos 

movf indice_minimo, w
addlw 30
call datos

MOVLW 0XC0 
CALL comando

MOVLW A' ' 
CALL datos
MOVLW A' ' 
CALL datos

movf minimo, w
movwf cont_vidas_usadas
call imprime_toques_dec

MOVLW A' ' 
CALL datos
MOVLW A'T' 
CALL datos 
MOVLW A'O' 
CALL datos 
MOVLW A'Q' 
CALL datos 
MOVLW A'U'
CALL datos
MOVLW A'E' 
CALL datos 
MOVLW A'S' 
CALL datos 

call ret1s
call ret1s
call ret1s

goto ganador




; SUBRUTINA PARA OBTENER JUGADOR CON MENOS TOQUES

obtener_minimo:
    movlw 0x26
    movwf apuntador_cont ;puntero para recorrer los datos de los jugadores.

    clrf cont_jugador ; contador para del jugador que se esta evaluando
    clrf cont_jugador_temp 
    ; contador para del jugador que se esta evaluando, compara sin alterar el orginal

    movf cont1, w
    movwf minimo

    movlw 0x1
    movwf indice_minimo

    bcf STATUS,IRP


ciclo_minimo:
    incf apuntador_cont
    incf cont_jugador

    movf apuntador_cont, w
    movwf FSR


    movf INDF, w
    movwf cont_vidas_usadas

    movf cont_vidas_usadas, w
    movwf cont_vidas_usadas_temp

    movf minimo, w
    subwf cont_vidas_usadas_temp


    btfss STATUS, C
    goto nuevo_minimo
    goto sig1

nuevo_minimo:
    movf cont_vidas_usadas, w
    movwf minimo

    movf cont_jugador, w
    movwf indice_minimo

sig1: 
    movf cont_jugador, w
    movwf cont_jugador_temp
    movf num_jugadores, w
    subwf cont_jugador_temp

    btfss STATUS, Z
    goto ciclo_minimo

return
 







; SUBRUTINA PARA IMPRIMIR TOQUES EN DECIMAL

imprime_toques_dec:
    ; imprime numero en decimal
    movf cont_vidas_usadas, w
    movwf hex0
    call hex_a_dec

    ; imprime centenas
    movf dec2, w
    addlw 30
    CALL datos

    ; imprime decenas
    movf dec1, w
    addlw 30
    CALL datos

    ; imprime unidades
    movf dec0, w
    addlw 30
    CALL datos
return




; SUBRUTINA PARA CONVERTIR DE HEX A DEC

hex_a_dec: 
    ; se ponen en cero los valores decimales
    movlw 0x0
    movwf dec0
    movwf dec1
    movwf dec2

    ;PARA DEC2 (CENTENAS)

    ; el contador se inicializa en -1 para su correcto uso
    movlw 0xff
    movwf cont1_dec

    ; se guarda el valor hexadecimal en un registro temporal
    movf hex0, w
    movwf temp1

    ; ciclo que realiza la division para centenas
    ciclo_div_dec2:
        incf cont1_dec ; se incrementa el contador (aqui estara el resultado)
        movf temp1, w
        movwf temp2 ; se guarda el resultado en otro registro temporal (aqui estara el residuo)

        ; se le va restando 100
        movlw 0x64 
        subwf temp1

        btfsc STATUS, C ; se checa la bandera carry para ver si se repite
        goto ciclo_div_dec2

        ;SE REGISTRA DEC2
        movf cont1_dec, w
        movwf dec2

        ;PARA DEC1 (DECENAS)
        ; el codigo es muy similar a la seccion de arriba, solo marcare las diferencias
        movlw 0xff
        movwf cont1_dec

        ; en vez de guardar el valor hexadecimal inicial, se guarda el residuo de las centenas
        movf temp2, w
        movwf temp1

    ; ciclo que realiza la division para decenas
    ciclo_div_dec1:
        incf cont1_dec
        movf temp1, w
        movwf temp2

        ; se le va restando 10
        movlw 0xa
        subwf temp1

        btfsc STATUS, C
        goto ciclo_div_dec1

        ;SE REGISTRA DEC1
        movf cont1_dec, w
        movwf dec1


        ;SE REGISTRA DEC0
        ; aqui simplemente se registra el residuo de las decenas que seran las unidades
        movf temp2, w
        movwf dec0

return



inicia_lcd:
    movlw 0x30
    call comando
    call ret100ms
    movlw 0x30 
    call comando
    call ret100ms 
    movlw 0x38
    call comando 
    movlw 0x0c
    call comando
    movlw 0x01
    call comando
    movlw 0x06
    call comando
    movlw 0x02
    call comando
return


comando: 
    movwf PORTB
    call ret200
    bcf PORTA,0
    bsf PORTA,1
    call ret200
    bcf PORTA,1
return


datos: 
    movwf PORTB 
    call ret200
    bsf PORTA,0
    bsf PORTA,1
    call ret200 
    bcf PORTA,1 
    call ret200
    call ret200
return

ret1s:
    call ret100ms
    call ret100ms
    call ret100ms
    call ret100ms
    call ret100ms
    call ret100ms
    call ret100ms
    call ret100ms
    call ret100ms
    call ret100ms 

    ret200:
        movlw 0x02 
        movwf valor1 
        loop: 
        movlw d'164' 
        movwf valor
        loop1: 
        decfsz valor,1 
        goto loop1
        decfsz valor1,1
        goto loop 
return


ret100ms: 
    movlw 0x03
    movwf valor
    tres: 
        movlw 0xff 
        movwf valor1
    dos: 
        movlw 0xff
        movwf valor2
    uno: 
        decfsz valor2 
        goto uno
        decfsz valor1
        goto dos
        decfsz valor
        goto tres
return

end






