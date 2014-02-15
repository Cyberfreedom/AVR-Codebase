
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;LCD-Display-interfacing.c,31 :: 		void main() {
;LCD-Display-interfacing.c,35 :: 		Lcd_Init();
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	CALL       _Lcd_Init+0
;LCD-Display-interfacing.c,44 :: 		Lcd_Out(1, 1, "Jontropati.com");
	LDI        R27, #lo_addr(?lstr1_LCD_45Display_45interfacing+0)
	MOV        R4, R27
	LDI        R27, hi_addr(?lstr1_LCD_45Display_45interfacing+0)
	MOV        R5, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Out+0
;LCD-Display-interfacing.c,46 :: 		Delay_ms(1000);      // delay- 1 sec
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L_main0:
	DEC        R16
	BRNE       L_main0
	DEC        R17
	BRNE       L_main0
	DEC        R18
	BRNE       L_main0
;LCD-Display-interfacing.c,53 :: 		Lcd_Out_CP(" !!!");
	LDI        R27, #lo_addr(?lstr2_LCD_45Display_45interfacing+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr2_LCD_45Display_45interfacing+0)
	MOV        R3, R27
	CALL       _Lcd_Out_CP+0
;LCD-Display-interfacing.c,55 :: 		Delay_ms(1000);    // delay 1 sec
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
;LCD-Display-interfacing.c,60 :: 		Lcd_Cmd(_LCD_CLEAR);
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Cmd+0
;LCD-Display-interfacing.c,67 :: 		Lcd_Chr(1, 1, 'A');
	LDI        R27, 65
	MOV        R4, R27
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _Lcd_Chr+0
;LCD-Display-interfacing.c,69 :: 		Delay_ms(1000);
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L_main4:
	DEC        R16
	BRNE       L_main4
	DEC        R17
	BRNE       L_main4
	DEC        R18
	BRNE       L_main4
;LCD-Display-interfacing.c,75 :: 		Lcd_Chr_CP('B');
	LDI        R27, 66
	MOV        R2, R27
	CALL       _Lcd_Chr_CP+0
;LCD-Display-interfacing.c,77 :: 		while (1) {
L_main6:
;LCD-Display-interfacing.c,79 :: 		}
	JMP        L_main6
;LCD-Display-interfacing.c,80 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
