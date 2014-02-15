
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

;7Sement-multiplexing-simple.c,8 :: 		void main() {
;7Sement-multiplexing-simple.c,11 :: 		DDRC  = 0xff;          // remember to set pins as output
	LDI        R27, 255
	OUT        DDRC+0, R27
;7Sement-multiplexing-simple.c,12 :: 		PORTC = 0x00;          //default all pins output low (0V)
	LDI        R27, 0
	OUT        PORTC+0, R27
;7Sement-multiplexing-simple.c,14 :: 		DDRD = 0x0f;           // switching each display ON or OFF
	LDI        R27, 15
	OUT        DDRD+0, R27
;7Sement-multiplexing-simple.c,15 :: 		PORTD = 0x00;          // all display are OFF
	LDI        R27, 0
	OUT        PORTD+0, R27
;7Sement-multiplexing-simple.c,18 :: 		while (1) {                           // main loop
L_main0:
;7Sement-multiplexing-simple.c,19 :: 		for (i=0; i<4; i++) {           // looping 10 times
	LDI        R27, 0
	STD        Y+0, R27
L_main2:
	LDD        R16, Y+0
	CPI        R16, 4
	BRLO       L__main8
	JMP        L_main3
L__main8:
;7Sement-multiplexing-simple.c,20 :: 		PORTC = i;                  // setting digit's value to PORTD
	LDD        R16, Y+0
	OUT        PORTC+0, R16
;7Sement-multiplexing-simple.c,21 :: 		PORTD = (1 << i);           // switch the transistor Q1, Q2, Q3, Q4 serially
	LDD        R27, Y+0
	LDI        R16, 1
	TST        R27
	BREQ       L__main10
L__main9:
	LSL        R16
	DEC        R27
	BRNE       L__main9
L__main10:
	OUT        PORTD+0, R16
;7Sement-multiplexing-simple.c,22 :: 		Delay_ms(20);               // Half second delay
	LDI        R17, 208
	LDI        R16, 202
L_main5:
	DEC        R16
	BRNE       L_main5
	DEC        R17
	BRNE       L_main5
	NOP
;7Sement-multiplexing-simple.c,19 :: 		for (i=0; i<4; i++) {           // looping 10 times
	LDD        R16, Y+0
	SUBI       R16, 255
	STD        Y+0, R16
;7Sement-multiplexing-simple.c,23 :: 		}
	JMP        L_main2
L_main3:
;7Sement-multiplexing-simple.c,24 :: 		}
	JMP        L_main0
;7Sement-multiplexing-simple.c,25 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
