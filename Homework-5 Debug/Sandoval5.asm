; file name: Sandoval5.asm
; Author: Brandon Sandoval
; Date: 2/21/2023
; Purpose: To verify HW5 answers by examining memory content
section .data

        Flags1 db 0F0h               ; Declared variable Flags1 for question p1_04
        Flags2 db 0F0h               ; Declared variable Flags2 for question p1_05
        Flags3 db 0F0h               ; Declared variable Flags3 for question p1_06
        
        num1   db 5h    
        num2   db 39h
        num3   db 6fh
        
section .bss                         ; Uninitialized data
        num4   resb 1
        num5   resb 1
        num6   resb 1
        
        
        

section .text
global _start
_start:
        ;====================== Part I =======================
p1_01:  mov ax, 0AF75h               ; Move value 0AF75h into register AX
        mov bx, 00FFh                ; Move value 00FFh into register BX
        and ax, bx                   ; Perform AND operation on AX and BX and store the result in AX

p1_02:  mov bx, 0AF75h               ; Move value 0AF75h into register BX
        mov cx, 0FF0h                ; Move value 0FF0h into register CX
        or bx, cx                    ; Perform OR operation on BX and CX and store the result in BX

p1_03:  mov cx, 0AF75h               ; Move value 0AF75h into register CX
        mov dx, 0F00Fh               ; Move value 0F00Fh into register DX
        xor cx, dx                   ; Perform XOR operation on CX and DX and store the result in CX

        
        
p1_04:  or byte [Flags1], 00010010b  ; Perform OR operation on Flags1 and 00010010b and store the result in Flags1
     
p1_05:  and byte [Flags2], 11011011b ; Perform AND operation on Flags2 and 11011011b and store the result in Flags2

p1_06:  xor byte [Flags3], 01001000b ; Perform XOR operation on Flags3 and 01001000b and store the result in Flags3


        
p1_07:  mov AL, 01000011b            ; Move value 01000011b (ASCII code for 'C') into register AL
        or AL, 00100000b             ; Perform OR operation on AL and 00100000b
                                     ; to convert 'C' into 'c'
        
p1_08:  mov BL, 01100101b            ; Move value 01100101b (ASCII code for 'e') into register BL
        and BL, 11011111b            ; Perform AND operation on BL and 11011111b
                                     ; to convert 'e' into 'E'
        
p1_09:  mov CL, 01000111b            ; Move value 01000111b (ASCII code for 'G') into register CL
        xor CL, 00100000b            ; Perform XOR operation on CL and 00100000b
                                     ; to convert 'G' into 'g'
        
p1_10:  mov DX, 541d                 ; Move value 541d into register DX
        and DX, 00111111b            ; Perform AND operation on DX and 00111111b 

p1_11:  mov CH, 4Dh                  ; CH <- 4D
        add CH, 00110000b            ; Add 00110000b to CH

        
        ;====================== Part II =======================

p2_01:  mov DI, 0AF75h               ; DI <- 0AF75h
        shl DI, 1                    ; left shift DI by 1 bit (multiply by 2)
        
p2_02:  mov SI, 0AF75h               ; SI <- 0AF75h
        shr SI, 1                    ; right shift SI by 1 bit (divide by 2)
        
p2_03:  mov r8w, 0AF75h              ; r8w <- 0AF75h
        sar r8w, 4                   ; arithmetic shift right r8w by 4 bits
        
p2_04:  mov r9w, 0AF75h              ; r9w <- 0AF75h
        rol r9w, 1                   ; rotate r9w left by 1 bit
        
p2_05:  mov r15w, 0AF75h             ; r15w <- 0AF75h
        ror r15w, 1                  ; rotate r15w right by 1 bit
        
p2_06:  mov EAX, -5                  ; EAX <- -5 (signed)
        sal EAX, 5                   ; arithmetic shift left EAX by 5 bits (multiply by 32)
        
p2_07:  mov EBX,-160                 ; EBX <- -160 (signed)
        sar EBX, 5                   ; arithmetic shift right EBX by 5 bits (divide by 32)
        
p2_08:  mov ECX, -2                  ; ECX <- -2 (signed)
        mov EAX, ECX                 ; copy ECX to EAX
        sal ECX, 5                   ; arithmetic shift left ECX by 5 bits (multiply by 32)
        add ECX, EAX                 ; add original ECX value to the shifted value
        
p2_09:  mov EDX, -2                  ; EDX <- -2 (signed)
        mov EAX, EDX                 ; copy EDX to EAX
        sal EDX, 6                   ; arithmetic shift left EDX by 6 bits (multiply by 64)
        sub EDX, EAX                 ; subtract the original EDX value from the shifted value

        ;====================== Part III ======================
        
        
p3_01:  mov AX, 0              ; Initialize AX to 0
        mov AL, byte [num3]    ; Extract seven-bit number from num3 and store it in AL
        shl AX, 6              ; Shift AX left by 6 bits
        or AL, byte [num2]     ; OR six-bit number from num2 with AL
        shl AX, 3              ; Shift AX left by 3 bits
        or AL, byte [num1]     ; OR three-bit number from num1 with AL
        
        
p3_02:  mov BX, AX             ; Save original value of AX in BX
        mov byte [num4], BL    ; Extract three-bit number and store it in num4
        and byte [num4], 00000111b
        ror BX, 3              ; Rotate bits in BX by 3 bits
        mov byte [num5], BL    ; Extract six-bit number and store it in num5
        and byte [num5], 00111111b
        ror BX, 6              ; Rotate bits in BX by 6 bits
        mov byte [num6], BL    ; Extract seven-bit number and store it in num6
        and byte [num6], 01111111b
        

       
        
        
        
        

        ;================  for sys_exit system call ====================
quit:   mov rax, 60                  ; Move 60 into RAX register to invoke sys_exit system call
        mov rdi, 0                   ; Move 0 into RDI register as the exit status code
        syscall                      ; Invoke sys_exit system call to terminate the program
        
        