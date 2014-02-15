#line 1 "F:/Dewsworld Bangladesh/RNDED/Soft Copy/10 - Analog To Digital Conversion/05 - ADC - IR Sensor Interfacing/ADC-Configuration.c"
#line 8 "F:/Dewsworld Bangladesh/RNDED/Soft Copy/10 - Analog To Digital Conversion/05 - ADC - IR Sensor Interfacing/ADC-Configuration.c"
void main() {
#line 12 "F:/Dewsworld Bangladesh/RNDED/Soft Copy/10 - Analog To Digital Conversion/05 - ADC - IR Sensor Interfacing/ADC-Configuration.c"
 unsigned int adcInput;
#line 18 "F:/Dewsworld Bangladesh/RNDED/Soft Copy/10 - Analog To Digital Conversion/05 - ADC - IR Sensor Interfacing/ADC-Configuration.c"
 DDRC |= (1 << DDC0);
 PORTC &= ~(1 << PORTC0);
#line 25 "F:/Dewsworld Bangladesh/RNDED/Soft Copy/10 - Analog To Digital Conversion/05 - ADC - IR Sensor Interfacing/ADC-Configuration.c"
 ADC_Init();

 while (1) {
#line 36 "F:/Dewsworld Bangladesh/RNDED/Soft Copy/10 - Analog To Digital Conversion/05 - ADC - IR Sensor Interfacing/ADC-Configuration.c"
 adcInput = ADC_Read(0);



 if (adcInput < 512) {
 PORTC |= (1 << PORTC0);
 } else {
 PORTC &= ~(1 << PORTC0);
 }
 }
}
