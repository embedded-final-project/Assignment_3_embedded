
_main:

;Team3.c,21 :: 		void main() {
;Team3.c,22 :: 		motor_init();
	CALL        _motor_init+0, 0
;Team3.c,23 :: 		Temp_init();
	CALL        _Temp_init+0, 0
;Team3.c,24 :: 		LCD_In();
	CALL        _LCD_In+0, 0
;Team3.c,26 :: 		while(1){
L_main0:
;Team3.c,27 :: 		Temp_reading = Temp_Read(1);
	MOVLW       1
	MOVWF       FARG_Temp_Read_ADC_pin+0 
	MOVLW       0
	MOVWF       FARG_Temp_Read_ADC_pin+1 
	CALL        _Temp_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _Temp_reading+0 
	MOVF        R1, 0 
	MOVWF       _Temp_reading+1 
	MOVF        R2, 0 
	MOVWF       _Temp_reading+2 
	MOVF        R3, 0 
	MOVWF       _Temp_reading+3 
;Team3.c,28 :: 		Display_Temp(Temp_reading);
	MOVF        R0, 0 
	MOVWF       FARG_Display_Temp_Temp_reading+0 
	MOVF        R1, 0 
	MOVWF       FARG_Display_Temp_Temp_reading+1 
	MOVF        R2, 0 
	MOVWF       FARG_Display_Temp_Temp_reading+2 
	MOVF        R3, 0 
	MOVWF       FARG_Display_Temp_Temp_reading+3 
	CALL        _Display_Temp+0, 0
;Team3.c,29 :: 		fan_operation(Temp_reading);
	MOVF        _Temp_reading+0, 0 
	MOVWF       FARG_fan_operation_temperature+0 
	MOVF        _Temp_reading+1, 0 
	MOVWF       FARG_fan_operation_temperature+1 
	MOVF        _Temp_reading+2, 0 
	MOVWF       FARG_fan_operation_temperature+2 
	MOVF        _Temp_reading+3, 0 
	MOVWF       FARG_fan_operation_temperature+3 
	CALL        _fan_operation+0, 0
;Team3.c,30 :: 		}
	GOTO        L_main0
;Team3.c,31 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
