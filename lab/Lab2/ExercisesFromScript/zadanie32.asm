.686
.model flat
extern _ExitProcess@4 : PROC
extern _show_eax : PROC
extern _input_eax : PROC
public _main32

.data

.code

_main32 PROC

	call _input_eax
	call _show_eax

	push dword PTR 0
	call _ExitProcess@4

_main32 ENDP
END

