.686
.XMM					
.model flat

public _int2float


.data
.code
_int2float PROC
	push EBP
	mov EBP, ESP
	push ESI

	mov ESI, [EBP+8]
	cvtpi2ps xmm0, qword ptr [ESI]
	mov ESI, [EBP+12]
	movups [ESI], xmm0

	pop ESI
	pop EBP
	ret
_int2float ENDP
END