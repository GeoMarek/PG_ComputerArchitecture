; Program gwiazdki.asm
; Wyświetlanie znaków * w takt przerwań zegarowych
; Uruchomienie w trybie rzeczywistym procesora x86
; lub na maszynie wirtualnej
; zakończenie programu po naciśnięciu klawisza 'x'
; asemblacja (MASM 4.0): masm gwiazdki.asm,,,;
; konsolidacja (LINK 3.60): link gwiazdki.obj;
.386
rozkazy SEGMENT use16
 ASSUME CS:rozkazy 

wyswietl_AL PROC
; wyswietl AL na ekranie wg adresu ES:BX
 push ax
 push cx
 push dx
  
  
 mov cl, 10 	; dzielnik
; dzielenie AX przez CL, wynik w AL, reszta w AH
; setki (bx) dziesiatki(bx+2) jednosci(bx+4)
 mov ah, 0 			; zerowanie reszty przed dzieleniem
 div cl 			; pierwsze dzielenie
 add ah, 30H 		; zamiana reszty na ASCII
 mov es:[bx+4], ah 	; wpisanie cyfry jedności
 mov ah, 0			; zerowanie reszty przed dzieleniem
 div cl 			; drugie dzielenie
 add ah, 30H 		; zamiana reszty na kod ASCII
 mov es:[bx+2], ah 	; wpisanie cyfry dziesiątek
 add al, 30H 		; zamiana ilorazu na kod ASCII
 mov es:[bx+0], al 	; cyfra setek
 
; wpisanie kolorów dla całej liczby
 mov al, 00001111B
 mov es:[bx+1],al ; dla setek
 mov es:[bx+3],al ; dla dziesiatek
 mov es:[bx+5],al ; dla jednosci

; wyjscie z podprogramu
 pop dx
 pop cx
 pop ax
 ret
wyswietl_AL ENDP



; procedura obsługi przerwania klawiatury
obsluga_klaw PROC
 push ax
 push bx
 push es
; deklaracja zmiennych
 mov ax, 0B800h 		; adres trybu tekstowego -> B8000h, ale po pomnozeniu przez 16
 mov es, ax				; wpisujemy adres do rejestru ES
 mov bx, cs:licznik		; adres biezacej komorki w trybie tekstowym
; wywołanie obslugi klawiatury
 in al, 60h				; przeslanie do AL numeru klawisza
 call wyswietl_AL		; wywołanie AL
; zapis znaku w pamieci ekranu
 add bx,8 				; przechodzimy dalej, zeby ladnie bylo widac
 cmp bx,4000 			; sprawdzamy, czy jestesmy w pamieci trybu 
 jb wyswietl			; skok gdy nie koniec ekranu
 mov bx, 0 				; wyzerowanie licznik, jak cały ekran zapisany
; zakonczenie 
wyswietl:
 mov cs:licznik,bx ; adres biezacy do licznika
 pop es
 pop bx
 pop ax
 jmp dword PTR cs:wektor9 ; skok do org przerwania klawiatury

licznik dw 320
wektor9 dd ?
obsluga_klaw ENDP


;==========================================================================
; program główny - instalacja i deinstalacja procedury
; obsługi przerwań
; ustalenie strony nr 0 dla trybu tekstowego
zacznij:
 mov ax, 0
 mov ds,ax ; zerowanie rejestru DS
 
 
; ZAPISANIE ORYGINALEJ FUNKCJI PRZERWANIA
; wektor nr 9 ma 4 bajty i lezy od adresu fizycznegi 0*16 + 4*9 = 36
 mov eax,ds:[36] ; adres fizyczny 0*16 + 4*9 = 36
 mov cs:wektor9, eax

; WRZUCENIE DO TWP NASZEJ PROCEDURY
 mov ax, SEG obsluga_klaw 		; część segmentowa adresu
 mov bx, OFFSET obsluga_klaw 	; offset adresu
 cli 							; zablokowanie przerwań
 mov ds:[36], bx 				; zapisanie w TWP segmentu
 mov ds:[38], ax 				; zapisanie w TWP offsetu
 sti 							; odblokowanie przerwań

 ; OCZEKIWANIE NA WCISNIECIE KLAWISZA ESC
aktywne_oczekiwanie:
 mov ah,1
 int 16H	 				; funkcja INT 16H (AH=1) ustawia ZF=1 jeśli naciśnięto klawisz
 jz aktywne_oczekiwanie
 mov ah, 0
 int 16H					; funkcja INT 16H (AH=0) zapisuje znak w AL
 cmp al, 27				; porównanie z kodem ESC
 jne aktywne_oczekiwanie 	; skok, gdy znak rozny od x
 
; ODTWORZENIE STAREGO WEKTORA PRZERWAŃ
 mov eax, cs:wektor9 		; adres oryginalnego wektora nr8 do eax
 cli						; zablokowanie przerwań
 mov ds:[36], eax 			; przesłanie wartości oryginalnej
 sti					 	; odblokowanie przerwań
 
; ZAKONCZENIE PROGRAMU
 mov al, 0
 mov ah, 4CH
 int 21H
rozkazy ENDS
;==========================================================================

nasz_stos SEGMENT stack
 db 128 dup (?)
nasz_stos ENDS
END zacznij