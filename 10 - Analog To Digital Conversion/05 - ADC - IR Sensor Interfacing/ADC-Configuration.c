/*
        Author        : Shamir Shakir
        Email        : dewsworld@gmail.com

        www.jontropati.com
*/

void main() {
     /*
       A variable to hold the ADC data
     */
     unsigned int adcInput;
     
     /*
       Setting PC0 as o/p and an initial
       output of LOW
     */
     DDRC |= (1 << DDC0);
     PORTC &= ~(1 << PORTC0);

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
           
           if (adcInput < 512) {
              PORTC |= (1 << PORTC0);
           } else {
             PORTC &= ~(1 << PORTC0);
           }
     }
}