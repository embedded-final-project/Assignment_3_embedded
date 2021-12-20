#include "Virtual_Terminal.h"

void temp_on_uart() {
  TRISC.F6 = 0;       //PORTC and Pin6 is an output pin
  TRISC.F7 = 1;       //PORTC and Pin7 is an input pin
  UART1_Init(9600);     //Initializing Uart module at 9600 bps
  Delay_ms(100);        //wait for Uart module to be more stable for 100 milliseconds 
  UART1_Write_Text ("Temperature:");      //send data through Uart for microcontroller 
  UART1_Write(13);    //display text 
  UART1_Write(10);
 }
 
void uart_data()
{
 if (UART1_Data_Ready()==1)     // when the data is received but when ==0 data is not receiving 
 {
 char x;
 x = UART1_Read();      //read data received through Uart for microcontroller 
 UART1_Write(x);      //send data through Uart
 }
 } 

 void motor_on_uart()  {
 if (PORTC.F3 == 1)   //PORTC and Pin3 is an input
        {

        UART1_Write_Text ("Heater ON");
        UART1_Write(13);
        UART1_Write(10);
        Delay_ms(1000);
        }
 else if (PORTC.F3 == 0) {    //PORTC and Pin3 is an output 
        UART1_Write_Text ("Cooler ON");
        UART1_Write(13);
        UART1_Write(10);
        Delay_ms(1000);   //wait for Uart to be more stable for 1000 millisecond
        }
}
}
