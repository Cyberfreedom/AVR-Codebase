
_Read24C64_Byte:

;ADC-Configuration.c,28 :: 		unsigned char Read24C64_Byte(unsigned char devAddr, unsigned int regAddr) {
;ADC-Configuration.c,31 :: 		TWI_Start();
	PUSH       R2
	CALL       _TWI_Start+0
;ADC-Configuration.c,32 :: 		TWI_Write(0b10100000);//_WRITE_MODE(devAddr));
	LDI        R27, 160
	MOV        R2, R27
	CALL       _TWI_Write+0
;ADC-Configuration.c,33 :: 		TWI_Write(regAddr>>8);          // MSB Byte first
	MOV        R16, R4
	LDI        R17, 0
	MOV        R2, R16
	CALL       _TWI_Write+0
;ADC-Configuration.c,34 :: 		TWI_Write(regAddr);             // LSB Byte afterward
	MOV        R2, R3
	CALL       _TWI_Write+0
;ADC-Configuration.c,35 :: 		TWI_Start();                    // Repeated start
	CALL       _TWI_Start+0
;ADC-Configuration.c,36 :: 		TWI_Write(0b10100001);//_READ_MODE(devAddr));
	LDI        R27, 161
	MOV        R2, R27
	CALL       _TWI_Write+0
;ADC-Configuration.c,37 :: 		val = TWI_Read(0u);
	CLR        R2
	CALL       _TWI_Read+0
; val start address is: 17 (R17)
	MOV        R17, R16
;ADC-Configuration.c,38 :: 		TWI_Stop();
	CALL       _TWI_Stop+0
;ADC-Configuration.c,40 :: 		return val;
	MOV        R16, R17
; val end address is: 17 (R17)
;ADC-Configuration.c,41 :: 		}
;ADC-Configuration.c,40 :: 		return val;
;ADC-Configuration.c,41 :: 		}
L_end_Read24C64_Byte:
	POP        R2
	RET
; end of _Read24C64_Byte

_Write24C64_Byte:

;ADC-Configuration.c,43 :: 		unsigned char Write24C64_Byte(unsigned char devAddr, unsigned int regAddr, unsigned char value) {
;ADC-Configuration.c,44 :: 		TWI_Start();
	PUSH       R2
	CALL       _TWI_Start+0
;ADC-Configuration.c,45 :: 		TWI_Write(_WRITE_MODE(devAddr));
	MOV        R16, R2
	ANDI       R16, 254
	MOV        R2, R16
	CALL       _TWI_Write+0
;ADC-Configuration.c,46 :: 		TWI_Write(regAddr>>8);
	MOV        R16, R4
	LDI        R17, 0
	MOV        R2, R16
	CALL       _TWI_Write+0
;ADC-Configuration.c,47 :: 		TWI_Write(regAddr);
	MOV        R2, R3
	CALL       _TWI_Write+0
;ADC-Configuration.c,48 :: 		TWI_Write(value);
	MOV        R2, R5
	CALL       _TWI_Write+0
;ADC-Configuration.c,49 :: 		TWI_Stop();
	CALL       _TWI_Stop+0
;ADC-Configuration.c,50 :: 		}
L_end_Write24C64_Byte:
	POP        R2
	RET
; end of _Write24C64_Byte

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 11
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;ADC-Configuration.c,52 :: 		void main() {
;ADC-Configuration.c,53 :: 		unsigned char write = 'A';
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
; write start address is: 16 (R16)
	LDI        R16, 65
;ADC-Configuration.c,58 :: 		TWI_Init(100000);
	IN         R27, TWPS0_bit+0
	CBR        R27, 1
	OUT        TWPS0_bit+0, R27
	IN         R27, TWPS1_bit+0
	CBR        R27, 2
	OUT        TWPS1_bit+0, R27
	LDI        R27, 32
	OUT        TWBR+0, R27
	CALL       _TWI_Init+0
;ADC-Configuration.c,59 :: 		Lcd_Init();
	PUSH       R16
	CALL       _Lcd_Init+0
	POP        R16
;ADC-Configuration.c,61 :: 		Write24C64_Byte(DEV24C64_ADDR, 0x00, write);
	MOV        R5, R16
; write end address is: 16 (R16)
	CLR        R3
	CLR        R4
	LDI        R27, 160
	MOV        R2, R27
	CALL       _Write24C64_Byte+0
;ADC-Configuration.c,62 :: 		read = Read24C64_Byte(DEV24C64_ADDR, 0x00);
	CLR        R3
	CLR        R4
	LDI        R27, 160
	MOV        R2, R27
	CALL       _Read24C64_Byte+0
;ADC-Configuration.c,64 :: 		IntToHex(read, buffer);
	MOV        R17, R28
	MOV        R18, R29
	SUBI       R17, 255
	SBCI       R18, 255
	MOV        R4, R17
	MOV        R5, R18
	MOV        R2, R16
	LDI        R27, 0
	MOV        R3, R27
	CALL       _IntToHex+0
;ADC-Configuration.c,65 :: 		Lcd_Out(1, 1, buffer);
	MOVW       R16, R28
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;ADC-Configuration.c,67 :: 		while (1);
L_main0:
	JMP        L_main0
;ADC-Configuration.c,79 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
