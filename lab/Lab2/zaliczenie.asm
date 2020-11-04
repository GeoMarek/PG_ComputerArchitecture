.686
.model flat
extern _ExitProcess@4	: PROC
extern _show_eax		: PROC
extern __read			: PROC

public _main

.data
read_buff db 12 dup (?)
mnoznik dd 12 
.code

_input_num PROC
push EBP
mov EBP, ESP
push ECX
push EBX

reading:
	push dword PTR 12
	push dword PTR OFFSET read_buff 
	push dword PTR 0
	call __read 
	add ESP, 12

	mov EAX, 0
	mov EBX, OFFSET read_buff

pobieraj_znaki:
	mov CL, [EBX] 
	inc EBX 
	; sprawdzam czy byl enter
	cmp CL, 10 
	je was_enter 
	; sprawczam znaki (a, A, b, B)
	cmp CL, 'A'
	je wstaw_dziesiec
	cmp CL, 'a'
	je wstaw_dziesiec
	cmp CL, 'B'
	je wstaw_jedenascie
	cmp CL, 'b'
	je wstaw_jedenascie
	; jesli nie znak, to zmien ascii na cyfre
	sub CL, 30h 
	jmp zmien_do_32

	; dodanie 10 do wyniku
	wstaw_dziesiec:
	mov CL, 10
	jmp zmien_do_32

	; dodanie 11 do wyniku
	wstaw_jedenascie:
	mov CL, 11
	jmp zmien_do_32

	; konwersja an liczbe 32 bit
	zmien_do_32:
	movzx ECX, CL 
	mul dword PTR mnoznik
	add EAX, ECX 
jmp pobieraj_znaki 

was_enter:
	pop EBX
	pop ECX
	mov ESP, EBP
	pop EBP
	ret
_input_num ENDP

_main PROC

call _input_num
mov ESI, EAX
call _input_num
add EAX, ESI
call _show_eax



push dword PTR 0
call _ExitProcess@4
_main ENDP
END
