/*
        Author        : Shamir Shakir
        Email        : dewsworld@gmail.com

        www.jontropati.com
*/

void main() {

     UART1_Init(9600);

     while (1) {
           UART1_Write_Text("Jontropati.com\r\n");
           Delay_ms(1000);
     }
}