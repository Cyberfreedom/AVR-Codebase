#line 1 "F:/Dewsworld Bangladesh/RNDED/Soft Copy/13 - Interrupt/01 - Button Input Using Interrupt/Button Interrupt.c"
#line 10 "F:/Dewsworld Bangladesh/RNDED/Soft Copy/13 - Interrupt/01 - Button Input Using Interrupt/Button Interrupt.c"
void main() {
 DDRC |= (1<<DDC0);

 PORTD2_bit = 1;

 MCUCR |= (1<<ISC10);

 GICR |= (1<<INT0);

 SREG |= (1<<SREG_I);

 while (1) {

 }
}

void interrupt0() iv IVT_ADDR_INT0
{
  PORTC0_bit  = ! PORTC0_bit ;

 GIFR |= (1<<INTF0);
}
