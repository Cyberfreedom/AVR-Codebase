/*
        Author        : Shamir Shakir
        Email        : dewsworld@gmail.com

        www.jontropati.com
*/

// Lcd pinout settings
sbit LCD_RS at PORTA0_bit;
sbit LCD_EN at PORTA1_bit;
sbit LCD_D7 at PORTA5_bit;
sbit LCD_D6 at PORTA4_bit;
sbit LCD_D5 at PORTA3_bit;
sbit LCD_D4 at PORTA2_bit;

// Pin direction
sbit LCD_RS_Direction at DDA0_bit;
sbit LCD_EN_Direction at DDA1_bit;
sbit LCD_D7_Direction at DDA5_bit;
sbit LCD_D6_Direction at DDA4_bit;
sbit LCD_D5_Direction at DDA3_bit;
sbit LCD_D4_Direction at DDA2_bit;


void main() {
     /*
       Variable to receive data from internal EEPROM
     */
     unsigned int val;

     Lcd_Init();
     
     EEPROM_Write(0x00, 'A');   // Store 'A' onto 0x00 address of EEPROM
     val = EEPROM_Read(0x00);   // Should return the value of addr 0x00
                                // which is 'A'
                                
     if (val == 'A') {
        Lcd_Out(1, 1, "A Found");
     } else {
       Lcd_Out(1, 1, "A not found");
     }

     while (1) {

     }
}