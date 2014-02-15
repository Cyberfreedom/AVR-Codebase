
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

;7Sement-multiplexing-simple.c,24 :: 		void main() {
;7Sement-multiplexing-simple.c,28 :: 		DDRC  = 0xff;          // remember to set pins as output
	LDI        R27, 255
	OUT        DDRC+0, R27
;7Sement-multiplexing-simple.c,29 :: 		PORTC = 0x00;          //default all pins output low (0V)
	LDI        R27, 0
	OUT        PORTC+0, R27
;7Sement-multiplexing-simple.c,31 :: 		DDRD = 0x0f;           // switching each display ON or OFF
	LDI        R27, 15
	OUT        DDRD+0, R27
;7Sement-multiplexing-simple.c,32 :: 		PORTD = 0x00;          // all display are OFF
	LDI        R27, 0
	OUT        PORTD+0, R27
;7Sement-multiplexing-simple.c,35 :: 		while (1) {                           // main loop
L_main0:
;7Sement-multiplexing-simple.c,36 :: 		for (i=0; i<4; i++) {           // looping 10 times
	LDI        R27, 0
	STD        Y+0, R27
L_main2:
	LDD        R16, Y+0
	CPI        R16, 4
	BRLO       L__main8
	JMP        L_main3
L__main8:
;7Sement-multiplexing-simple.c,37 :: 		PORTC = digit[i];           // setting digit's value to PORTD
	LDI        R17, #lo_addr(main_digit_L0+0)
	LDI        R18, hi_addr(main_digit_L0+0)
	LDD        R16, Y+0
	MOV        R30, R16
	LDI        R31, 0
	ADD        R30, R17
	ADC        R31, R18
	LPM        R16, Z
	OUT        PORTC+0, R16
;7Sement-multiplexing-simple.c,38 :: 		PORTD = (1 << i);           // switch the transistor Q1, Q2, Q3, Q4 serially
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
;7Sement-multiplexing-simple.c,39 :: 		Delay_ms(20);               // Half second delay
	LDI        R17, 208
	LDI        R16, 202
L_main5:
	DEC        R16
	BRNE       L_main5
	DEC        R17
	BRNE       L_main5
	NOP
;7Sement-multiplexing-simple.c,36 :: 		for (i=0; i<4; i++) {           // looping 10 times
	LDD        R16, Y+0
	SUBI       R16, 255
	STD        Y+0, R16
;7Sement-multiplexing-simple.c,40 :: 		}
	JMP        L_main2
L_main3:
;7Sement-multiplexing-simple.c,41 :: 		}
	JMP        L_main0
;7Sement-multiplexing-simple.c,42 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
