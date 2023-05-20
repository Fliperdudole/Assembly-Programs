;=======================================================================================
; Function computeAvg (value-returning function)
; Purpose: Compute the average of the elements in an array
; Parameter 1: RDI -- address of array (pass by reference)- input parameter
; Parameter 2: RSI -- array size (pass by value)- input parameter
; Return value:RAX -- average of the elements in an array
;=======================================================================================
global computeAvg

computeAvg:  
	push rbx       ; save registers
	mov  rbx, rdi  ; address of array -> rbx
	mov  rcx, rsi  ; array size -> rcx for loop counter
	
	mov  rax, 0    ; initialize sum to 0
	
	
	
	
	
	
addLoop:
	add  rax, [rbx] ;add array element to sum
	add  rbx, 8     ;next number in array
	loop addLoop    ;repeat at loop
	
	
	cqo
	idiv rsi        ;divide rax(sum) by rsi(counter)
	
	
	     
	pop rbx        ; restore registers
	ret            ; return