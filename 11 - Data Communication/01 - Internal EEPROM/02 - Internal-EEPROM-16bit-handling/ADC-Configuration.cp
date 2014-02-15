#line 1 "F:/Dewsworld Bangladesh/RNDED/Soft Copy/11 - Data Communication/01 - Internal EEPROM/02 - Internal-EEPROM-16bit-handling/ADC-Configuration.c"
#line 9 "F:/Dewsworld Bangladesh/RNDED/Soft Copy/11 - Data Communication/01 - Internal EEPROM/02 - Internal-EEPROM-16bit-handling/ADC-Configuration.c"
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

void EEPROM_Write_16bit(unsigned char addr, unsigned int value) {
 EEPROM_Write(addr, value>>8);
 EEPROM_Write(addr+1, value);
}

unsigned int EEPROM_Read_16bit(unsigned char addr) {
 unsigned int val;

 val = (EEPROM_Read(addr) << 8) | EEPROM_Read(addr+1);

 return val;
}

void main() {
#line 41 "F:/Dewsworld Bangladesh/RNDED/Soft Copy/11 - Data Communication/01 - Internal EEPROM/02 - Internal-EEPROM-16bit-handling/ADC-Configuration.c"
 unsigned int read;
 unsigned int write = 1234;

 Lcd_Init();

 EEPROM_Write_16bit(0x00, write);
 read = EEPROM_Read_16bit(0x00);

 if (read == write) {
 Lcd_Out(1, 1, "Match Found");
 } else {
 Lcd_Out(1, 1, "Match failed");
 }

 while (1) {

 }
}
