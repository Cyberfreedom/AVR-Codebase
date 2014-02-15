#line 1 "F:/Dewsworld Bangladesh/RNDED/Soft Copy/08 - Digital Switching/01- Transistor-switch/Transistor-switching.c"
#line 8 "F:/Dewsworld Bangladesh/RNDED/Soft Copy/08 - Digital Switching/01- Transistor-switch/Transistor-switching.c"
void main() {
 DDB1_bit = 1;
 PORTB1_bit = 0;

 while (1) {
 PORTB1_bit = !PORTB1_bit;
 Delay_ms(500);
 }
}
