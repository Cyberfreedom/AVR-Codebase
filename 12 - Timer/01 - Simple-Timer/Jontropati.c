/*
	Author	: Shamir Shakir
	Email	: dewsworld@gmail.com

	www.jontropati.com
*/

#define LED_BIT   PORTC0_bit
#define TCNT1    (((unsigned int)TCNT1H<<8)|TCNT1L)

void    main() {
    int i;

    DDC0_bit = 1;
    DDRB = 0xff;

   //Timer 0 configuration
                       // Initial value for 1ms interval
   TCCR1B |= (1<<CS02) | (1<<CS00);

   while(1)
   {
           PORTB = TCNT1H;
           continue;
           
           if (TCCR0 > 50) {
              TCCR0 = 0;

              LED_BIT != LED_BIT;
           }
   }
}