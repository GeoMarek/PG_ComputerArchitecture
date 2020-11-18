.686
.model flat

public _odejmij_jeden

.data
.code

_odejmij_jeden PROC
	push EBP
	mov EBP, ESP

	mov ECX,1 
	mov EAX, [EBP+8]
	mov EAX, [EAX]
	sub [EAX], ECX

	pop EBP
	ret
_odejmij_jeden ENDP
END


