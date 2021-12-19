
Rtc_getd:

	MOVLW       240
	ANDWF       FARG_Rtc_getd_nn+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       48
	ADDWF       R0, 1 
L_end_getd:
	RETURN      0
; end of Rtc_getd

Rtc_getu:

	MOVLW       15
	ANDWF       FARG_Rtc_getu_nn+0, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
L_end_getu:
	RETURN      0
; end of Rtc_getu

_Rtc_GetDateTime:

	CALL        _i2c_start+0, 0
	MOVLW       208
	MOVWF       FARG_i2c_wb_val+0 
	CALL        _i2c_wb+0, 0
	CLRF        FARG_i2c_wb_val+0 
	CALL        _i2c_wb+0, 0
	CALL        _i2c_start+0, 0
	MOVLW       209
	MOVWF       FARG_i2c_wb_val+0 
	CALL        _i2c_wb+0, 0
	MOVLW       1
	MOVWF       FARG_i2c_rb_ack+0 
	CALL        _i2c_rb+0, 0
	MOVLW       127
	ANDWF       R0, 0 
	MOVWF       Rtc_GetDateTime_tmp_L0+0 
	MOVLW       5
	ADDWF       FARG_Rtc_GetDateTime_time+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_Rtc_GetDateTime_time+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       58
	MOVWF       POSTINC1+0 
	MOVLW       6
	ADDWF       FARG_Rtc_GetDateTime_time+0, 0 
	MOVWF       FLOC__Rtc_GetDateTime+0 
	MOVLW       0
	ADDWFC      FARG_Rtc_GetDateTime_time+1, 0 
	MOVWF       FLOC__Rtc_GetDateTime+1 
	MOVF        Rtc_GetDateTime_tmp_L0+0, 0 
	MOVWF       FARG_Rtc_getd_nn+0 
	CALL        Rtc_getd+0, 0
	MOVFF       FLOC__Rtc_GetDateTime+0, FSR1L+0
	MOVFF       FLOC__Rtc_GetDateTime+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVLW       7
	ADDWF       FARG_Rtc_GetDateTime_time+0, 0 
	MOVWF       FLOC__Rtc_GetDateTime+0 
	MOVLW       0
	ADDWFC      FARG_Rtc_GetDateTime_time+1, 0 
	MOVWF       FLOC__Rtc_GetDateTime+1 
	MOVF        Rtc_GetDateTime_tmp_L0+0, 0 
	MOVWF       FARG_Rtc_getu_nn+0 
	CALL        Rtc_getu+0, 0
	MOVFF       FLOC__Rtc_GetDateTime+0, FSR1L+0
	MOVFF       FLOC__Rtc_GetDateTime+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVLW       8
	ADDWF       FARG_Rtc_GetDateTime_time+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_Rtc_GetDateTime_time+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
	MOVLW       1
	MOVWF       FARG_i2c_rb_ack+0 
	CALL        _i2c_rb+0, 0
	MOVLW       127
	ANDWF       R0, 0 
	MOVWF       Rtc_GetDateTime_tmp_L0+0 
	MOVLW       2
	ADDWF       FARG_Rtc_GetDateTime_time+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_Rtc_GetDateTime_time+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       58
	MOVWF       POSTINC1+0 
	MOVLW       3
	ADDWF       FARG_Rtc_GetDateTime_time+0, 0 
	MOVWF       FLOC__Rtc_GetDateTime+0 
	MOVLW       0
	ADDWFC      FARG_Rtc_GetDateTime_time+1, 0 
	MOVWF       FLOC__Rtc_GetDateTime+1 
	MOVF        Rtc_GetDateTime_tmp_L0+0, 0 
	MOVWF       FARG_Rtc_getd_nn+0 
	CALL        Rtc_getd+0, 0
	MOVFF       FLOC__Rtc_GetDateTime+0, FSR1L+0
	MOVFF       FLOC__Rtc_GetDateTime+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVLW       4
	ADDWF       FARG_Rtc_GetDateTime_time+0, 0 
	MOVWF       FLOC__Rtc_GetDateTime+0 
	MOVLW       0
	ADDWFC      FARG_Rtc_GetDateTime_time+1, 0 
	MOVWF       FLOC__Rtc_GetDateTime+1 
	MOVF        Rtc_GetDateTime_tmp_L0+0, 0 
	MOVWF       FARG_Rtc_getu_nn+0 
	CALL        Rtc_getu+0, 0
	MOVFF       FLOC__Rtc_GetDateTime+0, FSR1L+0
	MOVFF       FLOC__Rtc_GetDateTime+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVLW       1
	MOVWF       FARG_i2c_rb_ack+0 
	CALL        _i2c_rb+0, 0
	MOVLW       63
	ANDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       Rtc_GetDateTime_tmp_L0+0 
	MOVF        FARG_Rtc_GetDateTime_time+0, 0 
	MOVWF       FLOC__Rtc_GetDateTime+0 
	MOVF        FARG_Rtc_GetDateTime_time+1, 0 
	MOVWF       FLOC__Rtc_GetDateTime+1 
	MOVF        R0, 0 
	MOVWF       FARG_Rtc_getd_nn+0 
	CALL        Rtc_getd+0, 0
	MOVFF       FLOC__Rtc_GetDateTime+0, FSR1L+0
	MOVFF       FLOC__Rtc_GetDateTime+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVLW       1
	ADDWF       FARG_Rtc_GetDateTime_time+0, 0 
	MOVWF       FLOC__Rtc_GetDateTime+0 
	MOVLW       0
	ADDWFC      FARG_Rtc_GetDateTime_time+1, 0 
	MOVWF       FLOC__Rtc_GetDateTime+1 
	MOVF        Rtc_GetDateTime_tmp_L0+0, 0 
	MOVWF       FARG_Rtc_getu_nn+0 
	CALL        Rtc_getu+0, 0
	MOVFF       FLOC__Rtc_GetDateTime+0, FSR1L+0
	MOVFF       FLOC__Rtc_GetDateTime+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVLW       1
	MOVWF       FARG_i2c_rb_ack+0 
	CALL        _i2c_rb+0, 0
	MOVLW       1
	MOVWF       FARG_i2c_rb_ack+0 
	CALL        _i2c_rb+0, 0
	MOVLW       63
	ANDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       Rtc_GetDateTime_tmp_L0+0 
	MOVF        FARG_Rtc_GetDateTime_date+0, 0 
	MOVWF       FLOC__Rtc_GetDateTime+0 
	MOVF        FARG_Rtc_GetDateTime_date+1, 0 
	MOVWF       FLOC__Rtc_GetDateTime+1 
	MOVF        R0, 0 
	MOVWF       FARG_Rtc_getd_nn+0 
	CALL        Rtc_getd+0, 0
	MOVFF       FLOC__Rtc_GetDateTime+0, FSR1L+0
	MOVFF       FLOC__Rtc_GetDateTime+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVLW       1
	ADDWF       FARG_Rtc_GetDateTime_date+0, 0 
	MOVWF       FLOC__Rtc_GetDateTime+0 
	MOVLW       0
	ADDWFC      FARG_Rtc_GetDateTime_date+1, 0 
	MOVWF       FLOC__Rtc_GetDateTime+1 
	MOVF        Rtc_GetDateTime_tmp_L0+0, 0 
	MOVWF       FARG_Rtc_getu_nn+0 
	CALL        Rtc_getu+0, 0
	MOVFF       FLOC__Rtc_GetDateTime+0, FSR1L+0
	MOVFF       FLOC__Rtc_GetDateTime+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVLW       1
	MOVWF       FARG_i2c_rb_ack+0 
	CALL        _i2c_rb+0, 0
	MOVLW       31
	ANDWF       R0, 0 
	MOVWF       Rtc_GetDateTime_tmp_L0+0 
	MOVLW       2
	ADDWF       FARG_Rtc_GetDateTime_date+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_Rtc_GetDateTime_date+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       47
	MOVWF       POSTINC1+0 
	MOVLW       3
	ADDWF       FARG_Rtc_GetDateTime_date+0, 0 
	MOVWF       FLOC__Rtc_GetDateTime+0 
	MOVLW       0
	ADDWFC      FARG_Rtc_GetDateTime_date+1, 0 
	MOVWF       FLOC__Rtc_GetDateTime+1 
	MOVF        Rtc_GetDateTime_tmp_L0+0, 0 
	MOVWF       FARG_Rtc_getd_nn+0 
	CALL        Rtc_getd+0, 0
	MOVFF       FLOC__Rtc_GetDateTime+0, FSR1L+0
	MOVFF       FLOC__Rtc_GetDateTime+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVLW       4
	ADDWF       FARG_Rtc_GetDateTime_date+0, 0 
	MOVWF       FLOC__Rtc_GetDateTime+0 
	MOVLW       0
	ADDWFC      FARG_Rtc_GetDateTime_date+1, 0 
	MOVWF       FLOC__Rtc_GetDateTime+1 
	MOVF        Rtc_GetDateTime_tmp_L0+0, 0 
	MOVWF       FARG_Rtc_getu_nn+0 
	CALL        Rtc_getu+0, 0
	MOVFF       FLOC__Rtc_GetDateTime+0, FSR1L+0
	MOVFF       FLOC__Rtc_GetDateTime+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	CLRF        FARG_i2c_rb_ack+0 
	CALL        _i2c_rb+0, 0
	MOVF        R0, 0 
	MOVWF       Rtc_GetDateTime_tmp_L0+0 
	MOVLW       5
	ADDWF       FARG_Rtc_GetDateTime_date+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_Rtc_GetDateTime_date+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       47
	MOVWF       POSTINC1+0 
	MOVLW       6
	ADDWF       FARG_Rtc_GetDateTime_date+0, 0 
	MOVWF       FLOC__Rtc_GetDateTime+0 
	MOVLW       0
	ADDWFC      FARG_Rtc_GetDateTime_date+1, 0 
	MOVWF       FLOC__Rtc_GetDateTime+1 
	MOVF        Rtc_GetDateTime_tmp_L0+0, 0 
	MOVWF       FARG_Rtc_getd_nn+0 
	CALL        Rtc_getd+0, 0
	MOVFF       FLOC__Rtc_GetDateTime+0, FSR1L+0
	MOVFF       FLOC__Rtc_GetDateTime+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVLW       7
	ADDWF       FARG_Rtc_GetDateTime_date+0, 0 
	MOVWF       FLOC__Rtc_GetDateTime+0 
	MOVLW       0
	ADDWFC      FARG_Rtc_GetDateTime_date+1, 0 
	MOVWF       FLOC__Rtc_GetDateTime+1 
	MOVF        Rtc_GetDateTime_tmp_L0+0, 0 
	MOVWF       FARG_Rtc_getu_nn+0 
	CALL        Rtc_getu+0, 0
	MOVFF       FLOC__Rtc_GetDateTime+0, FSR1L+0
	MOVFF       FLOC__Rtc_GetDateTime+1, FSR1H+0
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVLW       8
	ADDWF       FARG_Rtc_GetDateTime_date+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_Rtc_GetDateTime_date+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
	CALL        _i2c_stop+0, 0
L_end_Rtc_GetDateTime:
	RETURN      0
; end of _Rtc_GetDateTime
