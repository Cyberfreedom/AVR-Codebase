
_rfWrite:

;Line-follower.c,29 :: 		void   rfWrite(char *in) {
;Line-follower.c,33 :: 		LIGHT = ON;
	IN         R27, PORTB7_bit+0
	SBR        R27, 128
	OUT        PORTB7_bit+0, R27
;Line-follower.c,38 :: 		for (i=0; i<25; i++) {
; i start address is: 18 (R18)
	LDI        R18, 0
	LDI        R19, 0
; i end address is: 18 (R18)
L_rfWrite0:
; i start address is: 18 (R18)
	LDI        R16, 25
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__rfWrite44
	JMP        L_rfWrite1
L__rfWrite44:
;Line-follower.c,39 :: 		UART1_Write_Text(in);
	PUSH       R19
	PUSH       R18
	CALL       _UART1_Write_Text+0
	POP        R18
	POP        R19
;Line-follower.c,38 :: 		for (i=0; i<25; i++) {
	MOVW       R16, R18
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R18, R16
;Line-follower.c,41 :: 		}
; i end address is: 18 (R18)
	JMP        L_rfWrite0
L_rfWrite1:
;Line-follower.c,43 :: 		LIGHT = OFF;
	IN         R27, PORTB7_bit+0
	CBR        R27, 128
	OUT        PORTB7_bit+0, R27
;Line-follower.c,44 :: 		}
L_end_rfWrite:
	RET
; end of _rfWrite

_rfRead:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;Line-follower.c,46 :: 		void   rfRead(char *in) {
;Line-follower.c,52 :: 		for (i=0; i<1000; i++) {
	PUSH       R4
	PUSH       R5
	PUSH       R6
	LDI        R27, 0
	STD        Y+0, R27
	STD        Y+1, R27
L_rfRead3:
	LDD        R18, Y+0
	LDD        R19, Y+1
	LDI        R16, 232
	LDI        R17, 3
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__rfRead46
	JMP        L_rfRead4
L__rfRead46:
;Line-follower.c,54 :: 		UART1_Read_Text(in, "XX", 50);
	LDI        R27, 50
	MOV        R6, R27
	LDI        R27, #lo_addr(?lstr1_Line_45follower+0)
	MOV        R4, R27
	LDI        R27, hi_addr(?lstr1_Line_45follower+0)
	MOV        R5, R27
	CALL       _UART1_Read_Text+0
;Line-follower.c,55 :: 		if (strlen(in) && in[0] >= 'A' && in[0] <= 'Z') {
	CALL       _strlen+0
	MOV        R27, R16
	OR         R27, R17
	BRNE       L__rfRead47
	JMP        L__rfRead40
L__rfRead47:
	MOVW       R30, R2
	LD         R16, Z
	CPI        R16, 65
	BRSH       L__rfRead48
	JMP        L__rfRead39
L__rfRead48:
	MOVW       R30, R2
	LD         R17, Z
	LDI        R16, 90
	CP         R16, R17
	BRSH       L__rfRead49
	JMP        L__rfRead38
L__rfRead49:
L__rfRead37:
;Line-follower.c,56 :: 		return;
	JMP        L_end_rfRead
;Line-follower.c,55 :: 		if (strlen(in) && in[0] >= 'A' && in[0] <= 'Z') {
L__rfRead40:
L__rfRead39:
L__rfRead38:
;Line-follower.c,52 :: 		for (i=0; i<1000; i++) {
	LDD        R16, Y+0
	LDD        R17, Y+1
	SUBI       R16, 255
	SBCI       R17, 255
	STD        Y+0, R16
	STD        Y+1, R17
;Line-follower.c,58 :: 		}
	JMP        L_rfRead3
L_rfRead4:
;Line-follower.c,60 :: 		if (in[0] < 'A' || in[0] > 'Z')
	MOVW       R30, R2
	LD         R16, Z
	CPI        R16, 65
	BRSH       L__rfRead50
	JMP        L__rfRead42
L__rfRead50:
	MOVW       R30, R2
	LD         R17, Z
	LDI        R16, 90
	CP         R16, R17
	BRSH       L__rfRead51
	JMP        L__rfRead41
L__rfRead51:
	JMP        L_rfRead11
L__rfRead42:
L__rfRead41:
;Line-follower.c,61 :: 		*in = '\0';
	MOVW       R30, R2
	LDI        R27, 0
	ST         Z, R27
L_rfRead11:
;Line-follower.c,62 :: 		}
L_end_rfRead:
	POP        R6
	POP        R5
	POP        R4
	ADIW       R28, 1
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _rfRead

_initDDR:

;Line-follower.c,64 :: 		void    initDDR() {
;Line-follower.c,65 :: 		DDB7_bit = 1; // light
	IN         R27, DDB7_bit+0
	SBR        R27, 128
	OUT        DDB7_bit+0, R27
;Line-follower.c,66 :: 		LIGHT = OFF;
	IN         R27, PORTB7_bit+0
	CBR        R27, 128
	OUT        PORTB7_bit+0, R27
;Line-follower.c,68 :: 		DDC5_bit = 1; // buzz
	IN         R27, DDC5_bit+0
	SBR        R27, 32
	OUT        DDC5_bit+0, R27
;Line-follower.c,69 :: 		BUZZ = OFF;
	IN         R27, PORTC5_bit+0
	CBR        R27, 32
	OUT        PORTC5_bit+0, R27
;Line-follower.c,71 :: 		DDB1_bit = DDB2_bit = 1;
	IN         R27, DDB2_bit+0
	SBR        R27, 4
	OUT        DDB2_bit+0, R27
	IN         R27, DDB2_bit+0
	BST        R27, 2
	IN         R27, DDB1_bit+0
	BLD        R27, 1
	OUT        DDB1_bit+0, R27
;Line-follower.c,72 :: 		PORTB1_bit = PORTB2_bit = 1;
	IN         R27, PORTB2_bit+0
	SBR        R27, 4
	OUT        PORTB2_bit+0, R27
	IN         R27, PORTB2_bit+0
	BST        R27, 2
	IN         R27, PORTB1_bit+0
	BLD        R27, 1
	OUT        PORTB1_bit+0, R27
;Line-follower.c,74 :: 		DDRC |= 0b00011110;
	IN         R16, DDRC+0
	ORI        R16, 30
	OUT        DDRC+0, R16
;Line-follower.c,75 :: 		PORTC &= 0b11100001;
	IN         R16, PORTC+0
	ANDI       R16, 225
	OUT        PORTC+0, R16
;Line-follower.c,79 :: 		}
L_end_initDDR:
	RET
; end of _initDDR

_initLib:

;Line-follower.c,81 :: 		void    initLib() {
;Line-follower.c,82 :: 		UART1_Init(9600);
	LDI        R27, 51
	OUT        UBRRL+0, R27
	LDI        R27, 0
	OUT        UBRRH+0, R27
	CALL       _UART1_Init+0
;Line-follower.c,83 :: 		Delay_ms(100);
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L_initLib12:
	DEC        R16
	BRNE       L_initLib12
	DEC        R17
	BRNE       L_initLib12
	DEC        R18
	BRNE       L_initLib12
;Line-follower.c,85 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Line-follower.c,86 :: 		}
L_end_initLib:
	RET
; end of _initLib

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

;Line-follower.c,88 :: 		void main() {
;Line-follower.c,93 :: 		initDDR();
	PUSH       R2
	CALL       _initDDR+0
;Line-follower.c,94 :: 		initLib();
	CALL       _initLib+0
;Line-follower.c,96 :: 		while (1) {
L_main14:
;Line-follower.c,97 :: 		if (UART1_Data_Ready()) {
	CALL       _UART1_Data_Ready+0
	TST        R16
	BRNE       L__main55
	JMP        L_main16
L__main55:
;Line-follower.c,98 :: 		input = UART1_Read();
	CALL       _UART1_Read+0
	STD        Y+0, R16
;Line-follower.c,100 :: 		UART1_Write(input);
	MOV        R2, R16
	CALL       _UART1_Write+0
;Line-follower.c,102 :: 		switch (input) {
	JMP        L_main17
;Line-follower.c,103 :: 		case 'F':
L_main19:
;Line-follower.c,104 :: 		BUZZ = ON;
	IN         R27, PORTC5_bit+0
	SBR        R27, 32
	OUT        PORTC5_bit+0, R27
;Line-follower.c,105 :: 		Delay_ms(40);
	LDI        R18, 2
	LDI        R17, 160
	LDI        R16, 147
L_main20:
	DEC        R16
	BRNE       L_main20
	DEC        R17
	BRNE       L_main20
	DEC        R18
	BRNE       L_main20
	NOP
;Line-follower.c,106 :: 		BUZZ = OFF;
	IN         R27, PORTC5_bit+0
	CBR        R27, 32
	OUT        PORTC5_bit+0, R27
;Line-follower.c,107 :: 		FORWARD
	IN         R27, PORTC2_bit+0
	SBR        R27, 4
	OUT        PORTC2_bit+0, R27
	IN         R27, PORTC2_bit+0
	BST        R27, 2
	IN         R27, PORTC4_bit+0
	BLD        R27, 4
	OUT        PORTC4_bit+0, R27
	IN         R27, PORTC1_bit+0
	CBR        R27, 2
	OUT        PORTC1_bit+0, R27
	IN         R27, PORTC1_bit+0
	BST        R27, 1
	IN         R27, PORTC3_bit+0
	BLD        R27, 3
	OUT        PORTC3_bit+0, R27
;Line-follower.c,108 :: 		break;
	JMP        L_main18
;Line-follower.c,110 :: 		case 'B':
L_main22:
;Line-follower.c,111 :: 		BUZZ = ON;
	IN         R27, PORTC5_bit+0
	SBR        R27, 32
	OUT        PORTC5_bit+0, R27
;Line-follower.c,112 :: 		Delay_ms(40);
	LDI        R18, 2
	LDI        R17, 160
	LDI        R16, 147
L_main23:
	DEC        R16
	BRNE       L_main23
	DEC        R17
	BRNE       L_main23
	DEC        R18
	BRNE       L_main23
	NOP
;Line-follower.c,113 :: 		BUZZ = OFF;
	IN         R27, PORTC5_bit+0
	CBR        R27, 32
	OUT        PORTC5_bit+0, R27
;Line-follower.c,115 :: 		BACKWARD
	IN         R27, PORTC2_bit+0
	CBR        R27, 4
	OUT        PORTC2_bit+0, R27
	IN         R27, PORTC2_bit+0
	BST        R27, 2
	IN         R27, PORTC4_bit+0
	BLD        R27, 4
	OUT        PORTC4_bit+0, R27
	IN         R27, PORTC1_bit+0
	SBR        R27, 2
	OUT        PORTC1_bit+0, R27
	IN         R27, PORTC1_bit+0
	BST        R27, 1
	IN         R27, PORTC3_bit+0
	BLD        R27, 3
	OUT        PORTC3_bit+0, R27
;Line-follower.c,116 :: 		break;
	JMP        L_main18
;Line-follower.c,118 :: 		case 'L':
L_main25:
;Line-follower.c,119 :: 		BUZZ = ON;
	IN         R27, PORTC5_bit+0
	SBR        R27, 32
	OUT        PORTC5_bit+0, R27
;Line-follower.c,120 :: 		Delay_ms(40);
	LDI        R18, 2
	LDI        R17, 160
	LDI        R16, 147
L_main26:
	DEC        R16
	BRNE       L_main26
	DEC        R17
	BRNE       L_main26
	DEC        R18
	BRNE       L_main26
	NOP
;Line-follower.c,121 :: 		BUZZ = OFF;
	IN         R27, PORTC5_bit+0
	CBR        R27, 32
	OUT        PORTC5_bit+0, R27
;Line-follower.c,122 :: 		LEFT
	IN         R27, PORTC2_bit+0
	SBR        R27, 4
	OUT        PORTC2_bit+0, R27
	IN         R27, PORTC1_bit+0
	CBR        R27, 2
	OUT        PORTC1_bit+0, R27
	IN         R27, PORTC1_bit+0
	BST        R27, 1
	IN         R27, PORTC3_bit+0
	BLD        R27, 3
	OUT        PORTC3_bit+0, R27
	IN         R27, PORTC3_bit+0
	BST        R27, 3
	IN         R27, PORTC4_bit+0
	BLD        R27, 4
	OUT        PORTC4_bit+0, R27
;Line-follower.c,123 :: 		break;
	JMP        L_main18
;Line-follower.c,125 :: 		case 'R':
L_main28:
;Line-follower.c,126 :: 		BUZZ = ON;
	IN         R27, PORTC5_bit+0
	SBR        R27, 32
	OUT        PORTC5_bit+0, R27
;Line-follower.c,127 :: 		Delay_ms(40);
	LDI        R18, 2
	LDI        R17, 160
	LDI        R16, 147
L_main29:
	DEC        R16
	BRNE       L_main29
	DEC        R17
	BRNE       L_main29
	DEC        R18
	BRNE       L_main29
	NOP
;Line-follower.c,128 :: 		BUZZ = OFF;
	IN         R27, PORTC5_bit+0
	CBR        R27, 32
	OUT        PORTC5_bit+0, R27
;Line-follower.c,129 :: 		RIGHT
	IN         R27, PORTC4_bit+0
	SBR        R27, 16
	OUT        PORTC4_bit+0, R27
	IN         R27, PORTC1_bit+0
	CBR        R27, 2
	OUT        PORTC1_bit+0, R27
	IN         R27, PORTC1_bit+0
	BST        R27, 1
	IN         R27, PORTC2_bit+0
	BLD        R27, 2
	OUT        PORTC2_bit+0, R27
	IN         R27, PORTC2_bit+0
	BST        R27, 2
	IN         R27, PORTC3_bit+0
	BLD        R27, 3
	OUT        PORTC3_bit+0, R27
;Line-follower.c,130 :: 		break;
	JMP        L_main18
;Line-follower.c,132 :: 		default:
L_main31:
;Line-follower.c,133 :: 		BUZZ = ON;
	IN         R27, PORTC5_bit+0
	SBR        R27, 32
	OUT        PORTC5_bit+0, R27
;Line-follower.c,134 :: 		Delay_ms(40);
	LDI        R18, 2
	LDI        R17, 160
	LDI        R16, 147
L_main32:
	DEC        R16
	BRNE       L_main32
	DEC        R17
	BRNE       L_main32
	DEC        R18
	BRNE       L_main32
	NOP
;Line-follower.c,135 :: 		BUZZ = OFF;
	IN         R27, PORTC5_bit+0
	CBR        R27, 32
	OUT        PORTC5_bit+0, R27
;Line-follower.c,136 :: 		HALT;
	IN         R27, PORTC1_bit+0
	CBR        R27, 2
	OUT        PORTC1_bit+0, R27
	IN         R27, PORTC1_bit+0
	BST        R27, 1
	IN         R27, PORTC2_bit+0
	BLD        R27, 2
	OUT        PORTC2_bit+0, R27
	IN         R27, PORTC2_bit+0
	BST        R27, 2
	IN         R27, PORTC3_bit+0
	BLD        R27, 3
	OUT        PORTC3_bit+0, R27
	IN         R27, PORTC3_bit+0
	BST        R27, 3
	IN         R27, PORTC4_bit+0
	BLD        R27, 4
	OUT        PORTC4_bit+0, R27
;Line-follower.c,137 :: 		break;
	JMP        L_main18
;Line-follower.c,138 :: 		}
L_main17:
	LDD        R16, Y+0
	CPI        R16, 70
	BRNE       L__main56
	JMP        L_main19
L__main56:
	LDD        R16, Y+0
	CPI        R16, 66
	BRNE       L__main57
	JMP        L_main22
L__main57:
	LDD        R16, Y+0
	CPI        R16, 76
	BRNE       L__main58
	JMP        L_main25
L__main58:
	LDD        R16, Y+0
	CPI        R16, 82
	BRNE       L__main59
	JMP        L_main28
L__main59:
	JMP        L_main31
L_main18:
;Line-follower.c,139 :: 		Delay_ms(100);
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L_main34:
	DEC        R16
	BRNE       L_main34
	DEC        R17
	BRNE       L_main34
	DEC        R18
	BRNE       L_main34
;Line-follower.c,140 :: 		}
L_main16:
;Line-follower.c,141 :: 		}
	JMP        L_main14
;Line-follower.c,142 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
