void main() {
 ADCON1 = 0x06;
 TRISC = 0;
 PORTC = 0x0F;
 while(1){
 PORTC = 0b00000001;
 Delay_ms(1000);
  PORTC = 0b00000100;
 Delay_ms(1000);
  PORTC = 0b00000010;
 Delay_ms(1000);
  PORTC = 0b00001000;
 Delay_ms(1000);
 }
 
}