#include "fan_control.h"

void motor_init(){
 ADCON1 = 0x03;                                       //Alternative of ansel that defines 1st 2 bits as digital
 TRISC.F0 = 0;                                        //define portc, pin 0 as output (motor leg)
 TRISC.F1 = 0;                                        //define portc, pin 1 as output (motor leg)
 TRISC.F3 = 0;                                        //define portc, pin 3 as output (motor leg)
 TRISC.F4 = 0;                                        //define portc, pin 4 as output (motor leg)
 TRISC.F2 = 1;                                        //define portc, pin 2 as input  (Circulation button)
}
void fan_operation(float Temperature, int limit){      //Function that return nothing but takes to argument both actual temperature and user preference
    if (Temperature>limit+1){                          //if the actual temperature more than the user preference (1 to create range)
       PORTC.F3 = 1;                                   //Turn on Cooler to decrease temperature
       fan_circulation();                              //Call fan circulation function
       }
    else if(Temperature<limit-1){                     //Test if temperature less tahn user preference
       PORTC.F0 = 1;                                   //Turn on the heater
       fan_circulation();                              //call fan circulation function
        }
    else{                                               //Otherwise (when both equal)
       PORTC = 0b00000000;                              //Turn off both heater and cooler
       }
       }
void fan_circulation(){                                 //Define fan circulation function
 if (PORTC.F2==1 && PORTC.F0 == 1){                     //Test if circulation button is one and heater  is clockwise
   PORTC = 0b00000010;                                  //Turn heater anti clockwise
   //Delay_ms(100);
 }
 else if (PORTC.F2==1 && PORTC.F3 == 1){                //if button is clicked but cooler is clockwise
   PORTC = 0b00010000;                                  //change to anticlockwise
   //Delay_ms(100);
   }
 else if (PORTC.F2==0 && PORTC.F1 == 1){                 //if button is off and heater is anti-clockwise
   PORTC = 0b00000001;                                   //change to clockwise
   //Delay_ms(100);
   }
 else if (PORTC.F2==0 && PORTC.F4 == 1){                 //same as heater for the cooler
   PORTC = 0b00001000;
   //Delay_ms(100);
   }
}