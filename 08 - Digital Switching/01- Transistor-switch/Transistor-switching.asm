
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Transistor-switching.c,8 :: 		void main() {
;Transistor-switching.c,9 :: 		DDB1_bit = 1;      // set Data Direction for B1 as output
	IN         R27, DDB1_bit+0
	SBR        R27, 2
	OUT        DDB1_bit+0, R27
;Transistor-switching.c,10 :: 		PORTB1_bit = 0;    // Initially output as LOW
	IN         R27, PORTB1_bit+0
	CBR        R27, 2
	OUT        PORTB1_bit+0, R27
;Transistor-switching.c,12 :: 		while (1) {
L_main0:
;Transistor-switching.c,13 :: 		PORTB1_bit = !PORTB1_bit;
	IN         R0, PORTB1_bit+0
	LDI        R27, 2
	EOR        R0, R27
	OUT        PORTB1_bit+0, R0
;Transistor-switching.c,14 :: 		Delay_ms(500);
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L_main2:
	DEC        R16
	BRNE       L_main2
	DEC        R17
	BRNE       L_main2
	DEC        R18
	BRNE       L_main2
	NOP
;Transistor-switching.c,15 :: 		}
	JMP        L_main0
;Transistor-switching.c,16 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
