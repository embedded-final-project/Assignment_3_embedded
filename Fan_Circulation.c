void fan_circulation(){
 if (PORTC.F2==1 && PORTC = 0b00000010){
   PORTC = 0b00000001;
   Delay_ms(100);
   }
 else if (PORTC.F2==1 && PORTC = 0b00000001){
   PORTC = 0b00000010;
   Delay_ms(100);
 }
 else if (PORTC.F2==1 && PORTC = 0b00001000){
   PORTC = 0b00010000;
   Delay_ms(100);
   }
 else if (PORTC.F2==1 && PORTC = 0b00010000){
   PORTC = 0b00001000;
   Delay_ms(100);
   }
 else if (PORTC.F2==0){
    PORTC = 0b00000010;
    Delay_ms(100);
 }
}