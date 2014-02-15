
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Jontropati.c,11 :: 		void    main() {
;Jontropati.c,14 :: 		DDC0_bit = 1;
	IN         R27, DDC0_bit+0
	SBR        R27, 1
	OUT        DDC0_bit+0, R27
;Jontropati.c,15 :: 		DDRB = 0xff;
	LDI        R27, 255
	OUT        DDRB+0, R27
;Jontropati.c,19 :: 		TCCR1B |= (1<<CS02) | (1<<CS00);
	IN         R16, TCCR1B+0
	ORI        R16, 5
	OUT        TCCR1B+0, R16
;Jontropati.c,21 :: 		while(1)
L_main0:
;Jontropati.c,23 :: 		PORTB = TCNT1H;
	IN         R16, TCNT1H+0
	OUT        PORTB+0, R16
;Jontropati.c,24 :: 		continue;
	JMP        L_main0
;Jontropati.c,32 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
