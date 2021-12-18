void fan_operation(float temperature){
    if (Temperature>35){
       PORTC = 0b00000001;
       fan_circulation();
       }
    else if(Temperature<=30){
       PORTC = 0b00000001;
       fan_circulation();
        }
    else{
       PORTC = 0b00000000;
       }
}
