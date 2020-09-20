.686
.model flat

public _multiply_by_ten

.data
.code

_multiply_by_ten PROC
push EBP
mov EBP, ESP

; [EBP+8] is address of num

mov EAX, [EBP+8]
mov EBX, [EBP+8]
shl EBX, 1			; EBX = EBX * (2^1)
shl EAX, 3			; EAX = EAX * (2^3)

add EAX, EBX		; EAX = num*8 + num*2

mov ESP, EBP
pop EBP
ret
_multiply_by_ten ENDP
ENd