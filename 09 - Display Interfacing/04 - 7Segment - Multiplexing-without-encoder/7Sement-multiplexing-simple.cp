#line 1 "F:/Dewsworld Bangladesh/Research and Developement (ED) Wing/Soft Copy/09 - Display Interfacing/03 - 7Segment - Encoder/7Sement-multiplexing-simple.c"
#line 24 "F:/Dewsworld Bangladesh/Research and Developement (ED) Wing/Soft Copy/09 - Display Interfacing/03 - 7Segment - Encoder/7Sement-multiplexing-simple.c"
void main() {
 const char digit[10] = {0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6D, 0x7d, 0x07, 0x7f, 0x6f};
 char i;

 DDRC = 0xff;
 PORTC = 0x00;

 DDRD = 0x0f;
 PORTD = 0x00;


 while (1) {
 for (i=0; i<4; i++) {
 PORTC = digit[i];
 PORTD = (1 << i);
 Delay_ms(20);
 }
 }
}
