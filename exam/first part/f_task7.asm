.686
.model flat

public _whatWillBeEAX0

.data
prr		dw	65, 129, 257
.code

_whatWillBeEAX0 PROC				; adresy rosna w dol
	push EBP						; 0100 0001		- 65 mlodszy bajt (64+1)
	mov EBP, ESP					; 0000 0000		- 65 starszy bajt (0)
	push EDI						; 1000 0001		- 129 mlodszy bajt (128+1)
	push EBX						; 0000 0000		- 129 starszy bajt (0)
									; 0000 0001		- 257 mlodszy bajt (1)
									; 0000 0001		- 257 starszy bajt (256)
	
	mov EBX, offset prr			; EBX to adres bajtu 0
	mov EDI, 1					; EDI to numer bajtu od ktorego zaczynamy
	mov EAX, [EDI][EBX]			; bierzemy 4 bajty konczac na pierwszym
								; 01 00 81 00
	pop EBX
	pop EDI
	pop EBP
	ret
_whatWillBeEAX0 ENDP
END