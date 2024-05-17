
_main:

;motorespro.c,1 :: 		void main() {
;motorespro.c,3 :: 		TRISA = 0x3F;
	MOVLW      63
	MOVWF      TRISA+0
;motorespro.c,4 :: 		ADCON1 = 0x06;
	MOVLW      6
	MOVWF      ADCON1+0
;motorespro.c,7 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;motorespro.c,8 :: 		TRISC.F1 = 0;
	BCF        TRISC+0, 1
;motorespro.c,9 :: 		TRISC.F2 = 0;
	BCF        TRISC+0, 2
;motorespro.c,11 :: 		while (1) {
L_main0:
;motorespro.c,13 :: 		unsigned char porta_value = PORTA & 0x3F; // Solo los primeros 6 bits son relevantes
	MOVLW      63
	ANDWF      PORTA+0, 0
	MOVWF      R1+0
;motorespro.c,16 :: 		switch (porta_value) {
	GOTO       L_main2
;motorespro.c,17 :: 		case 0x00:
L_main4:
;motorespro.c,19 :: 		PORTC.F1 = 0; // Disable Motor 1
	BCF        PORTC+0, 1
;motorespro.c,20 :: 		PORTB.F1 = 0;
	BCF        PORTB+0, 1
;motorespro.c,21 :: 		PORTB.F0 = 0;
	BCF        PORTB+0, 0
;motorespro.c,23 :: 		PORTC.F2 = 0; // Disable Motor 2
	BCF        PORTC+0, 2
;motorespro.c,24 :: 		PORTB.F3 = 0;
	BCF        PORTB+0, 3
;motorespro.c,25 :: 		PORTB.F2 = 0;
	BCF        PORTB+0, 2
;motorespro.c,26 :: 		break;
	GOTO       L_main3
;motorespro.c,28 :: 		case 0x01:
L_main5:
;motorespro.c,30 :: 		PORTC.F1 = 0; // Disable Motor 1
	BCF        PORTC+0, 1
;motorespro.c,31 :: 		PORTB.F1 = 0;
	BCF        PORTB+0, 1
;motorespro.c,32 :: 		PORTB.F0 = 0;
	BCF        PORTB+0, 0
;motorespro.c,34 :: 		PORTC.F2 = 1; // Enable Motor 2
	BSF        PORTC+0, 2
;motorespro.c,35 :: 		PORTB.F3 = 0; // DIR1 M2
	BCF        PORTB+0, 3
;motorespro.c,36 :: 		PORTB.F2 = 1; // DIR2 M2
	BSF        PORTB+0, 2
;motorespro.c,37 :: 		break;
	GOTO       L_main3
;motorespro.c,39 :: 		case 0x02:
L_main6:
;motorespro.c,41 :: 		PORTC.F1 = 1; // Enable Motor 1
	BSF        PORTC+0, 1
;motorespro.c,42 :: 		PORTB.F1 = 0; // DIR1 M1
	BCF        PORTB+0, 1
;motorespro.c,43 :: 		PORTB.F0 = 1; // DIR2 M1
	BSF        PORTB+0, 0
;motorespro.c,45 :: 		PORTC.F2 = 0; // Disable Motor 2
	BCF        PORTC+0, 2
;motorespro.c,46 :: 		PORTB.F3 = 0;
	BCF        PORTB+0, 3
;motorespro.c,47 :: 		PORTB.F2 = 0;
	BCF        PORTB+0, 2
;motorespro.c,48 :: 		break;
	GOTO       L_main3
;motorespro.c,50 :: 		case 0x03:
L_main7:
;motorespro.c,52 :: 		PORTC.F1 = 1; // Enable Motor 1
	BSF        PORTC+0, 1
;motorespro.c,53 :: 		PORTB.F1 = 1; // DIR1 M1
	BSF        PORTB+0, 1
;motorespro.c,54 :: 		PORTB.F0 = 0; // DIR2 M1
	BCF        PORTB+0, 0
;motorespro.c,56 :: 		PORTC.F2 = 0; // Disable Motor 2
	BCF        PORTC+0, 2
;motorespro.c,57 :: 		PORTB.F3 = 0;
	BCF        PORTB+0, 3
;motorespro.c,58 :: 		PORTB.F2 = 0;
	BCF        PORTB+0, 2
;motorespro.c,59 :: 		break;
	GOTO       L_main3
;motorespro.c,61 :: 		case 0x04:
L_main8:
;motorespro.c,63 :: 		PORTC.F1 = 0; // Disable Motor 1
	BCF        PORTC+0, 1
;motorespro.c,64 :: 		PORTB.F1 = 0;
	BCF        PORTB+0, 1
;motorespro.c,65 :: 		PORTB.F0 = 0;
	BCF        PORTB+0, 0
;motorespro.c,67 :: 		PORTC.F2 = 1; // Enable Motor 2
	BSF        PORTC+0, 2
;motorespro.c,68 :: 		PORTB.F3 = 0; // DIR1 M2
	BCF        PORTB+0, 3
;motorespro.c,69 :: 		PORTB.F2 = 1; // DIR2 M2
	BSF        PORTB+0, 2
;motorespro.c,70 :: 		break;
	GOTO       L_main3
;motorespro.c,72 :: 		case 0x05:
L_main9:
;motorespro.c,74 :: 		PORTC.F1 = 1; // Enable Motor 1
	BSF        PORTC+0, 1
;motorespro.c,75 :: 		PORTB.F1 = 0; // DIR1 M1
	BCF        PORTB+0, 1
;motorespro.c,76 :: 		PORTB.F0 = 1; // DIR2 M1
	BSF        PORTB+0, 0
;motorespro.c,78 :: 		PORTC.F2 = 1; // Enable Motor 2
	BSF        PORTC+0, 2
;motorespro.c,79 :: 		PORTB.F3 = 0; // DIR1 M2
	BCF        PORTB+0, 3
;motorespro.c,80 :: 		PORTB.F2 = 1; // DIR2 M2
	BSF        PORTB+0, 2
;motorespro.c,81 :: 		break;
	GOTO       L_main3
;motorespro.c,83 :: 		case 0x06:
L_main10:
;motorespro.c,85 :: 		PORTC.F1 = 1; // Enable Motor 1
	BSF        PORTC+0, 1
;motorespro.c,86 :: 		PORTB.F1 = 1; // DIR1 M1
	BSF        PORTB+0, 1
;motorespro.c,87 :: 		PORTB.F0 = 0; // DIR2 M1
	BCF        PORTB+0, 0
;motorespro.c,89 :: 		PORTC.F2 = 1; // Enable Motor 2
	BSF        PORTC+0, 2
;motorespro.c,90 :: 		PORTB.F3 = 1; // DIR1 M2
	BSF        PORTB+0, 3
;motorespro.c,91 :: 		PORTB.F2 = 0; // DIR2 M2
	BCF        PORTB+0, 2
;motorespro.c,92 :: 		break;
	GOTO       L_main3
;motorespro.c,94 :: 		case 0x07:
L_main11:
;motorespro.c,96 :: 		PORTC.F1 = 1; // Enable Motor 1
	BSF        PORTC+0, 1
;motorespro.c,97 :: 		PORTB.F1 = 0; // DIR1 M1
	BCF        PORTB+0, 1
;motorespro.c,98 :: 		PORTB.F0 = 1; // DIR2 M1
	BSF        PORTB+0, 0
;motorespro.c,100 :: 		PORTC.F2 = 0; // Disable Motor 2
	BCF        PORTC+0, 2
;motorespro.c,101 :: 		PORTB.F3 = 0;
	BCF        PORTB+0, 3
;motorespro.c,102 :: 		PORTB.F2 = 0;
	BCF        PORTB+0, 2
;motorespro.c,103 :: 		break;
	GOTO       L_main3
;motorespro.c,105 :: 		case 0x08:
L_main12:
;motorespro.c,107 :: 		PORTC.F1 = 0; // Disable Motor 1
	BCF        PORTC+0, 1
;motorespro.c,108 :: 		PORTB.F1 = 0;
	BCF        PORTB+0, 1
;motorespro.c,109 :: 		PORTB.F0 = 0;
	BCF        PORTB+0, 0
;motorespro.c,111 :: 		PORTC.F2 = 1; // Enable Motor 2
	BSF        PORTC+0, 2
;motorespro.c,112 :: 		PORTB.F3 = 1; // DIR1 M2
	BSF        PORTB+0, 3
;motorespro.c,113 :: 		PORTB.F2 = 0; // DIR2 M2
	BCF        PORTB+0, 2
;motorespro.c,114 :: 		break;
	GOTO       L_main3
;motorespro.c,116 :: 		default:
L_main13:
;motorespro.c,118 :: 		PORTC.F1 = 0; // Disable Motor 1
	BCF        PORTC+0, 1
;motorespro.c,119 :: 		PORTB.F1 = 0;
	BCF        PORTB+0, 1
;motorespro.c,120 :: 		PORTB.F0 = 0;
	BCF        PORTB+0, 0
;motorespro.c,122 :: 		PORTC.F2 = 0; // Disable Motor 2
	BCF        PORTC+0, 2
;motorespro.c,123 :: 		PORTB.F3 = 0;
	BCF        PORTB+0, 3
;motorespro.c,124 :: 		PORTB.F2 = 0;
	BCF        PORTB+0, 2
;motorespro.c,125 :: 		break;
	GOTO       L_main3
;motorespro.c,126 :: 		}
L_main2:
	MOVF       R1+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
	MOVF       R1+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main5
	MOVF       R1+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main6
	MOVF       R1+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main7
	MOVF       R1+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_main8
	MOVF       R1+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main9
	MOVF       R1+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main10
	MOVF       R1+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_main11
	MOVF       R1+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_main12
	GOTO       L_main13
L_main3:
;motorespro.c,127 :: 		}
	GOTO       L_main0
;motorespro.c,128 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
