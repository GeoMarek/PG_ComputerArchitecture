.686
.model flat

extern _MessageBoxA@16 : PROC
public _showMessageBox

.data
tekst 	dw 'ar', 'ch', 'it', 'ek', 'tu', 'ra', 0
.code

_showMessageBox PROC				
	push EBP						
	mov EBP, ESP					
	
	push 0							; dla kazdego dw najpierw bierzemy mlodszy bajt
	push OFFSET tekst 				; tytul - RA HC TI KE UT AR
	lea eax, dword ptr [tekst+6]	; tresc przesuwamy o 6 bajtow w prawo
	push eax 						; KE UT AR
	push 0							
	call _MessageBoxA@16

	pop EBP
	ret
_showMessageBox ENDP
END