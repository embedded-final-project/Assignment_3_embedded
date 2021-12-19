
_delay:

	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
L_end_delay:
	RETURN      0
; end of _delay

_i2c_init:

	BCF         TRISC4_bit+0, BitPos(TRISC4_bit+0) 
	BSF         RC3_bit+0, BitPos(RC3_bit+0) 
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
L_end_i2c_init:
	RETURN      0
; end of _i2c_init

_i2c_start:

	BSF         RC3_bit+0, BitPos(RC3_bit+0) 
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
	CALL        _delay+0, 0
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
	CALL        _delay+0, 0
L_end_i2c_start:
	RETURN      0
; end of _i2c_start

_i2c_stop:

	BSF         RC3_bit+0, BitPos(RC3_bit+0) 
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
	CALL        _delay+0, 0
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
	CALL        _delay+0, 0
L_end_i2c_stop:
	RETURN      0
; end of _i2c_stop

_i2c_wb:

	BCF         RC3_bit+0, BitPos(RC3_bit+0) 
	CLRF        i2c_wb_i_L0+0 
L_i2c_wb0:
	MOVLW       8
	SUBWF       i2c_wb_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_i2c_wb1
	MOVF        i2c_wb_i_L0+0, 0 
	SUBLW       7
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVF        R0, 0 
	MOVWF       R1 
	MOVF        FARG_i2c_wb_val+0, 0 
	MOVWF       R0 
	MOVF        R1, 0 
L__i2c_wb13:
	BZ          L__i2c_wb14
	RRCF        R0, 1 
	BCF         R0, 7 
	ADDLW       255
	GOTO        L__i2c_wb13
L__i2c_wb14:
	MOVLW       1
	ANDWF       R0, 1 
	BTFSC       R0, 0 
	GOTO        L__i2c_wb15
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
	GOTO        L__i2c_wb16
L__i2c_wb15:
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
L__i2c_wb16:
	BSF         RC3_bit+0, BitPos(RC3_bit+0) 
	CALL        _delay+0, 0
	BCF         RC3_bit+0, BitPos(RC3_bit+0) 
	INCF        i2c_wb_i_L0+0, 1 
	GOTO        L_i2c_wb0
L_i2c_wb1:
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
	CALL        _delay+0, 0
	BSF         RC3_bit+0, BitPos(RC3_bit+0) 
	CALL        _delay+0, 0
	BCF         RC3_bit+0, BitPos(RC3_bit+0) 
L_end_i2c_wb:
	RETURN      0
; end of _i2c_wb

_i2c_rb:

	CLRF        i2c_rb_ret_L0+0 
	BCF         RC3_bit+0, BitPos(RC3_bit+0) 
	BSF         TRISC4_bit+0, BitPos(TRISC4_bit+0) 
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
	CLRF        i2c_rb_i_L0+0 
L_i2c_rb3:
	MOVLW       8
	SUBWF       i2c_rb_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_i2c_rb4
	BSF         RC3_bit+0, BitPos(RC3_bit+0) 
	CALL        _delay+0, 0
	MOVF        i2c_rb_i_L0+0, 0 
	SUBLW       7
	MOVWF       R0 
	CLRF        R2 
	BTFSC       RC4_bit+0, BitPos(RC4_bit+0) 
	INCF        R2, 1 
	MOVF        R0, 0 
	MOVWF       R1 
	MOVF        R2, 0 
	MOVWF       R0 
	MOVF        R1, 0 
L__i2c_rb18:
	BZ          L__i2c_rb19
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L__i2c_rb18
L__i2c_rb19:
	MOVF        R0, 0 
	IORWF       i2c_rb_ret_L0+0, 1 
	BCF         RC3_bit+0, BitPos(RC3_bit+0) 
	INCF        i2c_rb_i_L0+0, 1 
	GOTO        L_i2c_rb3
L_i2c_rb4:
	BCF         TRISC4_bit+0, BitPos(TRISC4_bit+0) 
	MOVF        FARG_i2c_rb_ack+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_i2c_rb6
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
	GOTO        L_i2c_rb7
L_i2c_rb6:
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
L_i2c_rb7:
	CALL        _delay+0, 0
	BSF         RC3_bit+0, BitPos(RC3_bit+0) 
	CALL        _delay+0, 0
	BCF         RC3_bit+0, BitPos(RC3_bit+0) 
	MOVF        i2c_rb_ret_L0+0, 0 
	MOVWF       R0 
L_end_i2c_rb:
	RETURN      0
; end of _i2c_rb
