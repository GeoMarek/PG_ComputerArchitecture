.686
.model flat
extern __write	: PROC
extern __read	: PROC
public _zadanie_25

.data
tekst_pocz		db 10, 'Prosz', 0A9h, ' napisa', 086h,' jaki', 098h, ' tekst '
				db 'i nacisn', 0A5h, 086h, ' Enter', 10
koniec_t		db ?
magazyn			db 80 dup (?)
nowa_linia		db 10
liczba_znakow	dd ?

.code
_zadanie_25 PROC
push EBP
mov EBP, ESP


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


mov liczba_znakow, EAX
mov ECX, EAX
mov EBX, 0 

; modyfikacja tekstu
petla_glowna: 
	mov DL, magazyn[EBX]	; pobranie kolejnego znaku
	
	; a z ogonkiem
	cmp DL, 0A5h
	jne a_ogon_end
		mov DL, 0A4h
		jmp write_char
	a_ogon_end:

	; c z kreska
	cmp DL, 086h
	jne c_kreska_end
		mov DL, 08Fh
		jmp write_char
	c_kreska_end:

	; e z ogonkiem
	cmp DL, 0A9h
	jne e_ogon_end
		mov DL, 0A8h
		jmp write_char
	e_ogon_end:

	; l z kreska
	cmp DL, 088h
	jne l_kreska_end
		mov DL, 09Dh
		jmp write_char
	l_kreska_end:

	; n z kreska
	cmp DL, 0E4h
	jne n_kreska_end
		mov DL, 0E3h
		jmp write_char
	n_kreska_end:

	; o z kreska
	cmp DL, 0A2h
	jne o_kreska_end
		mov DL, 0E0h
		jmp write_char
	o_kreska_end:

	; s z kreska
	cmp DL, 098h
	jne s_kreska_end
		mov DL, 097h
		jmp write_char
	s_kreska_end:

	; z z kreska
	cmp DL, 0ABh
	jne z_kreska_end
		mov DL, 08Dh
		jmp write_char
	z_kreska_end:

	; z z kropka
	cmp DL, 0BEh
	jne z_kropka_end
		mov DL, 0BDh
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

loop petla_glowna 

; wyœwietlenie przekszta³conego tekstu
push liczba_znakow
push OFFSET magazyn
push 1
call __write 
add esp, 12


mov ESP, EBP
pop EBP
ret
_zadanie_25 ENDP
END
