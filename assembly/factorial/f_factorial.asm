.686
.model flat
public _factorial
.data
.code

_factorial PROC
push EBP
mov EBP, ESP

mov EAX, dword ptr [EBP+8]

; check for 0! and 1!
cmp EAX, 0
je ret_one
cmp EAX, 1
je ret_one

; recursive call
dec EAX
push EAX
call _factorial
mov EBX, [EBP+8]
mul EBX
; rebuild stack
mov ESP, EBP
pop EBP
ret
; return one
ret_one:
mov EAX, 1
mov ESP, EBP
pop EBP
ret
_factorial ENDP
END