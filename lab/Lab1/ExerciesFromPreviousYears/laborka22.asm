.686
.model flat
extern _ExitProcess@4 : PROC
extern __read : PROC
extern __write : PROc
public _mainL2

.data

textStart	db 'Prosz', 0A9h,' napisa',086h,' jaki', 098h,' tekst i potwierdzi', 086h,' enterem.'
			db 10, 'Nast', 0A9h, 'pnie wpisa', 086h, ' dwa indeksy oddzielone enterem.'
			db 10, 'Na koniec potwierdzi', 086h, ' enterem.', 10
textEnd		db ?
textData	db 80 dup (?)
indexOne	db 80 dup (?)
indexTwo	db 80 dup (?)
notFound	db '-1'
result		db 80 dup (?)
textCount	dd ?

.code
_mainL2 PROC

; wyswietlenie tekstu powitalnego
mov ECX, OFFSET textEnd
sub ECX, OFFSET textStart
push ECX
push OFFSET textStart
push 1
call __write
add esp, 12 

; czytanie wiersza z klawiatury
push 80 
push OFFSET textData
push 0 
call __read
add ESP, 12

; zapisanie liczby znaków
mov textCount, EAX
mov ECX, EAX
mov EBX, 0 

; wczytanie szukanego znaku
push 80
push OFFSET indexOne
push 0
call __read
add ESP, 12

; wczytannie indeksu poczatkowego
push 80
push OFFSET indexTwo
push 0
call __read
add ESP, 12
mov EAX, textCount

; sprawdzenie poprawnosci dla pierwszego indeksu
xor EBX, EBX
mov BL, indexOne[0]
cmp BL, 30h			
	jb not_found
cmp BL, 39h
	ja not_found
sub BL, 30h
cmp EBX, EAX
	ja not_found 

; sprawdzenie poprawnosci dla drugiego indeksu
xor EBX, EBX
mov BL, indexTwo[0]
cmp BL, 30h			
	jb not_found
cmp BL, 39h
	ja not_found
sub BL, 30h
cmp EBX, EAX
	ja not_found 

; konwersja indeksu na liczbe
mov BL, indexOne[0]
sub BL, 30h
mov BH, indexTwo[0]
sub BH, 30h
mov indexOne, BL
mov indexTwo, BH

; sprawdzenie poprawnosci dla pierwszego znaku
xor EBX, EBX
mov BL, indexOne[0]
mov AL, textData[EBX]
cmp AL, 30h			
	jb not_found
cmp AL, 39h
	ja not_found

; sprawdzenie poprawnosci dla drugiego znaku
xor EBX, EBX
xor EAX, EAX
mov BL, indexTwo[0]
mov AL, textData[EBX]
cmp AL, 30h			
	jb not_found
cmp AL, 39h
	ja not_found

; obliczenie sumy liczb
mov BL, indexOne[0]
mov AL, textData[EBX]
mov BL, indexTwo[0]
add AL, textData[EBX]

; sprawdzenie czy wynik jest dwucyfrowy
sub AL, 60h
cmp AL, 10
ja two_digit

; wynik jednocyfrowy
one_digit:
	add AL, 30h
	mov result[0], AL
	jmp print_result
	
; wynik dwucyfrowy
two_digit:
	sub AL, 10
	add AL, 30h
	mov AH, '1'
	mov result[0], AH
	mov result[1], AL
	jmp print_result

; drukowanie wyniku
print_result:
	push 80
	push OFFSET result
	push 1
	call __write
	add esp, 12 
	jmp end_function

; wyswietlenie minus jeden
not_found:
	push 80
	push OFFSET notFound
	push 1
	call __write
	add esp, 12 

; zakonczenie programu
end_function:
	push dword PTR 0
	call _ExitProcess@4
_mainL2 ENDP
END

