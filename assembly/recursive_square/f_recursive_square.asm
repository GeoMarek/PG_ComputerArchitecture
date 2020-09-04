.686
.model flat
public _recursive_square
.data
.code

_recursive_square PROC
push EBP
mov EBP, ESP

mov EAX, dword ptr [EBP+8]
; check for 1 and 0
cmp EAX, 0
je ret_zero
cmp EAX, 1
je ret_one

; recursive call
sub EAX, 2
push EAX
call _recursive_square

; calculate value
mov EBX, dword ptr [EBP+8]
shl EBX, 2
add EAX, EBX
sub EAX, 4

; clear stack
mov ESP, EBP
pop EBP
ret

; return one
ret_one:
mov EAX, 1
mov ESP, EBP
pop EBP
ret

; return zero
ret_zero:
mov EAX, 0
mov ESP, EBP
pop EBP
ret
mov ESP, EBP
pop EBP
ret
_recursive_square ENDP
END