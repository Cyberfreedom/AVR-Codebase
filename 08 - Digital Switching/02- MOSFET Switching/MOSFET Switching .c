/*
	Author	: Shamir Shakir
	Email	: dewsworld@gmail.com

	www.jontropati.com
*/

void main() {
     DDA0_bit = 1;      // set Data Direction for A0 as output
     PORTA0_bit = 0;    // Initially output as LOW

     while (1) {
           PORTA0_bit = !PORTA0_bit;
           Delay_ms(500);
     }
}