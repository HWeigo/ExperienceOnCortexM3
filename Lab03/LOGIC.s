symbol_label	 EQU 	0x0000 ; equate symbol with a number
		AREA MyConst, DATA, READONLY ; allocates memory for initialized data
const_label ; Your DCB, , DCW, DCD, etc. statements go here.

		AREA MyData, DATA, READWRITE ; allocates memory for uninitialized data
data_label ; Your SPACE, etc. statements go here.

		AREA MyCode, CODE, READONLY
		ENTRY
		__main PROC
		EXPORT __main ; make main available to other routines
		IMPORT xxxx ; any routines defined in other files
 ; Your code goes here.
 
		MOV R2, #0					; use R2 bit 1,2,3 as XYZ's output(00000XYZ), initialize R2 to 00000000B
		
; set output X
		AND R3, R0, #00000001B		; check num1's 1st bit by using AND
		CMP R3, #00000001B			; compare R3 with 00000001B to check if the 1st bit is 1
		BEQ xNext					; if num1's 1st bit is 1, then jump to NextX1 and see if both number are odd
		B   xIsZero					; if num1's 1st bit is not 1, then jump to xIsZero to set X=0

xNext	AND R3, R1, #00000001B		; check num2's 1st bit by using AND
		CMP R3, #00000001B			; compare R3 with 00000100B to check if the 1st bit is 1
		BNE xIsZero					; if num2's 1st bit is not 1, then jump to xIsZero to set X=0
		ORR R2, #00000100B			; if num1's 1st bit is 1, then set X = 1
		B xDone
		
xIsZero AND R2, #11111011B			; set X = 0, while not to change other bits

; set output Y
xDone   nop
		


		
done b done ; infinite loop
		ENDP	
			
Subrout_label PROC
		 push {LR} ; save Link Register
		 ; Your subroutine code goes here.
		 pop {LR} ; recover Link Register
		 bx LR ; return to main
		 ENDP
		END