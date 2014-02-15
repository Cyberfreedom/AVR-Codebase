#line 1 "F:/Dewsworld Bangladesh/RNDED/Soft Copy/12 - Timer/01 - Simple-Timer/Jontropati.c"
#line 11 "F:/Dewsworld Bangladesh/RNDED/Soft Copy/12 - Timer/01 - Simple-Timer/Jontropati.c"
void main() {
 int i;

 DDC0_bit = 1;
 DDRB = 0xff;



 TCCR1B |= (1<<CS02) | (1<<CS00);

 while(1)
 {
 PORTB = TCNT1H;
 continue;

 if (TCCR0 > 50) {
 TCCR0 = 0;

  PORTC0_bit  !=  PORTC0_bit ;
 }
 }
}
