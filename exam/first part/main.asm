.686
.model flat

public _main

extern  _ExitProcess@4	: PROC
extern _convertUTF16toUTF8 : PROC
extern _convertUTF8toUTF16 : PROC

.data

.code

_main PROC

; zadanie 1 
; konwersja znaku w utf16 na znak w utf8
; na przykadzie znaku D83D DD14 (Bell) 
call _convertUTF16toUTF8

; zadanie 2
; konwersja znaku w utf8 na znak w utf16
; na przykadzie znaku F09F 9494 (Bell) 
call _convertUTF8toUTF16

exit_program:
	push  0			
	call _ExitProcess@4

_main ENDP

END

