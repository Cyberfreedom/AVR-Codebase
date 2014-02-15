/*
	Author	: Shamir Shakir
	Email	: dewsworld@gmail.com

	www.jontropati.com
*/

/*
Below are the table for number and their
Binary and Hexa code

0	0b00111111	0x3F
1	0b00000110	0x06
2	0b01011011	0x5B
3	0b01001111	0x4F
4	0b01100110	0x66
5	0b01101101	0x6D
6	0b01111101	0x7D
7	0b00000111	0x07
8	0b01111111	0x7F
9	0b11101111	 0x6F
*/

void main() {

    const char digit[10] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6D, 0x7d, 0x07, 0x7f, 0x6f};
    char i;

    DDRC = 0xff;
    PORTC = 0x00;

    while (1) {
       for (i=0; i<10; i++) {
            PORTC = digit[i];

            Delay_ms(500);
       }
    }
}