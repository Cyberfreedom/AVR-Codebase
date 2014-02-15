
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;ADC-Configuration.c,1 :: 		void main() {
;ADC-Configuration.c,11 :: 		ADC_Init();
	PUSH       R2
	CALL       _ADC_Init+0
;ADC-Configuration.c,13 :: 		while (1) {
L_main0:
;ADC-Configuration.c,22 :: 		adcInput = ADC_Read(0);
	CLR        R2
	CALL       _ADC_Read+0
;ADC-Configuration.c,25 :: 		}
	JMP        L_main0
;ADC-Configuration.c,26 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
