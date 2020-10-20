.686
.model flat
extern _ExitProcess@4 : PROC
extern __read : PROC
extern __write : PROc
public _mainL1

.data

textStart	db 'Prosz', 0A9h,' napisa',086h,' jaki', 098h,' tekst i potwierdzi', 086h,' enterem.'
			db 10, 'Nast', 0A9h, 'pnie wpisa', 086h, ' szukany znak i indeks oddzielone enterem.'
			db 10, 'Na koniec potwierdzi', 086h, ' enterem.', 10
textEnd		db ?
textData	db 80 dup (?)
myIndex		db 80 dup (?)
myCharacter	db 80 dup (?)
notFound	db '-1'
textCount	dd ?

.code
_mainL1 PROC

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
push OFFSET myCharacter
push 0
call __read
add ESP, 12

; wczytannie indeksu poczatkowego
push 80
push OFFSET myIndex
push 0
call __read
add ESP, 12

; sprawdzenie poprawnosci indeksu
xor EBX, EBX
mov BL, myIndex
mov EAX, textCount

cmp BL, 30h			
	jb not_found
cmp BL, 39h
	ja not_found
sub BL, 30h
cmp EBX, EAX
	ja not_found 

; przygotowanie do petli
xor ECX, ECX			; licznik wystapien
mov AH, myCharacter[0]

; glowna petla
main_loop:
	cmp EBX, textCount		
	jae end_main_loop
	mov AL, textData[EBX]
	cmp AH, AL
	jne dont_count
	inc ECX
	dont_count:
	inc EBX
	jmp main_loop
end_main_loop:
cmp ECX, 0
je not_found

; wyswietlenie wyniku
add ECX, 30h
mov textCount, ECX
push 80
push OFFSET textCount
push 1
call __write
add esp, 12 
jmp end_function

; wyswietlenie -1
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
_mainL1 ENDP
END

