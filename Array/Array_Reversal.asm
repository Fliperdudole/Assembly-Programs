; File name: HW7Ex.asm
; Author: Brandon Sandoval
; Course: CSCI-3160-D01
; Assignment: Homework7
; Date: March 17, 2023
; Purpose: This program reverses an array


section .data
    numbers      dq     201, 202, 203, 204, 205
    len          dq     5
    
section .text
    global _start    
    
_start:    
    ; Register usage: RCX: loop count (number of elements in array)
    ; RBX: Address of array element
;========================================================================
          mov          rcx, qword [len] ; loop count in RCX
          mov          rbx, numbers ; address of (first element of) array
    
pushLoop: push qword [rbx] ; push an element on the stack
          add rbx, 8 ; get address of next element
          loop pushLoop ; repeat until rcx becomes zero
          
          
          
          
          
          
;========================================================================
    
          mov rcx, qword [len] ; loop count in RCX
          mov rbx, numbers ; address of (first item of) array
          
          
popLoop:  pop qword [rbx] ; pop the stack and store array value in memory
          add rbx, 8 ; get the address of next element
          loop popLoop ; repeat until rcx becomes zero

done:
    ; Exit program
    mov rax, 60                  ; Move 60 into RAX register to invoke sys_exit system call
    mov rdi, 0                   ; Move 0 into RDI register as the exit status code
    syscall 
    