#include "temp.h"  //header file
 void Temp_init(){   //initializing temp
    TRISD = 0; //PortD is an output
    TRISA.F3 = 1; //PortA is an input 
    TRISE =0; //portE in an output
    }
 void LCD_In(){  //initializing LCD
  Lcd_Init(); //Initialize LCD
  Lcd_Cmd(_LCD_CLEAR); //Clear LCD
  Lcd_Cmd(_LCD_CURSOR_OFF); //Cursor off
  Lcd_Out(1,1,"Temp:"); //print "temp" in row 1 coloumn 1
  }
  float Temp_Read(int ADC_pin){ //Taking function from ADC and returns it as a float
    float Temp_reading; //variable to store Temp_reading
    char temp_txt[5];
    Temp_reading = (float)ADC_Read(ADC_pin)*0.48828125; //Read abaloge voltage conerting to celsius. calculating temp
    FloatToStr_FixLen(Temp_reading,temp_txt,4); //float to string
    //sprintf(temp_txt,"%f",Temp_reading);
    Lcd_Out(1,6,temp_txt); //LCD prints out temperature in row 1 coloumn 6
    Lcd_Out(1,12,"Team3"); //LCD prints out "team3" in row 1 coloumn 12
    return Temp_reading;
 }
 void Display_Temp(float Temp_reading, int limit){
      if (Temp_reading>limit+1){ //If Temp_reading is more than limit+1 
       Lcd_Out(2,1,"Decreasing FANOFF"); } //Lcd prints out decreasing fanoff in row 2 coloumn 1 
    else if(Temp_reading<=limit-1){ //If Temp_reading is less than or equal limit-1
       Lcd_Out(2,1,"Increasing FANON"); //Lcd prints out increasing fanon in row 2 coloumn 1
 }
    else { //If Temp_reading is in range
      Lcd_Out(2,1,"Reached   "); //LCD prints out reached in row 2 coloumn 1
       }
}
