.686
.model flat
public _swap_fragments

.data
.code

_swap_fragments PROC
push EBP
mov EBP, ESP
push ESI
push EDI

; EBP+8		- text 
; EBP+12	- delete
; EBP+16	- insert
xor EAX, EAX	; EAX is for letter comparision
xor EBX, EBX	; EBX is match fragment counter
xor ECX, ECX	; ECX is help with save match index


mov ESI, [EBP+8]
mov EDI, [EBP+12]

main_loop:
	mov AL, byte ptr [ESI]
	mov AH, byte ptr [EDI]
	cmp AH, AL
	je znaki_zgodne

znaki_niezgodne:
	mov ECX, 0
	inc ESI
	mov EDI, [EBP+12]

sprawdz_czy_koniec:
	cmp AL, 0
	je finish
	jmp main_loop

znaki_zgodne:
	cmp ECX, 0
	ja nie_zapisuj_indeksu
	inc ECX
	mov EDX, ESI

nie_zapisuj_indeksu:
	inc ESI
	inc EDI
	cmp byte ptr [EDI], 0
	je zgodny_fragment
	jmp main_loop

zgodny_fragment:
	inc EBX		; licznik trafien
	mov ECX, [EBP+16]
	zacznij_wstawiac:
	mov AL, byte ptr [ECX]	; zapisz znak do wstawienia
	cmp AL, 0
	je koniec_wstawiania
	mov [EDX], AL
	inc ECX
	inc EDX
	jmp zacznij_wstawiac


	koniec_wstawiania:
	mov EDX, 0
	mov EDI, [EBP+12]
	jmp main_loop

finish:
	mov EAX, EBX

pop EDI
pop ESI
mov ESP, EBP
pop EBP
ret
_swap_fragments ENDP
END