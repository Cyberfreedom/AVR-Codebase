#line 1 "E:/electronics-workspace/line-follower/Firmware/Line-follower.c"

sbit LCD_RS at PORTC5_bit;
sbit LCD_EN at PORTC4_bit;
sbit LCD_D4 at PORTC3_bit;
sbit LCD_D5 at PORTC2_bit;
sbit LCD_D6 at PORTC1_bit;
sbit LCD_D7 at PORTC0_bit;

sbit LCD_RS_Direction at DDC5_bit;
sbit LCD_EN_Direction at DDC4_bit;
sbit LCD_D4_Direction at DDC3_bit;
sbit LCD_D5_Direction at DDC2_bit;
sbit LCD_D6_Direction at DDC1_bit;
sbit LCD_D7_Direction at DDC0_bit;
#line 29 "E:/electronics-workspace/line-follower/Firmware/Line-follower.c"
 void rfWrite(char *in) {
 int i;


  PORTB7_bit  =  1 ;




 for (i=0; i<25; i++) {
 UART1_Write_Text(in);

 }

  PORTB7_bit  =  0 ;
}

 void rfRead(char *in) {
 int i;




 for (i=0; i<1000; i++) {

 UART1_Read_Text(in, "XX", 50);
 if (strlen(in) && in[0] >= 'A' && in[0] <= 'Z') {
 return;
 }
 }

 if (in[0] < 'A' || in[0] > 'Z')
 *in = '\0';
}

void initDDR() {
 DDB7_bit = 1;
  PORTB7_bit  =  0 ;

 DDC5_bit = 1;
  PORTC5_bit  =  0 ;

 DDB1_bit = DDB2_bit = 1;
 PORTB1_bit = PORTB2_bit = 1;

 DDRC |= 0b00011110;
 PORTC &= 0b11100001;
#line 79 "E:/electronics-workspace/line-follower/Firmware/Line-follower.c"
}

void initLib() {
 UART1_Init(9600);
 Delay_ms(100);

 Lcd_Init();
}

void main() {
 char buffer[10];
 char i;
 char input;

 initDDR();
 initLib();

 while (1) {
 if (UART1_Data_Ready()) {
 input = UART1_Read();

 UART1_Write(input);

 switch (input) {
 case 'F':
  PORTC5_bit  =  1 ;
 Delay_ms(40);
  PORTC5_bit  =  0 ;
  { PORTC4_bit = PORTC2_bit = 1; PORTC3_bit = PORTC1_bit = 0; } 
 break;

 case 'B':
  PORTC5_bit  =  1 ;
 Delay_ms(40);
  PORTC5_bit  =  0 ;
  PORTB7_bit  ==  0 ;
  { PORTC4_bit = PORTC2_bit = 0; PORTC3_bit = PORTC1_bit = 1; } 
 break;

 case 'L':
  PORTC5_bit  =  1 ;
 Delay_ms(40);
  PORTC5_bit  =  0 ;
  { PORTC2_bit = 1; PORTC4_bit = PORTC3_bit = PORTC1_bit = 0; } 
 break;

 case 'R':
  PORTC5_bit  =  1 ;
 Delay_ms(40);
  PORTC5_bit  =  0 ;
  { PORTC4_bit = 1; PORTC3_bit = PORTC2_bit = PORTC1_bit = 0; } 
 break;

 default:
  PORTC5_bit  =  1 ;
 Delay_ms(40);
  PORTC5_bit  =  0 ;
  { PORTC4_bit = PORTC3_bit = PORTC2_bit = PORTC1_bit = 0; } ;
 break;
 }
 Delay_ms(100);
 }
 }
}
