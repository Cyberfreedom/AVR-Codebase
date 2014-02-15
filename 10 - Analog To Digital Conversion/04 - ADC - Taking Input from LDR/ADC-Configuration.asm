
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;ADC-Configuration.c,8 :: 		void main() {
;ADC-Configuration.c,18 :: 		DDRC |= (1 << DDC0);
	PUSH       R2
	IN         R16, DDRC+0
	ORI        R16, 1
	OUT        DDRC+0, R16
;ADC-Configuration.c,19 :: 		PORTC &= ~(1 << PORTC0);
	IN         R27, PORTC+0
	CBR        R27, 1
	OUT        PORTC+0, R27
;ADC-Configuration.c,25 :: 		ADC_Init();
	CALL       _ADC_Init+0
;ADC-Configuration.c,27 :: 		while (1) {
L_main0:
;ADC-Configuration.c,36 :: 		adcInput = ADC_Read(0);
	CLR        R2
	CALL       _ADC_Read+0
;ADC-Configuration.c,40 :: 		if (adcInput < 512) {
	CPI        R17, 2
	BRNE       L__main5
	CPI        R16, 0
L__main5:
	BRLO       L__main6
	JMP        L_main2
L__main6:
;ADC-Configuration.c,41 :: 		PORTC |= (1 << PORTC0);
	IN         R16, PORTC+0
	ORI        R16, 1
	OUT        PORTC+0, R16
;ADC-Configuration.c,42 :: 		} else {
	JMP        L_main3
L_main2:
;ADC-Configuration.c,43 :: 		PORTC &= ~(1 << PORTC0);
	IN         R16, PORTC+0
	ANDI       R16, 254
	OUT        PORTC+0, R16
;ADC-Configuration.c,44 :: 		}
L_main3:
;ADC-Configuration.c,45 :: 		}
	JMP        L_main0
;ADC-Configuration.c,46 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
