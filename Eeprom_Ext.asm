
_EepromExt_Read:

	MOVLW       0
	ANDWF       FARG_EepromExt_Read_addr+0, 0 
	MOVWF       R3 
	MOVF        FARG_EepromExt_Read_addr+1, 0 
	ANDLW       1
	MOVWF       R4 
	MOVF        R4, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVF        R0, 0 
	MOVWF       EepromExt_Read_ah_L0+0 
	MOVLW       255
	ANDWF       FARG_EepromExt_Read_addr+0, 0 
	MOVWF       EepromExt_Read_al_L0+0 
	CALL        _i2c_start+0, 0
	MOVF        EepromExt_Read_ah_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_EepromExt_Read0
	MOVLW       162
	MOVWF       FARG_i2c_wb_val+0 
	CALL        _i2c_wb+0, 0
	GOTO        L_EepromExt_Read1
L_EepromExt_Read0:
	MOVLW       160
	MOVWF       FARG_i2c_wb_val+0 
	CALL        _i2c_wb+0, 0
L_EepromExt_Read1:
	MOVF        EepromExt_Read_al_L0+0, 0 
	MOVWF       FARG_i2c_wb_val+0 
	CALL        _i2c_wb+0, 0
	CALL        _i2c_start+0, 0
	MOVF        EepromExt_Read_ah_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_EepromExt_Read2
	MOVLW       163
	MOVWF       FARG_i2c_wb_val+0 
	CALL        _i2c_wb+0, 0
	GOTO        L_EepromExt_Read3
L_EepromExt_Read2:
	MOVLW       161
	MOVWF       FARG_i2c_wb_val+0 
	CALL        _i2c_wb+0, 0
L_EepromExt_Read3:
	MOVLW       1
	MOVWF       FARG_i2c_rb_ack+0 
	CALL        _i2c_rb+0, 0
	MOVF        R0, 0 
	MOVWF       EepromExt_Read_ret_L0+0 
	CALL        _i2c_stop+0, 0
	MOVF        EepromExt_Read_ret_L0+0, 0 
	MOVWF       R0 
L_end_EepromExt_Read:
	RETURN      0
; end of _EepromExt_Read

_EepromExt_Write:

	MOVF        FARG_EepromExt_Write_val+0, 0 
	MOVWF       EepromExt_Write_tmp_L0+0 
	MOVLW       0
	MOVWF       EepromExt_Write_tmp_L0+1 
	MOVLW       0
	ANDWF       FARG_EepromExt_Write_addr+0, 0 
	MOVWF       R3 
	MOVF        FARG_EepromExt_Write_addr+1, 0 
	ANDLW       1
	MOVWF       R4 
	MOVF        R4, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVF        R0, 0 
	MOVWF       EepromExt_Write_ah_L0+0 
	MOVLW       255
	ANDWF       FARG_EepromExt_Write_addr+0, 0 
	MOVWF       EepromExt_Write_al_L0+0 
	CLRF        EepromExt_Write_nt_L0+0 
L_EepromExt_Write4:
	CALL        _i2c_start+0, 0
	MOVF        EepromExt_Write_ah_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_EepromExt_Write7
	MOVLW       162
	MOVWF       FARG_i2c_wb_val+0 
	CALL        _i2c_wb+0, 0
	GOTO        L_EepromExt_Write8
L_EepromExt_Write7:
	MOVLW       160
	MOVWF       FARG_i2c_wb_val+0 
	CALL        _i2c_wb+0, 0
L_EepromExt_Write8:
	MOVF        EepromExt_Write_al_L0+0, 0 
	MOVWF       FARG_i2c_wb_val+0 
	CALL        _i2c_wb+0, 0
	MOVF        EepromExt_Write_tmp_L0+0, 0 
	MOVWF       FARG_i2c_wb_val+0 
	CALL        _i2c_wb+0, 0
	CALL        _i2c_stop+0, 0
	INCF        EepromExt_Write_nt_L0+0, 1 
	MOVF        FARG_EepromExt_Write_addr+0, 0 
	MOVWF       FARG_EepromExt_Read_addr+0 
	MOVF        FARG_EepromExt_Write_addr+1, 0 
	MOVWF       FARG_EepromExt_Read_addr+1 
	CALL        _EepromExt_Read+0, 0
	MOVLW       0
	XORWF       EepromExt_Write_tmp_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__EepromExt_Write14
	MOVF        R0, 0 
	XORWF       EepromExt_Write_tmp_L0+0, 0 
L__EepromExt_Write14:
	BTFSC       STATUS+0, 2 
	GOTO        L__EepromExt_Write11
	MOVLW       10
	SUBWF       EepromExt_Write_nt_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L__EepromExt_Write11
	GOTO        L_EepromExt_Write4
L__EepromExt_Write11:
L_end_EepromExt_Write:
	RETURN      0
; end of _EepromExt_Write
