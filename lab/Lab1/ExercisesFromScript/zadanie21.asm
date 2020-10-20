.686
.model flat

extern _ExitProcess@4: PROC
extern __write : PROC
public _main21
.data

tekst	db 10,'Nazywam si', 0A9h, '...', 10
		db 'M', 0A2h,'j pierwszy 32-bitowy program '
		db 'asemblerowy dzia',088h ,'a ju', 0BEh,' poprawnie!', 10

.code

_main21 PROC

	
; wywolanie write z biblioteki C
push dword ptr 85				; liczba znakow
push dword ptr OFFSET tekst		; polozenie obszaru
push dword ptr 1				; uchwyt do urzadzenia
call __write
add ESP, 12						

push dword PTR 0
call _ExitProcess@4

_main21 ENDP
END