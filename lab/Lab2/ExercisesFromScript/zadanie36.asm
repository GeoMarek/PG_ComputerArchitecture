.686
.model flat
extern _ExitProcess@4	: PROC
extern _show_eax		: PROC
extern _show_eax_hex	: PROC
extern _input_eax		: PROC
extern _input_eax_hex	: PROC


public _main36

.data


.code

_main36 PROC
	call _input_eax_hex
	call _show_eax
	push dword PTR 0
	call _ExitProcess@4

_main36 ENDP
END

