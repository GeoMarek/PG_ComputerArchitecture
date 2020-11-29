.686
.XMM					
.model flat
public _pm_jeden

.data
	jedynki real4 1.0,1.0,1.0,1.0

.code

_pm_jeden PROC
	push EBP
	mov EBP, ESP
	push ESI
	push EDI

	mov ESI, [EBP+8]
	mov EDI, offset jedynki

	movups xmm0, [EDI]
	movups xmm1, [ESI]
	addsubps xmm1, xmm0
	movups [ESI], xmm1

	pop EDI
	pop ESI
	pop EBP
	ret
_pm_jeden ENDP
END