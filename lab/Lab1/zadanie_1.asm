.686
.model flat
extern __write : PROC
public _zadanie_21

.data

tekst	db 10, 'Nazywam si', 0A9h, '...', 10
		db 'M', 0A2h,'j pierwszy 32-bitowy program '
		db 'asemblerowy dzia',088h ,'a ju', 0BEh,' poprawnie!', 10

.code

_zadanie_21 PROC
push EBP
mov EBP, ESP
	
; wywolanie write z biblioteki C
push dword ptr 85				; liczba znakow
push dword ptr OFFSET tekst		; polozenie obszaru
push dword ptr 1				; uchwyt do urzadzenia
call __write
add ESP, 12						

mov ESP, EBP
pop EBP
ret
_zadanie_21 ENDP
END