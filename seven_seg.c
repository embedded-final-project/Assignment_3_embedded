#include "seven_seg.h"      //[including header file ]

void SEV_SEG_initialize() //function initializes seven segment used pins
{
 TRISA.F0 = 0;   //setting pin direction of pin 1 portA tO output
 TRISA.F1 = 0;  //setting pin direction of pin 2 portA tO output
 TRISB = 0;     //setting PORTB direction to output
 Digit1 = 0;    //variable being replaced with 'PORTA.RA0' from macros found in header file
 Digit2 = 0;    ///variable being replaced with 'PORTA.RA1' from macros found in header file
}


unsigned char display_digit(unsigned char digit)   //function stores and displays a digit value on seven-segment 
{
 unsigned char value;   //defined variable to store value of the digit in
 unsigned char SEG_MAP[10] =
 {0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90};    //mapping of seven-segment common anode
 value = SEG_MAP[digit]; //assign the chosen digit to the variable 'value'
 return (value);        //return this value
 }


 void SEV_SEG_write_number(unsigned char number)  //function writes full number of two digits on seven segment
 {     
        unsigned char LD,RD;    //defining local variable
 
        LD = number % 10;       //take modulus the entered number to seperate left digit
        LATB = display_digit(LD);  //display this digit on segment 1
        Digit2 = 1;           
        Delay_ms(10);   //delay of 10 milliseconds
        Digit2 =0;    

        RD = number / 10;       //divide entered number by 10 to seperate the right digit
        LATB = display_digit(RD);  //display digit on seven segment
        Digit1 = 1;   
        Delay_ms(10);           //delay of 10 milliseconds
        Digit1 = 0;
 }