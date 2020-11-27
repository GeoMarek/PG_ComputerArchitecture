
.model flat

public _instructionAddress

.data
obszar dw 2 dup(?)
.code

_instructionAddress PROC				
	push EBP						
	mov EBP, ESP					
	
	mov EAX, $
	mov dword ptr obszar, EAX

	pop EBP
	ret
_instructionAddress ENDP
END