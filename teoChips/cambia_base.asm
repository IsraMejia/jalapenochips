Tengo el siguiente codigo en ensamblador para el p16f877a, el cual convierte un numero hexadecimal a decimal, 
Reviza cada digito del numero hexadecimal y lo convierte a decimal, esto mediante restas sucesivas, 
para obtener las centenas, decenas y unidades (estas son el ultimo residuo negativo de la resta).
La funcion Respuesta se encarga de hacer el swap en decenas, para despues sumarlo a centenas y unidades.
Actualmente el codigo no funciona, me gustaria que como respuesta lo soluciones y me explicaras a detalle cada linea de codigo 


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

    ; Inicializar el numero decimal como 0
    clrf Decimal
    
    ; Inicializar el contador en 0
    clrf Cont_centenas
    clrf Cont_decenas
    

	movlw Hexadecimal ;w-> lo ponemos donde esta hexadecimal 
	movwf FSR ;Transferir el valor de WREG a FSR para seleccionar la direccion de memoria
    
recorrer_cada_dig_hexa:
    movf  INDF, f ; Leer el digito hexadecimal actual
    btfss STATUS, Z ; Z=1 se dejara de recorrer el numero por que llegamos al final  
    call Convercion_decimal
    ;avanzamos al siguiente digito
    incf FSR,F ; aqui apuntamos a la siguiente direccion de memoria 
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








	
