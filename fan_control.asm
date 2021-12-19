
_motor_init:

	MOVLW       3
	MOVWF       ADCON1+0 
	MOVLW       4
	MOVWF       TRISC+0 
	BSF         TRISA+0, 1 
L_end_motor_init:
	RETURN      0
; end of _motor_init

_fan_operation:

	MOVF        FARG_fan_operation_Temperature+0, 0 
	MOVWF       R4 
	MOVF        FARG_fan_operation_Temperature+1, 0 
	MOVWF       R5 
	MOVF        FARG_fan_operation_Temperature+2, 0 
	MOVWF       R6 
	MOVF        FARG_fan_operation_Temperature+3, 0 
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
	GOTO        L_fan_operation0
	BSF         PORTC+0, 3 
	CALL        _fan_circulation+0, 0
	GOTO        L_fan_operation1
L_fan_operation0:
	MOVF        FARG_fan_operation_Temperature+0, 0 
	MOVWF       R4 
	MOVF        FARG_fan_operation_Temperature+1, 0 
	MOVWF       R5 
	MOVF        FARG_fan_operation_Temperature+2, 0 
	MOVWF       R6 
	MOVF        FARG_fan_operation_Temperature+3, 0 
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
	GOTO        L_fan_operation2
	BSF         PORTC+0, 0 
	CALL        _fan_circulation+0, 0
	GOTO        L_fan_operation3
L_fan_operation2:
	CLRF        PORTC+0 
L_fan_operation3:
L_fan_operation1:
L_end_fan_operation:
	RETURN      0
; end of _fan_operation

_fan_circulation:

	BTFSS       PORTC+0, 2 
	GOTO        L_fan_circulation6
	BTFSS       PORTC+0, 0 
	GOTO        L_fan_circulation6
L__fan_circulation26:
	MOVLW       2
	MOVWF       PORTC+0 
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_fan_circulation7:
	DECFSZ      R13, 1, 1
	BRA         L_fan_circulation7
	DECFSZ      R12, 1, 1
	BRA         L_fan_circulation7
	NOP
	NOP
	GOTO        L_fan_circulation8
L_fan_circulation6:
	BTFSS       PORTC+0, 2 
	GOTO        L_fan_circulation11
	BTFSS       PORTC+0, 3 
	GOTO        L_fan_circulation11
L__fan_circulation25:
	MOVLW       16
	MOVWF       PORTC+0 
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_fan_circulation12:
	DECFSZ      R13, 1, 1
	BRA         L_fan_circulation12
	DECFSZ      R12, 1, 1
	BRA         L_fan_circulation12
	NOP
	NOP
	GOTO        L_fan_circulation13
L_fan_circulation11:
	BTFSC       PORTC+0, 2 
	GOTO        L_fan_circulation16
	BTFSS       PORTC+0, 1 
	GOTO        L_fan_circulation16
L__fan_circulation24:
	MOVLW       1
	MOVWF       PORTC+0 
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_fan_circulation17:
	DECFSZ      R13, 1, 1
	BRA         L_fan_circulation17
	DECFSZ      R12, 1, 1
	BRA         L_fan_circulation17
	NOP
	NOP
	GOTO        L_fan_circulation18
L_fan_circulation16:
	BTFSC       PORTC+0, 2 
	GOTO        L_fan_circulation21
	BTFSS       PORTC+0, 4 
	GOTO        L_fan_circulation21
L__fan_circulation23:
	MOVLW       8
	MOVWF       PORTC+0 
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_fan_circulation22:
	DECFSZ      R13, 1, 1
	BRA         L_fan_circulation22
	DECFSZ      R12, 1, 1
	BRA         L_fan_circulation22
	NOP
	NOP
L_fan_circulation21:
L_fan_circulation18:
L_fan_circulation13:
L_fan_circulation8:
L_end_fan_circulation:
	RETURN      0
; end of _fan_circulation
