;file name: Checker.asm
; adding two numbers with different sizes

section .data
num1b   db         0x06
num2b   db         0xFC

num3b   db         0xFD
num4b   db         0xFB

num5w   dw         0x4297
num6w   dw         0x6348

num7w   dw         0xE3BA
num8w   dw         0x8FDE

section .bss   ;uninitialized data
    ans1  resb   1
    ans2  resb   1
    ans3  resw   1
    ans4  resw   1

global _start

section .text

_start:
    mov al, [num1b]
    add al, [num2b]
    mov [ans1],al
    
    mov bl, [num3b]
    add bl, [num4b]
    mov [ans2],bl
    
    mov cx, [num5w]
    add cx, [num6w]
    mov [ans3],cx

    mov dx, [num7w]
    add dx, [num8w]
    mov [ans4],dx
    
    mov rax, 60
    mov rdi, 0
    syscall
    