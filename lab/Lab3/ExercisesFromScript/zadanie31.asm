.686
.model flat

public _szukaj4_max

.data
.code

_szukaj4_max PROC
	push EBP
	mov EBP, ESP
	push ESI

	mov EAX, [EBP+8]	; eax ma pierwsza liczbe
	lea ESI, [EBP+12]	; esi ma adres drugiej liczby
	mov ECX, 3			; licznik obiegow petli

	petla:
		cmp EAX, [ESI]
		jge eax_mniejsze
		mov EAX, [ESI]
		eax_mniejsze:
		add ESI, 4
	loop petla

	pop ESI
	pop EBP
	ret
_szukaj4_max ENDP
END


