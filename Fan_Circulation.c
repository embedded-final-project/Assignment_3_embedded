void fan_circulation(){
 if (PORTC.F2==1){
   PORTC = 0b00000001;
   Delay_ms(100);
   }
 else{
    PORTC = 0b00000010;
    Delay_ms(100);
 }
}