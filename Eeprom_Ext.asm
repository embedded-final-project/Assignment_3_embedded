
_EepromExt_Read:

;Eeprom_Ext.c,4 :: 		unsigned char EepromExt_Read(unsigned int addr)
;Eeprom_Ext.c,10 :: 		ah=(addr&0x0100)>>8;
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
;Eeprom_Ext.c,11 :: 		al=addr&0x00FF;
	MOVLW       255
	ANDWF       FARG_EepromExt_Read_addr+0, 0 
	MOVWF       EepromExt_Read_al_L0+0 
;Eeprom_Ext.c,13 :: 		i2c_start();
	CALL        _i2c_start+0, 0
;Eeprom_Ext.c,14 :: 		if(ah)
	MOVF        EepromExt_Read_ah_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_EepromExt_Read0
;Eeprom_Ext.c,16 :: 		i2c_wb(0xA2);
	MOVLW       162
	MOVWF       FARG_i2c_wb_val+0 
	CALL        _i2c_wb+0, 0
;Eeprom_Ext.c,17 :: 		}
	GOTO        L_EepromExt_Read1
L_EepromExt_Read0:
;Eeprom_Ext.c,20 :: 		i2c_wb(0xA0);
	MOVLW       160
	MOVWF       FARG_i2c_wb_val+0 
	CALL        _i2c_wb+0, 0
;Eeprom_Ext.c,21 :: 		}
L_EepromExt_Read1:
;Eeprom_Ext.c,22 :: 		i2c_wb(al);
	MOVF        EepromExt_Read_al_L0+0, 0 
	MOVWF       FARG_i2c_wb_val+0 
	CALL        _i2c_wb+0, 0
;Eeprom_Ext.c,24 :: 		i2c_start();
	CALL        _i2c_start+0, 0
;Eeprom_Ext.c,25 :: 		if(ah)
	MOVF        EepromExt_Read_ah_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_EepromExt_Read2
;Eeprom_Ext.c,27 :: 		i2c_wb(0xA3);
	MOVLW       163
	MOVWF       FARG_i2c_wb_val+0 
	CALL        _i2c_wb+0, 0
;Eeprom_Ext.c,28 :: 		}
	GOTO        L_EepromExt_Read3
L_EepromExt_Read2:
;Eeprom_Ext.c,31 :: 		i2c_wb(0xA1);
	MOVLW       161
	MOVWF       FARG_i2c_wb_val+0 
	CALL        _i2c_wb+0, 0
;Eeprom_Ext.c,32 :: 		}
L_EepromExt_Read3:
;Eeprom_Ext.c,33 :: 		ret=i2c_rb(1);
	MOVLW       1
	MOVWF       FARG_i2c_rb_ack+0 
	CALL        _i2c_rb+0, 0
	MOVF        R0, 0 
	MOVWF       EepromExt_Read_ret_L0+0 
;Eeprom_Ext.c,34 :: 		i2c_stop();
	CALL        _i2c_stop+0, 0
;Eeprom_Ext.c,36 :: 		return ret;
	MOVF        EepromExt_Read_ret_L0+0, 0 
	MOVWF       R0 
;Eeprom_Ext.c,37 :: 		}
L_end_EepromExt_Read:
	RETURN      0
; end of _EepromExt_Read

_EepromExt_Write:

;Eeprom_Ext.c,40 :: 		void EepromExt_Write(unsigned int addr, unsigned char val)
;Eeprom_Ext.c,47 :: 		tmp=val;
	MOVF        FARG_EepromExt_Write_val+0, 0 
	MOVWF       EepromExt_Write_tmp_L0+0 
	MOVLW       0
	MOVWF       EepromExt_Write_tmp_L0+1 
;Eeprom_Ext.c,48 :: 		ah=(addr&0x0100)>>8;
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
;Eeprom_Ext.c,49 :: 		al=addr&0x00FF;
	MOVLW       255
	ANDWF       FARG_EepromExt_Write_addr+0, 0 
	MOVWF       EepromExt_Write_al_L0+0 
;Eeprom_Ext.c,50 :: 		nt=0;
	CLRF        EepromExt_Write_nt_L0+0 
;Eeprom_Ext.c,52 :: 		do
L_EepromExt_Write4:
;Eeprom_Ext.c,54 :: 		i2c_start();
	CALL        _i2c_start+0, 0
;Eeprom_Ext.c,55 :: 		if(ah)
	MOVF        EepromExt_Write_ah_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_EepromExt_Write7
;Eeprom_Ext.c,57 :: 		i2c_wb(0xA2);
	MOVLW       162
	MOVWF       FARG_i2c_wb_val+0 
	CALL        _i2c_wb+0, 0
;Eeprom_Ext.c,58 :: 		}
	GOTO        L_EepromExt_Write8
L_EepromExt_Write7:
;Eeprom_Ext.c,61 :: 		i2c_wb(0xA0);
	MOVLW       160
	MOVWF       FARG_i2c_wb_val+0 
	CALL        _i2c_wb+0, 0
;Eeprom_Ext.c,62 :: 		}
L_EepromExt_Write8:
;Eeprom_Ext.c,63 :: 		i2c_wb(al);
	MOVF        EepromExt_Write_al_L0+0, 0 
	MOVWF       FARG_i2c_wb_val+0 
	CALL        _i2c_wb+0, 0
;Eeprom_Ext.c,64 :: 		i2c_wb(tmp);
	MOVF        EepromExt_Write_tmp_L0+0, 0 
	MOVWF       FARG_i2c_wb_val+0 
	CALL        _i2c_wb+0, 0
;Eeprom_Ext.c,65 :: 		i2c_stop();
	CALL        _i2c_stop+0, 0
;Eeprom_Ext.c,67 :: 		nt++;
	INCF        EepromExt_Write_nt_L0+0, 1 
;Eeprom_Ext.c,69 :: 		while((tmp != EepromExt_Read(addr))&&(nt < 10));
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
;Eeprom_Ext.c,70 :: 		}
L_end_EepromExt_Write:
	RETURN      0
; end of _EepromExt_Write
