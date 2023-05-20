; file name: Sandoval3.asm
; Author: Brandon Sandoval
; Date: 2/2/2023
; Purpose: TO verify HW3 answers by examining memory content

section .data
        ;====================== HW3, Problem 1 =========================
        numbers1      db        100, -100           ; store decimal
        numbers2      dw        100, -100           ; store decimal
        number3       dd        100                 ; store decimal
        number4       dq        -100                ; store decimal
        
        ;====================== HW3, Problem 2 =========================
        num1          db        0x64                ; store hex 64
        num2          db        0x9C                ; store hex 9C
        num3          dw        0x0064              ; store hex 0064
        num4          dw        0x009C              ; store hex 009C
        num5          dd        0x00000064          ; store hex 00000064
        num6          dd        0xFFFFFF9C          ; store hex FFFFFF9C
        num7          dq        0x89ABCDEF01234567  ; store hex 89ABCDEF01234567
        num8          dq        0x9ABCDEF012345678  ; store hex 9ABCDEF012345678
        
section .bss
        ;====================== HW3, Problem 2 =========================
        ans1          resb      1                   ; reserve 1 byte
        ans2          resw      1                   ; reserve 1 word
        ans3          resd      1                   ; reserve 1 dword
        ans4          resq      1                   ; reserve 1 qword
        
section .text
global _start
_start:
        ;====================== HW3, Problem 2-1 =======================
        mov al, [num1]          ; AL <-- num1 (copy one byte from memory at num1)
        add al, [num2]          ; AL <-- num1 + num2 (add two numbers)
        mov [ans1], al          ; ans1 <-- AL (copy the value in AL into memory)
        ;====================== HW3, Problem 2-2 =======================
        mov cx, [num3]          ; CX <-- num3 (copy one byte from memory at num1)
        add cx, [num4]          ; CX <-- num3 + num4 (add two numbers)
        mov [ans2], cx          ; ans2 <-- CX (copy the value in CX into memory)
        ;====================== HW3, Problem 2-3 =======================
        mov eax, [num5]         ; EAX <-- num5 (copy one byte from memory at num1)
        add eax, [num6]         ; EAX <-- num5 + num6 (add two numbers)
        mov [ans3], eax         ; ans3 <-- EAX (copy the value in EAX into memory)

        ;====================== HW3, Problem 2-4 =======================
        mov rax, [num7]         ; RAX <-- num7 (copy one byte from memory at num1)
        add rax, [num8]         ; RAX <-- num7 + num8 (add two numbers)
        mov [ans4], rax         ; ans4 <-- RAX (copy the value in RAX into memory)
        
        ;================  for sys_exit system call ====================
        mov rax, 60
        mov rdi, 0
        syscall
        