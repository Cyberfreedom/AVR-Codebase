#line 1 "F:/Dewsworld Bangladesh/Research and Developement (ED) Wing/Soft Copy/06 - LED-blinking/01- LED-blinking/LED_BLINKING.c"
#line 8 "F:/Dewsworld Bangladesh/Research and Developement (ED) Wing/Soft Copy/06 - LED-blinking/01- LED-blinking/LED_BLINKING.c"
void main() {
#line 14 "F:/Dewsworld Bangladesh/Research and Developement (ED) Wing/Soft Copy/06 - LED-blinking/01- LED-blinking/LED_BLINKING.c"
 DDRB = 0xff;
#line 19 "F:/Dewsworld Bangladesh/Research and Developement (ED) Wing/Soft Copy/06 - LED-blinking/01- LED-blinking/LED_BLINKING.c"
 PORTB = 0x00;

 while (1) {

 PORTB = 0xff;
 Delay_ms(500);

 PORTB = 0x00;
 Delay_ms(500);
 Delay_ms(500);
 }
}
