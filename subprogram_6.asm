.686
.model flat

public _decimal_count

.data
.code

_decimal_count PROC
push EBP
mov EBP, ESP
push ESI

; prepare to divide
mov EAX, [EBP+8]		; EAX is num
mov EBX, 0Ah			; EBX is 10
xor EDX, EDX			; EDX is 0
xor ESI, ESI			; ESI is counter



div_by_ten:
	div EBX				; rest in EDX, result in EAX
	add ESI, EDX		; add rest to counter
	jae next
	cmp EAX, EBX		; check if num is 0
	jge div_by_ten

next:
add EAX, ESI			; save result

pop ESI
mov ESP, EBP
pop EBP
ret
_decimal_count ENDP
END