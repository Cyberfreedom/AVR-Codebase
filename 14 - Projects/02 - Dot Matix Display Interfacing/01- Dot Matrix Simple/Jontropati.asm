
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 10
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;Jontropati.c,1 :: 		void main() {
;Jontropati.c,11 :: 		};
	LDI        R30, #lo_addr(?ICSmain_A_L0+0)
	LDI        R31, hi_addr(?ICSmain_A_L0+0)
	MOVW       R26, R28
	ADIW       R26, 2
	LDI        R24, 8
	LDI        R25, 0
	CALL       ___CC2DW+0
;Jontropati.c,14 :: 		DDRC = DDRD = 0xff;
	LDI        R27, 255
	OUT        DDRD+0, R27
	LDI        R27, 255
	OUT        DDRC+0, R27
;Jontropati.c,16 :: 		while (1) {
L_main0:
;Jontropati.c,17 :: 		for (i=0; i<8; i++) {
	LDI        R27, 0
	STD        Y+0, R27
	STD        Y+1, R27
L_main2:
	LDD        R18, Y+0
	LDD        R19, Y+1
	LDI        R16, 8
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__main8
	JMP        L_main3
L__main8:
;Jontropati.c,18 :: 		PORTC = A[i];
	MOVW       R18, R28
	SUBI       R18, 254
	SBCI       R19, 255
	LDD        R16, Y+0
	LDD        R17, Y+1
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LD         R16, Z
	OUT        PORTC+0, R16
;Jontropati.c,20 :: 		PORTD = ~(1<<i);
	LDD        R27, Y+0
	LDI        R16, 1
	TST        R27
	BREQ       L__main10
L__main9:
	LSL        R16
	DEC        R27
	BRNE       L__main9
L__main10:
	COM        R16
	OUT        PORTD+0, R16
;Jontropati.c,21 :: 		Delay_ms(10);
	LDI        R17, 104
	LDI        R16, 229
L_main5:
	DEC        R16
	BRNE       L_main5
	DEC        R17
	BRNE       L_main5
;Jontropati.c,17 :: 		for (i=0; i<8; i++) {
	LDD        R16, Y+0
	LDD        R17, Y+1
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+0, R16
	STD        Y+1, R17
;Jontropati.c,22 :: 		}
	JMP        L_main2
L_main3:
;Jontropati.c,23 :: 		}
	JMP        L_main0
;Jontropati.c,24 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
