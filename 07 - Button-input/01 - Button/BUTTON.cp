#line 1 "F:/Jontroapti.Com/RESTRICTED/Soft Copy/07 - Button-input/01 - Button/BUTTON.c"
#line 8 "F:/Jontroapti.Com/RESTRICTED/Soft Copy/07 - Button-input/01 - Button/BUTTON.c"
void main() {
#line 13 "F:/Jontroapti.Com/RESTRICTED/Soft Copy/07 - Button-input/01 - Button/BUTTON.c"
 DDRB = 0x00;
 PORTB = 0xff;


 DDRA = 0xff;
 PORTA = 0x00;

 while (1) {
 if (PINB0_bit == 0){
 Delay_ms(45);


 PORTA = ~PORTA;


 while (PINB0_bit==0);
 }
 }
}
