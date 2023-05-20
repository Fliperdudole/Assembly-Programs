;Filename: hexToAscii.asm
;Procedure to convert a DWORD to ASCII’s for Hex digits
;Parameter 1: rdi - binary number 
;Parameter 2: rsi - Address of a byte array of size 8

global hexToAscii

hexToAscii:
	push rbx              ; save registers
	mov r9, rsi
	mov rbx, rdi
	
	
	
	
				 ; Initialization
		lea rbx, [r9] ; get address for asciiHex
		add rbx, 7 ; go to the right-most byte
		mov rcx, 8 ; prepare for loop instruction
			 
				 ; Loop to process 4 bits at a time and create 8 ASCIIs
hexLoop:   mov dl, al         ; copy rightmost byte of binary number temporarily
		  and dl, 00001111b  ; extract right most 4 bits
		  cmp dl, 9          ; check if 4 bits are a digit or a letter
		  jg ifLetter        ; jump to create ASCII for letter
		  or dl, 00110000b   ; create ASCII for 0,1,… 9
		  jmp next           ; skip the if section
ifLetter: add dl, 55         ; create ASCII for A,B,… F
next:     mov BYTE [rbx], dl ; store ASCII in memory
		  dec rbx            ; get address for the previous byte
		  shr eax, 4         ; get the next 4 bits to process
		  loop hexLoop        ; repeat until process 8 times
	
	
	
	
	
	
	
	
	
	pop rbx             ; return registers
	ret                 ; return