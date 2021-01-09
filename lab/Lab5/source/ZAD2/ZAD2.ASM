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
	mov CX, CS:sekunda		; wpisuje licznik do CX						
	add CX, 1				; zwiekszam licznik o jeden
	cmp CX, 19				; jak licznik ma 19 to wtedy pokaz gwiazdke
	jne koniec_cyklu
	mov CX, 0				; wyzeruj licznik i printuj
	
	mov BX, CS:licznik					; licznik to adres biezacy
										; pamieci ekranu
	
	mov byte ptr ES:[BX], '*'			; kod ascii
	mov byte ptr ES:[BX+1], 00010110b	; kolor
	add BX, 2							; nastepny znak
	
	cmp BX, 4000						; sprawdzenie czy koniec
	jb wyswietlaj_dalej					
	mov BX, 0
	
	wyswietlaj_dalej:
	mov CS:licznik, BX				; nadpisanie licznik nowym adresem
	
	koniec_cyklu:
	mov CS:sekunda, CX
	pop ES
	pop BX
	pop AX
	
	jmp dword ptr cs:wektor8
	sekunda 	dw 0
	licznik 	dw 320
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	