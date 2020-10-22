.686
.model flat
extern _ExitProcess@4 : PROC
extern _MessageBoxA@16 : PROc
public _mainC2

.data
tytul   db    'Znaki', 0
bufor	db    50H, 6FH, 0C5H, 82H, 0C4H, 85H, 63H, 7AH, 65H, 6EH, 69H, 61H, 20H 
        db    0F0H, 9FH, 9AH, 82H   ; parowóz
        db    20H, 20H, 6BH, 6FH, 6CH, 65H, 6AH, 6FH, 77H, 6FH, 20H
        db    0E2H, 80H, 93H ; pó³pauza
        db    20H, 61H, 75H, 74H, 6FH, 62H, 75H, 73H, 6FH, 77H, 65H, 20H, 20H
        db    0F0H,  9FH,  9AH,  8CH ; autobus

.code
_mainC2 PROC
	
push 0
push OFFSET tytul
push OFFSET bufor
push 0
call _MessageBoxA@16



; zakonczenie programu
end_function:
	push dword PTR 0
	call _ExitProcess@4

_mainC2 ENDP
END

