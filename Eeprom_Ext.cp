#line 1 "P:/Final_Projects_Github/Group_3/Eeprom_Ext.c"
#line 1 "p:/final_projects_github/group_3/i2c_manual.h"





extern void i2c_init(void);
extern void i2c_start(void);
extern void i2c_stop(void);
extern void i2c_wb(unsigned char val);
extern unsigned char i2c_rb(unsigned char ack);
extern void i2c_acktst(unsigned char val);
#line 1 "p:/final_projects_github/group_3/eeprom_ext.h"

unsigned char EepromExt_Read(unsigned int addr);

void EepromExt_Write(unsigned int addr, unsigned char val);
#line 4 "P:/Final_Projects_Github/Group_3/Eeprom_Ext.c"
unsigned char EepromExt_Read(unsigned int addr)
{
 unsigned char ret;
 unsigned char ah;
 unsigned char al;

 ah=(addr&0x0100)>>8;
 al=addr&0x00FF;

 i2c_start();
 if(ah)
 {
 i2c_wb(0xA2);
 }
 else
 {
 i2c_wb(0xA0);
 }
 i2c_wb(al);

 i2c_start();
 if(ah)
 {
 i2c_wb(0xA3);
 }
 else
 {
 i2c_wb(0xA1);
 }
 ret=i2c_rb(1);
 i2c_stop();

 return ret;
}


void EepromExt_Write(unsigned int addr, unsigned char val)
{
 unsigned int tmp;
 unsigned char ah;
 unsigned char al;
 unsigned char nt;

 tmp=val;
 ah=(addr&0x0100)>>8;
 al=addr&0x00FF;
 nt=0;

 do
 {
 i2c_start();
 if(ah)
 {
 i2c_wb(0xA2);
 }
 else
 {
 i2c_wb(0xA0);
 }
 i2c_wb(al);
 i2c_wb(tmp);
 i2c_stop();

 nt++;
 }
 while((tmp != EepromExt_Read(addr))&&(nt < 10));
}
