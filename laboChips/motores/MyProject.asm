
_main:

	MOVLW      255
	MOVWF      TRISA+0
	MOVLW      6
	MOVWF      ADCON1+0
	CLRF       TRISB+0
	BCF        TRISC+0, 1
	BCF        TRISC+0, 2
L_main0:
	MOVLW      15
	ANDWF      PORTA+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      R2+0
	MOVF       R1+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main2
	BCF        PORTC+0, 1
	BCF        PORTB+0, 1
	BCF        PORTB+0, 0
	BCF        PORTC+0, 2
	BCF        PORTB+0, 3
	BCF        PORTB+0, 2
	GOTO       L_main3
L_main2:
	MOVF       R2+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main4
	BCF        PORTC+0, 1
	BCF        PORTB+0, 1
	BCF        PORTB+0, 0
	BSF        PORTC+0, 2
	BCF        PORTB+0, 3
	BSF        PORTB+0, 2
	GOTO       L_main5
L_main4:
	MOVF       R2+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main6
	BCF        PORTC+0, 1
	BCF        PORTB+0, 1
	BCF        PORTB+0, 0
	BSF        PORTC+0, 2
	BSF        PORTB+0, 3
	BCF        PORTB+0, 2
	GOTO       L_main7
L_main6:
	MOVF       R2+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_main8
	BSF        PORTC+0, 1
	BCF        PORTB+0, 1
	BSF        PORTB+0, 0
	BCF        PORTC+0, 2
	BCF        PORTB+0, 3
	BCF        PORTB+0, 2
	GOTO       L_main9
L_main8:
	MOVF       R2+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_main10
	BSF        PORTC+0, 1
	BSF        PORTB+0, 1
	BCF        PORTB+0, 0
	BCF        PORTC+0, 2
	BCF        PORTB+0, 3
	BCF        PORTB+0, 2
	GOTO       L_main11
L_main10:
	MOVF       R2+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_main12
	BSF        PORTC+0, 1
	BCF        PORTB+0, 1
	BSF        PORTB+0, 0
	BSF        PORTC+0, 2
	BCF        PORTB+0, 3
	BSF        PORTB+0, 2
	GOTO       L_main13
L_main12:
	MOVF       R2+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_main14
	BSF        PORTC+0, 1
	BSF        PORTB+0, 1
	BCF        PORTB+0, 0
	BSF        PORTC+0, 2
	BSF        PORTB+0, 3
	BCF        PORTB+0, 2
	GOTO       L_main15
L_main14:
	MOVF       R2+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_main16
	BSF        PORTC+0, 1
	BCF        PORTB+0, 1
	BSF        PORTB+0, 0
	BSF        PORTC+0, 2
	BSF        PORTB+0, 3
	BCF        PORTB+0, 2
	GOTO       L_main17
L_main16:
	MOVF       R2+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_main18
	BSF        PORTC+0, 1
	BSF        PORTB+0, 1
	BCF        PORTB+0, 0
	BSF        PORTC+0, 2
	BCF        PORTB+0, 3
	BSF        PORTB+0, 2
	GOTO       L_main19
L_main18:
	BCF        PORTC+0, 1
	BCF        PORTB+0, 1
	BCF        PORTB+0, 0
	BCF        PORTC+0, 2
	BCF        PORTB+0, 3
	BCF        PORTB+0, 2
L_main19:
L_main17:
L_main15:
L_main13:
L_main11:
L_main9:
L_main7:
L_main5:
L_main3:
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	DECFSZ     R11+0, 1
	GOTO       L_main20
	NOP
	GOTO       L_main0
L_end_main:
	GOTO       $+0
; end of _main
