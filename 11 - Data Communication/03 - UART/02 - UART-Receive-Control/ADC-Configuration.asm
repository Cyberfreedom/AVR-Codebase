
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 10
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;ADC-Configuration.c,10 :: 		void main() {
;ADC-Configuration.c,13 :: 		DDRC |= (1<<DDC0);
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	IN         R16, DDRC+0
	ORI        R16, 1
	OUT        DDRC+0, R16
;ADC-Configuration.c,14 :: 		PORTC &= ~(1<<PORTC0);
	IN         R27, PORTC+0
	CBR        R27, 1
	OUT        PORTC+0, R27
;ADC-Configuration.c,16 :: 		UART1_Init(9600);
	LDI        R27, 51
	OUT        UBRRL+0, R27
	LDI        R27, 0
	OUT        UBRRH+0, R27
	CALL       _UART1_Init+0
;ADC-Configuration.c,18 :: 		UART1_Write_Text("Usages:\r\n");
	LDI        R27, #lo_addr(?lstr1_ADC_45Configuration+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr1_ADC_45Configuration+0)
	MOV        R3, R27
	CALL       _UART1_Write_Text+0
;ADC-Configuration.c,19 :: 		UART1_Write_Text("LED on : ONXX\r\n");
	LDI        R27, #lo_addr(?lstr2_ADC_45Configuration+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr2_ADC_45Configuration+0)
	MOV        R3, R27
	CALL       _UART1_Write_Text+0
;ADC-Configuration.c,20 :: 		UART1_Write_Text("LED off: OFFXX\r\n");
	LDI        R27, #lo_addr(?lstr3_ADC_45Configuration+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr3_ADC_45Configuration+0)
	MOV        R3, R27
	CALL       _UART1_Write_Text+0
;ADC-Configuration.c,21 :: 		UART1_Write_Text("Enter your command below\r\n");
	LDI        R27, #lo_addr(?lstr4_ADC_45Configuration+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr4_ADC_45Configuration+0)
	MOV        R3, R27
	CALL       _UART1_Write_Text+0
;ADC-Configuration.c,24 :: 		while (1) {
L_main0:
;ADC-Configuration.c,25 :: 		if (UART1_Data_Ready()) {
	CALL       _UART1_Data_Ready+0
	TST        R16
	BRNE       L__main8
	JMP        L_main2
L__main8:
;ADC-Configuration.c,26 :: 		UART1_Read_Text(buffer, "XX", 6);
	MOVW       R16, R28
	LDI        R27, 6
	MOV        R6, R27
	LDI        R27, #lo_addr(?lstr5_ADC_45Configuration+0)
	MOV        R4, R27
	LDI        R27, hi_addr(?lstr5_ADC_45Configuration+0)
	MOV        R5, R27
	MOVW       R2, R16
	CALL       _UART1_Read_Text+0
;ADC-Configuration.c,28 :: 		if (strcmp(buffer, "ON") == 0) {
	MOVW       R16, R28
	LDI        R27, #lo_addr(?lstr6_ADC_45Configuration+0)
	MOV        R4, R27
	LDI        R27, hi_addr(?lstr6_ADC_45Configuration+0)
	MOV        R5, R27
	MOVW       R2, R16
	CALL       _strcmp+0
	CPI        R17, 0
	BRNE       L__main9
	CPI        R16, 0
L__main9:
	BREQ       L__main10
	JMP        L_main3
L__main10:
;ADC-Configuration.c,29 :: 		LED_BIT = 1;
	IN         R27, PORTC0_bit+0
	SBR        R27, 1
	OUT        PORTC0_bit+0, R27
;ADC-Configuration.c,30 :: 		UART1_Write_Text("LED ON\r\n");
	LDI        R27, #lo_addr(?lstr7_ADC_45Configuration+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr7_ADC_45Configuration+0)
	MOV        R3, R27
	CALL       _UART1_Write_Text+0
;ADC-Configuration.c,31 :: 		} else if (strcmp(buffer, "OFF") == 0){
	JMP        L_main4
L_main3:
	MOVW       R16, R28
	LDI        R27, #lo_addr(?lstr8_ADC_45Configuration+0)
	MOV        R4, R27
	LDI        R27, hi_addr(?lstr8_ADC_45Configuration+0)
	MOV        R5, R27
	MOVW       R2, R16
	CALL       _strcmp+0
	CPI        R17, 0
	BRNE       L__main11
	CPI        R16, 0
L__main11:
	BREQ       L__main12
	JMP        L_main5
L__main12:
;ADC-Configuration.c,32 :: 		LED_BIT = 0;
	IN         R27, PORTC0_bit+0
	CBR        R27, 1
	OUT        PORTC0_bit+0, R27
;ADC-Configuration.c,33 :: 		UART1_Write_Text("LED OFF\r\n");
	LDI        R27, #lo_addr(?lstr9_ADC_45Configuration+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr9_ADC_45Configuration+0)
	MOV        R3, R27
	CALL       _UART1_Write_Text+0
;ADC-Configuration.c,34 :: 		} else {
	JMP        L_main6
L_main5:
;ADC-Configuration.c,35 :: 		UART1_Write_Text("Wrong code\r\n");
	LDI        R27, #lo_addr(?lstr10_ADC_45Configuration+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr10_ADC_45Configuration+0)
	MOV        R3, R27
	CALL       _UART1_Write_Text+0
;ADC-Configuration.c,36 :: 		}
L_main6:
L_main4:
;ADC-Configuration.c,37 :: 		}
L_main2:
;ADC-Configuration.c,38 :: 		}
	JMP        L_main0
;ADC-Configuration.c,39 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
