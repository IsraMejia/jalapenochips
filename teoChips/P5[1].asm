
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

    ; Inicializar el número decimal como 0
    clrf Decimal
    
    ; Inicializar el contador en 0
    clrf Cont_centenas
    clrf Cont_decenas
    

	movlw Hexadecimal ;w-> lo ponemos donde esta hexadecimal 
	movwf FSR ;Transferir el valor de WREG a FSR para seleccionar la dirección de memoria
    
recorrer_cada_díg_hexa:
    movf  INDF, f ; Leer el dígito hexadecimal actual
    btfss STATUS, Z ; Z=1 se dejara de recorrer el número por que llegamos al final  
    call Convercion_decimal
    ;avanzamos al siguiente dígito
    incf FSR,F ; aqui apuntamos a la siguiente direción de memoria 
    return ; regresamos 
    
 Convercion_decimal:
    
    movlw 0X64 ; ponemos 100
    subwf Hexadecimal,w  ; restamos 
    btfsc STATUS,C ; si C=0 (+), nos  quedamos en las centenas 
    incf Cont_centenas, F ; el contador lo incrementamos 
    call  Decenas  
   
    
  Decenas:
    movlw 0x0A
    subwf Hexadecimal,w
    btfsc STATUS,C ; si C=0 (+), nos  quedamos en las decenas 
    incf Cont_decenas, F ; el contador lo incrementamos 
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








	
