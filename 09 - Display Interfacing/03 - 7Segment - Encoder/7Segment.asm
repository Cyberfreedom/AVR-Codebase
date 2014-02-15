
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 1
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;7Segment.c,21 :: 		void main() {
;7Segment.c,25 :: 		DDRC = 0xff;
	LDI        R27, 255
	OUT        DDRC+0, R27
;7Segment.c,26 :: 		PORTC = 0x00;
	LDI        R27, 0
	OUT        PORTC+0, R27
;7Segment.c,28 :: 		while (1) {
L_main0:
;7Segment.c,29 :: 		for (i=0; i<10; i++) {
	LDI        R27, 0
	STD        Y+0, R27
L_main2:
	LDD        R16, Y+0
	CPI        R16, 10
	BRLO       L__main8
	JMP        L_main3
L__main8:
;7Segment.c,30 :: 		PORTC = i; // simply output the i
	LDD        R16, Y+0
	OUT        PORTC+0, R16
;7Segment.c,33 :: 		Delay_ms(500);
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L_main5:
	DEC        R16
	BRNE       L_main5
	DEC        R17
	BRNE       L_main5
	DEC        R18
	BRNE       L_main5
	NOP
;7Segment.c,29 :: 		for (i=0; i<10; i++) {
	LDD        R16, Y+0
	SUBI       R16, 255
	STD        Y+0, R16
;7Segment.c,34 :: 		}
	JMP        L_main2
L_main3:
;7Segment.c,35 :: 		}
	JMP        L_main0
;7Segment.c,36 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
