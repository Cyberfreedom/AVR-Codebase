
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;ADC-Configuration.c,25 :: 		void main() {
;ADC-Configuration.c,31 :: 		Lcd_Init();
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	CALL       _Lcd_Init+0
;ADC-Configuration.c,33 :: 		EEPROM_Write(0x00, 'A');   // Store 'A' onto 0x00 address of EEPROM
	LDI        R27, 65
	MOV        R4, R27
	CLR        R2
	CLR        R3
	CALL       _EEPROM_Write+0
;ADC-Configuration.c,34 :: 		val = EEPROM_Read(0x00);   // Should return the value of addr 0x00
	CLR        R2
	CLR        R3
	CALL       _EEPROM_Read+0
; val start address is: 16 (R16)
	LDI        R17, 0
;ADC-Configuration.c,37 :: 		if (val == 'A') {
	CPI        R17, 0
	BRNE       L__main5
	CPI        R16, 65
L__main5:
	BREQ       L__main6
	JMP        L_main0
L__main6:
; val end address is: 16 (R16)
;ADC-Configuration.c,38 :: 		Lcd_Out(1, 1, "A Found");
	LDI        R27, #lo_addr(?lstr1_ADC_45Configuration+0)
	MOV        R4, R27
	LDI        R27, hi_addr(?lstr1_ADC_45Configuration+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;ADC-Configuration.c,39 :: 		} else {
	JMP        L_main1
L_main0:
;ADC-Configuration.c,40 :: 		Lcd_Out(1, 1, "A not found");
	LDI        R27, #lo_addr(?lstr2_ADC_45Configuration+0)
	MOV        R4, R27
	LDI        R27, hi_addr(?lstr2_ADC_45Configuration+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;ADC-Configuration.c,41 :: 		}
L_main1:
;ADC-Configuration.c,43 :: 		while (1) {
L_main2:
;ADC-Configuration.c,45 :: 		}
	JMP        L_main2
;ADC-Configuration.c,46 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
