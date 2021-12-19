#line 1 "P:/Final_Projects_Github/Group_3/i2c_manual.c"
#line 1 "p:/final_projects_github/group_3/i2c_manual.h"





extern void i2c_init(void);
extern void i2c_start(void);
extern void i2c_stop(void);
extern void i2c_wb(unsigned char val);
extern unsigned char i2c_rb(unsigned char ack);
extern void i2c_acktst(unsigned char val);
#line 3 "P:/Final_Projects_Github/Group_3/i2c_manual.c"
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
  TRISC4_bit =0;
  RC3_bit =1;
  RC4_bit =1;
}

void i2c_start(void)
{
  RC3_bit =1;
  RC4_bit =1;
 delay();
  RC4_bit =0;
 delay();
}

void i2c_stop(void)
{
  RC3_bit =1;
  RC4_bit =0;
 delay();
  RC4_bit =1;
 delay();
}

void i2c_wb(unsigned char val)
{
 char i;
  RC3_bit =0;

 for(i=0;i<8;i++)
 {
  RC4_bit =((val>>(7-i))& 0x01);
  RC3_bit =1;
 delay();
  RC3_bit =0;
 }
  RC4_bit =1;
 delay();
  RC3_bit =1;
 delay();
  RC3_bit =0;
}

unsigned char i2c_rb(unsigned char ack)
{
 char i;
 unsigned char ret=0;

  RC3_bit =0;
  TRISC4_bit =1;
  RC4_bit =1;

 for(i=0;i<8;i++)
 {
  RC3_bit =1;
 delay();
 ret|=( RC4_bit <<(7-i));
  RC3_bit =0;
 }
  TRISC4_bit =0;
 if(ack)
  RC4_bit =0;
 else
  RC4_bit =1;
 delay();
  RC3_bit =1;
 delay();
  RC3_bit =0;

 return ret;
}
