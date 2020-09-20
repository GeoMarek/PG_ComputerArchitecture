.686
.model flat

public _binary_to_decimal

.data
.code

_binary_to_decimal PROC
push EBP
mov EBP, ESP
push ESI

mov ESI, [EBP+8]
xor EDX, EDX
xor EAX, EAX



main_loop:
	mov DL, [ESI]
	cmp DL, 0
	je exit_fun
	shl EAX, 1
	cmp DL, 31h
	sete DL
	add EAX, EDX
	inc ESI
	jmp main_loop

exit_fun:

pop ESI
mov ESP, EBP
pop EBP
ret
_binary_to_decimal ENDP
END