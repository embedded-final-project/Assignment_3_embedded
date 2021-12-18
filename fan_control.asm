
_motor_init:

;fan_control.c,3 :: 		void motor_init(){
;fan_control.c,4 :: 		ADCON1 = 0x03;
	MOVLW       3
	MOVWF       ADCON1+0 
;fan_control.c,5 :: 		TRISC = 0b00000100;
	MOVLW       4
	MOVWF       TRISC+0 
;fan_control.c,6 :: 		TRISA.F1 = 1;
	BSF         TRISA+0, 1 
;fan_control.c,7 :: 		}
L_end_motor_init:
	RETURN      0
; end of _motor_init

_fan_operation:

;fan_control.c,8 :: 		void fan_operation(float temperature){
;fan_control.c,9 :: 		if (Temperature>35){
	MOVF        FARG_fan_operation_temperature+0, 0 
	MOVWF       R4 
	MOVF        FARG_fan_operation_temperature+1, 0 
	MOVWF       R5 
	MOVF        FARG_fan_operation_temperature+2, 0 
	MOVWF       R6 
	MOVF        FARG_fan_operation_temperature+3, 0 
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
;fan_control.c,10 :: 		PORTC.F3 = 1;
	BSF         PORTC+0, 3 
;fan_control.c,11 :: 		fan_circulation();
	CALL        _fan_circulation+0, 0
;fan_control.c,12 :: 		}
	GOTO        L_fan_operation1
L_fan_operation0:
;fan_control.c,13 :: 		else if(Temperature<=30){
	MOVF        FARG_fan_operation_temperature+0, 0 
	MOVWF       R4 
	MOVF        FARG_fan_operation_temperature+1, 0 
	MOVWF       R5 
	MOVF        FARG_fan_operation_temperature+2, 0 
	MOVWF       R6 
	MOVF        FARG_fan_operation_temperature+3, 0 
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
;fan_control.c,14 :: 		PORTC.F0 = 1;
	BSF         PORTC+0, 0 
;fan_control.c,15 :: 		fan_circulation();
	CALL        _fan_circulation+0, 0
;fan_control.c,16 :: 		}
	GOTO        L_fan_operation3
L_fan_operation2:
;fan_control.c,18 :: 		PORTC = 0b00000000;
	CLRF        PORTC+0 
;fan_control.c,19 :: 		}
L_fan_operation3:
L_fan_operation1:
;fan_control.c,20 :: 		}
L_end_fan_operation:
	RETURN      0
; end of _fan_operation

_fan_circulation:

;fan_control.c,21 :: 		void fan_circulation(){
;fan_control.c,22 :: 		if (PORTC.F2==1 && PORTC.F0 == 1){
	BTFSS       PORTC+0, 2 
	GOTO        L_fan_circulation6
	BTFSS       PORTC+0, 0 
	GOTO        L_fan_circulation6
L__fan_circulation26:
;fan_control.c,23 :: 		PORTC = 0b00000010;
	MOVLW       2
	MOVWF       PORTC+0 
;fan_control.c,24 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_fan_circulation7:
	DECFSZ      R13, 1, 1
	BRA         L_fan_circulation7
	DECFSZ      R12, 1, 1
	BRA         L_fan_circulation7
	DECFSZ      R11, 1, 1
	BRA         L_fan_circulation7
	NOP
;fan_control.c,25 :: 		}
	GOTO        L_fan_circulation8
L_fan_circulation6:
;fan_control.c,26 :: 		else if (PORTC.F2==1 && PORTC.F3 == 1){
	BTFSS       PORTC+0, 2 
	GOTO        L_fan_circulation11
	BTFSS       PORTC+0, 3 
	GOTO        L_fan_circulation11
L__fan_circulation25:
;fan_control.c,27 :: 		PORTC = 0b00010000;
	MOVLW       16
	MOVWF       PORTC+0 
;fan_control.c,28 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_fan_circulation12:
	DECFSZ      R13, 1, 1
	BRA         L_fan_circulation12
	DECFSZ      R12, 1, 1
	BRA         L_fan_circulation12
	DECFSZ      R11, 1, 1
	BRA         L_fan_circulation12
	NOP
;fan_control.c,29 :: 		}
	GOTO        L_fan_circulation13
L_fan_circulation11:
;fan_control.c,30 :: 		else if (PORTC.F2==0 && PORTC.F1 == 1){
	BTFSC       PORTC+0, 2 
	GOTO        L_fan_circulation16
	BTFSS       PORTC+0, 1 
	GOTO        L_fan_circulation16
L__fan_circulation24:
;fan_control.c,31 :: 		PORTC = 0b00000001;
	MOVLW       1
	MOVWF       PORTC+0 
;fan_control.c,32 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_fan_circulation17:
	DECFSZ      R13, 1, 1
	BRA         L_fan_circulation17
	DECFSZ      R12, 1, 1
	BRA         L_fan_circulation17
	DECFSZ      R11, 1, 1
	BRA         L_fan_circulation17
	NOP
;fan_control.c,33 :: 		}
	GOTO        L_fan_circulation18
L_fan_circulation16:
;fan_control.c,34 :: 		else if (PORTC.F2==0 && PORTC.F4 == 1){
	BTFSC       PORTC+0, 2 
	GOTO        L_fan_circulation21
	BTFSS       PORTC+0, 4 
	GOTO        L_fan_circulation21
L__fan_circulation23:
;fan_control.c,35 :: 		PORTC = 0b00001000;
	MOVLW       8
	MOVWF       PORTC+0 
;fan_control.c,36 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_fan_circulation22:
	DECFSZ      R13, 1, 1
	BRA         L_fan_circulation22
	DECFSZ      R12, 1, 1
	BRA         L_fan_circulation22
	DECFSZ      R11, 1, 1
	BRA         L_fan_circulation22
	NOP
;fan_control.c,37 :: 		}
L_fan_circulation21:
L_fan_circulation18:
L_fan_circulation13:
L_fan_circulation8:
;fan_control.c,38 :: 		}
L_end_fan_circulation:
	RETURN      0
; end of _fan_circulation
