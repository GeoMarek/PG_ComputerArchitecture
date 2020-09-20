.686
.model flat
public _compare_mixed_formats
.data
.code

_compare_mixed_formats PROC
push EBP
mov EBP, ESP
push EDI
push ESI

; both formats are unsigned mixed numbers
; first format - most left 2^23 most right 2^-8
; second format - most left 2^24 most right 2^-7

mov ESI, [EBP+8]		; first format
mov EDI, [EBP+12]		; second format

bt EDI, 31				; check bit 2^24
jc ret_one				; if set, then second is bigger
shl EDI, 1				; convert to first format

cmp EDI, ESI			; cmp values
je ret_zero				; if equal return 0
ja ret_one				; if second > first return 1
mov EAX, -1				; if second < first return -1
jmp finish

ret_zero:
mov EAX, 0
jmp finish

ret_one:
mov EAX, 1

finish:
pop ESI
pop EDI
mov ESP, EBP
pop EBP
ret
_compare_mixed_formats ENDP
END