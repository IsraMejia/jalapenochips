
_delay_ms:

;MyProject.c,3 :: 		void delay_ms(unsigned int milliseconds) {
;MyProject.c,5 :: 		while (milliseconds > 0) {
L_delay_ms0:
	MOVF       FARG_delay_ms_milliseconds+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__delay_ms37
	MOVF       FARG_delay_ms_milliseconds+0, 0
	SUBLW      0
L__delay_ms37:
	BTFSC      STATUS+0, 0
	GOTO       L_delay_ms1
;MyProject.c,6 :: 		count = 500;
	MOVLW      244
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R1+1
;MyProject.c,7 :: 		while (count > 0) {
L_delay_ms2:
	MOVF       R1+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__delay_ms38
	MOVF       R1+0, 0
	SUBLW      0
L__delay_ms38:
	BTFSC      STATUS+0, 0
	GOTO       L_delay_ms3
;MyProject.c,8 :: 		count--;
	MOVLW      1
	SUBWF      R1+0, 1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
;MyProject.c,9 :: 		}
	GOTO       L_delay_ms2
L_delay_ms3:
;MyProject.c,10 :: 		milliseconds--;
	MOVLW      1
	SUBWF      FARG_delay_ms_milliseconds+0, 1
	BTFSS      STATUS+0, 0
	DECF       FARG_delay_ms_milliseconds+1, 1
;MyProject.c,11 :: 		}
	GOTO       L_delay_ms0
L_delay_ms1:
;MyProject.c,12 :: 		}
L_end_delay_ms:
	RETURN
; end of _delay_ms

_main:

