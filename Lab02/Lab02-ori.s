numOfValues 	EQU 	10 ; define the num of values to be averaged
	
			AREA MyConst, DATA, READONLY ; set memory for initialized data


			AREA MyData, DATA, READWRITE ; set memory for uninitialized data
			
array			SPACE	numOfValues*2		; allocate 10 bytes for data array
sumOfValues		SPACE	2		; allocate space for sum of 

			AREA MyCode, CODE, READONLY
		
	ENTRY
__main PROC
	
			EXPORT __main ; make main available to other routines
			
			; calculate sum
			mov R11, #numOfValues		; set the num of values as the conter for loop
			subs R11, #1				; decrement counter
			ldr R0, =array				; point to first element of array
			ldrh R1, [R0], #2			; load 1st element to R1, and post-increment pointer

addloop		ldrh R2, [R0], #2			; load next element to R2, and post-increment pointer
			add R1, R2					; add next element to R1
			subs R11, #1				; decrement counter
			bne addloop					; loop "addloop" if counter is nozero 
			
			; calculate average
			ldr R0, =sumOfValues		; point to the address which stores sum of all values
			strh R1, [R0]				; store sum in memory sumOfValues
			mov R11, #numOfValues		; load num of values in R11
			udiv R3, R1, R11			; divide sum of all values by num of values, and store the average in R3
			
			; calculate remainder
			mul R4, R3, R11				; multiply average by num 
			sub R2, R1, R4				; subtract the sum by multiplication of average and num to get the remainder

done 		b done ; infinite loop

			ENDP
			END