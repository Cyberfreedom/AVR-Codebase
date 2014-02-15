#line 1 "C:/Users/Refayate Manju Maruf/Desktop/Soft Copy/09 - Display Interfacing/01 - LCD-display/LCD-Display-interfacing.c"
#line 16 "C:/Users/Refayate Manju Maruf/Desktop/Soft Copy/09 - Display Interfacing/01 - LCD-display/LCD-Display-interfacing.c"
sbit LCD_RS at PORTA0_bit;
sbit LCD_EN at PORTA1_bit;
sbit LCD_D4 at PORTA2_bit;
sbit LCD_D5 at PORTA3_bit;
sbit LCD_D6 at PORTA4_bit;
sbit LCD_D7 at PORTA5_bit;


sbit LCD_RS_Direction at DDA0_bit;
sbit LCD_EN_Direction at DDA1_bit;
sbit LCD_D4_Direction at DDA2_bit;
sbit LCD_D5_Direction at DDA3_bit;
sbit LCD_D6_Direction at DDA4_bit;
sbit LCD_D7_Direction at DDA5_bit;

void main() {
#line 35 "C:/Users/Refayate Manju Maruf/Desktop/Soft Copy/09 - Display Interfacing/01 - LCD-display/LCD-Display-interfacing.c"
 Lcd_Init();
#line 44 "C:/Users/Refayate Manju Maruf/Desktop/Soft Copy/09 - Display Interfacing/01 - LCD-display/LCD-Display-interfacing.c"
 Lcd_Out(1, 1, "Jontropati.com");

 Delay_ms(1000);
#line 53 "C:/Users/Refayate Manju Maruf/Desktop/Soft Copy/09 - Display Interfacing/01 - LCD-display/LCD-Display-interfacing.c"
 Lcd_Out_CP(" !!!");

 Delay_ms(1000);
#line 60 "C:/Users/Refayate Manju Maruf/Desktop/Soft Copy/09 - Display Interfacing/01 - LCD-display/LCD-Display-interfacing.c"
 Lcd_Cmd(_LCD_CLEAR);
#line 67 "C:/Users/Refayate Manju Maruf/Desktop/Soft Copy/09 - Display Interfacing/01 - LCD-display/LCD-Display-interfacing.c"
 Lcd_Chr(1, 1, 'A');

 Delay_ms(1000);
#line 75 "C:/Users/Refayate Manju Maruf/Desktop/Soft Copy/09 - Display Interfacing/01 - LCD-display/LCD-Display-interfacing.c"
 Lcd_Chr_CP('B');

 while (1) {

 }
}
