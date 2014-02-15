
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Button Interrupt.c,10 :: 		void main() {
;Button Interrupt.c,11 :: 		DDRC |= (1<<DDC0);
	IN         R16, DDRC+0
	ORI        R16, 1
	OUT        DDRC+0, R16
;Button Interrupt.c,13 :: 		PORTD2_bit = 1;                    // internal pull up enable
	IN         R27, PORTD2_bit+0
	SBR        R27, 4
	OUT        PORTD2_bit+0, R27
;Button Interrupt.c,15 :: 		MCUCR |= (1<<ISC10);               // falling edge
	IN         R27, MCUCR+0
	SBR        R27, 4
	OUT        MCUCR+0, R27
;Button Interrupt.c,17 :: 		GICR |= (1<<INT0);                 // select int
	IN         R16, GICR+0
	ORI        R16, 64
	OUT        GICR+0, R16
;Button Interrupt.c,19 :: 		SREG |= (1<<SREG_I);               // enable global int
	IN         R16, SREG+0
	ORI        R16, 128
	OUT        SREG+0, R16
;Button Interrupt.c,21 :: 		while (1) {
L_main0:
;Button Interrupt.c,23 :: 		}
	JMP        L_main0
;Button Interrupt.c,24 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main

_interrupt0:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;Button Interrupt.c,26 :: 		void interrupt0() iv IVT_ADDR_INT0
;Button Interrupt.c,28 :: 		LED_BIT = !LED_BIT;
	IN         R0, PORTC0_bit+0
	LDI        R27, 1
	EOR        R0, R27
	OUT        PORTC0_bit+0, R0
;Button Interrupt.c,30 :: 		GIFR |= (1<<INTF0);
	IN         R27, GIFR+0
	SBR        R27, 64
	OUT        GIFR+0, R27
;Button Interrupt.c,31 :: 		}
L_end_interrupt0:
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _interrupt0