;MyProject.c,16 :: 		void main() {
;MyProject.c,17 :: 		TRISB = 0;      // Configuramos el puerto B como salida
	CLRF       TRISB+0
;MyProject.c,18 :: 		TRISA = 0x3F;   // Cinco unos para configurar el puerto A
	MOVLW      63
	MOVWF      TRISA+0
;MyProject.c,19 :: 		ADCON1 = 6;     // Configura entradas digitales en el puerto A y E
	MOVLW      6
	MOVWF      ADCON1+0
;MyProject.c,20 :: 		PORTB = 0;      // Inicialmente apagado
	CLRF       PORTB+0
;MyProject.c,22 :: 		while (1) {
L_main4:
;MyProject.c,23 :: 		if (PORTA == 0x00) {
	MOVF       PORTA+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;MyProject.c,25 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;MyProject.c,26 :: 		} else if (PORTA == 0x01) {
	GOTO       L_main7
L_main6:
	MOVF       PORTA+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;MyProject.c,28 :: 		PORTB = 0xFF;
	MOVLW      255
	MOVWF      PORTB+0
;MyProject.c,29 :: 		} else if (PORTA == 0x02) {
	GOTO       L_main9
L_main8:
	MOVF       PORTA+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main10
;MyProject.c,31 :: 		PORTB = 0x80; // Estado inicial del corrimiento 10000000
	MOVLW      128
	MOVWF      PORTB+0
;MyProject.c,32 :: 		i = 0; // Inicializamos i a 0
	CLRF       _i+0
	CLRF       _i+1
;MyProject.c,33 :: 		for (i = 0; i < 7; i++) {
	CLRF       _i+0
	CLRF       _i+1
L_main11:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main40
	MOVLW      7
	SUBWF      _i+0, 0
L__main40:
	BTFSC      STATUS+0, 0
	GOTO       L_main12
;MyProject.c,34 :: 		PORTB = (PORTB >> 1) | ((PORTB & 0x01) << 7);
	MOVF       PORTB+0, 0
	MOVWF      R3+0
	RRF        R3+0, 1
	BCF        R3+0, 7
	MOVLW      1
	ANDWF      PORTB+0, 0
	MOVWF      R2+0
	MOVLW      7
	MOVWF      R1+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main41:
	BTFSC      STATUS+0, 2
	GOTO       L__main42
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main41
L__main42:
	MOVF       R0+0, 0
	IORWF      R3+0, 0
	MOVWF      PORTB+0
;MyProject.c,35 :: 		delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
	NOP
;MyProject.c,33 :: 		for (i = 0; i < 7; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MyProject.c,36 :: 		} // Fin del corrimiento 00000001
	GOTO       L_main11
L_main12:
;MyProject.c,37 :: 		i = 0; // Restablecemos i a 0
	CLRF       _i+0
	CLRF       _i+1
;MyProject.c,38 :: 		} else if (PORTA == 0x03) {
	GOTO       L_main15
L_main10:
	MOVF       PORTA+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_main16
;MyProject.c,40 :: 		PORTB = 0x01; // Estado inicial del corrimiento 00000001
	MOVLW      1
	MOVWF      PORTB+0
;MyProject.c,41 :: 		i = 0; // Inicializamos i a 0
	CLRF       _i+0
	CLRF       _i+1
;MyProject.c,42 :: 		for (i = 0; i < 7; i++) {
	CLRF       _i+0
	CLRF       _i+1
L_main17:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main43
	MOVLW      7
	SUBWF      _i+0, 0
L__main43:
	BTFSC      STATUS+0, 0
	GOTO       L_main18
;MyProject.c,43 :: 		PORTB = (PORTB << 1) | ((PORTB & 0x80) >> 7);
	MOVF       PORTB+0, 0
	MOVWF      R3+0
	RLF        R3+0, 1
	BCF        R3+0, 0
	MOVLW      128
	ANDWF      PORTB+0, 0
	MOVWF      R2+0
	MOVLW      7
	MOVWF      R1+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main44:
	BTFSC      STATUS+0, 2
	GOTO       L__main45
	RRF        R0+0, 1
	BCF        R0+0, 7
	ADDLW      255
	GOTO       L__main44
L__main45:
	MOVF       R0+0, 0
	IORWF      R3+0, 0
	MOVWF      PORTB+0
;MyProject.c,44 :: 		delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	DECFSZ     R11+0, 1
	GOTO       L_main20
	NOP
;MyProject.c,42 :: 		for (i = 0; i < 7; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MyProject.c,45 :: 		} // Fin del corrimiento 10000000
	GOTO       L_main17
L_main18:
;MyProject.c,46 :: 		i = 0; // Restablecemos i a 0
	CLRF       _i+0
	CLRF       _i+1
;MyProject.c,47 :: 		} else if (PORTA == 0x04) {
	GOTO       L_main21
L_main16:
	MOVF       PORTA+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_main22
;MyProject.c,51 :: 		PORTB = 0x80; // Estado inicial del corrimiento 10000000
	MOVLW      128
	MOVWF      PORTB+0
;MyProject.c,52 :: 		i = 0; // Inicializamos i a 0
	CLRF       _i+0
	CLRF       _i+1
;MyProject.c,53 :: 		for (i = 0; i < 7; i++) {
	CLRF       _i+0
	CLRF       _i+1
L_main23:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main46
	MOVLW      7
	SUBWF      _i+0, 0
L__main46:
	BTFSC      STATUS+0, 0
	GOTO       L_main24
;MyProject.c,54 :: 		PORTB = (PORTB >> 1) | ((PORTB & 0x01) << 7);
	MOVF       PORTB+0, 0
	MOVWF      R3+0
	RRF        R3+0, 1
	BCF        R3+0, 7
	MOVLW      1
	ANDWF      PORTB+0, 0
	MOVWF      R2+0
	MOVLW      7
	MOVWF      R1+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main47:
	BTFSC      STATUS+0, 2
	GOTO       L__main48
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main47
L__main48:
	MOVF       R0+0, 0
	IORWF      R3+0, 0
	MOVWF      PORTB+0
;MyProject.c,55 :: 		delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_main26:
	DECFSZ     R13+0, 1
	GOTO       L_main26
	DECFSZ     R12+0, 1
	GOTO       L_main26
	DECFSZ     R11+0, 1
	GOTO       L_main26
	NOP
;MyProject.c,53 :: 		for (i = 0; i < 7; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MyProject.c,56 :: 		} // Fin del corrimiento 00000001
	GOTO       L_main23
L_main24:
;MyProject.c,59 :: 		PORTB = 0x01; // Estado inicial del corrimiento 00000001
	MOVLW      1
	MOVWF      PORTB+0
;MyProject.c,60 :: 		i = 0; // Inicializamos i a 0
	CLRF       _i+0
	CLRF       _i+1
;MyProject.c,61 :: 		for (i = 0; i < 7; i++) {
	CLRF       _i+0
	CLRF       _i+1
L_main27:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main49
	MOVLW      7
	SUBWF      _i+0, 0
L__main49:
	BTFSC      STATUS+0, 0
	GOTO       L_main28
;MyProject.c,62 :: 		PORTB = (PORTB << 1) | ((PORTB & 0x80) >> 7);
	MOVF       PORTB+0, 0
	MOVWF      R3+0
	RLF        R3+0, 1
	BCF        R3+0, 0
	MOVLW      128
	ANDWF      PORTB+0, 0
	MOVWF      R2+0
	MOVLW      7
	MOVWF      R1+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main50:
	BTFSC      STATUS+0, 2
	GOTO       L__main51
	RRF        R0+0, 1
	BCF        R0+0, 7
	ADDLW      255
	GOTO       L__main50
L__main51:
	MOVF       R0+0, 0
	IORWF      R3+0, 0
	MOVWF      PORTB+0
;MyProject.c,63 :: 		delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_main30:
	DECFSZ     R13+0, 1
	GOTO       L_main30
	DECFSZ     R12+0, 1
	GOTO       L_main30
	DECFSZ     R11+0, 1
	GOTO       L_main30
	NOP
;MyProject.c,61 :: 		for (i = 0; i < 7; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;MyProject.c,64 :: 		} // Fin del corrimiento 10000000
	GOTO       L_main27
L_main28:
;MyProject.c,65 :: 		i = 0; // Restablecemos i a 0
	CLRF       _i+0
	CLRF       _i+1
;MyProject.c,66 :: 		} else if (PORTA == 0x05) {
	GOTO       L_main31
L_main22:
	MOVF       PORTA+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_main32
;MyProject.c,68 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;MyProject.c,69 :: 		delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_main33:
	DECFSZ     R13+0, 1
	GOTO       L_main33
	DECFSZ     R12+0, 1
	GOTO       L_main33
	DECFSZ     R11+0, 1
	GOTO       L_main33
	NOP
;MyProject.c,70 :: 		PORTB = 0xFF;
	MOVLW      255
	MOVWF      PORTB+0
;MyProject.c,71 :: 		delay_ms(500);
	MOVLW      13
	MOVWF      R11+0
	MOVLW      175
	MOVWF      R12+0
	MOVLW      182
	MOVWF      R13+0
L_main34:
	DECFSZ     R13+0, 1
	GOTO       L_main34
	DECFSZ     R12+0, 1
	GOTO       L_main34
	DECFSZ     R11+0, 1
	GOTO       L_main34
	NOP
;MyProject.c,72 :: 		} else {
	GOTO       L_main35
L_main32:
;MyProject.c,74 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;MyProject.c,75 :: 		}
L_main35:
L_main31:
L_main21:
L_main15:
L_main9:
L_main7:
;MyProject.c,76 :: 		}
	GOTO       L_main4
;MyProject.c,77 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
