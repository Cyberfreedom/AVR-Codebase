#line 1 "F:/Dewsworld Bangladesh/RNDED/Soft Copy/11 - Data Communication/03 - UART/02 - UART-Receive-Control/ADC-Configuration.c"
#line 10 "F:/Dewsworld Bangladesh/RNDED/Soft Copy/11 - Data Communication/03 - UART/02 - UART-Receive-Control/ADC-Configuration.c"
void main() {
 unsigned char buffer[10];

 DDRC |= (1<<DDC0);
 PORTC &= ~(1<<PORTC0);

 UART1_Init(9600);

 UART1_Write_Text("Usages:\r\n");
 UART1_Write_Text("LED on : ONXX\r\n");
 UART1_Write_Text("LED off: OFFXX\r\n");
 UART1_Write_Text("Enter your command below\r\n");


 while (1) {
 if (UART1_Data_Ready()) {
 UART1_Read_Text(buffer, "XX", 6);

 if (strcmp(buffer, "ON") == 0) {
  PORTC0_bit  = 1;
 UART1_Write_Text("LED ON\r\n");
 } else if (strcmp(buffer, "OFF") == 0){
  PORTC0_bit  = 0;
 UART1_Write_Text("LED OFF\r\n");
 } else {
 UART1_Write_Text("Wrong code\r\n");
 }
 }
 }
}
