.686
.model flat
public _zadanie_27
extern __read	: PROC
extern __write	: PROC
extern _MessageBoxW@16 : PROc
.data

tytul			dw 'T','e','k','s','t',' ','w',' ','s','t','a','n','d','a','r','d','z','i','e',
					' ','U','T','F','-','1','6',0
tekst_pocz		db 10, 'Prosz', 0A9h, ' napisa', 086h,' jaki', 098h, ' tekst '
				db 'i nacisn', 0A5h, 086h, ' Enter', 10
koniec_t		db ?
magazyn			db 80 dup (?)
magazyn_utf		dw 80 dup (?)
nowa_linia		db 10
liczba_znakow	dd ?
.code

_zadanie_27 PROC
push EBP
mov EBP, ESP
push ESI
push EDI

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
	dec ECX
	mov ESI, 0		; indeks magazyn 8bit
	mov EDI, 0		; indeks magazyn 16bit

; glowna petla
main_loop:
	mov DX, 0
	mov DL, magazyn[ESI]
	cmp DL, 128
	jb ascii_character

	; a ogonek
	cmp DL, 165
	jne a_ogonek_end
		mov DX, 0104h
		mov magazyn_utf[EDI], DX
		jmp increment
	a_ogonek_end:

	; c kreska
	cmp DL, 134
	jne c_kreska_end
		mov DX, 0106h
		mov magazyn_utf[EDI], DX
		jmp increment
	c_kreska_end:

	; e ogonek
	cmp DL, 169
	jne e_ogonek_end
		mov DX, 0118h
		mov magazyn_utf[EDI], DX
		jmp increment
	e_ogonek_end:

	; l kreska
	cmp DL, 136
	jne l_kreska_end
		mov DX, 0141h
		mov magazyn_utf[EDI], DX
		jmp increment
	l_kreska_end:

	; n kreska
	cmp DL, 228
	jne n_kreska_end
		mov DX, 0143h
		mov magazyn_utf[EDI], DX
		jmp increment
	n_kreska_end:

	; o kreska
	cmp DL, 162
	jne o_kreska_end
		mov DX, 00D3H
		mov magazyn_utf[EDI], DX
		jmp increment
	o_kreska_end:

	; s kreska
	cmp DL, 152
	jne s_kreska_end
		mov DX, 015Ah
		mov magazyn_utf[EDI], DX
		jmp increment
	s_kreska_end:

	; z kreska
	cmp DL, 171
	jne z_kreska_end
		mov DX, 0179h
		mov magazyn_utf[EDI], DX
		jmp increment
	z_kreska_end:

	; z kropka
	cmp DL, 190
	jne z_kropka_end
		mov DX, 017Bh
		mov magazyn_utf[EDI], DX
		jmp increment
	z_kropka_end:

	ascii_character:
		sub DL, 20h
		mov magazyn_utf[EDI], DX
		jmp increment

	increment:
		add EDI, 2
		add ESI, 1
		dec ECX
	jnz main_loop




; wyswietlenie komunikatu
push 0
push OFFSET tytul
push OFFSET magazyn_utf
push 0
call _MessageBoxW@16

pop EDI
pop ESI
mov ESP, EBP
pop EBP
ret
_zadanie_27  ENDP
END