/*
	Author	: Shamir Shakir
	Email	: dewsworld@gmail.com

	www.jontropati.com
*/

void main() {
     /*
       A variable to hold the ADC data
     */
     unsigned int adcInput;

     /*
       ADC_Init()
       Use this method to initialize ADC library
     */
     ADC_Init();
   
     while (1) {
           /*
             ADC_Read(channel)
             Use this method to make an ADC conversion.
             channel is the ADC Channel to take the input.
             
             below takes the ADC input from ADC0 or
             PIN 40 of ATMEGA16A
           */
           adcInput = ADC_Read(0);
           
           // Process the 'adcInput' variable...
     }
}