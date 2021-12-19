
_Temp_init:

	CLRF        TRISD+0 
	MOVLW       255
	MOVWF       TRISA+0 
	CLRF        TRISE+0 
L_end_Temp_init:
	RETURN      0
; end of _Temp_init

_LCD_In:

	CALL        _Lcd_Init+0, 0
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       84
	MOVWF       ?lstr1_temp+0 
	MOVLW       101
	MOVWF       ?lstr1_temp+1 
	MOVLW       109
	MOVWF       ?lstr1_temp+2 
	MOVLW       112
	MOVWF       ?lstr1_temp+3 
	MOVLW       58
	MOVWF       ?lstr1_temp+4 
	CLRF        ?lstr1_temp+5 
	MOVLW       ?lstr1_temp+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_temp+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_end_LCD_In:
	RETURN      0
; end of _LCD_In

_Temp_Read:

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
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       Temp_Read_temp_txt_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(Temp_Read_temp_txt_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       12
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       84
	MOVWF       ?lstr2_temp+0 
	MOVLW       101
	MOVWF       ?lstr2_temp+1 
	MOVLW       97
	MOVWF       ?lstr2_temp+2 
	MOVLW       109
	MOVWF       ?lstr2_temp+3 
	MOVLW       51
	MOVWF       ?lstr2_temp+4 
	CLRF        ?lstr2_temp+5 
	MOVLW       ?lstr2_temp+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_temp+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	MOVF        Temp_Read_Temp_reading_L0+0, 0 
	MOVWF       R0 
	MOVF        Temp_Read_Temp_reading_L0+1, 0 
	MOVWF       R1 
	MOVF        Temp_Read_Temp_reading_L0+2, 0 
	MOVWF       R2 
	MOVF        Temp_Read_Temp_reading_L0+3, 0 
	MOVWF       R3 
L_end_Temp_Read:
	RETURN      0
; end of _Temp_Read

_Display_Temp:

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
	GOTO        L_Display_Temp0
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?ICS?lstr3_temp+0
	MOVWF       TBLPTRL+0 
	MOVLW       hi_addr(?ICS?lstr3_temp+0)
	MOVWF       TBLPTRL+1 
	MOVLW       higher_addr(?ICS?lstr3_temp+0)
	MOVWF       TBLPTRL+2 
	MOVLW       ?lstr3_temp+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(?lstr3_temp+0)
	MOVWF       FSR1L+1 
	MOVLW       18
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr3_temp+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_temp+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	GOTO        L_Display_Temp1
L_Display_Temp0:
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
	GOTO        L_Display_Temp2
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?ICS?lstr4_temp+0
	MOVWF       TBLPTRL+0 
	MOVLW       hi_addr(?ICS?lstr4_temp+0)
	MOVWF       TBLPTRL+1 
	MOVLW       higher_addr(?ICS?lstr4_temp+0)
	MOVWF       TBLPTRL+2 
	MOVLW       ?lstr4_temp+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(?lstr4_temp+0)
	MOVWF       FSR1L+1 
	MOVLW       16
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr4_temp+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_temp+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	GOTO        L_Display_Temp3
L_Display_Temp2:
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       82
	MOVWF       ?lstr5_temp+0 
	MOVLW       101
	MOVWF       ?lstr5_temp+1 
	MOVLW       97
	MOVWF       ?lstr5_temp+2 
	MOVLW       99
	MOVWF       ?lstr5_temp+3 
	MOVLW       104
	MOVWF       ?lstr5_temp+4 
	MOVLW       101
	MOVWF       ?lstr5_temp+5 
	MOVLW       100
	MOVWF       ?lstr5_temp+6 
	CLRF        ?lstr5_temp+7 
	MOVLW       ?lstr5_temp+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_temp+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_Display_Temp3:
L_Display_Temp1:
L_end_Display_Temp:
	RETURN      0
; end of _Display_Temp
