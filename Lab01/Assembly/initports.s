GPIOC_CRH EQU 0x40011004
GPIOC_ODR EQU 0x4001100C
GPIOB_CRL EQU 0x40010C00
GPIOB_CRH EQU 0x40010C04
GPIOB_ODR EQU 0x40010C0C
RCC_APB2ENR EQU 0x40021018
	AREA ARMex, CODE, READONLY
initports PROC
	EXPORT initports

	push {lr} ;store link register on stack
	;; Enable the Port B peripheral clock
	ldr r6, =RCC_APB2ENR
	mov r0, #0x08
	str r0, [r6]

	;; Set the config and mode bits for Port B bits 5-12 so they will
	;; be a push-pull output (up to 50 MHz) by setting bits 19-16
	;; to '0011'.
	ldr r6, =GPIOB_CRL
	ldr r0, =0x33300000 ;configure PB5-PB7 as outputs
	str r0, [r6]

	ldr r6, =GPIOB_CRH
	ldr r0, =0x00033333 ;configure PB8-PB12 as outputs
	str r0, [r6]

	pop {lr} ;get link value
	bx lr ;return to calling program

		ENDP
		END 