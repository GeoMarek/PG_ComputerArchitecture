.686
.model flat
extern _ExitProcess@4	: PROC
extern _show_eax	: PROC
extern _input_eax	: PROC

; napisz program, ktory wczyta kilka liczb i od
; pewnego indeksu poszuka najwiekszej z nich
public _find_max

.data

.code
_find_max PROC

	; zapisanie rejestrow
	push ebp
	mov ebp, esp
	push ebx
	push esi
	push edi
	mov ecx,0 

	; wczytywanie liczb, dopoki nie pojawi sie zero
	; liczby sa zapisywane na stosie
	reading:
		call _input_eax 
		cmp EAX, 0 
		je end_of_reading
		inc ECX 
		push EAX 
		jmp reading
	end_of_reading:

	; wczytanie indeksu od ktorego bedziemy szukac
	call _input_eax 
	mov EDX, EAX 
	sub ECX, EAX
	dec ECX
	pop EBX

	; sprawdzanie kolejnych liczb
	check_number:
		pop EAX
		cmp EBX, EAX
		jae less_number
		mov EBX, EAX
		less_number:
	loop check_number
	
	; usuwanie nie sprawdzanych liczb ze stosu
	cmp EDX, 0
	je show_max
	mov ECX, EDX
	free_number:
	pop EDX
	loop free_number

	; wyswietlenie maksimum
	show_max:
		mov EAX, EBX
		call _show_eax

	; rebuild stosu
	end_function:
		pop edi
		pop esi
		pop ebx
		pop ebp
		ret
_find_max ENDP
END

