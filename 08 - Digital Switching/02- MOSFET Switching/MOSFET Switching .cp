#line 1 "C:/Users/Refayate Manju Maruf/Desktop/Soft Copy/08 - Digital Switching/02- MOSFET Switching/MOSFET Switching .c"
#line 8 "C:/Users/Refayate Manju Maruf/Desktop/Soft Copy/08 - Digital Switching/02- MOSFET Switching/MOSFET Switching .c"
void main() {
 DDA0_bit = 1;
 PORTA0_bit = 0;

 while (1) {
 PORTA0_bit = !PORTA0_bit;
 Delay_ms(500);
 }
}
