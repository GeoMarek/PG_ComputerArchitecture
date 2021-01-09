.386
rozkazy SEGMENT use16
	ASSUME cs:rozkazy

linia PROC
    push AX
    push BX
    push CX
    push ES

	mov AX, 0A000H
    mov ES, AX
	
	
    mov BX, cs:adres_piksela
    mov AL, cs:kolor
    
    ; nadawanie 'grubości' linii
    mov es:[BX+0], AL		; [000]		[001]	[002]
    mov es:[BX+1], AL		; [320]		[321]	[322]
    mov es:[BX+2], AL       ; [640]		[641]	[642]
    mov es:[BX+320], AL     
    mov es:[BX+321], AL    
    mov es:[BX+322], AL     
    mov es:[BX+640], AL
    mov es:[BX+641], AL
    mov es:[BX+642], AL

    add bx, 320       ; Następny wiersz
    add bx, 5
    
    cmp bx, 320 * 200
    jb dalej          ; skok, gdy nie narysowano całej linii

    
	
	
	mov byte ptr cs:koniec, 1

dalej:
    mov cs:adres_piksela, BX
	mov cs:ostatni_piksel, BX

    ; przywracanie rejestrów
    pop es
    pop cx
    pop bx
    pop ax
    jmp dword PTR cs:wektor8

    kolor          db 10 
    adres_piksela  dw 0
	ostatni_piksel dw 0
    przyrost       dw 0
    koniec         db 0
    wektor8        dd ?
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
