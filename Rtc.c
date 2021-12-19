
#include"rtc.h"
#include"i2c_manual.h"


static unsigned char getd(unsigned char nn)
{
 return ((nn & 0xF0)>>4)+0x30;
}

static unsigned char getu(unsigned char nn)
{
  return (nn  & 0x0F)+0x30;
}

// Reads time and date information from RTC (PCF8563)
void Rtc_GetDateTime(volatile char date[], volatile char time[])
{
  unsigned char tmp;

  i2c_start();
  i2c_wb(0xD0);
  i2c_wb(0);

  i2c_start();
  i2c_wb(0xD1);
  tmp= 0x7F & i2c_rb(1); //segundos
  time[5]=':';
  time[6]=getd(tmp);
  time[7]=getu(tmp);
  time[8]=0;

  tmp= 0x7F & i2c_rb(1); //minutos
  time[2]=':';
  time[3]=getd(tmp);
  time[4]=getu(tmp);

  tmp= 0x3F & i2c_rb(1); //horas
  time[0]=getd(tmp);
  time[1]=getu(tmp);

  i2c_rb(1); //dia semana

  tmp= 0x3F & i2c_rb(1); //dia
  date[0]=getd(tmp);
  date[1]=getu(tmp);


  tmp= 0x1F & i2c_rb(1); //mes
  date[2]='/'; 
  date[3]=getd(tmp);
  date[4]=getu(tmp);

  tmp=  i2c_rb(0); //ano
  date[5]='/';
  date[6]=getd(tmp);
  date[7]=getu(tmp);
  date[8]=0;

  i2c_stop();

}