.model flat
.686
public _largest_common_divisor
.data
.code

_largest_common_divisor PROC
push EBP
mov EBP, ESP
push ESI
push EDI

; [EBP+8]	- number A
; [EBP+12]	- number B

mov EAX, [EBP+8]
mov EBX, [EBP+12]
cmp EAX, EBX
je return_place
ja is_bigger


is_lower:
	sub EBX, EAX
	push EAX
	push EBX
	call _largest_common_divisor
	jmp return_place

is_bigger:
	sub EAX, EBX
	push EAX
	push EBX
	call _largest_common_divisor
	jmp return_place

are_equal:

return_place:
pop EDI
pop ESI
mov ESP, EBP
pop EBP
ret
_largest_common_divisor ENDP
ENd