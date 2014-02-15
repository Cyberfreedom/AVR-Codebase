#line 1 "F:/Dewsworld Bangladesh/Research and Developement (ED) Wing/Soft Copy/09 - Display Interfacing/05 - 7Segment - Multiplxing-with-encoder/7Sement-multiplexing-simple.c"
#line 8 "F:/Dewsworld Bangladesh/Research and Developement (ED) Wing/Soft Copy/09 - Display Interfacing/05 - 7Segment - Multiplxing-with-encoder/7Sement-multiplexing-simple.c"
void main() {
 char i;

 DDRC = 0xff;
 PORTC = 0x00;

 DDRD = 0x0f;
 PORTD = 0x00;


 while (1) {
 for (i=0; i<4; i++) {
 PORTC = i;
 PORTD = (1 << i);
 Delay_ms(20);
 }
 }
}
