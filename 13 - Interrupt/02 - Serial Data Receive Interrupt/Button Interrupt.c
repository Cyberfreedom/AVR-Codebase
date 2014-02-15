/*
        Author        : Shamir Shakir
        Email        : dewsworld@gmail.com

        www.jontropati.com
*/

#define LED_BIT           PORTC0_bit

void main() {
     DDRC |= (1<<DDC0);
     
     PORTD2_bit = 1;                    // internal pull up enable

     MCUCR |= (1<<ISC10);               // falling edge
     
     GICR |= (1<<INT0);                 // select int
     
     SREG |= (1<<SREG_I);               // enable global int
     
     while (1) {
           // Sitting duck!
     }
}

void interrupt0() iv IVT_ADDR_INT0
{
     LED_BIT = !LED_BIT;
     
     GIFR |= (1<<INTF0);
}