.686
.model flat
public _u2_to_sign_modul
.data
.code

_u2_to_sign_modul PROC
push EBP
mov EBP, ESP

; if most right bit not set, then 
; U2 = SM and we can end function
mov EBX, dword ptr [EBP+8]
bt EBX, 31
jnc finish

; if number is below zero, then
; minus value - plus value = absolute value
; sign bit and absolute value is SM
mov EAX, 80000000h	; EAX has first set bit
and EBX, 7fffffffh	; EBX is number without most left bit
sub EAX, EBX		; EAX is absolute of our number
bts EAX, 31			; add sign bit


finish:
mov ESP, EBP
pop EBP
ret
_u2_to_sign_modul ENDP
END
