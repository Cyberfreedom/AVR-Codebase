/*
	Author	: Shamir Shakir
	Email	: dewsworld@gmail.com

	www.jontropati.com
*/

void main() {
     /*
       Set the Data Direction Register as input
     */
     
     DDRB = 0x00;   // all are input
     PORTB = 0xff;  // Set the internal pull-up
     
     
     DDRA = 0xff;   // all PORTA are output
     PORTA = 0x00;  // initially arrl output as LOW
     
     while (1) {
           if (PINB0_bit == 0){
              Delay_ms(45);                    // Debouncing Delay

              // Some code when button pressed
              PORTA = ~PORTA;                 // Toggle PORTA
              // End- Some code when button pressed

              while (PINB0_bit==0);            // safety while
           }
     }
}