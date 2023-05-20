; file name: Sandoval4.asm
; Author: Brandon Sandoval
; Date: 2/9/2023
; Purpose: TO verify HW4 answers by examining memory content

global _start
_start:
        ;====================== HW4, Problem 1 =======================
q01:    mov cl, 0x7A ; Move 0x7A (122 in decimal) into CL register
        mov dl, 0xCD ; Move 0xCD (205 in decimal) into DL register
        sub cl, dl ; Subtract DL from CL and store the result in CL            
        
        ;====================== HW4, Problem 2 =======================
q02:    mov eax, 40000000h ; Move 40000000h into EAX register
        mov ebx, 20000h ; Move 20000h into EBX register
        mul ebx ; Multiply EAX by EBX and store the result in EDX:EAX
        
        ;====================== HW4, Problem 3 =======================
q03:    mov al, 10 ; Move 10 into AL register
        mov bl, -6 ; Move -6 into BL register
        imul bl ; Multiply AL by BL and store the result in AX
        
        ;====================== HW4, Problem 4 =======================
q04:    mov ax, 20 ; Move 20 into AX register
        mov bx, 40 ; Move 40 into BX register
        imul bx ; Multiply AX by BX and store the result in DX:AX
        
        ;====================== HW4, Problem 5 =======================
q05:    mov ah, 0 ; Move 0 into AH register
        mov al, -34 ; Move -34 into AL register
        mov bl, 5 ; Move 5 into BL register
        idiv bl ; Divide AX by BL and store the quotient in AL and remainder in AH
        
        ;====================== HW4, Problem 6 =======================
q06:    mov ax, -34 ; Move -34 into AX register
        mov bl, 5 ; Move 5 into BL register
        idiv bl ; Divide AX by BL and store the quotient in AL and remainder in AH
        
        ;====================== HW4, Problem 7 =======================
q07:    mov al, -34 ; Move -34 into AL register
        cbw ; Sign extend AL into AX
        mov bl, 5 ; Move 5 into BL register
        idiv bl ; Divide AX by BL and store the quotient in AL and remainder in AH
        
        ;====================== HW4, Problem 8 =======================
q08:    mov ax, -34 ; Move -34 into AX register
        cwd ; Sign extend AX into DX:AX
        mov bx, 5 ; Move 5 into BX register
        idiv bx ; Divide DX:AX by BX and store the quotient in AX and remainder in DX
        
        ;====================== HW4, Problem 9 =======================
q09:    mov eax, -34 ; Move -34 into EAX register
        cdq ; Sign extend EAX into EDX:EAX
        mov ebx, -5 ; Move -5 into EBX register
        idiv ebx ; Divide EDX:EAX by EBX and store the quotient in EAX and remainder in EDX
        
        ;====================== HW4, Problem 10 =======================
q10:    mov rax, 34 ; Move 34 into RAX register
        cqo ; Sign extend RAX into RDX:RAX
        mov rbx, -5 ; Move -5 into RBX register
        idiv rbx ; Divide RDX:RAX by RBX and store
        
        
        ;================  for sys_exit system call ====================
quit:   mov rax, 60 ; Move 60 into RAX register to invoke sys_exit system call
        mov rdi, 0 ; Move 0 into RDI register as the exit status code
        syscall ; Invoke sys_exit system call to terminate the program
        