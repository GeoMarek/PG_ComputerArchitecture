.686
.model flat

public _divByMinus2

.data
.code

_divByMinus2 PROC
	push EBP
	mov EBP, ESP


	mov EAX, 0
	mov AL, 15
	sar AL, 1
	neg AL

	pop EBP
	ret
_divByMinus2 ENDP
END