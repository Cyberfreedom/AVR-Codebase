/*
	Author	: Shamir Shakir
	Email	: dewsworld@gmail.com

	www.jontropati.com
*/

void main() {
     DDB1_bit = 1;      // set Data Direction for B1 as output
     PORTB1_bit = 0;    // Initially output as LOW
     
     while (1) {
           PORTB1_bit = !PORTB1_bit;
           Delay_ms(500);
     }
}