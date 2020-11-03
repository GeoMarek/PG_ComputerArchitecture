.686
.model flat
extern _ExitProcess@4 : PROC
public _main31
extern _show_eax : PROC

.data

.code

_main31 PROC

	mov ESI, 1
	mov EAX, 1
	add_loop:
		call _show_eax
		add EAX, ESI
		inc ESI
		cmp ESI, 50
		je end_main
		jmp add_loop

	end_main:
		push dword PTR 0
		call _ExitProcess@4

_main31 ENDP
END

