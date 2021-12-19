#include "i2c_manual.h"
 
void delay(void)
{
  asm{
       NOP
       NOP
       NOP
       NOP
       NOP
       NOP
       NOP
       NOP
      }
}

void i2c_init(void)
{
  TIDAT=0;
  ICLK=1;
  IDAT=1;
}

void i2c_start(void)
{
  ICLK=1;
  IDAT=1;
  delay();
  IDAT=0;
  delay();
}

void i2c_stop(void)
{
  ICLK=1;
  IDAT=0;
  delay();
  IDAT=1;
  delay();
}

void i2c_wb(unsigned char val)
{
  char i;
  ICLK=0;
  //for(i=7;i>=0;i--)  //bug mikroc
  for(i=0;i<8;i++)
  {
    IDAT=((val>>(7-i))& 0x01);
    ICLK=1;
    delay();
    ICLK=0;
  }        
  IDAT=1;
  delay();
  ICLK=1;
  delay();
  ICLK=0;
}

unsigned char i2c_rb(unsigned char ack)
{
  char i;
  unsigned char ret=0;

  ICLK=0;
  TIDAT=1;
  IDAT=1;
  //for(i=7;i>=0;i--) bug mikroc
  for(i=0;i<8;i++)
  {
    ICLK=1;
    delay();
    ret|=(IDAT<<(7-i));
    ICLK=0;
  }
  TIDAT=0;
  if(ack)
    IDAT=0;
  else
    IDAT=1;
  delay();
  ICLK=1;
  delay();
  ICLK=0;

  return ret;
}