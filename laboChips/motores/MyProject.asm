
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
	CLRF       _i+0
	CLRF       _i+1
L_main3:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main61
	MOVLW      10
	SUBWF      _i+0, 0
L__main61:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
	BCF        PORTC+0, 2
	BCF        PORTC+0, 1
	BCF        PORTB+0, 3
	BCF        PORTB+0, 2
	BCF        PORTB+0, 1
	BCF        PORTB+0, 0
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
	GOTO       L_main3
L_main4:
	CLRF       _i+0
	CLRF       _i+1
	GOTO       L_main7
L_main2:
	MOVF       R2+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_main8
	CLRF       _i+0
	CLRF       _i+1
L_main9:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main62
	MOVLW      10
	SUBWF      _i+0, 0
L__main62:
	BTFSC      STATUS+0, 0
	GOTO       L_main10
	BSF        PORTC+0, 2
	BCF        PORTC+0, 1
	BCF        PORTB+0, 3
	BCF        PORTB+0, 2
	BCF        PORTB+0, 1
	BSF        PORTB+0, 0
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
	NOP
	NOP
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
	GOTO       L_main9
L_main10:
	CLRF       _i+0
	CLRF       _i+1
	GOTO       L_main13
L_main8:
	MOVF       R2+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_main14
	CLRF       _i+0
	CLRF       _i+1
L_main15:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main63
	MOVLW      10
	SUBWF      _i+0, 0
L__main63:
	BTFSC      STATUS+0, 0
	GOTO       L_main16
	BSF        PORTC+0, 2
	BCF        PORTC+0, 1
	BCF        PORTB+0, 3
	BCF        PORTB+0, 2
	BSF        PORTB+0, 1
	BCF        PORTB+0, 0
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	DECFSZ     R11+0, 1
	GOTO       L_main18
	NOP
	NOP
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
	GOTO       L_main15
L_main16:
	CLRF       _i+0
	CLRF       _i+1
	GOTO       L_main19
L_main14:
	MOVF       R2+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_main20
	CLRF       _i+0
	CLRF       _i+1
L_main21:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main64
	MOVLW      10
	SUBWF      _i+0, 0
L__main64:
	BTFSC      STATUS+0, 0
	GOTO       L_main22
	BCF        PORTC+0, 2
	BSF        PORTC+0, 1
	BCF        PORTB+0, 3
	BCF        PORTB+0, 2
	BSF        PORTB+0, 1
	BSF        PORTB+0, 0
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main24:
	DECFSZ     R13+0, 1
	GOTO       L_main24
	DECFSZ     R12+0, 1
	GOTO       L_main24
	DECFSZ     R11+0, 1
	GOTO       L_main24
	NOP
	NOP
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
	GOTO       L_main21
L_main22:
	CLRF       _i+0
	CLRF       _i+1
	GOTO       L_main25
L_main20:
	MOVF       R2+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_main26
	CLRF       _i+0
	CLRF       _i+1
L_main27:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main65
	MOVLW      10
	SUBWF      _i+0, 0
L__main65:
	BTFSC      STATUS+0, 0
	GOTO       L_main28
	BCF        PORTC+0, 2
	BSF        PORTC+0, 1
	BCF        PORTB+0, 3
	BSF        PORTB+0, 2
	BCF        PORTB+0, 1
	BCF        PORTB+0, 0
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main30:
	DECFSZ     R13+0, 1
	GOTO       L_main30
	DECFSZ     R12+0, 1
	GOTO       L_main30
	DECFSZ     R11+0, 1
	GOTO       L_main30
	NOP
	NOP
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
	GOTO       L_main27
L_main28:
	CLRF       _i+0
	CLRF       _i+1
	GOTO       L_main31
L_main26:
	MOVF       R2+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_main32
	CLRF       _i+0
	CLRF       _i+1
L_main33:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main66
	MOVLW      10
	SUBWF      _i+0, 0
