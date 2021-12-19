
_main:

	CALL        _motor_init+0, 0
	CALL        _Temp_init+0, 0
	CALL        _LCD_In+0, 0
	CALL        _temp_on_uart+0, 0
L_main0:
	MOVLW       2
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
	MOVF        R0, 0 
	MOVWF       FARG_Display_Temp_Temp_reading+0 
	MOVF        R1, 0 
	MOVWF       FARG_Display_Temp_Temp_reading+1 
	MOVF        R2, 0 
	MOVWF       FARG_Display_Temp_Temp_reading+2 
	MOVF        R3, 0 
	MOVWF       FARG_Display_Temp_Temp_reading+3 
	CALL        _Display_Temp+0, 0
	MOVF        _Temp_reading+0, 0 
	MOVWF       FARG_fan_operation_temperature+0 
	MOVF        _Temp_reading+1, 0 
	MOVWF       FARG_fan_operation_temperature+1 
	MOVF        _Temp_reading+2, 0 
	MOVWF       FARG_fan_operation_temperature+2 
	MOVF        _Temp_reading+3, 0 
	MOVWF       FARG_fan_operation_temperature+3 
	CALL        _fan_operation+0, 0
	CALL        _motor_on_uart+0, 0
	GOTO        L_main0
L_end_main:
	GOTO        $+0
; end of _main
