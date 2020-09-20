.686
.model flat
extern _MessageBoxW@16 : PROc
public _zadanie_23

.data

tytul_Unicode	dw 'Z','n','a','k','i',0

tekst_Unicode	dw  'T','o',' ','j','e','s','t',' ','k','o','t',
					':',' ',0D83Dh, 0DC08h, '.', 0

.code

_zadanie_23 PROC
push EBP
mov EBP, ESP
	
push 0
push OFFSET tytul_Unicode
push OFFSET tekst_Unicode
push 0
call _MessageBoxW@16
				
mov ESP, EBP
pop EBP
ret
_zadanie_23 ENDP
END