.686
.model flat
extern _ExitProcess@4 : PROC
extern __read : PROC
extern __write : PROc
public _mainL3

.data

textStart	db 'Prosz', 0A9h,' napisa',086h,' jaki', 098h,' tekst i potwierdzi', 086h,' enterem.', 10
textEnd		db ?
textCount	dd ?
textData	db 80 dup (?)

.code
_mainL3 PROC

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
mov EBX, 0

; petla zamiany znakow
main_loop:
	cmp EBX, textCount
	jae print_result
	mov AL, textData[EBX]
	inc EBX
	cmp textData[EBX], 10
	je print_result
	mov AH, textData[EBX]
	xchg AL, AH
	mov textData[EBX], AH
	dec EBX
	mov textData[EBX], AL
	add EBX, 2
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
_mainL3 ENDP
END

