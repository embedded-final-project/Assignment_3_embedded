
_temp_on_uart:

	MOVLW       25
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_temp_on_uart0:
	DECFSZ      R13, 1, 1
	BRA         L_temp_on_uart0
	DECFSZ      R12, 1, 1
	BRA         L_temp_on_uart0
	NOP
	NOP
	MOVLW       84
	MOVWF       ?lstr1_Virtual_Terminal+0 
	MOVLW       101
	MOVWF       ?lstr1_Virtual_Terminal+1 
	MOVLW       109
	MOVWF       ?lstr1_Virtual_Terminal+2 
	MOVLW       112
	MOVWF       ?lstr1_Virtual_Terminal+3 
	MOVLW       101
	MOVWF       ?lstr1_Virtual_Terminal+4 
	MOVLW       114
	MOVWF       ?lstr1_Virtual_Terminal+5 
	MOVLW       97
	MOVWF       ?lstr1_Virtual_Terminal+6 
	MOVLW       116
	MOVWF       ?lstr1_Virtual_Terminal+7 
	MOVLW       117
	MOVWF       ?lstr1_Virtual_Terminal+8 
	MOVLW       114
	MOVWF       ?lstr1_Virtual_Terminal+9 
	MOVLW       101
	MOVWF       ?lstr1_Virtual_Terminal+10 
	MOVLW       58
	MOVWF       ?lstr1_Virtual_Terminal+11 
	CLRF        ?lstr1_Virtual_Terminal+12 
	MOVLW       ?lstr1_Virtual_Terminal+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_Virtual_Terminal+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
L_end_temp_on_uart:
	RETURN      0
; end of _temp_on_uart

_uart_data:

	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_uart_data1
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
L_uart_data1:
L_end_uart_data:
	RETURN      0
; end of _uart_data

_motor_on_uart:

	BSF         PORTC+0, 3 
	BTFSS       PORTC+0, 3 
	GOTO        L_motor_on_uart2
	MOVLW       ?ICS?lstr2_Virtual_Terminal+0
	MOVWF       TBLPTRL+0 
	MOVLW       hi_addr(?ICS?lstr2_Virtual_Terminal+0)
	MOVWF       TBLPTRL+1 
	MOVLW       higher_addr(?ICS?lstr2_Virtual_Terminal+0)
	MOVWF       TBLPTRL+2 
	MOVLW       ?lstr2_Virtual_Terminal+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(?lstr2_Virtual_Terminal+0)
	MOVWF       FSR1L+1 
	MOVLW       26
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr2_Virtual_Terminal+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_Virtual_Terminal+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_motor_on_uart3:
	DECFSZ      R13, 1, 1
	BRA         L_motor_on_uart3
	DECFSZ      R12, 1, 1
	BRA         L_motor_on_uart3
	DECFSZ      R11, 1, 1
	BRA         L_motor_on_uart3
	NOP
	NOP
L_motor_on_uart2:
	BCF         PORTC+0, 3 
	BTFSS       PORTC+0, 3 
	GOTO        L_motor_on_uart4
	MOVLW       ?ICS?lstr3_Virtual_Terminal+0
	MOVWF       TBLPTRL+0 
	MOVLW       hi_addr(?ICS?lstr3_Virtual_Terminal+0)
	MOVWF       TBLPTRL+1 
	MOVLW       higher_addr(?ICS?lstr3_Virtual_Terminal+0)
	MOVWF       TBLPTRL+2 
	MOVLW       ?lstr3_Virtual_Terminal+0
	MOVWF       FSR1L+0 
	MOVLW       hi_addr(?lstr3_Virtual_Terminal+0)
	MOVWF       FSR1L+1 
	MOVLW       25
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
	MOVLW       ?lstr3_Virtual_Terminal+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr3_Virtual_Terminal+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_motor_on_uart5:
	DECFSZ      R13, 1, 1
	BRA         L_motor_on_uart5
	DECFSZ      R12, 1, 1
	BRA         L_motor_on_uart5
	DECFSZ      R11, 1, 1
	BRA         L_motor_on_uart5
	NOP
	NOP
L_motor_on_uart4:
L_end_motor_on_uart:
	RETURN      0
; end of _motor_on_uart
