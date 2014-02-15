
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;BUTTON.c,8 :: 		void main() {
;BUTTON.c,13 :: 		DDRB = 0x00;   // all are input
	LDI        R27, 0
	OUT        DDRB+0, R27
;BUTTON.c,14 :: 		PORTB = 0xff;  // Set the internal pull-up
	LDI        R27, 255
	OUT        PORTB+0, R27
;BUTTON.c,17 :: 		DDRA = 0xff;   // all PORTA are output
	LDI        R27, 255
	OUT        DDRA+0, R27
;BUTTON.c,18 :: 		PORTA = 0x00;  // initially arrl output as LOW
	LDI        R27, 0
	OUT        PORTA+0, R27
;BUTTON.c,20 :: 		while (1) {
L_main0:
;BUTTON.c,21 :: 		if (PINB0_bit == 0){
	IN         R27, PINB0_bit+0
	SBRC       R27, 0
	JMP        L_main2
;BUTTON.c,22 :: 		Delay_ms(45);                    // Debouncing Delay
	LDI        R18, 2
	LDI        R17, 212
	LDI        R16, 134
L_main3:
	DEC        R16
	BRNE       L_main3
	DEC        R17
	BRNE       L_main3
	DEC        R18
	BRNE       L_main3
;BUTTON.c,25 :: 		PORTA = ~PORTA;                 // Toggle PORTA
	IN         R16, PORTA+0
	COM        R16
	OUT        PORTA+0, R16
;BUTTON.c,28 :: 		while (PINB0_bit==0);            // safety while
L_main5:
	IN         R27, PINB0_bit+0
	SBRC       R27, 0
	JMP        L_main6
	JMP        L_main5
L_main6:
;BUTTON.c,29 :: 		}
L_main2:
;BUTTON.c,30 :: 		}
	JMP        L_main0
;BUTTON.c,31 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
