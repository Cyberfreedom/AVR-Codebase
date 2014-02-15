/*
        Author        : Shamir Shakir
        Email        : dewsworld@gmail.com

        www.jontropati.com
*/

/*
  Below sbit definations are the LCD PINOUT
  configuration for Microcontroller.

  Set those PIN accordingly
*/

// Lcd pinout settings
sbit LCD_RS at PORTA0_bit;
sbit LCD_EN at PORTA1_bit;
sbit LCD_D4 at PORTA2_bit;
sbit LCD_D5 at PORTA3_bit;
sbit LCD_D6 at PORTA4_bit;
sbit LCD_D7 at PORTA5_bit;

// Pin direction
sbit LCD_RS_Direction at DDA0_bit;
sbit LCD_EN_Direction at DDA1_bit;
sbit LCD_D4_Direction at DDA2_bit;
sbit LCD_D5_Direction at DDA3_bit;
sbit LCD_D6_Direction at DDA4_bit;
sbit LCD_D7_Direction at DDA5_bit;

void main() {
     /*
       Lcd_Init() to initialize the library
     */
     Lcd_Init();
     
     /*
       In order to print a string on a specific
       row, colum, use the following function.
       
       first number is the line number.
       second number is the column number.
     */
     Lcd_Out(1, 1, "Jontropati.com");
     
     Delay_ms(1000);      // delay- 1 sec
     
     
     /*
       THis function append some new string from
       previous string position
     */
     Lcd_Out_CP(" !!!");

     Delay_ms(1000);    // delay 1 sec
     
     /*
       Clear the LCD display
     */
     Lcd_Cmd(_LCD_CLEAR);
     

     /*
       Below funciton, prints a charecter
       on specific line, column
     */
     Lcd_Chr(1, 1, 'A');
     
     Delay_ms(1000);
     
     /*
       This function appends a new charecter
       from previous position.
     */
     Lcd_Chr_CP('B');

     while (1) {

     }
}