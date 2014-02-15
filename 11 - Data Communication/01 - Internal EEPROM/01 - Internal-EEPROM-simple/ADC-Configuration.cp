#line 1 "F:/Dewsworld Bangladesh/RNDED/Soft Copy/11 - Data Communication/01 - Internal EEPROM/ADC-Configuration.c"
#line 9 "F:/Dewsworld Bangladesh/RNDED/Soft Copy/11 - Data Communication/01 - Internal EEPROM/ADC-Configuration.c"
sbit LCD_RS at PORTA0_bit;
sbit LCD_EN at PORTA1_bit;
sbit LCD_D7 at PORTA5_bit;
sbit LCD_D6 at PORTA4_bit;
sbit LCD_D5 at PORTA3_bit;
sbit LCD_D4 at PORTA2_bit;


sbit LCD_RS_Direction at DDA0_bit;
sbit LCD_EN_Direction at DDA1_bit;
sbit LCD_D7_Direction at DDA5_bit;
sbit LCD_D6_Direction at DDA4_bit;
sbit LCD_D5_Direction at DDA3_bit;
sbit LCD_D4_Direction at DDA2_bit;


void main() {
#line 29 "F:/Dewsworld Bangladesh/RNDED/Soft Copy/11 - Data Communication/01 - Internal EEPROM/ADC-Configuration.c"
 unsigned int val;

 Lcd_Init();

 EEPROM_Write(0x00, 'A');
 val = EEPROM_Read(0x00);


 if (val == 'A') {
 Lcd_Out(1, 1, "A Found");
 } else {
 Lcd_Out(1, 1, "A not found");
 }

 while (1) {

 }
}
