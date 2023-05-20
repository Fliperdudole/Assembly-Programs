;=======================================================================================
; Function maxMin
; Purpose: Find the largest and smallest values in an array
; Parameter 1: RDI -- maximum of an array (pass by reference)- output parameter
; Parameter 2: RSI -- minimum of an array (pass by reference)- output parameter
; Parameter 3: RDX -- address of array (pass by reference)- input parameter
; Parameter 4: RCX -- array size (pass by value)- input parameter
; Register usage:       RAX -- temporary maximum value
;                       R8  -- temporary minimum value
;                       RBX -- address of array for “register indirect memory addressing”
;                       RCX -- counter for “loop” instruction                       
;=======================================================================================
global maxMin

maxMin:
	push rbx        ; save registers
	mov  rbx,  rdx  ; address of the array -> rbx 
	mov  rcx,  rcx  ; array size -> counter for loop
	mov  rax, [rdx] ; initialize max (temp-max) to array[0]
	mov  r8,  [rdx] ; initialize min (temp-min) to array[0]
	
	
	
maxLoop:
	cmp [rbx], rax  ; compare array element to temp-max
	jng minLoop     ; jump to minLoop if element is not greater than temp max
	mov rax, [rbx]  ; new maximum

minLoop:
	cmp [rbx], r8   ; compare array element to temp-min
	jnl next        ; jump to next if element is not less than temp min
	mov r8, [rbx]   ; new minimum
 



	
	
	
next:	
	add rbx, 8     ; next element in the array
	loop maxLoop   ; repeat
	
	mov [rdi], rax ; store maximum
	mov [rsi], r8  ; store minimum
	
	
	pop rbx        ; restore registers
	ret            ; return
