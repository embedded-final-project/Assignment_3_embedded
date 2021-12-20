#include "Button.h"
char flag_button_up;
char flag_button_down;
char user_in = 22;
int button(){
    if(PORTC.F5 == 1 && flag_button_up ==0){
     user_in = user_in + 1;
     flag_button_up = 1;
    }
    else if(PORTC.F5 ==0 && flag_button_up ==1){
     flag_button_up =0;
    }
    else if(PORTA.F4 == 1 && flag_button_down== 0 ){
     user_in = user_in - 1;
     flag_button_down =1;
    }
    else if(PORTA.F4 ==0 && flag_button_down== 1){
     flag_button_down =0;
    }
    return user_in;
}