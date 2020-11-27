.686
.model flat

public _whatWillBeEAX1

.data
prr		dw	65, 129, 257
.code

_whatWillBeEAX1 PROC				; adresy rosna w dol
	push EBP						; 0100 0001		- 65 mlodszy bajt (64+1)
	mov EBP, ESP					; 0000 0000		- 65 starszy bajt (0)
	push ESI						; 1000 0001		- 129 mlodszy bajt (128+1)
	push EBX						; 0000 0000		- 129 starszy bajt (0)
									; 0000 0001		- 257 mlodszy bajt (1)
									; 0000 0001		- 257 starszy bajt (256)
	
	mov EBX, offset prr			; bierzemy B(0 + 2 - 1) = B(1)
	mov ESI, 2					; od B(1) bierzemy 4 bajty od konca
	mov EAX, [EBX + ESI - 1]	; 01 00 81 00
	
	pop EBX
	pop ESI
	pop EBP
	ret
_whatWillBeEAX1 ENDP
END