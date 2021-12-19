                                      #include "i2c_manual.h"
#include "eeprom_ext.h"
#include "rtc.h"
#include "Lcd.h"

volatile char date[10];  /*dd/mm/aa*/
volatile char time[10];  /*hh:mm:ss*/

void main()
{
  unsigned char i;
  unsigned char tmp;

  TRISB=0x00;
  TRISC=0x00;
  TRISD=0x00;
  TRISE=0x00;


  initLCD();
  i2c_init();


  //test RTC
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Out(1,1,"Test RTC");
  Lcd_Cmd(_LCD_SECOND_ROW);
  Rtc_GetDateTime(date, time);

  Lcd_Out_CP(date);
  delay_ms(2000);
  for(i=0;i<20;i++)
  {
    Rtc_GetDateTime(date, time);
    Lcd_Cmd(_LCD_SECOND_ROW);;
    Lcd_Out_CP(time);
    delay_ms(500);
  }


  //Test EEPROM EXT
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Cmd(_LCD_FIRST_ROW);
  Lcd_Out_CP("Test EEPROM EXT");


    tmp=EepromExt_Read(10);
    lcd_Out_CP(tmp);

    EepromExt_Write(10,0xA5);
    EepromExt_Write(10,0x5A);
    i= EepromExt_Read(10);

    EepromExt_Write(10,tmp);

    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Cmd(_LCD_FIRST_ROW);
    Lcd_Out_CP("Teste EEPROM EXT");
    Lcd_Cmd(_LCD_SECOND_ROW);
    if(i == 0x5A)
    {
      Lcd_Out_CP("       OK");
    }
    else
    {
      Lcd_Out_CP("      ERRO");
    }
    delay_ms(1000);

  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Cmd(_LCD_FIRST_ROW);
  Lcd_Out_CP("      Done");
  Lcd_Cmd(_LCD_SECOND_ROW);
  Lcd_Out_CP("   Press RST");



  while(1);

}
