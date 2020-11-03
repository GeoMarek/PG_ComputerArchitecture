.686
.model flat
extern _ExitProcess@4	: PROC
extern _malloc			: PROC
extern _show_eax		: PROC
extern _input_eax		: PROC


; napisz program, ktory wczyta dzielnik oraz kilka liczb wielocyfrowych
; i potem wyswietli tylko te ktore sa podzielne przez podany dzielnik

; read_numbers(x) - wczytuje znaki to tablicy i zwraca jej adres, gdzie x to liczba znakow 
public _read_numbers
; print_divisible(buf, n, dzielnik) - printuje tylko te liczby z bufora, ktore sa podzielne
public _print_divisible

public _main

.data
.code

_read_numbers PROC
push EBP
mov EBP, ESP
push ESI
push ECX

; rezerwacja pamieci
mov ECX, [EBP+8]
shl ECX, 2
push ECX
call _malloc
mov ESI, EAX
push ESI

; liczba znakow
mov ECX, [EBP+8]

; wczytywanie kolejnych znakow
read_loop:
	call _input_eax
	mov dword ptr [ESI], EAX
	add ESI, 4
loop read_loop

; cleaning
pop ESI
mov EAX, ESI
pop ECX
pop ESI
mov ESP, EBP
pop EBP
ret
_read_numbers ENDP

_print_divisible PROC
push EBP
mov EBP, ESP
push ESI
push EDI
push ECX

; ebp+8 to adres bufora
; ebp+12 to rozmiar bufora w bajtach
; ebp+16 to adres bufora

mov ESI, [EBP+16]	; esi to adres bufora
mov ECX, [EBP+12]	; ecx to ilosc liczb do sprawdzenia
mov EDI, [EBP+8]	; edi to dzielnik 
shr ECX, 2
xor EAX, EAX
xor EDX, EDX

check_divisible:
	mov EAX, dword ptr [ESI]
	div EDI
	cmp EDX, 0

	jne dont_print
		mov EAX, dword ptr [ESI]
		call _show_eax
	
	dont_print:
		add ESI, 4
		xor EAX, EAX
		xor EDX, EDX
	
loop check_divisible

return:
pop ECX
pop EDI
pop ESI
mov ESP, EBP
pop EBP
ret
_print_divisible ENDP


_main PROC
	
	; dzielnik w ebx
	call _input_eax
	mov EBX, EAX
	; ilosc liczb w ecx
	mov ECX, 7
	push ECX
	; adres obszaru w eax
	call _read_numbers

	push EAX
	push ECX
	push EBX
	call _print_divisible

	push dword PTR 0
	call _ExitProcess@4
_main ENDP
END

