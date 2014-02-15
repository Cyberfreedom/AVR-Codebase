#line 1 "F:/Dewsworld Bangladesh/RNDED/Soft Copy/11 - Data Communication/03 - UART/01 - UART-Basic-Configuration/ADC-Configuration.c"
#line 8 "F:/Dewsworld Bangladesh/RNDED/Soft Copy/11 - Data Communication/03 - UART/01 - UART-Basic-Configuration/ADC-Configuration.c"
void main() {

 UART1_Init(9600);

 while (1) {
 UART1_Write_Text("Jontropati.com\r\n");
 Delay_ms(1000);
 }
}
