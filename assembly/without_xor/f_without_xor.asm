.686
.model flat
public _without_xor
.data
.code

_without_xor PROC
push EBP
mov EBP, ESP

mov EAX, [EBP+8]
mov EBX, [EBP+12]
not EAX
and EAX, EBX

mov ESP, EBP
pop EBP
ret
_without_xor ENDP
END