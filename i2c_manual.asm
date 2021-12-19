
_delay:

;i2c_manual.c,3 :: 		void delay(void)
;i2c_manual.c,6 :: 		NOP
	NOP
;i2c_manual.c,7 :: 		NOP
	NOP
;i2c_manual.c,8 :: 		NOP
	NOP
;i2c_manual.c,9 :: 		NOP
	NOP
;i2c_manual.c,10 :: 		NOP
	NOP
;i2c_manual.c,11 :: 		NOP
	NOP
;i2c_manual.c,12 :: 		NOP
	NOP
;i2c_manual.c,13 :: 		NOP
	NOP
;i2c_manual.c,15 :: 		}
L_end_delay:
	RETURN      0
; end of _delay

_i2c_init:

;i2c_manual.c,17 :: 		void i2c_init(void)
;i2c_manual.c,19 :: 		TIDAT=0;
	BCF         TRISC4_bit+0, BitPos(TRISC4_bit+0) 
;i2c_manual.c,20 :: 		ICLK=1;
	BSF         RC3_bit+0, BitPos(RC3_bit+0) 
;i2c_manual.c,21 :: 		IDAT=1;
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
;i2c_manual.c,22 :: 		}
L_end_i2c_init:
	RETURN      0
; end of _i2c_init

_i2c_start:

;i2c_manual.c,24 :: 		void i2c_start(void)
;i2c_manual.c,26 :: 		ICLK=1;
	BSF         RC3_bit+0, BitPos(RC3_bit+0) 
;i2c_manual.c,27 :: 		IDAT=1;
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
;i2c_manual.c,28 :: 		delay();
	CALL        _delay+0, 0
;i2c_manual.c,29 :: 		IDAT=0;
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
;i2c_manual.c,30 :: 		delay();
	CALL        _delay+0, 0
;i2c_manual.c,31 :: 		}
L_end_i2c_start:
	RETURN      0
; end of _i2c_start

_i2c_stop:

;i2c_manual.c,33 :: 		void i2c_stop(void)
;i2c_manual.c,35 :: 		ICLK=1;
	BSF         RC3_bit+0, BitPos(RC3_bit+0) 
;i2c_manual.c,36 :: 		IDAT=0;
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
;i2c_manual.c,37 :: 		delay();
	CALL        _delay+0, 0
;i2c_manual.c,38 :: 		IDAT=1;
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
;i2c_manual.c,39 :: 		delay();
	CALL        _delay+0, 0
;i2c_manual.c,40 :: 		}
L_end_i2c_stop:
	RETURN      0
; end of _i2c_stop

_i2c_wb:

;i2c_manual.c,42 :: 		void i2c_wb(unsigned char val)
;i2c_manual.c,45 :: 		ICLK=0;
	BCF         RC3_bit+0, BitPos(RC3_bit+0) 
;i2c_manual.c,47 :: 		for(i=0;i<8;i++)
	CLRF        i2c_wb_i_L0+0 
L_i2c_wb0:
	MOVLW       8
	SUBWF       i2c_wb_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_i2c_wb1
;i2c_manual.c,49 :: 		IDAT=((val>>(7-i))& 0x01);
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
;i2c_manual.c,50 :: 		ICLK=1;
	BSF         RC3_bit+0, BitPos(RC3_bit+0) 
;i2c_manual.c,51 :: 		delay();
	CALL        _delay+0, 0
;i2c_manual.c,52 :: 		ICLK=0;
	BCF         RC3_bit+0, BitPos(RC3_bit+0) 
;i2c_manual.c,47 :: 		for(i=0;i<8;i++)
	INCF        i2c_wb_i_L0+0, 1 
;i2c_manual.c,53 :: 		}
	GOTO        L_i2c_wb0
L_i2c_wb1:
;i2c_manual.c,54 :: 		IDAT=1;
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
;i2c_manual.c,55 :: 		delay();
	CALL        _delay+0, 0
;i2c_manual.c,56 :: 		ICLK=1;
	BSF         RC3_bit+0, BitPos(RC3_bit+0) 
;i2c_manual.c,57 :: 		delay();
	CALL        _delay+0, 0
;i2c_manual.c,58 :: 		ICLK=0;
	BCF         RC3_bit+0, BitPos(RC3_bit+0) 
;i2c_manual.c,59 :: 		}
L_end_i2c_wb:
	RETURN      0
; end of _i2c_wb

_i2c_rb:

;i2c_manual.c,61 :: 		unsigned char i2c_rb(unsigned char ack)
;i2c_manual.c,64 :: 		unsigned char ret=0;
	CLRF        i2c_rb_ret_L0+0 
;i2c_manual.c,66 :: 		ICLK=0;
	BCF         RC3_bit+0, BitPos(RC3_bit+0) 
;i2c_manual.c,67 :: 		TIDAT=1;
	BSF         TRISC4_bit+0, BitPos(TRISC4_bit+0) 
;i2c_manual.c,68 :: 		IDAT=1;
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
;i2c_manual.c,70 :: 		for(i=0;i<8;i++)
	CLRF        i2c_rb_i_L0+0 
L_i2c_rb3:
	MOVLW       8
	SUBWF       i2c_rb_i_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_i2c_rb4
;i2c_manual.c,72 :: 		ICLK=1;
	BSF         RC3_bit+0, BitPos(RC3_bit+0) 
;i2c_manual.c,73 :: 		delay();
	CALL        _delay+0, 0
;i2c_manual.c,74 :: 		ret|=(IDAT<<(7-i));
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
;i2c_manual.c,75 :: 		ICLK=0;
	BCF         RC3_bit+0, BitPos(RC3_bit+0) 
;i2c_manual.c,70 :: 		for(i=0;i<8;i++)
	INCF        i2c_rb_i_L0+0, 1 
;i2c_manual.c,76 :: 		}
	GOTO        L_i2c_rb3
L_i2c_rb4:
;i2c_manual.c,77 :: 		TIDAT=0;
	BCF         TRISC4_bit+0, BitPos(TRISC4_bit+0) 
;i2c_manual.c,78 :: 		if(ack)
	MOVF        FARG_i2c_rb_ack+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_i2c_rb6
;i2c_manual.c,79 :: 		IDAT=0;
	BCF         RC4_bit+0, BitPos(RC4_bit+0) 
	GOTO        L_i2c_rb7
L_i2c_rb6:
;i2c_manual.c,81 :: 		IDAT=1;
	BSF         RC4_bit+0, BitPos(RC4_bit+0) 
L_i2c_rb7:
;i2c_manual.c,82 :: 		delay();
	CALL        _delay+0, 0
;i2c_manual.c,83 :: 		ICLK=1;
	BSF         RC3_bit+0, BitPos(RC3_bit+0) 
;i2c_manual.c,84 :: 		delay();
	CALL        _delay+0, 0
;i2c_manual.c,85 :: 		ICLK=0;
	BCF         RC3_bit+0, BitPos(RC3_bit+0) 
;i2c_manual.c,87 :: 		return ret;
	MOVF        i2c_rb_ret_L0+0, 0 
	MOVWF       R0 
;i2c_manual.c,88 :: 		}
L_end_i2c_rb:
	RETURN      0
; end of _i2c_rb
