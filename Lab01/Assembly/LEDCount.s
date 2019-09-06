GPIOB_ODR EQU 0x40010C0C
LEDDELAY EQU 0x09FFFF
MAXVAL EQU 8192
		AREA ARMex, CODE, READONLY
		ENTRY
__main PROC
		EXPORT __main
		IMPORT initports
	bl initports
top mov r2, #31 ; Load R2 with count starting value
	ldr r6, =GPIOB_ODR ; load r6 with Port B output data register address
loop
	str r2, [r6] ; send current value of counter out Port B
	ldr r1, =LEDDELAY ; delay so we can see the count
delay1
	subs r1, #1 ; subtract 1 from delay value
	nop ; do nothing
	bne delay1 ; loop until you reach zero

	add r2,#128 ; increment count
	cmp r2,#MAXVAL ; compare counter to maximum count
	bgt top ; if it's greater than MAXVAL, you're done, start over
	b loop ; else display next value
	ENDP
	END 