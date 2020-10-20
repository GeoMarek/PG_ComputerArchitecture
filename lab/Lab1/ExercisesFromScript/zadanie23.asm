.686
.model flat
extern _MessageBoxW@16 : PROc
extern _ExitProcess@4: PROC
public _main23

.data

tytul_Unicode	dw 'Z','n','a','k','i',0

tekst_Unicode	dw  'T','o',' ','j','e','s','t',' ',
					'p', 'i', 'e', 's', ' ',
					0D83Dh, 0DC15h, ' ', 
					'i',' ','k','o','t',' ',
					0D83Dh, 0DC08h, '.', 0

.code

_main23 PROC

	
push 0
push OFFSET tytul_Unicode
push OFFSET tekst_Unicode
push 0
call _MessageBoxW@16
				
push dword PTR 0
call _ExitProcess@4
_main23 ENDP
END