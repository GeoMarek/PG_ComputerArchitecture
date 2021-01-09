.386
rozkazy SEGMENT use16
	ASSUME cs:rozkazy

linia PROC
	push AX
	push BX
	push ES
	
	mov AX, 0A000H 
	mov ES, AX
	
	; wypisanie piksela na ekranie
	mov BX, cs:adres_piksela 
	mov AL, cs:kolor
	mov es:[BX], AL 

	; inkrementacja i sprawdzenie czy koniec
	add BX, 320
	cmp BX, 320*200
	jb kolumna_bez_zmian 
	
	; zmiana koloru i kolumny
	add word PTR cs:przyrost, 10
	mov BX, 10
	add BX, cs:przyrost
	inc cs:kolor 


	kolumna_bez_zmian:
	mov cs:adres_piksela, BX
	
	; skok do oryginalnego przerwania
	pop ES
	pop BX
	pop AX
	jmp dword PTR cs:wektor8
	
	; zmienne podprogramu
	kolor db 1 
	adres_piksela dw 10 
	przyrost dw 0
	wektor8 dd ?
linia ENDP

zacznij:
	mov AH, 0
	mov AL, 13H 
	int 10H
	
	mov BX, 0
	mov ES, BX 
	
	; nadpisanie procedury przerwania
	mov EAX, es:[32] 
	mov cs:wektor8, EAX
	mov AX, SEG linia
	mov BX, OFFSET linia
	cli 
	mov es:[32], BX
	mov es:[32+2], AX
	sti
	
	; czekaj na jakikolwiek znak
	czekaj:
		mov ah, 1 
		int 16h 
		jz czekaj
	mov ah, 0 
	mov al, 3H
	int 10H
	
	; odtworzenie oryginalnej zawartości wektora nr 8
	mov EAX, cs:wektor8
	mov es:[32], EAX
	
	; zakończenie wykonywania programu
	mov AX, 4C00H
	int 21H

rozkazy ENDS

stosik SEGMENT stack
db 256 dup (?)
stosik ENDS
	
END zacznij