L__main66:
	BTFSC      STATUS+0, 0
	GOTO       L_main34
	BSF        PORTC+0, 2
	BSF        PORTC+0, 1
	BCF        PORTB+0, 3
	BSF        PORTB+0, 2
	BCF        PORTB+0, 1
	BSF        PORTB+0, 0
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main36:
	DECFSZ     R13+0, 1
	GOTO       L_main36
	DECFSZ     R12+0, 1
	GOTO       L_main36
	DECFSZ     R11+0, 1
	GOTO       L_main36
	NOP
	NOP
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
	GOTO       L_main33
L_main34:
	CLRF       _i+0
	CLRF       _i+1
	GOTO       L_main37
L_main32:
	MOVF       R2+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_main38
	CLRF       _i+0
	CLRF       _i+1
L_main39:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main67
	MOVLW      10
	SUBWF      _i+0, 0
L__main67:
	BTFSC      STATUS+0, 0
	GOTO       L_main40
	BSF        PORTC+0, 2
	BSF        PORTC+0, 1
	BCF        PORTB+0, 3
	BSF        PORTB+0, 2
	BSF        PORTB+0, 1
	BCF        PORTB+0, 0
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main42:
	DECFSZ     R13+0, 1
	GOTO       L_main42
	DECFSZ     R12+0, 1
	GOTO       L_main42
	DECFSZ     R11+0, 1
	GOTO       L_main42
	NOP
	NOP
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
	GOTO       L_main39
L_main40:
	CLRF       _i+0
	CLRF       _i+1
	GOTO       L_main43
L_main38:
	MOVF       R2+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main44
	CLRF       _i+0
	CLRF       _i+1
L_main45:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main68
	MOVLW      10
	SUBWF      _i+0, 0
L__main68:
	BTFSC      STATUS+0, 0
	GOTO       L_main46
	BSF        PORTC+0, 2
	BSF        PORTC+0, 1
	BCF        PORTB+0, 3
	BSF        PORTB+0, 2
	BSF        PORTB+0, 1
	BSF        PORTB+0, 0
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main48:
	DECFSZ     R13+0, 1
	GOTO       L_main48
	DECFSZ     R12+0, 1
	GOTO       L_main48
	DECFSZ     R11+0, 1
	GOTO       L_main48
	NOP
	NOP
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
	GOTO       L_main45
L_main46:
	CLRF       _i+0
	CLRF       _i+1
	GOTO       L_main49
L_main44:
	MOVF       R2+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main50
	CLRF       _i+0
	CLRF       _i+1
L_main51:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main69
	MOVLW      10
	SUBWF      _i+0, 0
L__main69:
	BTFSC      STATUS+0, 0
	GOTO       L_main52
	BSF        PORTC+0, 2
	BSF        PORTC+0, 1
	BSF        PORTB+0, 3
	BCF        PORTB+0, 2
	BCF        PORTB+0, 1
	BCF        PORTB+0, 0
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main54:
	DECFSZ     R13+0, 1
	GOTO       L_main54
	DECFSZ     R12+0, 1
	GOTO       L_main54
	DECFSZ     R11+0, 1
	GOTO       L_main54
	NOP
	NOP
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
	GOTO       L_main51
L_main52:
	CLRF       _i+0
	CLRF       _i+1
	GOTO       L_main55
L_main50:
	CLRF       _i+0
	CLRF       _i+1
L_main56:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main70
	MOVLW      10
	SUBWF      _i+0, 0
L__main70:
	BTFSC      STATUS+0, 0
	GOTO       L_main57
	BCF        PORTC+0, 1
	BCF        PORTC+0, 2
	BCF        PORTB+0, 1
	BCF        PORTB+0, 0
	BCF        PORTB+0, 3
	BCF        PORTB+0, 2
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main59:
	DECFSZ     R13+0, 1
	GOTO       L_main59
	DECFSZ     R12+0, 1
	GOTO       L_main59
	DECFSZ     R11+0, 1
	GOTO       L_main59
	NOP
	NOP
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
	GOTO       L_main56
L_main57:
	CLRF       _i+0
	CLRF       _i+1
L_main55:
L_main49:
L_main43:
L_main37:
L_main31:
L_main25:
L_main19:
L_main13:
L_main7:
	GOTO       L_main0
L_end_main:
	GOTO       $+0
; end of _main
