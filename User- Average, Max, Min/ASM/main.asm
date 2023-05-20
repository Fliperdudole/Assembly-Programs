; file name: Sandoval8.asm
; Author: Brandon Sandoval
; Date: 4/4/2023
; Purpose: Write a program that fills an array with user input and display size, average, maximum, and minimum value

section .data
    prompt      db    "Enter a number or 0 to quit: "
    prompt_len  equ   $-prompt
    
    response_size     db  "Array size: "
    response_size_len equ $-response_size
	
	response_avg      db  "Average: "
    response_avg_len  equ $-response_avg
    
    
    response_max      db  "Maximum value: "
    response_max_len  equ $-response_max
	
	response_min      db  "Minimum value: "
    response_min_len  equ $-response_min
    
    sys_write   equ   1
    stdout      equ   1
    
    asciiSize   times 10   db   0 ; initialize 10 bytes with 0
                db    0ah         ;New Line Character
	
	asciiAvg    times 10   db   0 ; assume ASCIIs for Average are at most 10
				db    0ah

	asciiMax    times 10   db   0 ; assume ASCIIs for Maximum are at most 10
				db    0ah

	asciiMin    times 10   db   0 ; assume ASCIIs for Minimum are at most 10
				db    0ah



section .bss
    num_max_len equ   11
    asciinum    resb  num_max_len ; storage for ASCII input, 10 chars + newline
    numArray    resd  25          ; storage for array elements
    maximum     resq  1           ;label for QWORD to store maximum, uninitialized
	minimum     resq  1           ;label for QWORD to store minimum, uninitialized
	average     resq  1           ;label for QWORD to store average, uninitialized
	
    
    

extern getInput
extern itos
extern stoi
extern maxMin
extern computeAvg

section .text
    global _start

_start:

    

    mov r9, 0             ; init array size to 0
    mov rbx, numArray     ; rbx has the address of first element of array

readLoop:
    mov rdi, prompt_len   ; Parameter 1: number of characters in promptString
    mov rsi, prompt       ; Parameter 2: pointer to promptString
    mov rdx, asciinum     ; Parameter 3: pointer to inputString
    mov rcx, num_max_len  ; Parameter 4: max number of characters to be read
    call getInput         ; function call-will return number of characters read
    dec rax               ; decrement the character count (Newline char)
    
    ; Convert ASCIIs to Integer using stoi function
    mov rdi, rax          ; Parameter 1: Number of characters
    mov rsi, asciinum     ; Parameter 2: Address of the string
    call stoi             ; function call-will return integer in RAX
    
    cmp rax, 0            ; user wants to quit?
    je next               ; quit if 0 was entered
    mov [rbx], rax        ; store the integer in memory
    add rbx, 8            ; get address of next element array
    inc r9                ; update array size
    jmp readLoop          ; repeat

;=======================================================================================
                                  ;COMPUTE AVERAGE
;=======================================================================================
next:
	
	mov rdi, numArray ; Parameter 1
	mov rsi, r9       ; Parameter 2
	
	call computeAvg   ; Returns value in RAX
	
	
	mov rdi, rax             ; Parameter 1: Integer to be converted
    mov rsi, asciiAvg         ; Parameter 2: Address of the ASCII string
    call itos
	




;=======================================================================================
                         ;FIND MAXIMUM AND MINIMUM VALUE
;=======================================================================================

	
	mov rdi, maximum  ; Parameter 1
	mov rsi, minimum  ; Parameter 2
	mov rdx, numArray ; Parameter 3
	mov rcx, r9       ; Parameter 4
	call maxMin       





;=======================================================================================
                            ;Integer to String Function Calls
;=======================================================================================

    mov rdi, r9               ; Parameter 1: Integer to be converted
    mov rsi, asciiSize         ; Parameter 2: Address of the ASCII string
    call itos
    
	
	; Average itos must be called after function call since RAX register will be used again
	
	
	mov rdi, [maximum]              ; Parameter 1: Integer to be converted
    mov rsi, asciiMax         ; Parameter 2: Address of the ASCII string
    call itos
	
	
    mov rdi, [minimum]              ; Parameter 1: Integer to be converted
    mov rsi, asciiMin         ; Parameter 2: Address of the ASCII string
    call itos
    
    
	
	
	
;=======================================================================================
                                   ;PRINT TO SCREEN
;======================================================================================
	
	
	;Write "Array size: "
    mov rax, sys_write
    mov rdi, stdout
    mov rsi, response_size
    mov rdx, response_size_len
    syscall
    
    ;Write the array size
    mov rax, sys_write
    mov rdi, stdout
    mov rsi, asciiSize
    mov rdx, 11           ;Newline Character
    syscall
    
    
	
	;Write "Average: "
    mov rax, sys_write
    mov rdi, stdout
    mov rsi, response_avg
    mov rdx, response_avg_len
    syscall
    
    ;Write the average
    mov rax, sys_write
    mov rdi, stdout
    mov rsi, asciiAvg
    mov rdx, 11           ;Newline Character
    syscall
	
	
    
    ;Write "Maximum Value: "
    mov rax, sys_write
    mov rdi, stdout
    mov rsi, response_max
    mov rdx, response_max_len
    syscall
    
    ;Write the max number
    mov rax, sys_write
    mov rdi, stdout
    mov rsi, asciiMax     
    mov rdx, 11           ;Newline character
    syscall
	
	
	
	
	;Write "Minimum Value: "
    mov rax, sys_write
    mov rdi, stdout
    mov rsi, response_min
    mov rdx, response_min_len
    syscall
    
    ;Write the min number
    mov rax, sys_write
    mov rdi, stdout
    mov rsi, asciiMin     
    mov rdx, 11           ;Newline character
    syscall




;=======================================================================================
                                         ;END
;=======================================================================================

    ; End the program
    mov rax, 60               ; syscall number: 60 for sys_exit
    mov rdi, 0                ; error code: 0 for successful run
    syscall