#include"sev_seg.h"

void SEV_SEG_initialize()
{
 TRISA = 0;
 TRISB = 0;
 Digit1 = 0;
 Digit2 = 0;
}


unsigned char display_digit(unsigned char digit)
{
 unsigned char value;
 unsigned char SEG_MAP[10] =
 {0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90};
 value = SEG_MAP[digit];
 return (value);
 }


 void SEV_SEG_write_number(unsigned char number)
 {     
        unsigned char LD,RD;
 
        LD = number % 10;
        LATB = display_digit(LD);
        Digit2 = 1;
        delay_ms(10);
        Digit2 =0;

        RD = number / 10;
        LATB = display_digit(RD);
        Digit1 = 1;
        delay_ms(10);
        Digit1 = 0;
 }
 
 
