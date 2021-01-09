.386
rozkazy SEGMENT use16
		ASSUME CS:rozkazy
		
obsluga_zegara PROC
	push AX
	push BX 
	push ES
	
	mov AX, 0B800h						; oryginalny adres ma B8000h
	mov ES, AX							; ale wpisujemy B800h, bo ES
										; jest zawsze mnozony przez 16
	
	mov BX, CS:licznik					; licznik to adres biezacy
										; pamieci ekranu
	
	mov byte ptr ES:[BX], '*'			; kod ascii
	mov byte ptr ES:[BX+1], 00010110b	; kolor
	
	
	
	add BX, 160				; znak ponizej (80 znakow * 2 bajty)
	cmp BX, 4000		
	jb wyswietlaj_dalej
							; jak poza zakresem 
	add cs:kolumna, 2		; zwieksz numer kolumny o 2 (znak to 2 bajty)
	mov BX, cs:kolumna		; numer kolumy to numer znaku w pierwszym wierszu
	
	wyswietlaj_dalej:
	mov CS:licznik, BX				; nadpisanie licznik nowym adresem
	
	koniec_cyklu:
	pop ES
	pop BX
	pop AX
	
	jmp dword ptr cs:wektor8
	kolumna 		dw 0
	licznik 	dw 0
	wektor8 	dd ?
	
obsluga_zegara ENDP


zacznij:
	mov AL, 0
	mov AH, 5
	int 10
	mov AX, 0
	mov DS, AX
	
	mov EAX, DS:[32]
	mov CS:wektor8, EAX
	
	mov AX, SEG obsluga_zegara
	mov BX, OFFSET obsluga_zegara
	cli
	
	mov DS:[32], BX
	mov DS:[34], AX
	sti
	
	; sprawdzenie czy wcisnieto klawisz
	; int 16h - ustawia ZF po wcisnieciu 
	aktywne_oczekiwanie:
		mov AH, 1
		int 16h
	jz aktywne_oczekiwanie
	
	; sprawdzenie czy wcisnieto 'x'
	mov AH, 0
	int 16h
	cmp AL, 'x'
	jne aktywne_oczekiwanie
	
	mov EAX, CS:wektor8
	cli
	mov DS:[32], EAX
	STI
	
	mov AL, 0
	mov AH, 4Ch
	int 21h

rozkazy ENDS
	
stosik SEGMENT stack
	db 256 dup (?)
stosik ENDS

END zacznij
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	