  #include "temp.h"
 void Temp_init(){
    TRISD = 0;
    TRISA = 0xFF;
    TRISE =0;
    }
 void LCD_In(){
  Lcd_Init();
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Cmd(_LCD_CURSOR_OFF);
  Lcd_Out(1,1,"Temp:");
  }
  float Temp_Read(int ADC_pin){
    float Temp_reading;
    char temp_txt[5];
    Temp_reading = (float)ADC_Read(ADC_pin)*0.48828125;
    FloatToStr_FixLen(Temp_reading,temp_txt,4);
    Lcd_Out(1,6,temp_txt);
    delay_ms(100);
    return Temp_reading;
 }
 void Display_Temp(float Temp_reading){
      if (Temp_reading>35){
       Lcd_Out(2,1,"Decreasing"); }
    else if(Temp_reading<=30){
       Lcd_Out(2,1,"Increasing");
 }
    else {
      Lcd_Out(2,1,"Reached");
       }
}