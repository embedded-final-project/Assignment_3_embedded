
Rtc_getd:

;Rtc.c,6 :: 		static unsigned char getd(unsigned char nn)
;Rtc.c,8 :: 		return ((nn & 0xF0)>>4)+0x30;
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
;Rtc.c,9 :: 		}
L_end_getd:
	RETURN      0
; end of Rtc_getd

Rtc_getu:

;Rtc.c,11 :: 		static unsigned char getu(unsigned char nn)
;Rtc.c,13 :: 		return (nn  & 0x0F)+0x30;
	MOVLW       15
	ANDWF       FARG_Rtc_getu_nn+0, 0 
	MOVWF       R0 
	MOVLW       48
	ADDWF       R0, 1 
;Rtc.c,14 :: 		}
L_end_getu:
	RETURN      0
; end of Rtc_getu

_Rtc_GetDateTime:

;Rtc.c,17 :: 		void Rtc_GetDateTime(volatile char date[], volatile char time[])
;Rtc.c,21 :: 		i2c_start();
	CALL        _i2c_start+0, 0
;Rtc.c,22 :: 		i2c_wb(0xD0);
	MOVLW       208
	MOVWF       FARG_i2c_wb_val+0 
	CALL        _i2c_wb+0, 0
;Rtc.c,23 :: 		i2c_wb(0);
	CLRF        FARG_i2c_wb_val+0 
	CALL        _i2c_wb+0, 0
;Rtc.c,25 :: 		i2c_start();
	CALL        _i2c_start+0, 0
;Rtc.c,26 :: 		i2c_wb(0xD1);
	MOVLW       209
	MOVWF       FARG_i2c_wb_val+0 
	CALL        _i2c_wb+0, 0
;Rtc.c,27 :: 		tmp= 0x7F & i2c_rb(1); //segundos
	MOVLW       1
	MOVWF       FARG_i2c_rb_ack+0 
	CALL        _i2c_rb+0, 0
	MOVLW       127
	ANDWF       R0, 0 
	MOVWF       Rtc_GetDateTime_tmp_L0+0 
;Rtc.c,28 :: 		time[5]=':';
	MOVLW       5
	ADDWF       FARG_Rtc_GetDateTime_time+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_Rtc_GetDateTime_time+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       58
	MOVWF       POSTINC1+0 
;Rtc.c,29 :: 		time[6]=getd(tmp);
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
;Rtc.c,30 :: 		time[7]=getu(tmp);
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
;Rtc.c,31 :: 		time[8]=0;
	MOVLW       8
	ADDWF       FARG_Rtc_GetDateTime_time+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_Rtc_GetDateTime_time+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;Rtc.c,33 :: 		tmp= 0x7F & i2c_rb(1); //minutos
	MOVLW       1
	MOVWF       FARG_i2c_rb_ack+0 
	CALL        _i2c_rb+0, 0
	MOVLW       127
	ANDWF       R0, 0 
	MOVWF       Rtc_GetDateTime_tmp_L0+0 
;Rtc.c,34 :: 		time[2]=':';
	MOVLW       2
	ADDWF       FARG_Rtc_GetDateTime_time+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_Rtc_GetDateTime_time+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       58
	MOVWF       POSTINC1+0 
;Rtc.c,35 :: 		time[3]=getd(tmp);
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
;Rtc.c,36 :: 		time[4]=getu(tmp);
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
;Rtc.c,38 :: 		tmp= 0x3F & i2c_rb(1); //horas
	MOVLW       1
	MOVWF       FARG_i2c_rb_ack+0 
	CALL        _i2c_rb+0, 0
	MOVLW       63
	ANDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       Rtc_GetDateTime_tmp_L0+0 
;Rtc.c,39 :: 		time[0]=getd(tmp);
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
;Rtc.c,40 :: 		time[1]=getu(tmp);
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
;Rtc.c,42 :: 		i2c_rb(1); //dia semana
	MOVLW       1
	MOVWF       FARG_i2c_rb_ack+0 
	CALL        _i2c_rb+0, 0
;Rtc.c,44 :: 		tmp= 0x3F & i2c_rb(1); //dia
	MOVLW       1
	MOVWF       FARG_i2c_rb_ack+0 
	CALL        _i2c_rb+0, 0
	MOVLW       63
	ANDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       Rtc_GetDateTime_tmp_L0+0 
;Rtc.c,45 :: 		date[0]=getd(tmp);
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
;Rtc.c,46 :: 		date[1]=getu(tmp);
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
;Rtc.c,49 :: 		tmp= 0x1F & i2c_rb(1); //mes
	MOVLW       1
	MOVWF       FARG_i2c_rb_ack+0 
	CALL        _i2c_rb+0, 0
	MOVLW       31
	ANDWF       R0, 0 
	MOVWF       Rtc_GetDateTime_tmp_L0+0 
;Rtc.c,50 :: 		date[2]='/';
	MOVLW       2
	ADDWF       FARG_Rtc_GetDateTime_date+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_Rtc_GetDateTime_date+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       47
	MOVWF       POSTINC1+0 
;Rtc.c,51 :: 		date[3]=getd(tmp);
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
;Rtc.c,52 :: 		date[4]=getu(tmp);
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
;Rtc.c,54 :: 		tmp=  i2c_rb(0); //ano
	CLRF        FARG_i2c_rb_ack+0 
	CALL        _i2c_rb+0, 0
	MOVF        R0, 0 
	MOVWF       Rtc_GetDateTime_tmp_L0+0 
;Rtc.c,55 :: 		date[5]='/';
	MOVLW       5
	ADDWF       FARG_Rtc_GetDateTime_date+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_Rtc_GetDateTime_date+1, 0 
	MOVWF       FSR1L+1 
	MOVLW       47
	MOVWF       POSTINC1+0 
;Rtc.c,56 :: 		date[6]=getd(tmp);
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
;Rtc.c,57 :: 		date[7]=getu(tmp);
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
;Rtc.c,58 :: 		date[8]=0;
	MOVLW       8
	ADDWF       FARG_Rtc_GetDateTime_date+0, 0 
	MOVWF       FSR1L+0 
	MOVLW       0
	ADDWFC      FARG_Rtc_GetDateTime_date+1, 0 
	MOVWF       FSR1L+1 
	CLRF        POSTINC1+0 
;Rtc.c,60 :: 		i2c_stop();
	CALL        _i2c_stop+0, 0
;Rtc.c,62 :: 		}
L_end_Rtc_GetDateTime:
	RETURN      0
; end of _Rtc_GetDateTime
