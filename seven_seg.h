//macros [text replacement]

#define Digit1 PORTA.RA0  
#define Digit2 PORTA.RA1   

//functions prototypes

void SEV_SEG_initialize();  
unsigned char display_digit(unsigned char digit);
void SEV_SEG_write_number(unsigned char number);
