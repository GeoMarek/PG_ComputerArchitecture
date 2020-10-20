.686
.model flat
 
extern __read	: PROC
extern __write	: PROC
extern _MessageBoxA@16 : PROc
extern _ExitProcess@4: PROC
public _main26

.data

tytul			db 'Tekst w standardzie Windows 1250', 0
tekst_pocz		db 10, 'Prosz', 0A9h, ' napisa', 086h,' jaki', 098h, ' tekst '
				db 'i nacisn', 0A5h, 086h, ' Enter', 10
koniec_t		db ?
magazyn			db 80 dup (?)
nowa_linia		db 10
liczba_znakow	dd ?
.code

_main26 PROC


; wyswietlenie tekstu powitalnego
	mov ECX, OFFSET koniec_t
	sub ECX, OFFSET tekst_pocz
	push ECX
	push OFFSET tekst_pocz 
	push 1
	call __write
	add esp, 12 

; czytanie wiersza z klawiatury
	push 80 
	push OFFSET magazyn
	push 0 
	call __read
	add esp, 12

; przygotowanie do modyfikacji
	mov liczba_znakow, EAX
	mov ECX, EAX
	mov EBX, 0 

; modyfikacja tekstu
upper_case:
	mov DL, magazyn[EBX]
	
	; a ogonek
	cmp DL, 0A5h
	jne a_ogon_end
		mov DL, 0A5h
		jmp write_char
	a_ogon_end:

	; c kreska
	cmp DL, 086h
	jne c_kreska_end
		mov DL, 0C6h
		jmp write_char
	c_kreska_end:

	; e ogonek
	cmp DL, 0A9h
	jne e_ogon_end
		mov DL, 0CAh
		jmp write_char
	e_ogon_end:

	; l kreska
	cmp DL, 088h
	jne l_kreska_end
		mov DL, 0A3h
		jmp write_char
	l_kreska_end:
	
	; n kreska
	cmp DL, 0E4h
	jne n_kreska_end
		mov DL, 0D1h
		jmp write_char
	n_kreska_end:
	
	; o kreska
	cmp DL, 0A2h
	jne o_kreska_end
		mov DL, 0D3h
		jmp write_char
	o_kreska_end:
	
	; s kreska
	cmp DL, 098h
	jne s_kreska_end
		mov DL, 08Ch
		jmp write_char
	s_kreska_end:
	
	; z kreska
	cmp DL, 0ABh
	jne z_kreska_end
		mov DL, 08Fh
		jmp write_char
	z_kreska_end:
	
	; z kropka
	cmp DL, 0BEh
	jne z_kropka_end
		mov DL, 0Afh
		jmp write_char
	z_kropka_end:

	; zwykle znaki
	cmp DL, 'a'				; sprawdzenie czy trzeba
	jb increm				; zmienic znak
	cmp DL, 'z'
	ja increm
	sub DL, 20H				; zamiana na wielkie litery
	
	; zapisz znak i zwieksz licznik
	write_char:	
	mov magazyn[EBX], DL
	increm: 
	inc EBX
	loop upper_case
	



; wyswietlenie komunikatu
push 0
push OFFSET tytul
push OFFSET magazyn
push 0
call _MessageBoxA@16

push dword PTR 0
call _ExitProcess@4
_main26  ENDP
END