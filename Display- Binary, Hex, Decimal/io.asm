; File name: functions.asm




; Function getInput
; Parameter 1: RDI -- number of characters in promptString (value parameter)
; Parameter 2: RSI -- pointer to promptString (reference parameter)
; Parameter 3: RDX -- pointer to inputString (reference parameter)
; Parameter 4: RCX -- max number of characters to be read (value parameter)
; Return value: RAX -- number of characters read    
global getInput    
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

global stoi
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

global itos
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

    