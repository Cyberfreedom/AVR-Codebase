/*
	Author	: Shamir Shakir
	Email	: dewsworld@gmail.com

	www.jontropati.com
*/

void main() {
    /*
      Setting the Data Direction for PORTB
      1 - Output
      0 - Input
    */
    DDRB = 0xff;  /* 0xff means 0b11111111 */
    
    /*
      Initially all output are 0
    */
    PORTB = 0x00;
    
    while (1) {                // The while engine
          
          PORTB = 0xff;       // all o/p HIGH
          Delay_ms(500);      // wait for 500 mili sec.
          
          PORTB = 0x00;
          Delay_ms(500);      // all o/p LOW
          Delay_ms(500);      // wait for 500 mili sec
    }
}