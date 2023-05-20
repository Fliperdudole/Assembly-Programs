; File name: Sandoval6.asm
; Author: Brandon Sandoval
; Course: CSCI-3160-D01
; Assignment: Homework6
; Date: March 17, 2023
; Purpose: This assignment gives practice on using loops to create these four programs.


section .data
    x db 25
    y db 7
    z db 15
    
section .bss

    max resb 1
    min resb 1

section .text
    global _start

_start:
    ; Find the maximum of x, y, and z
    mov al, byte [x]   ; Load x into AL
    mov bl, byte [y]   ; Load y into BL
    cmp al, bl         ; Compare x and y
    jg greater_xy      ; If x > y, jump to greater_xy
    mov al, bl         ; Otherwise, move y into AL
    
    
    
greater_xy:
    mov bl, byte [z]   ; Load z into BL
    cmp al, bl         ; Compare max(x,y) and z
    jg greater_xyz     ; If max(x,y) > z, jump to greater_xyz
    mov al, bl         ; Otherwise, move z into AL
    
    
    
greater_xyz:
    mov byte [max], al ; Store the maximum value in memory

    ; Find the minimum of x, y, and z
    mov al, byte [x]   ; Load x into AL
    mov bl, byte [y]   ; Load y into BL
    cmp al, bl         ; Compare x and y
    jl lesser_xy       ; If x < y, jump to lesser_xy
    mov al, bl         ; Otherwise, move y into AL
    
    
    
lesser_xy:
    mov bl, byte [z]   ; Load z into BL
    cmp al, bl         ; Compare min(x,y) and z
    jl lesser_xyz      ; If min(x,y) < z, jump to lesser_xyz
    mov al, bl         ; Otherwise, move z into AL
    
    
    
lesser_xyz:
    mov byte [min], al ; Store the minimum value in memory

;===============================PROGRAM 2=============================================

section .data
    a dd 373065
    b dd 24310
    
section .bss

    gcd resd 1

section .text
    global _start_prog2

_start_prog2:
    ; Find the greatest common divisor of a and b
    mov eax, dword [a]   ; Load a into EAX
    mov ebx, dword [b]   ; Load b into EBX
    
    
gcd_loop:
    mov edx, 0           ; Clear EDX (remainder)
    div ebx              ; Divide EAX by EBX, quotient in EAX, remainder in EDX
    test edx, edx        ; Test if remainder is zero
    jz gcd_done          ; If remainder is zero, jump to gcd_done
    mov eax, ebx         ; Move EBX into EAX
    mov ebx, edx         ; Move remainder into EBX
    jmp gcd_loop         ; Repeat loop
    
    
gcd_done:
    mov dword [gcd], ebx ; Store the greatest common divisor in memory


;===============================PROGRAM 3=============================================

section .data
    limit dd 500000000 ; The limit to compute the factorial
    
section .bss
    m         resd 1 ; The value of m in the equation m!
    factorial resd 1 ; The factorial value of m!

section .text
    global _start_prog3
    
_start_prog3:
    mov ecx, 1 ; Initialize loop counter to 1
    mov eax, 1 ; Initialize factorial value to 1
    mov ebx, [limit] ; Load limit value from memory into ebx register
    
compute_factorial:
    mul ecx ; Multiply current value in eax by loop counter in ecx
    cmp eax, ebx ; Compare eax to limit value in ebx
    jle continue_loop ; If eax <= ebx, continue the loop
    jmp end_loop ; If eax > ebx, end the loop
    
continue_loop:
    inc ecx ; Increment loop counter
    jmp compute_factorial ; Continue loop
    
end_loop:
    ; Divide by ecx to go back one factorial
    div ecx
    dec ecx
    
    mov [factorial], eax ; Store computed factorial value in memory
    mov [m], ecx ; Store value of m in memory


;===============================PROGRAM 4=============================================

section .data
    n dq 25 ; Value of n
    k dq 12 ; Value of k

section .bss
    binomial resq 1 ; Result of the binomial coefficient

section .text
    global _start_prog4
    _start_prog4:
    
    mov rax, 1     ; Initialize result to 1
    mov rcx, [k]     ; Load k value from memory into rcx register
    cmp rcx, 0     ; Compare k to 0
    je compute_result  ; If k = 0, result is 1
    
compute_numerator:
    imul rax, [n]     ; Multiply result by n
    dec qword[n]           ; Decrement n
    loop compute_numerator ; Continue loop
    
compute_denominator:
    mov rdx, [k]      ; Load k value into rdx register
    mov rbx, 1      ; Initialize denominator to 1
    cmp rdx, 0      ; Compare k to 0
    je compute_result   ; If k = 0, result is 1

compute_denominator_loop:
    imul rbx, rdx   ; Multiply denominator by k
    dec rdx         ; Decrement k
    cmp rdx, 0      ; Compare k to 0
    jnz compute_denominator_loop ; If k != 0, continue loop
    div rbx         ; Divide numerator by denominator
    jmp compute_result ; Jump to compute final result
    
compute_result:
    mov [binomial], rax ; Store result in memory






done:
    ; Exit program
    mov rax, 60                  ; Move 60 into RAX register to invoke sys_exit system call
    mov rdi, 0                   ; Move 0 into RDI register as the exit status code
    syscall 
    