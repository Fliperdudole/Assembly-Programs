; file name: main.asm
; Author: Brandon Sandoval
; Date: 4/15/2023
; Purpose: Get a number from the user and then display the number as decimal, 8 hex digits, and 32 binary digits


section .data
	prompt      db    "Enter a decimal number: "
    prompt_len  equ   $-prompt
	
	response_dec     db  "Number in decimal: "
    response_dec_len equ $-response_dec
	
	response_hex     db  "Number in hexadecimal: "
    response_hex_len equ $-response_hex
	
	response_bin     db  "Number in binary: "
    response_bin_len equ $-response_bin
	
	
	sys_write   equ   1
    stdout      equ   1
	
	
	empty_space times 2 db 0 ; array of 8 bytes for ASCII
				db    0Ah ; one byte of ASCII (Newline character)

	asciiDec    times 10 db 0 ; array of 8 bytes for ASCII
				db    0Ah ; one byte of ASCII (Newline character)
				
	asciiHex    times 8 db 0 ; array of 8 bytes for ASCII
				db    0Ah ; one byte of ASCII (Newline character)
				
	asciiBin    times 32 db 0 ; array of 8 bytes for ASCII
				db    10 ; one byte of ASCII (Newline character)


section .bss
	readNum     equ   1
	
	decimal     resq  1           ;label for DWORD to store decimal, uninitialized
	
	binary      resq  1           ;label for DWORD to store binary, uninitialized



extern getInput
extern itos
extern stoi
extern hexToAscii
extern binToAscii




section .text
	global _start
	
_start:


			 ;Use the getInput function to get decimal number (ASCII)
			 ;Use the stoi function to convert ASCII to binary
			 ;The stoi function will store the binary in RAX
			 ;We will process 32 bits in EAX and store ASCIIs in memory

		mov rdi, prompt_len   ; Parameter 1: number of characters in promptString
		mov rsi, prompt       ; Parameter 2: pointer to promptString
		mov rdx, asciiHex     ; Parameter 3: pointer to inputString
		mov rcx, readNum      ; Parameter 4: max number of characters to be read
		call getInput
		dec rax
		
		
		
		
		; Convert ASCIIs to Integer using stoi function
		mov rdi, rax          ; Parameter 1: Number of characters
		mov rsi, asciiHex     ; Parameter 2: Address of the string
		call stoi             ; function call-will return integer in RAX
		
		mov [asciiDec], rax   ; Copy Integer from previous stoi call
		
		mov r8, rax           ; Copy rax for future function calls
hexCall:

		mov rdi, rax            ; Parameter 1
		mov rsi, asciiHex       ; Parameter 2

		call hexToAscii   ; Returns value in asciiHex by reference

binCall:
		mov rax, r8           ; Updates rax since it was altered before
		mov rdi, rax          ; Parameter 1
		mov rsi, asciiBin     ; Parameter 2
		
		call binToAscii   ; Retuns value in asciiBin by reference
		



		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
	mov rdi, [asciiDec]              ; Parameter 1: Integer to be converted
    mov rsi, decimal         ; Parameter 2: Address of the ASCII string
    call itos	  
	
	
	;Write empty space
    mov rax, sys_write
    mov rdi, stdout
    mov rsi, empty_space
    mov rdx, 3
    syscall
	

	;Write "Number in decimal: "
    mov rax, sys_write
    mov rdi, stdout
    mov rsi, response_dec
    mov rdx, response_dec_len
    syscall
    
    ;Write the number in decimal
    mov rax, sys_write
    mov rdi, stdout
    mov rsi, decimal
    mov rdx, 9           ;Newline Character
    syscall
	
	
	
	;Write empty space
    mov rax, sys_write
    mov rdi, stdout
    mov rsi, empty_space
    mov rdx, 3
    syscall



	;Write "Number in hexadecimal: "
    mov rax, sys_write
    mov rdi, stdout
    mov rsi, response_hex
    mov rdx, response_hex_len
    syscall
    
    ;Write the number in hexadecimal
    mov rax, sys_write
    mov rdi, stdout
    mov rsi, asciiHex
    mov rdx, 9           ;Newline Character
    syscall
	
	
	
	
	
	;Write "Number in binary: "
    mov rax, sys_write
    mov rdi, stdout
    mov rsi, response_bin
    mov rdx, response_bin_len
    syscall
	
	
	;Write the number in binary
    mov rax, sys_write
    mov rdi, stdout
    mov rsi, asciiBin
    mov rdx, 32           ;Newline Character
    syscall
	

;Write empty space
    mov rax, sys_write
    mov rdi, stdout
    mov rsi, empty_space
    mov rdx, 3
    syscall



		  
		  
		  ; End the program
end:	  mov rax, 60               ; syscall number: 60 for sys_exit
		  mov rdi, 0                ; error code: 0 for successful run
		  syscall