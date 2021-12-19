
_Temp_init:

;temp.c,2 :: 		void Temp_init(){
;temp.c,3 :: 		TRISD = 0;
	CLRF        TRISD+0 
;temp.c,4 :: 		TRISA = 0xFF;
	MOVLW       255
	MOVWF       TRISA+0 
;temp.c,5 :: 		TRISE =0;
	CLRF        TRISE+0 
;temp.c,6 :: 		}
L_end_Temp_init:
	RETURN      0
; end of _Temp_init

_LCD_In:

;temp.c,7 :: 		void LCD_In(){
;temp.c,8 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;temp.c,9 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;temp.c,10 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;temp.c,11 :: 		Lcd_Out(1,1,"Temp:");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_temp+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_temp+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;temp.c,12 :: 		}
L_end_LCD_In:
	RETURN      0
; end of _LCD_In

_Temp_Read:

;temp.c,13 :: 		float Temp_Read(int ADC_pin){
;temp.c,16 :: 		Temp_reading = (float)ADC_Read(ADC_pin)*0.48828125;
	MOVF        FARG_Temp_Read_ADC_pin+0, 0 
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       122
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       Temp_Read_Temp_reading_L0+0 
	MOVF        R1, 0 
	MOVWF       Temp_Read_Temp_reading_L0+1 
	MOVF        R2, 0 
	MOVWF       Temp_Read_Temp_reading_L0+2 
	MOVF        R3, 0 
	MOVWF       Temp_Read_Temp_reading_L0+3 
;temp.c,17 :: 		FloatToStr_FixLen(Temp_reading,temp_txt,4);
	MOVF        R0, 0 
	MOVWF       FARG_FloatToStr_FixLen_fnum+0 
	MOVF        R1, 0 
	MOVWF       FARG_FloatToStr_FixLen_fnum+1 
	MOVF        R2, 0 
	MOVWF       FARG_FloatToStr_FixLen_fnum+2 
	MOVF        R3, 0 
	MOVWF       FARG_FloatToStr_FixLen_fnum+3 
	MOVLW       Temp_Read_temp_txt_L0+0
	MOVWF       FARG_FloatToStr_FixLen_str+0 
	MOVLW       hi_addr(Temp_Read_temp_txt_L0+0)
	MOVWF       FARG_FloatToStr_FixLen_str+1 
	MOVLW       4
	MOVWF       FARG_FloatToStr_FixLen_len+0 
	CALL        _FloatToStr_FixLen+0, 0
;temp.c,18 :: 		Lcd_Out(1,6,temp_txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       Temp_Read_temp_txt_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(Temp_Read_temp_txt_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;temp.c,19 :: 		Lcd_Out(1,12,"Team3");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       12
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_temp+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_temp+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;temp.c,20 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_Temp_Read0:
	DECFSZ      R13, 1, 1
	BRA         L_Temp_Read0
	DECFSZ      R12, 1, 1
	BRA         L_Temp_Read0
	DECFSZ      R11, 1, 1
	BRA         L_Temp_Read0
	NOP
;temp.c,21 :: 		return Temp_reading;
	MOVF        Temp_Read_Temp_reading_L0+0, 0 
	MOVWF       R0 
	MOVF        Temp_Read_Temp_reading_L0+1, 0 
	MOVWF       R1 
	MOVF        Temp_Read_Temp_reading_L0+2, 0 
	MOVWF       R2 
	MOVF        Temp_Read_Temp_reading_L0+3, 0 
	MOVWF       R3 
;temp.c,22 :: 		}
L_end_Temp_Read:
	RETURN      0
; end of _Temp_Read

_Display_Temp:

;temp.c,23 :: 		void Display_Temp(float Temp_reading){
;temp.c,24 :: 		if (Temp_reading>35){
	MOVF        FARG_Display_Temp_Temp_reading+0, 0 
	MOVWF       R4 
	MOVF        FARG_Display_Temp_Temp_reading+1, 0 
	MOVWF       R5 
	MOVF        FARG_Display_Temp_Temp_reading+2, 0 
	MOVWF       R6 
	MOVF        FARG_Display_Temp_Temp_reading+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       12
	MOVWF       R2 
	MOVLW       132
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Display_Temp1
;temp.c,25 :: 		Lcd_Out(2,1,"Decreasing FANOFF"); }
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_temp+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_temp+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	GOTO        L_Display_Temp2
L_Display_Temp1:
;temp.c,26 :: 		else if(Temp_reading<=30){
	MOVF        FARG_Display_Temp_Temp_reading+0, 0 
	MOVWF       R4 
	MOVF        FARG_Display_Temp_Temp_reading+1, 0 
	MOVWF       R5 
	MOVF        FARG_Display_Temp_Temp_reading+2, 0 
	MOVWF       R6 
	MOVF        FARG_Display_Temp_Temp_reading+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       112
	MOVWF       R2 
	MOVLW       131
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Display_Temp3
;temp.c,27 :: 		Lcd_Out(2,1,"IncreasingFANON");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_temp+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_temp+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;temp.c,28 :: 		}
	GOTO        L_Display_Temp4
L_Display_Temp3:
;temp.c,30 :: 		Lcd_Out(2,1,"Reached");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_temp+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_temp+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;temp.c,31 :: 		}
L_Display_Temp4:
L_Display_Temp2:
;temp.c,32 :: 		}
L_end_Display_Temp:
	RETURN      0
; end of _Display_Temp
