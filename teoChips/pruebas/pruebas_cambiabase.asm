processor 16f877a
include <p16f877.inc> 
 
 Hexadecimal   equ 0x21
 Decimal       equ 0x22
     
 Cont_centenas  equ 0x23
 Cont_decenas   equ 0x24
 
 
 org 0
  goto inicio
 org 5 

 inicio:

    ; Inicializar el n�mero decimal como 0
    clrf Decimal
    
    ; Inicializar el contador en 0
    clrf Cont_centenas
    clrf Cont_decenas
    

	movlw Hexadecimal ;w-> lo ponemos donde esta hexadecimal 
	movwf FSR ;Transferir el valor de WREG a FSR para seleccionar la direcci�n de memoria
    
recorrer_cada_d�g_hexa:
    movf  INDF, f ; Leer el d�gito hexadecimal actual
    btfss STATUS, Z ; Z=1 se dejara de recorrer el n�mero por que llegamos al final  
    call Convercion_decimal
    ;avanzamos al siguiente d�gito
    incf FSR,F ; aqui apuntamos a la siguiente direci�n de memoria 
    return ; regresamos 
    
 Convercion_decimal:
    
    movlw 0X64 ; ponemos 100
    subwf Hexadecimal,w  ; restamos 
    btfsc STATUS,C ; si C=0 (+), nos  quedamos en las centenas 
    incf Cont_centenas, F ; el contador lo incrementamos 
    btfss STATUS,C ; si C=1 (-), nos  quedamos en las centenas 
    incf Cont_decenas , F ; el contador lo incrementamos 
    call  Decenas  
   
    
  Decenas:
    movlw 0x0A
    subwf Hexadecimal,w
    call Respuesta 

 Respuesta:
   movf Cont_centenas, W
   movwf Decimal
   movf Cont_decenas, W
   swapf W,F 
   addwf Decimal,f
   return 
   goto Terminamos
 

  Terminamos:
    sleep
    
END








	
 
processor 16f877a
include <p16f877.inc>

 Hexadecimal equ 0x20 ; Direcci�n de memoria donde se almacena el n�mero hexadecimal
 Decimal equ 0x21 ; Direcci�n de memoria donde se almacena el n�mero decimal
 Cont_centenas equ 0x22 ; Direcci�n de memoria donde se almacena el contador de centenas
 Cont_decenas equ 0x23 ; Direcci�n de memoria donde se almacena el contador de decenas

org 0
goto inicio

org 5
inicio:
    ; Inicializar los registros
    clrf Decimal
    clrf Cont_centenas
    clrf Cont_decenas
    
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
    movlw 0x64 ; Constante 16 (base hexadecimal)
    subwf w, w ; w = w - 0x64
    btfss STATUS, C ; Verificar si el resultado es negativo
    incf Cont_centenas, f ; Si el resultado es positivo, incrementar el contador de unidades
    btfsc STATUS, C ; Verificar si el resultado es negativo
    incf Cont_decenas, f ; Si el resultado es negativo, incrementar el contador de decenas
    return

Conversion_decenas:
    movlw 0xA ; Constante 16 (base hexadecimal)
    subwf w, w ; w = w - 0x64
    return
   
Respuesta:
    movf Cont_centenas, w
    movwf Decimal
    movf Cont_decenas, w
    swapf w, f ; Intercambiar nibbles (decenas y unidades)
    addwf Decimal, f ; Sumar las decenas a las centenas
    return
Terminados:
    sleep
 end