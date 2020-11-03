.686
.model flat
extern __write : PROC
public _show_eax

.data
znaki db 12 dup (?)

.code

_show_eax PROC
	pusha
	mov ESI, 10			; indeks w talibcy znaki
	mov EBX, 10			; dzielnik

konwersja:
	mov EDX, 0			; zerowanie starszej czesci dzielnej
	div EBX				; wykonanie dzielenia (wynik EAX, reszta EDX)
	add DL, 30h			; konwersja na symbol ASCII
	mov znaki[ESI], DL	; wpisanie cyfry
	dec ESI				
	cmp EAX, 0			; sprawdzam czy juz zero
	jne konwersja

wypeln:
	or ESI, ESI						; sprawdzam czy ESI == 0
	jz wyswietl
	mov BYTE PTR znaki[ESI], 20h	; wpisanie spacji na czyste miejsce
	dec ESI
	jmp wypeln

wyswietl:
	mov BYTE PTR znaki[0], 0Ah ; nowy wiersz
	mov BYTE PTR znaki[11], 20h ; spacja

	push DWORD PTR 12
	push DWORD PTR OFFSET znaki
	push DWORD PTR 1
	call __write
	add ESP, 12

	popa
	ret
_show_eax ENDP
END