.686
.model flat
extern _ExitProcess@4 : PROC
extern _input_eax :PROC
extern _show_eax_hex :PROC

public _main34

.data


.code

_main34 PROC

	call _input_eax
	call _show_eax_hex

	push dword PTR 0
	call _ExitProcess@4

_main34 ENDP

END

