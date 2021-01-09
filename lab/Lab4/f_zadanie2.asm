.686
.xmm
.model flat
public _mul_at_once
.data
.code

_mul_at_once PROC
	push EBP
	mov EBP, ESP

	pmulld xmm0,xmm1


	pop EBP
	ret
_mul_at_once ENDP
END
