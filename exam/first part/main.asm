.686
.model flat

public _main

extern  _ExitProcess@4		: PROC

extern _convertUTF16toUTF8	: PROC
extern _convertUTF8toUTF16	: PROC
extern _divByMinus2			: PROC

extern _whatWillBeEAX0		: PROC
extern _whatWillBeEAX1		: PROC

extern _whatWillBeEAX2		: PROC

extern _isEvenEBX			: PROC 
extern _instructionAddress	: PROC
extern _showMessageBox		: PROC

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

; zadanie 3 
; dzielenie liczby w AL przez -2 uzywajac
; rozkazu SAR - iloraz do AL, reszta do CL
call _divByMinus2



; zadanie 7
; co bedzie w rejestrze EAX
call _whatWillBeEAX0

; zadanie 8
; co bedzie w rejestrze EAX
call _whatWillBeEAX1

; zadanie 11
; co bedzie w rejestrze EAX
call _whatWillBeEAX2

; zadanie 22 
; napisz program, ktory sprawdzi 
; czy EBX jest nieparzysty, jak 
; tak to CF=1, jak nie to CF=0
call _isEvenEBX

; zadanie 23
; co pokaze MessageBox
call _showMessageBox

; zadanie 24
; wpisz do zmiennej statycznej adres 
; aktualnie wykonywanej instrukcji
call _instructionAddress

exit_program:
	push  0			
	call _ExitProcess@4

_main ENDP

END

