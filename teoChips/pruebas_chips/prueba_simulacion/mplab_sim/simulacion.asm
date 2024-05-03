processor pic16f877a
include <p16f877a.inc>

; Definici�n de variables y constantes
valor   equ h'20'
valor1  equ h'21'
valor2  equ h'22' 

num_participantes equ 3 ; N�mero de participantes que puede haber
cont   equ  0x23 ; Para ver cuantas veces toca la varilla el cable

BOTON_1     EQU     RE0     ; Define el primer bot�n conectado al pin RE0
BOTON_2     EQU     RE1     ; Define el segundo bot�n conectado al pin RE2
BOTON_3     EQU     RE2     ; Define el tercer bot�n conectado al pin RE3


org 0
goto inicio
org 5

inicio:
  clrf  PORTA       ; Limpia el registro PORTA
  clrf  PORTB       ; Limpia el registro PORTB
  

  bsf   STATUS,5   ; Establece el bit 5 del registro STATUS para cambiar al banco de registros 1
  bcf   STATUS,6   ; Borra el bit 6 del registro STATUS para configurar el temporizador en modo 0
  movlw 0x00       ; Carga el valor 0x00 en el registro W (registro de trabajo)
  movwf TRISB      ; Configura todos los pines del puerto B como salidas
  movlw 0x07       ; Carga el valor 0x07 en el registro W
  movwf ADCON1     ; Configura el ADC para un funcionamiento normal
  movlw 0x00       ; Carga el valor 0x00 en el registro W
  movwf TRISA      ; Configura todos los pines del puerto A como salidas

  
  bcf STATUS,5     ; Borra el bit 5 del registro STATUS para volver al banco de registros 0
  call inicia_lcd  ; Llama a la subrutina para inicializar la pantalla LCD
  


mostrar_bienvenida:

  movlw 0x80       ; Carga el valor 0x80 en el registro W
  call comando     ; Llama a la subrutina "comando" con el valor 0x80 (establecer la posici�n del cursor)
  movlw '0'        ; Para que se pueda mostrar el "Bienvenidos 
  call datos
  movlw ' '        ; Env�a el car�cter espacio
  call datos
  movlw ' '        ; Env�a el car�cter espacio
  call datos

  movlw 'B'
  call datos
  movlw 'i'
  call datos
  movlw 'e'
  call datos
  movlw 'n'
  call datos
  movlw 'v'
  call datos
  movlw 'e'
  call datos
  movlw 'n'
  call datos
  movlw 'i'
  call datos
  movlw 'd'
  call datos
  movlw 'o'
  call datos
  movlw 's'
  call datos
  call esperar_20seg


  Nombres_Jugadores:
  ; Mensaje en la primera l�nea
  movlw 0x80       ; Posici�n del cursor en la primera l�nea
  call comando     ; Llama a la subrutina "comando" con el valor 0x80 (establecer la posici�n del cursor)
  movlw '0'        ; Para que se pueda mostrar todo 
  call datos
  movlw 'M'        
  call datos
  movlw 'a'       
  call datos
  movlw 'r'        
  call datos
  movlw 'i'        
  call datos
  movlw 's'       
  call datos
  movlw 'o'        
  call datos
  movlw 'l'        
  call datos 
  
  movlw ' '     ; Env�a el car�cter espacio
  call datos
  movlw ' '     ; Env�a el car�cter espacio
  call datos
 
  movlw 'E'        
  call datos
  movlw 'r'       
  call datos
  movlw 'a'        
  call datos
  movlw 'n'        
  call datos
  movlw 'd'        
  call datos
  movlw 'i'        
  call datos
  

  movlw 0xC0    ; Posici�n del cursor en la segunda l�nea
  call comando
  movlw ' '     ; Env�a el car�cter espacio
  call datos
  movlw 'I'        
  call datos
  movlw 's'       
  call datos
  movlw 'r'        
  call datos
  movlw 'a'        
  call datos
  movlw 'e'       
  call datos
  movlw 'l'
  call datos 
  goto $ 

