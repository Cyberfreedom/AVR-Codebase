/*
        Author        : Shamir Shakir
        Email        : dewsworld@gmail.com

        www.jontropati.com
*/

/*
  Remember, with encoder you dont' need to
  put the binary code for each number.

  In-stead, output the actual number to the
  encoder. The encoder will encode the hex
  code.
  
  Use,
      7447  to Common Anode        7 seg
      7448  to Common Cathode      7 seg
*/

void main() {

    char i;

    DDRC = 0xff;
    PORTC = 0x00;

    while (1) {
       for (i=0; i<10; i++) {
            PORTC = i; // simply output the i
                       // or the number itself

            Delay_ms(500);
       }
    }
}