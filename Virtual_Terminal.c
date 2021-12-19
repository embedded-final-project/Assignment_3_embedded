#include "Virtual_Terminal.h"

void temp_on_uart() {
  UART1_Init(9600);
  Delay_ms(100);
  UART1_Write_Text ("Temperature:");
  UART1_Write(13);
  UART1_Write(10);
 }
 
void uart_data()
{
 if (UART1_Data_Ready()==1)
 {
 char x;
 x = UART1_Read();
 UART1_Write(x);
 }
 } 

 void motor_on_uart()  {
 if (PORTC.F3 = 1)
        {

        UART1_Write_Text ("motor rotate to the Right");
        UART1_Write(13);
        UART1_Write(10);
        Delay_ms(1000);
        }
 if (PORTC.F3 = 0) {
        UART1_Write_Text ("motor rotate to the Left");
        UART1_Write(13);
        UART1_Write(10);
        Delay_ms(1000);
        }
}