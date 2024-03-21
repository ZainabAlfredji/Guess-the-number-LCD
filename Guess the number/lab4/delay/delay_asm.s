/*
 * delay_asm.s
 * These delay functions are assembly subroutines.
 * Different kinds of delays through macros and subroutines
 *
 * Author:	Judy Sibai, Zainab Alfredji
 *
 * Date:	2022-04-01
 */ 



 #define _SFR_ASM_COMPAT 1
 #define __SFR_OFFSET 0
 #include <avr/io.h>
;==============================================================================
; Delay of 1 µs (including RCALL)
;==============================================================================
.global delay_1_micros
delay_1_micros:   /* UPPGIFT: komplettera med ett antal NOP-instruktioner!!! */
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	RET

;==============================================================================
; Delay of X µs
;	LDI + RCALL = 4 cycles
;==============================================================================
.global delay_micros
delay_micros:   /* UPPGIFT: komplettera med ett antal NOP-instruktioner!!! */
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP

	DEC R24
	CPI R24, 0			; more loops to do?
	BRNE delay_micros	;	continue!
	RET

;==============================================================================
; Delay of X ms
;	LDI + RCALL = 4 cycles
;==============================================================================
.global delay_ms
delay_ms:
	MOV R18, R24
loop_dms:
	LDI R24, 250
	RCALL delay_micros
	LDI R24, 250
	RCALL delay_micros
	LDI R24, 250
	RCALL delay_micros
	LDI R24, 250
	RCALL delay_micros
	DEC R18
	CPI R18, 0			; more loops to do?
	BRNE loop_dms		;	continue!
	RET



;==============================================================================
; Delay seconds, R24 input
;==============================================================================
.global delay_s
delay_s:
	MOV R18, R24

loop_s:
	LDI R24, 250
	RCALL delay_ms
	LDI R24, 250
	RCALL delay_ms
	LDI R24, 250
	RCALL delay_ms
	LDI R24, 250
	RCALL delay_ms
	DEC R18
	CPI R18, 0			; more loops to do?
	BRNE loop_s			; continue!
	RET


