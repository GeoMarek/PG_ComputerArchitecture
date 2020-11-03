.686
.model flat

extern __read : PROC
public _input_eax_hex
.data

.code

_input_eax_hex PROC

	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp

	; rezerwacja pamieci na wczytana liczbe
	sub esp, 12
	mov esi, esp
	
	; wczytwanie tekstu z klawiatury
	push dword PTR 10 
	push esi 
	push dword PTR 0
	call __read 

	; przygotowanie do petli
	add esp, 12
	mov eax, 0 

; glowna petla po wczytanych  znakach
main_loop:
	mov dl, [esi] 
	inc esi 

; sprawdzenie czy byl wcisniety enter
check_enter:
	cmp dl, 10 
	je cleaning

; sprawdzenie czy wprowadzony znak to (0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
check_numbers:
	cmp dl, '0'
	jb main_loop 
	cmp dl, '9'
	ja check_big_letters
	sub dl, '0'

; wpisanie znaku na 4 ostatnie bity
write_letter:
	shl eax, 4 
	or al, dl 
	jmp main_loop

; sprawdzenie czy wprowadzony znak to (A, B, C, D, E, F)
check_big_letters:
	cmp dl, 'A'
	jb main_loop
	cmp dl, 'F'
	ja check_small_letters
	sub dl, 'A' - 10
	jmp write_letter

; sprawdzenie czy wprowadzony znak to (a,b,c,d,e,f)
check_small_letters:
	cmp DL, 'a'
	jb main_loop 
	cmp DL, 'f'
	ja main_loop
	sub DL, 'a' - 10
	jmp write_letter

; sprzatanie po podprogramie i return
cleaning:
	add esp, 12
	pop ebp
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
_input_eax_hex ENDP
END