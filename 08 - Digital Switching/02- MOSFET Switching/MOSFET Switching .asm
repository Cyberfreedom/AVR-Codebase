
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;MOSFET Switching .c,8 :: 		void main() {
;MOSFET Switching .c,9 :: 		DDA0_bit = 1;      // set Data Direction for A0 as output
	IN         R27, DDA0_bit+0
	SBR        R27, 1
	OUT        DDA0_bit+0, R27
;MOSFET Switching .c,10 :: 		PORTA0_bit = 0;    // Initially output as LOW
	IN         R27, PORTA0_bit+0
	CBR        R27, 1
	OUT        PORTA0_bit+0, R27
;MOSFET Switching .c,12 :: 		while (1) {
L_main0:
;MOSFET Switching .c,13 :: 		PORTA0_bit = !PORTA0_bit;
	IN         R0, PORTA0_bit+0
	LDI        R27, 1
	EOR        R0, R27
	OUT        PORTA0_bit+0, R0
;MOSFET Switching .c,14 :: 		Delay_ms(500);
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
;MOSFET Switching .c,15 :: 		}
	JMP        L_main0
;MOSFET Switching .c,16 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
