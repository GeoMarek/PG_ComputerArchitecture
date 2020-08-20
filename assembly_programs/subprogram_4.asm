.686
.model flat

public _count_set_bits

.data

.code

_count_set_bits PROC
push EBP
mov EBP, ESP

xor EAX, EAX		; EBX is counter
mov EBX, [EBP+8]


main_loop:
	shr EBX, 1		; shift one bit right
	jnc not_set	
	inc EAX			; if flag C is set, inc counter
	not_set:
	cmp EBX, 0		; check if num is zero
	je exit_fun		; if is zero exit function
	jmp main_loop	; if not, jmp to next loop
exit_fun:
	mov ESP, EBP
	pop EBP
	ret
_count_set_bits ENDP
ENd