;*************************************************************************************************************  
Botones_A_Usar:
  ; Se configura el puerto E como entrada 
  ; Los botones aqui estar�n 
  bcf STATUS, RP0
  bcf STATUS, RP1 
  clrf PORTE
  
  movlw 0x06
  movwf ADCON1
  bsf STATUS,RP0
  movlw 0x07 
  movwf TRISE
  bcf STATUS, RP0 


Menu_Principal:
    ; Si quiero el puerto A  a RA0 seria btfss PORTA,0
    ; No se si hay confusion al asignar el PORTE de nuevo ya que tecnicamente esto me muestra lo que hace Boton1_Precionado

    btfss PORTE,0   ; aqui se deberia de establecer otro puerto dado que ya se uso RE0  para establecer el BOTON_1  "Pero no se como hacerlo"  mas que nada cambiar de banco seria el problema 
    goto Iniciar_Juego
    goto Menu_Principal 

 
Iniciar_Juego:
    ; Verifica si el bot�n 1 est� presionado
    btfsc BOTON_1,0   ; RE0
    goto Boton1_Presionado
    ; Verifica si el bot�n 2 est� presionado
    btfsc BOTON_2,1   ; RE1
    goto Boton2_Presionado
    ; Verifica si el bot�n 3 est� presionado
    btfsc BOTON_3,2   ; RE2
    goto Boton3_Presionado
    goto Bucle_Principal     ; Si ning�n bot�n est� presionado, contin�a en el bucle principal


Boton1_Presionado:
 ;Selccionamos al Jugador 1
   bsf BOTON_1, 0   ;Si es as�, establece el bit BOTON_1 en 1  (no tengo idea si esta linea sea necesaria o no ) 
  
   movlw 0x80       ; Posici�n del cursor en la primera l�nea
   call comando     ; Llama a la subrutina "comando" con el valor 0x80 (establecer la posici�n del cursor)
   movlw '0'        
   call datos
   movlw 'M'        
   call datos 
   movlw 'a'        
   call datos
   movlw 'r'        
   call datos
   movlw 'i'        
   call datos
   movlw 's'       
   call datos
   movlw 'o'        
   call datos
   movlw 'l'        
   call datos 
   goto Iniciar_Juego     ; Vuelve al bucle principal

Boton2_Presionado:
 ;Selccionamos al Jugador 2
   bsf BOTON_2, 1  ;Si es as�, establece el bit BOTON_2 en 1  
   movlw 0x80       ; Posici�n del cursor en la primera l�nea
   call comando     ; Llama a la subrutina "comando" con el valor 0x80 (establecer la posici�n del cursor)
   movlw '0'        
   call datos
   movlw 'E'        
   call datos
   movlw 'r'        
   call datos
   movlw 'a'        
   call datos
   movlw 'n'        
   call datos
   movlw 'd'       
   call datos
   movlw 'i'        
   call datos
   goto Iniciar_Juego     ; Vuelve al bucle principal


Boton3_Presionado:
 ;Selccionamos al Jugador 3
   bsf BOTON_3, 2   ;Si es as�, establece el bit BOTON_3 en 1  
   movlw 0x80       ; Posici�n del cursor en la primera l�nea
   call comando     ; Llama a la subrutina "comando" con el valor 0x80 (establecer la posici�n del cursor)
   movlw '0'        
   call datos
   movlw 'I'        
   call datos
   movlw 's'        
   call datos
   movlw 'r'        
   call datos
   movlw 'a'        
   call datos
   movlw 'e'       
   call datos
   movlw 'l'        
   call datos
   goto Iniciar_Juego     ; Vuelve al bucle principal





 

 

;***************************************************************************************************************
limpiar_pantalla:
  movlw 0x01       ; Enviar comando para limpiar pantalla
  call comando

  
esperar_20seg:
  movlw 0xF0       ; Cargar el valor 0xA0 en el registro W
  call ret100ms    ; Esperar 500ms (0.5s) x 40 = 20 segundos




Continuar: 


 
              
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


  TERMINO:
   sleep 
  
  END
