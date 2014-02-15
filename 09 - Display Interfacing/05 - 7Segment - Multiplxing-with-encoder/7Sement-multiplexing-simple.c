/*
        Author        : Shamir Shakir
        Email        : dewsworld@gmail.com

        www.jontropati.com
*/

void main() {
     char i;

     DDRC  = 0xff;          // remember to set pins as output
     PORTC = 0x00;          //default all pins output low (0V)

     DDRD = 0x0f;           // switching each display ON or OFF
     PORTD = 0x00;          // all display are OFF


     while (1) {                           // main loop
           for (i=0; i<4; i++) {           // looping 10 times
               PORTC = i;                  // setting digit's value to PORTD
               PORTD = (1 << i);           // switch the transistor Q1, Q2, Q3, Q4 serially
               Delay_ms(20);               // Half second delay
           }
     }
}