
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;LED_BLINKING.c,8 :: 		void main() {
;LED_BLINKING.c,14 :: 		DDRB = 0xff;  /* 0xff means 0b11111111 */
	LDI        R27, 255
	OUT        DDRB+0, R27
;LED_BLINKING.c,19 :: 		PORTB = 0x00;
	LDI        R27, 0
	OUT        PORTB+0, R27
;LED_BLINKING.c,21 :: 		while (1) {                // The while engine
L_main0:
;LED_BLINKING.c,23 :: 		PORTB = 0xff;       // all o/p HIGH
	LDI        R27, 255
	OUT        PORTB+0, R27
;LED_BLINKING.c,24 :: 		Delay_ms(500);      // wait for 500 mili sec.
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
;LED_BLINKING.c,26 :: 		PORTB = 0x00;
	LDI        R27, 0
	OUT        PORTB+0, R27
;LED_BLINKING.c,27 :: 		Delay_ms(500);      // all o/p LOW
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L_main4:
	DEC        R16
	BRNE       L_main4
	DEC        R17
	BRNE       L_main4
	DEC        R18
	BRNE       L_main4
	NOP
;LED_BLINKING.c,28 :: 		Delay_ms(500);      // wait for 500 mili sec
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L_main6:
	DEC        R16
	BRNE       L_main6
	DEC        R17
	BRNE       L_main6
	DEC        R18
	BRNE       L_main6
	NOP
;LED_BLINKING.c,29 :: 		}
	JMP        L_main0
;LED_BLINKING.c,30 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
