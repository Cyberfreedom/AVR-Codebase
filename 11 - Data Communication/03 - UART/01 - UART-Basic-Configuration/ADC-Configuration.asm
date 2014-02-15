
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;ADC-Configuration.c,8 :: 		void main() {
;ADC-Configuration.c,10 :: 		UART1_Init(9600);
	PUSH       R2
	PUSH       R3
	LDI        R27, 51
	OUT        UBRRL+0, R27
	LDI        R27, 0
	OUT        UBRRH+0, R27
	CALL       _UART1_Init+0
;ADC-Configuration.c,12 :: 		while (1) {
L_main0:
;ADC-Configuration.c,13 :: 		UART1_Write_Text("Jontropati.com\r\n");
	LDI        R27, #lo_addr(?lstr1_ADC_45Configuration+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr1_ADC_45Configuration+0)
	MOV        R3, R27
	CALL       _UART1_Write_Text+0
;ADC-Configuration.c,14 :: 		Delay_ms(1000);
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L_main2:
	DEC        R16
	BRNE       L_main2
	DEC        R17
	BRNE       L_main2
	DEC        R18
	BRNE       L_main2
;ADC-Configuration.c,15 :: 		}
	JMP        L_main0
;ADC-Configuration.c,16 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
