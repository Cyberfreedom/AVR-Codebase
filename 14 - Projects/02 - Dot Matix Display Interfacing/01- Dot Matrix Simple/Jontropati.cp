#line 1 "F:/Dewsworld Bangladesh/RNDED/Soft Copy/14 - Projects/02 - Dot Matix Display Interfacing/01- Dot Matrix Simple/Jontropati.c"
void main() {
 unsigned char A[8] = {
 0b00011000,
 0b00011000,
 0b00111100,
 0b01101110,
 0b01100110,
 0b11000011,
 0b11000011,
 0b11000011
 };
 int i,j;

 DDRC = DDRD = 0xff;

 while (1) {
 for (i=0; i<8; i++) {
 PORTC = A[i];

 PORTD = ~(1<<i);
 Delay_ms(10);
 }
 }
}
