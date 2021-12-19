#line 1 "P:/Final_Projects_Github/Group_3/Team3.c"
#line 1 "p:/final_projects_github/group_3/fan_control.h"
void motor_init();
void fan_circulation();
void fan_operation(float temperature);
#line 1 "p:/final_projects_github/group_3/temp.h"
void Temp_init();
void LCD_In();
float Temp_Read(int ADC_pin);
void Display_Temp(float Temp_reading);
#line 4 "P:/Final_Projects_Github/Group_3/Team3.c"
char temp_txt[5];

sbit LCD_RS at LATE2_bit;
sbit LCD_EN at LATE1_bit;
sbit LCD_D4 at LATD4_bit;
sbit LCD_D5 at LATD5_bit;
sbit LCD_D6 at LATD6_bit;
sbit LCD_D7 at LATD7_bit;
sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;

float Temp_reading;

void main() {
 motor_init();
 Temp_init();
 LCD_In();

 while(1){
 Temp_reading = Temp_Read(1);
 Display_Temp(Temp_reading);
 fan_operation(Temp_reading);
 }
 }
