.686
.model flat
extern _ExitProcess@4 : PROC
extern _show_eax : PROC
extern _input_eax :PROC

public _main33

.data
.code

_main33 PROC

call _input_eax
xor EDX, EDX
mul EAX
call _show_eax


end_main:
	push dword PTR 0
	call _ExitProcess@4

_main33 ENDP
END

