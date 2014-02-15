/*
        Author        : Shamir Shakir
        Email        : dewsworld@gmail.com

        www.jontropati.com
*/

/*
Below are the table for number and their
Binary and Hexa code

0        0b00111111        0x3F
1        0b00000110        0x06
2        0b01011011        0x5B
3        0b01001111        0x4F
4        0b01100110        0x66
5        0b01101101        0x6D
6        0b01111101        0x7D
7        0b00000111        0x07
8        0b01111111        0x7F
9        0b11101111         0x6F
*/

void main() {
     const char digit[10] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6D, 0x7d, 0x07, 0x7f, 0x6f}; // hexadecimal representation of the number
     char i;

     DDRC  = 0xff;          // remember to set pins as output
     PORTC = 0x00;          //default all pins output low (0V)

     DDRD = 0x0f;           // switching each display ON or OFF
     PORTD = 0x00;          // all display are OFF


     while (1) {                           // main loop
           for (i=0; i<4; i++) {           // looping 10 times
               PORTC = digit[i];           // setting digit's value to PORTD
               PORTD = (1 << i);           // switch the transistor Q1, Q2, Q3, Q4 serially
               Delay_ms(20);               // Half second delay
           }
     }
}