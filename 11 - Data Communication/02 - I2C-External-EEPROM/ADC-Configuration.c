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

#define DEV24C64_ADDR   0b10100000
#define _READ_MODE(x)    (x|0x0001)
#define _WRITE_MODE(x)   (x&0xfffe)

unsigned char Read24C64_Byte(unsigned char devAddr, unsigned int regAddr) {
         unsigned char val;
         
         TWI_Start();
         TWI_Write(0b10100000);//_WRITE_MODE(devAddr));
         TWI_Write(regAddr>>8);          // MSB Byte first
         TWI_Write(regAddr);             // LSB Byte afterward
         TWI_Start();                    // Repeated start
         TWI_Write(0b10100001);//_READ_MODE(devAddr));
         val = TWI_Read(0u);
         TWI_Stop();
         
         return val;
}

unsigned char Write24C64_Byte(unsigned char devAddr, unsigned int regAddr, unsigned char value) {
         TWI_Start();
         TWI_Write(_WRITE_MODE(devAddr));
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
     
     Write24C64_Byte(DEV24C64_ADDR, 0x00, write);
     read = Read24C64_Byte(DEV24C64_ADDR, 0x00);
     
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