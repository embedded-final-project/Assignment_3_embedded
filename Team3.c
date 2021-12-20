//including header files 
#include "fan_control.h"
//including header files 
#include "temp.h"
#include "Virtual_Terminal.h"
#include "seven_seg.h"
#include "Button.h"

//#define ENABLE_UART

char temp_txt[5];    //text array to store temperature 
char user;            //uninitialized global variable to store value of number reached by button

//setting LCD connections 
sbit LCD_RS at LATE2_bit; 
sbit LCD_EN at LATE1_bit;
sbit LCD_D4 at LATD4_bit;
sbit LCD_D5 at LATD5_bit;
sbit LCD_D6 at LATD6_bit;
sbit LCD_D7 at LATD7_bit;
//setting LCD pin direction
sbit LCD_RS_Direction at TRISE2_bit;
sbit LCD_EN_Direction at TRISE1_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;         
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit; 
//end of LCD connections


void main() {                              
 
 float Temp_reading;   //uninitialized global variable
 motor_init();  //calling function for motor initialization
 Temp_init();  //calling function for temperature sensor initialization
 LCD_In();    //calling function for LCD initialization 
 SEV_SEG_initialize();   //calling function for Seven-segment initialization 
 Delay_ms(1000);     //delay for 1000 milliseconds 
 
 #if defined (ENABLE_UART)  //function operates if only defined 
 temp_on_uart();   //calling function that presents temperature reading on terminal screen through UART
 //uart_data(Temp_reading); 
 #endif
 
 while(1){
    user = button();   //call Button function to take input from user and incrementing this input //store this value in 'user' variable
    SEV_SEG_write_number(user); //function to display this stored on value seven segment
    Temp_reading = Temp_Read(2);   //store ADC temperature reading  
    Display_Temp(Temp_reading, user); //
    fan_operation(Temp_reading, user); 
    //motor_on_uart();
 }
 }
