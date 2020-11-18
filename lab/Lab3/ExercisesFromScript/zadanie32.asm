.686
.model flat

public _liczba_przeciwna

.data
.code

_liczba_przeciwna PROC
	push EBP
	mov EBP, ESP

	mov EAX, [EBP+8]
	neg EAX

	pop EBP
	ret
_liczba_przeciwna ENDP
END


