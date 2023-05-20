;Filename: binaryToAscii.asm
;Procedure to convert a DWORD to ASCII’s for binary digits
;Parameter 1: rdi - binary number 
;Parameter 2: rsi -  Address of a byte array of size 32

global binToAscii

binToAscii:
	push rbx              ; save registers
	mov r9, rsi           ; address of AsciiBin to use as memory
	mov rbx, rdi          ; binary number to rbx
	 
	
	
				 ; Initialization
		lea rbx, [r9] ; get address for asciiBin
		add rbx, 31 ; go to the right-most byte
		mov rcx, 32 ; prepare for loop instruction
	
		
	
				 ; Loop to process 1 bit at a time and create 32 ASCIIs
binLoop:   
		ror eax, 1         ; get the next 1 bits to process
		mov dl, '0'        ; Default to 0
		jc ifCarry         ; If CF = 1 then jump to ifCarry
		jmp next           ; Otherwise go next


ifCarry: mov dl, '1'       ; Change default to 1

next:     mov BYTE [rbx], dl ; store ASCII in memory
		  dec rbx            ; get address for the previous byte
		  
		  loop binLoop        ; repeat until process 32 times
		
	
	
	
	
	
	
	pop rbx             ; return registers
	ret                 ; return