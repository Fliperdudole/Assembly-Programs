; File name: Sandoval1
; Display "Hello, world!" to stdout (screen)

section .data
        message db "Hello, world!", 10 ;store ASCII's to display

section .text
        global _start      ;for ld command for linking

_start:
        mov rax, 1        ;sys_call id for sys_write
        mov rdi, 1        ;for stdout
        mov rsi, message  ;address of the string
        mov rdx, 14       ;length of the string
        syscall           ;system call to display message on screen
        
        mov rax, 60       ;sys_call id for sys_exit (for ld)
        mov rdi, 0        ;success - no error
        syscall           ;system call to exit the program
