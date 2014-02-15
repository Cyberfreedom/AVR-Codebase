#line 1 "F:/Dewsworld Bangladesh/Research and Developement (ED) Wing/Soft Copy/10 - Analog To Digital Conversion/02 - ADC - Taking Button Input/ADC-Configuration.c"
void main() {
#line 5 "F:/Dewsworld Bangladesh/Research and Developement (ED) Wing/Soft Copy/10 - Analog To Digital Conversion/02 - ADC - Taking Button Input/ADC-Configuration.c"
 unsigned int adcInput;
#line 11 "F:/Dewsworld Bangladesh/Research and Developement (ED) Wing/Soft Copy/10 - Analog To Digital Conversion/02 - ADC - Taking Button Input/ADC-Configuration.c"
 ADC_Init();

 while (1) {
#line 22 "F:/Dewsworld Bangladesh/Research and Developement (ED) Wing/Soft Copy/10 - Analog To Digital Conversion/02 - ADC - Taking Button Input/ADC-Configuration.c"
 adcInput = ADC_Read(0);


 }
}
