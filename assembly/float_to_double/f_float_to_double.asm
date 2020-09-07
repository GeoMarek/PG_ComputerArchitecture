.686
.model flat
extern _malloc : PROC
public _float_to_double
.data
.code

_float_to_double PROC
push EBP
mov EBP, ESP
push ESI
push EDI

; float		|1|8 |23|
; double	|1|11|52|

xor ESI, ESI
xor EDI, EDI

; save bit sign 
mov EAX, [EBP+8]
bt EAX, 31
adc ESI, 0			; ESI = | 31b | sign | 

; add exponent 
rol ESI, 11			; ESI = | 20b | sign | 11b |
mov EAX, [EBP+8]
shl EAX, 1			; remove sign 
and EAX, 0FF000000h	; remove mantis
rol EAX, 8			; EAX = | 24b | 8exp |
add EAX, 1023		; calc offset
sub EAX, 127
add ESI, EAX		; ESI = | 20b | sign | 11exp |

; add mantis bits (0-15) to result
shl ESI, 16			; ESI = | 4b | sign | 11exp | 16b |
mov EAX, [EBP+8]
shl EAX, 9			; remove exp and sign
shr EAX, 9			; EAX = | 9b | 23 mantis |
ror EAX, 7			; EAX = | 7 mantis | 9b | 16 mantis |
add SI, AX			; add 16 mantis bits
shl ESI, 4			; prepare bits to last mantis bits
; ESI = | sign | 11 exp | 16 mantis | 4b |

; add mantis bits (16-19) to result
mov EAX, [EBP+8]	
shr EAX, 3			; remove last 3 mantis bits
mov SI, AX			; save bit 4-20 
; ESI = | sign | 11 exp | 20 mantis |

; add last 3 bits to second register
mov EAX, [EBP+8]
shl EAX, 29
mov EDI, EAX

; double is in |ESI|EDI|
; we need to alloc 8 bytes and save in them
push 8
call _malloc
mov [EAX], EDI
add EAX, 4
mov [EAX], ESI
sub EAX, 4

; rebuild stack
pop EDI
pop ESI
mov ESP, EBP
pop EBP
ret
_float_to_double ENDP
END