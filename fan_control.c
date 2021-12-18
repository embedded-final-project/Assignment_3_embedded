      #include "fan_control.h"

void motor_init(){
 ADCON1 = 0x03;
 TRISC = 0b00000100;
 TRISA.F1 = 1;
}

void fan_circulation(){
 if (PORTC.F2==1 && PORTC.F0 == 1){
   PORTC = 0b00000010;
   Delay_ms(100);
 }
 else if (PORTC.F2==1 && PORTC.F3 == 1){
   PORTC = 0b00010000;
   Delay_ms(100);
   }
}
void fan_operation(float temperature){
    if (Temperature>35){
       PORTC.F3 = 1;
       fan_circulation();
       }
    else if(Temperature<=30){
       PORTC.F0 = 1;
       fan_circulation();
        }
    else{
       PORTC = 0b00000000;
       }
       }