// LCD module connections
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
// End LCD module connections

#define LIGHT        PORTB7_bit
#define BUZZ         PORTC5_bit
#define  ON          1
#define OFF          0

#define FORWARD      { PORTC4_bit = PORTC2_bit = 1; PORTC3_bit = PORTC1_bit = 0; }
#define BACKWARD     { PORTC4_bit = PORTC2_bit = 0; PORTC3_bit = PORTC1_bit = 1; }
#define LEFT         { PORTC2_bit = 1; PORTC4_bit = PORTC3_bit = PORTC1_bit = 0; }
#define RIGHT        { PORTC4_bit = 1; PORTC3_bit = PORTC2_bit = PORTC1_bit = 0; }
#define HALT         { PORTC4_bit = PORTC3_bit = PORTC2_bit = PORTC1_bit = 0; }


      void   rfWrite(char *in) {
       int i;


       LIGHT = ON;
//       for (i=0; i<10; i++) {
//           UART1_Write((rand()%10) + '0');
//       }
//
       for (i=0; i<25; i++) {
           UART1_Write_Text(in);
//           Delay_ms(1);
       }

       LIGHT = OFF;
}

        void   rfRead(char *in) {
       int i;

       // set a timer for max wait
       //while (!UART1_Data_Ready());

       for (i=0; i<1000; i++) {
           //if (!UART1_Data_Ready())continue;
           UART1_Read_Text(in, "XX", 50);
           if (strlen(in) && in[0] >= 'A' && in[0] <= 'Z') {
              return;
           }
       }

       if (in[0] < 'A' || in[0] > 'Z')
          *in = '\0';
}

void    initDDR() {
        DDB7_bit = 1; // light
        LIGHT = OFF;
        
        DDC5_bit = 1; // buzz
        BUZZ = OFF;
        
        DDB1_bit = DDB2_bit = 1;
        PORTB1_bit = PORTB2_bit = 1;

        DDRC |= 0b00011110;
        PORTC &= 0b11100001;
          /*
        DDRB |= 0b01111001;
        PORTB &= 0b10000110;  */
}

void    initLib() {
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
                           BUZZ = ON;
                           Delay_ms(40);
                           BUZZ = OFF;
                           FORWARD
                      break;
                      
                      case 'B':
                           BUZZ = ON;
                           Delay_ms(40);
                           BUZZ = OFF;
                           LIGHT == OFF;
                           BACKWARD
                      break;
                      
                      case 'L':
                           BUZZ = ON;
                           Delay_ms(40);
                           BUZZ = OFF;
                           LEFT
                      break;
                      
                      case 'R':
                           BUZZ = ON;
                           Delay_ms(40);
                           BUZZ = OFF;
                           RIGHT
                      break;
                      
                      default:
                           BUZZ = ON;
                           Delay_ms(40);
                           BUZZ = OFF;
                           HALT;
                      break;
               }
               Delay_ms(100);
            }
      }
}