; File name: Sandoval7p2.asm
; Author: Brandon Sandoval
; Course: CSCI-3160-D01
; Assignment: Homework7
; Date: March 17, 2023
; Purpose: This program will get two numbers from the user and display the sum of the two numbers on the screen

section .data
    prompt             db "Enter a number: "
    prompt_len         equ $-prompt
    response_plus      db " + "
    response_plus_len  equ $-response_plus
    response_equal     db " = "
    response_equal_len equ $-response_equal
    response_end       db "!", 10
    response_end_len   equ $-response_end
    num_max_len        equ 11
    sys_write          equ 1
    stdout             equ 1

    

section .bss
    asciinum1 resb num_max_len      ;array of bytes to store first ASCII input
    asciinum2 resb num_max_len      ;array of bytes to store second ASCII input
    len1      resq 1                ;to store length of characters in first num
    len2      resq 1                ;to store length of characters in second num
    asciiout  resb 10               ;array of bytes to store characters to display
    num1      resq 1                ;store the first QWORD size binary number
    num2      resq 1                ;store the second QWORD size binary number



section .text
    global _start
_start:
                              ; Get user input (string for the first number) using getInput function
    mov rdi, prompt_len       ; Parameter 1: number of characters in promptString
    mov rsi, prompt           ; Parameter 2: pointer to promptString
    mov rdx, asciinum1        ; Parameter 3: pointer to inputString
    mov rcx, num_max_len      ; Parameter 4: max number of characters to be read
    call getInput
    
    ; getInput function returned the number of characters read in RAX
    ; Store the number of characters entered by the user
    dec rax                   ; decrement the character count (Newline char)
    mov [len1], rax           ; save the character count in memory for later use
    
    ; Convert ASCIIs to integer (binary) using stoi function
    mov rdi, rax              ; Parameter 1: Number of characters
    mov rsi, asciinum1        ; Parameter 2: Address of the string
    call stoi
    
    ; stoi function returned the first number (in binary) in RAX
    mov [num1], rax           ; store the first number (binary) in memory
    
    ; Get user input (string for the second number) using getInput function
    mov rdi, prompt_len       ; Parameter 1: number of characters in promptString
    mov rsi, prompt           ; Parameter 2: pointer to promptString
    mov rdx, asciinum2        ; Parameter 3: pointer to inputString
    mov rcx, num_max_len      ; Parameter 4: max number of characters to be read
    call getInput
    
    ; getInput function returned the number of characters read in RAX
    ; Store the number of characters entered by the user
    dec rax                   ; decrement the character count (Newline char)
    mov [len2], rax           ; save the character count in memory for later use
    
    ; Convert ASCIIs to integer (binary) using stoi function
    mov rdi, rax              ; Parameter 1: Number of characters
    mov rsi, asciinum2        ; Parameter 2: Address of the string
    call stoi
    
    ; stoi function returned the second number (in binary) in RAX
    ; Now the second number (in binary) is in RAX
    mov [num2], rax           ; store the integer in memory
    
    ; add the two binary numbers, first and second
    add rax, [num1]           ; add the first and second numbers
    
    ; integer sum (binary) cannot be displayed directly
    ; Convert the integer sum to ASCIIs using itos function
    mov rdi, rax              ; Parameter 1: Integer to be converted
    mov rsi, asciiout         ; Parameter 2: Address of the ASCII string
    call itos
    
    ; Write sum
    mov rax, sys_write
    mov rdi, stdout
    mov rsi, asciinum1
    mov rdx, [len1]
    syscall                   ; call system

   ; Write + symbol
    mov rax, sys_write
    mov rdi, stdout
    mov rsi, response_plus
    mov rdx, response_plus_len
    syscall
    ; Write the second num
    mov rax, sys_write
    mov rdi, stdout
    mov rsi, asciinum2
    mov rdx, [len2]
    syscall
    ; Write = symbol
    mov rax, sys_write
    mov rdi, stdout
    mov rsi, response_equal
    mov rdx, response_equal_len
    syscall
    ; Write sum
    mov rax, sys_write
    mov rdi, stdout
    mov rsi, asciiout
    mov rdx, 10
    syscall
    ; Write the end of the response
    mov rax, sys_write
    mov rdi, stdout
    mov rsi, response_end
    mov rdx, response_end_len
    syscall

    
    
    
    ; End the program
    mov rax, 60               ; syscall number: 60 for sys_exit
    mov rdi, 0                ; error code: 0 for successful run
    syscall



    
    
; Function getInput
; Parameter 1: RDI -- number of characters in promptString (value parameter)
; Parameter 2: RSI -- pointer to promptString (reference parameter)
; Parameter 3: RDX -- pointer to inputString (reference parameter)
; Parameter 4: RCX -- max number of characters to be read (value parameter)
; Return value: RAX -- number of characters read    
    
getInput:
    push rdx        ; save register (pointer to inputString)
    mov rax, 1      ; syscall number: 1 for sys_write
    mov rdx, rdi    ; number of characters to be written
    mov rdi, 1      ; file descriptor: 1 for STDOUT
    syscall
    mov rax, 0      ; syscall number: 0 for sys_read
    mov rdi, 0      ; file descriptor: 0 for STDIN
    pop rsi         ; pop address of the input string from stack
    mov rdx, rcx    ; max number of characters to be read
    syscall
    ret


    
; Function stoi
; Parameter 1: RDI -- number of digits in the string (value parameter)
; Parameter 2: RSI -- pointer to the string to convert (reference parameter)
; Return value: RAX -- integer value

stoi:
    push rbx               ; save rbx
    xor rbx, rbx           ; clear rbx (Initialize integer value to zero)
    mov rcx, rdi           ; loop counter in rcx
    mulAddLoop:
    movzx rax, byte[rsi]   ; copy the ASCII to rax (al)
    sub al,'0'             ; convert from ASCII to number/digit
    imul rbx,10            ; Multiply current integer value by 10
    add rbx, rax           ; update integer: rbx = rbx*10 + rax
    inc rsi                ; to get the next character
    loop mulAddLoop        ; decrement rcx and repeat until rcx = zero
    mov rax,rbx            ; store the return value in RAX
    pop rbx                ; restore rbx
    ret
    
    
    
    
; Function itos
; Parameter 1: RDI -- integer value to convert (by value)
; Parameter 2: RSI – address of string to store ASCIIs (by reference)
; Return value: RAX -- pointer to the first character of the generated string

itos:
    push rbx               ; save rbx
    add rsi, 9             ; go to the rightmost character position
    mov byte [rsi], 0      ; NULL character at the end of string
    mov rbx, 10            ; divisor in rbx
    mov rax, rdi           ; dividend in rax
    divLoop:
    xor rdx, rdx           ; Clear edx prior to dividing rdx:rax by rbx
    div rbx                ; rax / 10
    add dl,'0'             ; Convert the remainder to ASCII
    dec rsi                ; move pointer to left (store characters in reverse order)
    mov [rsi], dl          ; store ASCII in memory
    test rax, rax          ; check whether quotient is zero
    jnz divLoop            ; Repeat until quotient becomes zero
    mov rax, rsi           ; return value: address of the first character
    pop rbx                ; restore rbx
    ret

    
    