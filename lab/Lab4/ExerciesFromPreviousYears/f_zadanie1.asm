.686
.model flat
public _srednia_kwadratowa
.data
.code
_srednia_kwadratowa PROC
	push EBP
	mov EBP, ESP
	push ESI

	; pobranie argumentow
	mov ESI, [EBP+8]
	mov ECX, [EBP+12]
	dec ECX
	
	; pierwszy wyraz sumy
	finit
	fld dword ptr [ESI]
	fmul st(0), st(0)
	
	; petla sumujaca
	suma_kwadratow:
		add ESI, 4
		fld dword ptr [ESI]
		fmul st(0), st(0)
		faddp st(1), st(0)

	loop suma_kwadratow

	; podzielenie przez N
	fild dword ptr [EBP+12]
	fdivp st(1), st(0)

	; pierwiastek 
	fsqrt 

	pop ESI
	pop EBP
	ret
_srednia_kwadratowa ENDP
END