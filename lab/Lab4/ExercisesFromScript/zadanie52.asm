.686
.model flat

public _nowy_exp

.data

.code
_nowy_exp PROC
	push EBP
	mov EBP, ESP	
	push EBX

	mov ECX, 18
	mov EBX, 1
	push EBX
	finit
	
	; zaladowanie pierwszego wyrazu
	fild dword ptr [ESP]		; 1
	fld dword ptr [EBP+8]		; x, 1
	fdiv st(0), st(1)			; x/1 , 1
	fadd st(1), st(0)			; x/1, 1+x/1


	main_loop:
		pop EBX					; zwiekszenie mnoznika
		inc EBX					; ktory jest w mianowniku
		push EBX	

		fild dword ptr [ESP]	; 2			x/1			1+(x/1)
		fdivp st(1), st(0)		; x/(1*2)	1+(x/1)
		fld dword ptr [EBP+8]	; x			x/(1*2)		1+(x/1)
		fmulp st(1), st(0)		; x^2/(1*2)	1+(x/1)
		fadd st(1), st(0)		; x^2/(1*2)	1+(x/1)+(x^2/(1*2*))
		
	loop main_loop
	pop EBX
	fstp st(0)					; pozbycie sie wartosci tymczasowej
	pop EBX
	pop EBP
	ret
_nowy_exp ENDP
END