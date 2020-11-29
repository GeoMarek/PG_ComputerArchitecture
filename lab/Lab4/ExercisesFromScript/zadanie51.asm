.686
.model flat

public _srednia_harm

.data

.code
_srednia_harm PROC
	push EBP
	mov EBP, ESP	
	push ESI

	mov ECX, [EBP+12]
	mov ESI, [EBP+8]
	dec ECX
	finit
	
	; zaladowanie pierwszego wyrazu
	fld1
	fld dword ptr [ESI]
	fdiv
	add ESI, 4

	; petla po reszcie wyrazow
	suma_odwrotnosci:
		fld1					; st(0) = 1, st(1) = sum
		fld dword ptr [ESI]		; st(0) = a, st(1) = 1, st(2) = sum
		fdiv					; st(0) = 1/a, st(1) = sum
		faddp st(1), st(0)		; st(0) = sum
		add ESI, 4				; nastepna liczba
	loop suma_odwrotnosci

	; podzielenie n przez sume odwrotnosci
	fild dword ptr [EBP+12]			; st(0) = n, st(1) = sum
	fdiv st(0), st(1)				; st(0) = n/sum, st(1) = sum
	fxch st(1)						; sum, n/sum
	fstp st(0)						; n/sum


	pop ESI
	pop EBP
	ret
_srednia_harm ENDP
END