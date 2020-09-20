.686
.model flat
public _round_mixed_number
.data
.code

_round_mixed_number PROC
push EBP
mov EBP, ESP

; [EBP+8]- number
; 32bit mixed number 
	; most left is sign
	; second left is 2^23
	; most right is 2^-7

; take integer part
mov EAX, [EBP+8]
btr EAX, 31			; clear sign bit
shr EAX, 7			; EAX is integer part

; calc fraction round
mov EBX, [EBP+8] 
bt EBX, 6
jnc set_sign
inc EAX

; set sign bit
set_sign:
bt EBX, 31
jnc finish
mov EBX, 0
sub EBX, EAX
mov EAX, EBX

finish:
mov ESP, EBP
pop EBP
ret
_round_mixed_number ENDP
END

