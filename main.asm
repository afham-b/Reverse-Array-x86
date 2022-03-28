; main.asm - Assembly language source file
; Author: Afham Bashir 
; Date:   02/19/2021
; Description:  Reverse Array Program

; main.asm - Assembly language source file

.386
.model flat,stdcall
.stack 1000h

.data

	array1 SDWORD 10,20,30,40,50,60,70,80
	array2 SDWORD LENGTHOF array1 DUP(?)

.code
main PROC		; main procedure, entry point

	; Copy all values in array1 to array2

	mov ESI,OFFSET array1			; base address of source array
	mov EDI,OFFSET array2 + SIZEOF array2 -TYPE array2	
	; base address of destination, using the offeset to move the address by size of the array1. 
	mov ECX,LENGTHOF array1			; set up loop counter
L1:
	mov EAX,[ESI]					; copy from source array
	mov [EDI],EAX					; copy to destination
	add ESI,4						; advance source to next element
	sub EDI,4						; decrement destination for next element
	loop L1							; loop to process next element


	ret			; end the program
main ENDP
END