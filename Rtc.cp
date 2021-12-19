#line 1 "P:/Final_Projects_Github/Group_3/Rtc.c"
#line 1 "p:/final_projects_github/group_3/rtc.h"
void Rtc_GetDateTime(volatile char date[], volatile char time[]);
#line 1 "p:/final_projects_github/group_3/i2c_manual.h"





extern void i2c_init(void);
extern void i2c_start(void);
extern void i2c_stop(void);
extern void i2c_wb(unsigned char val);
extern unsigned char i2c_rb(unsigned char ack);
extern void i2c_acktst(unsigned char val);
#line 6 "P:/Final_Projects_Github/Group_3/Rtc.c"
static unsigned char getd(unsigned char nn)
{
 return ((nn & 0xF0)>>4)+0x30;
}

static unsigned char getu(unsigned char nn)
{
 return (nn & 0x0F)+0x30;
}


void Rtc_GetDateTime(volatile char date[], volatile char time[])
{
 unsigned char tmp;

 i2c_start();
 i2c_wb(0xD0);
 i2c_wb(0);

 i2c_start();
 i2c_wb(0xD1);
 tmp= 0x7F & i2c_rb(1);
 time[5]=':';
 time[6]=getd(tmp);
 time[7]=getu(tmp);
 time[8]=0;

 tmp= 0x7F & i2c_rb(1);
 time[2]=':';
 time[3]=getd(tmp);
 time[4]=getu(tmp);

 tmp= 0x3F & i2c_rb(1);
 time[0]=getd(tmp);
 time[1]=getu(tmp);

 i2c_rb(1);

 tmp= 0x3F & i2c_rb(1);
 date[0]=getd(tmp);
 date[1]=getu(tmp);


 tmp= 0x1F & i2c_rb(1);
 date[2]='/';
 date[3]=getd(tmp);
 date[4]=getu(tmp);

 tmp= i2c_rb(0);
 date[5]='/';
 date[6]=getd(tmp);
 date[7]=getu(tmp);
 date[8]=0;

 i2c_stop();

}
