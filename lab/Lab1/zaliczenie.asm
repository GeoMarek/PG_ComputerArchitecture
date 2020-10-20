.686
.model flat
extern _ExitProcess@4 : PROC
extern __read : PROC
extern __write : PROc
public _main

.data


.code
_main PROC


end_function:
	push dword PTR 0
	call _ExitProcess@4
_main ENDP
END

