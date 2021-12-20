#include "temp.h"
 void Temp_init(){
    TRISD = 0; //port D ouput
    TRISA.F3 = 1;  //port A input
    TRISE =0; //port E output
    }
 void LCD_In(){
  Lcd_Init(); //Initialize LCD
  Lcd_Cmd(_LCD_CLEAR); //Clear LCD
  Lcd_Cmd(_LCD_CURSOR_OFF); //cursor off
  Lcd_Out(1,1,"Temp:"); //print"temp" in row 1 coloumn 1
  }
  float Temp_Read(int ADC_pin){ 
    float Temp_reading; //variable to store Temp_reading
    char temp_txt[5];
    Temp_reading = (float)ADC_Read(ADC_pin)*0.48828125; //Read analoge voltage converting to celsius. calculating temp
    FloatToStr_FixLen(Temp_reading,temp_txt,4); //flost to string
    //sprintf(temp_txt,"%f",Temp_reading);
    Lcd_Out(1,6,temp_txt); //print out temp in row 1 coloumn 6 
    Lcd_Out(1,12,"Team3"); //print out"team3" in row 1 coloumn 12
    return Temp_reading;
 }
 void Display_Temp(float Temp_reading, int limit){
      if (Temp_reading>limit+1){  //if temp reading is less that the limit+1
       Lcd_Out(2,1,"Decreasing FANOFF"); }  //lcd prints out "decreasing fan off"
    else if(Temp_reading<=limit-1){  //if temp reading is more than limit-1
       Lcd_Out(2,1,"Increasing FANON"); //lcd prints "increasing fan on"
 }
    else { //if in range
      Lcd_Out(2,1,"Reached   ");  //lcd prints reached
       }
}
