


processor 16f877a
include <p16f877a.inc>

; Definici�n de variables y constantes
valor   equ h '20'
valor1  equ h '21'
valor2  equ h '22'
 
org 0
goto inicio
org 5

inicio:
  clrf  PORTA
  clrf  PORTB
  bsf   STATUS,5
  bcf   STATUS,6
  movlw 0x00
  movwf TRISB
  movlw 0x07
  movwf ADCON1
  movlw 0x00
  movwf TRISA


  bcf STATUS,5
  call inicia_lcd
  movlw 0x80
  call comando
  
  loopf_movlw a 'R'
  call datos
  goto loopf

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
  movlw d '164' 
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
  
  END







