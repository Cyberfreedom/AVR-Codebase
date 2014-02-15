#line 1 "F:/Dewsworld Bangladesh/RNDED/Soft Copy/11 - Data Communication/02 - I2C-External-EEPROM/ADC-Configuration.c"
#line 9 "F:/Dewsworld Bangladesh/RNDED/Soft Copy/11 - Data Communication/02 - I2C-External-EEPROM/ADC-Configuration.c"
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





unsigned char Read24C64_Byte(unsigned char devAddr, unsigned int regAddr) {
 unsigned char val;

 TWI_Start();
 TWI_Write(0b10100000);
 TWI_Write(regAddr>>8);
 TWI_Write(regAddr);
 TWI_Start();
 TWI_Write(0b10100001);
 val = TWI_Read(0u);
 TWI_Stop();

 return val;
}

unsigned char Write24C64_Byte(unsigned char devAddr, unsigned int regAddr, unsigned char value) {
 TWI_Start();
 TWI_Write( (devAddr&0xfffe) );
 TWI_Write(regAddr>>8);
 TWI_Write(regAddr);
 TWI_Write(value);
 TWI_Stop();
}

void main() {
 unsigned char write = 'A';
 unsigned char read;

 char buffer[10];

 TWI_Init(100000);
 Lcd_Init();

 Write24C64_Byte( 0b10100000 , 0x00, write);
 read = Read24C64_Byte( 0b10100000 , 0x00);

 IntToHex(read, buffer);
 Lcd_Out(1, 1, buffer);

 while (1);

 if( write == read ) {
 Lcd_Out(1, 1, "Successfully written");
 } else {
 Lcd_Out(1, 1, "Data writing failed");
 }


 while (1) {

 }
}
