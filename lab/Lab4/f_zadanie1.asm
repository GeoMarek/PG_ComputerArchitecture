.686
.model flat
public _znajdz_max_wysokosc
.data
przyspieszenie dd 9.81 
.code
_znajdz_max_wysokosc PROC
	push EBP
	mov EBP, ESP
	
	; pobranie argumentow
	;[EBP+8]	; pierwszy
	;[EBP+12]	; drugi
	finit 
	
	; wyliczenie 1/2g
	push 2
	fild dword ptr [ESP]
	add ESP, 4

	fld dword ptr przyspieszenie
	fmul

	fld1
	fxch st(1)
	fdivp st(1), st(0)

	; wliczenie v^2 / 2g
	fld dword ptr [EBP+8]
	fmul st(0), st(0)

	fmulp

	; konwersja stopni na radiany 
	fld dword ptr [EBP+12]
	fldpi
	fmul

	push 180 
	fild dword ptr [ESP]
	add ESP, 4

	fdivp st(1), st(0)

	; wyliczenie sin(a) ^ 2 
	fsincos 

	
	fstp st(0)

	fmul st(0), st(0)
	
	; koncowy wynik 
	fmulp 
	
	pop EBP
	ret
_znajdz_max_wysokosc ENDP
END