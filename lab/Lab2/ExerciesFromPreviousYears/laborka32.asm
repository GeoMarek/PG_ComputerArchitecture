.686
.model flat
extern _ExitProcess@4	: PROC
extern _show_eax		: PROC

; napisz program, ktory wyswietli kwadraty kolejnych liczb
public _show_squares
public _mainL2

.data
.code

_show_squares PROC
push EBP
mov EBP, ESP

mov EBX, 1
mov ECX, [EBP+8]

main_loop:
	; prepare registers before mul
	xor EDX, EDX
	xor EAX, EAX
	mov EAX, EBX
	mul EBX
	; call show eax and inc number
	call _show_eax
	inc EBX
	loop main_loop
	
mov ESP, EBP
pop EBP
ret
_show_squares ENDP


_mainL2 PROC
	mov EAX, 10 
	push EAX
	call _show_squares
	push dword PTR 0
	call _ExitProcess@4
_mainL2 ENDP
END

