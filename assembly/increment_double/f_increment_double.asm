.686
.model flat
public _increment_double
.data
.code

_increment_double PROC
push EBP
mov EBP, ESP
push ESI
push EDI

; 1 + (2^x) * b  = (2^x) * a
; (2^x) * (b + 1/(2^x)) = (2^x) * a
; a = b + 1/(2^x)
; so we need to add 1/(2^x) to mantis

; calculate the exponent
mov EBX, [EBP+12]
shr EBX, 20		; EBX = | 11exp | rest is empty
sub EBX, 1024	; sub the offset

; now in EBX is real exponent
; need to set bit in index equal to exponent

mov EAX, 80000000h	; set first bit
mov ECX, EBX		; save exponent in counter
set_index:
	shr EAX, 1		
	loop set_index
shr EAX, 12			; make space for sign and exponent

; add one into double number
mov EBX, [EBP+12]	; first part of double
mov EDX, [EBP+8]	; second part of double
add EAX, EBX		; add set bit 

save_result:
finit
push EAX
push EDX
fld qword ptr [ESP]

; rebuild stack
pop EDI
pop ESI
mov ESP, EBP
pop EBP
ret
_increment_double ENDP
END


