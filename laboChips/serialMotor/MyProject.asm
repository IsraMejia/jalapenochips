
_recibe_byte:

L_recibe_byte0:
	BTFSC      PIR1+0, 5
	GOTO       L_recibe_byte1
	GOTO       L_recibe_byte0
L_recibe_byte1:
	MOVF       RCREG+0, 0
	MOVWF      R0+0
L_end_recibe_byte:
	RETURN
; end of _recibe_byte

_main:

	CLRF       main_vueltas_L0+0
	CLRF       main_vueltas_L0+1
	MOVLW      192
	MOVWF      main_valores_L0+0
	MOVLW      96
	MOVWF      main_valores_L0+1
	MOVLW      48
	MOVWF      main_valores_L0+2
	MOVLW      144
	MOVWF      main_valores_L0+3
	CLRF       TRISB+0
	MOVLW      129
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	BCF        TXSTA+0, 4
	BSF        RCSTA+0, 7
	BSF        TXSTA+0, 5
	BSF        RCSTA+0, 4
L_main2:
	CALL       _recibe_byte+0
	MOVF       R0+0, 0
	MOVWF      main_dato_L0+0
	MOVF       R0+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L_main4
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main5:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main36
	MOVLW      4
	SUBWF      main_i_L0+0, 0
L__main36:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
	MOVF       main_i_L0+0, 0
	ADDLW      main_valores_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	NOP
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
	GOTO       L_main5
L_main6:
	GOTO       L_main9
L_main4:
	MOVF       main_dato_L0+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L_main10
	MOVLW      3
	MOVWF      main_i_L0+0
	MOVLW      0
	MOVWF      main_i_L0+1
L_main11:
	MOVLW      127
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main37
	MOVF       main_i_L0+0, 0
	SUBLW      255
L__main37:
	BTFSC      STATUS+0, 0
	GOTO       L_main12
	MOVF       main_i_L0+0, 0
	ADDLW      main_valores_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	NOP
	MOVLW      1
	SUBWF      main_i_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_i_L0+1, 1
	GOTO       L_main11
L_main12:
	GOTO       L_main15
L_main10:
	MOVF       main_dato_L0+0, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L_main16
	CALL       _recibe_byte+0
	MOVF       R0+0, 0
	MOVWF      main_dir_L0+0
	CALL       _recibe_byte+0
	MOVLW      48
	SUBWF      R0+0, 0
	MOVWF      main_vueltas_L0+0
	CLRF       main_vueltas_L0+1
	BTFSS      STATUS+0, 0
	DECF       main_vueltas_L0+1, 1
	MOVF       main_dir_L0+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L_main17
	CLRF       main_n_L0+0
	CLRF       main_n_L0+1
L_main18:
	MOVLW      8
	MOVWF      R0+0
	MOVLW      2
	MOVWF      R0+1
	MOVF       main_vueltas_L0+0, 0
	MOVWF      R4+0
	MOVF       main_vueltas_L0+1, 0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      128
	XORWF      main_n_L0+1, 0
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main38
	MOVF       R0+0, 0
	SUBWF      main_n_L0+0, 0
L__main38:
	BTFSC      STATUS+0, 0
	GOTO       L_main19
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main21:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main39
	MOVLW      4
	SUBWF      main_i_L0+0, 0
L__main39:
	BTFSC      STATUS+0, 0
	GOTO       L_main22
	MOVF       main_i_L0+0, 0
	ADDLW      main_valores_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_main24:
	DECFSZ     R13+0, 1
	GOTO       L_main24
	DECFSZ     R12+0, 1
	GOTO       L_main24
	NOP
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
	GOTO       L_main21
L_main22:
	INCF       main_n_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_n_L0+1, 1
	GOTO       L_main18
L_main19:
	GOTO       L_main25
L_main17:
	MOVF       main_dir_L0+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L_main26
	CLRF       main_n_L0+0
	CLRF       main_n_L0+1
L_main27:
	MOVLW      8
	MOVWF      R0+0
	MOVLW      2
	MOVWF      R0+1
	MOVF       main_vueltas_L0+0, 0
	MOVWF      R4+0
	MOVF       main_vueltas_L0+1, 0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      128
	XORWF      main_n_L0+1, 0
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main40
	MOVF       R0+0, 0
	SUBWF      main_n_L0+0, 0
L__main40:
	BTFSC      STATUS+0, 0
	GOTO       L_main28
	MOVLW      3
	MOVWF      main_i_L0+0
	MOVLW      0
	MOVWF      main_i_L0+1
L_main30:
	MOVLW      127
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main41
	MOVF       main_i_L0+0, 0
	SUBLW      255
L__main41:
	BTFSC      STATUS+0, 0
	GOTO       L_main31
	MOVF       main_i_L0+0, 0
	ADDLW      main_valores_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_main33:
	DECFSZ     R13+0, 1
	GOTO       L_main33
	DECFSZ     R12+0, 1
	GOTO       L_main33
	NOP
	MOVLW      1
	SUBWF      main_i_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_i_L0+1, 1
	GOTO       L_main30
L_main31:
	INCF       main_n_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_n_L0+1, 1
	GOTO       L_main27
L_main28:
L_main26:
L_main25:
L_main16:
L_main15:
L_main9:
	GOTO       L_main2
L_end_main:
	GOTO       $+0
; end of _main
