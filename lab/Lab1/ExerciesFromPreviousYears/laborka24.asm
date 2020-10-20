.686
.model flat
extern _ExitProcess@4 : PROC
extern __read : PROC
extern __write : PROc
public _mainL4

.data

textStart	db 'Prosz', 0A9h,' napisa',086h,' jaki', 098h,' tekst i potwierdzi', 086h,' enterem.'
			db 10, 'Nast', 0A9h, 'pnie wpisa', 086h, ' znak i indeks oddzielone enterem.'
			db 10, 'Na koniec potwierdzi', 086h, ' enterem.', 10
textEnd		db ?
textData	db 80 dup (?)
myIndex		db 80 dup (?)
myCharacter	db 80 dup (?)
textCount	dd ?

.code
_mainL4 PROC

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

; zapisanie indeksu jako liczby
xor ECX, ECX
mov CL, myIndex
sub CL, 30h


main_loop:	
	cmp ECX, textCount
	ja print_result
	mov AH, myCharacter[0]
	mov AL, textData[ECX]
	mov textData[ECX], AH
	mov myCharacter[0], AL
	inc ECX
	jmp main_loop



; drukowanie wyniku
print_result:
push 80
push OFFSET textData
push 1
call __write
add esp, 12 


; zakonczenie programu
end_function:
push dword PTR 0
call _ExitProcess@4
_mainL4 ENDP
END

