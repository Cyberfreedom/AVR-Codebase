#line 1 "F:/Dewsworld Bangladesh/Research and Developement (ED) Wing/Soft Copy/09 - Display Interfacing/03 - 7Segment - Encoder/7Segment.c"
#line 21 "F:/Dewsworld Bangladesh/Research and Developement (ED) Wing/Soft Copy/09 - Display Interfacing/03 - 7Segment - Encoder/7Segment.c"
void main() {

 char i;

 DDRC = 0xff;
 PORTC = 0x00;

 while (1) {
 for (i=0; i<10; i++) {
 PORTC = i;


 Delay_ms(500);
 }
 }
}
