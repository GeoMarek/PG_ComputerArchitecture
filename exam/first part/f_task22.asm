.686
.model flat

public _isEvenEBX
.data
.code
_isEvenEBX PROC
	push EBP
	mov EBP, ESP
	

	mov EBX, 17		; bt sprawdza czy dany bit jest ustawiony 
	bt EBX, 0		; jak jest to ustawia CF, jak nie to wpisuje 0

	pop EBP
	ret
_isEvenEBX ENDP
END