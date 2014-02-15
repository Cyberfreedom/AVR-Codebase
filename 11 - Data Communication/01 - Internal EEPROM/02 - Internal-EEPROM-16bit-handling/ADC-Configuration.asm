
_EEPROM_Write_16bit:

;ADC-Configuration.c,24 :: 		void EEPROM_Write_16bit(unsigned char addr, unsigned int value) {
;ADC-Configuration.c,25 :: 		EEPROM_Write(addr, value>>8);
	PUSH       R2
	PUSH       R3
	PUSH       R4
	MOV        R16, R4
	LDI        R17, 0
	PUSH       R4
	PUSH       R3
	MOV        R4, R16
	LDI        R27, 0
	MOV        R3, R27
	CALL       _EEPROM_Write+0
	POP        R3
	POP        R4
;ADC-Configuration.c,26 :: 		EEPROM_Write(addr+1, value);
	MOV        R16, R2
	LDI        R17, 0
	SUBI       R16, 255
	SBCI       R17, 255
	MOV        R4, R3
	MOVW       R2, R16
	CALL       _EEPROM_Write+0
;ADC-Configuration.c,27 :: 		}
L_end_EEPROM_Write_16bit:
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _EEPROM_Write_16bit

_EEPROM_Read_16bit:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;ADC-Configuration.c,29 :: 		unsigned int EEPROM_Read_16bit(unsigned char addr) {
;ADC-Configuration.c,32 :: 		val = (EEPROM_Read(addr) << 8) | EEPROM_Read(addr+1);
	PUSH       R2
	PUSH       R3
	LDI        R27, 0
	MOV        R3, R27
	CALL       _EEPROM_Read+0
	MOV        R17, R16
	CLR        R16
	STD        Y+0, R16
	STD        Y+1, R17
	MOV        R16, R2
	LDI        R17, 0
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R2, R16
	CALL       _EEPROM_Read+0
	LDD        R18, Y+0
	LDD        R19, Y+1
	LDI        R17, 0
	OR         R16, R18
	OR         R17, R19
;ADC-Configuration.c,34 :: 		return val;
;ADC-Configuration.c,35 :: 		}
;ADC-Configuration.c,34 :: 		return val;
;ADC-Configuration.c,35 :: 		}
L_end_EEPROM_Read_16bit:
	POP        R3
	POP        R2
	ADIW       R28, 1
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _EEPROM_Read_16bit

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;ADC-Configuration.c,37 :: 		void main() {
;ADC-Configuration.c,42 :: 		unsigned int write = 1234;
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 210
	STD        Y+0, R27
	LDI        R27, 4
	STD        Y+1, R27
;ADC-Configuration.c,44 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;ADC-Configuration.c,46 :: 		EEPROM_Write_16bit(0x00, write);
	LDD        R3, Y+0
	LDD        R4, Y+1
	CLR        R2
	CALL       _EEPROM_Write_16bit+0
;ADC-Configuration.c,47 :: 		read = EEPROM_Read_16bit(0x00);
	CLR        R2
	CALL       _EEPROM_Read_16bit+0
;ADC-Configuration.c,49 :: 		if (read == write) {
	LDD        R18, Y+0
	LDD        R19, Y+1
	CP         R16, R18
	CPC        R17, R19
	BREQ       L__main7
	JMP        L_main0
L__main7:
;ADC-Configuration.c,50 :: 		Lcd_Out(1, 1, "Match Found");
	LDI        R27, #lo_addr(?lstr1_ADC_45Configuration+0)
	MOV        R4, R27
	LDI        R27, hi_addr(?lstr1_ADC_45Configuration+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;ADC-Configuration.c,51 :: 		} else {
	JMP        L_main1
L_main0:
;ADC-Configuration.c,52 :: 		Lcd_Out(1, 1, "Match failed");
	LDI        R27, #lo_addr(?lstr2_ADC_45Configuration+0)
	MOV        R4, R27
	LDI        R27, hi_addr(?lstr2_ADC_45Configuration+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;ADC-Configuration.c,53 :: 		}
L_main1:
;ADC-Configuration.c,55 :: 		while (1) {
L_main2:
;ADC-Configuration.c,57 :: 		}
	JMP        L_main2
;ADC-Configuration.c,58 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
