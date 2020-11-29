.686
.model flat
public _weighted_average
.data
.code

_weighted_average PROC
	push EBP
	mov EBP, ESP
	push EDI
	push ESI

	; [EBP+8]	- rozmiar
	; [EBP+12]	- oceny
	; [EBP+16]	- wagi ocen

	; pobranie argumentow
	mov ECX, [EBP+8]	
	mov ESI, [EBP+12]	
	mov EDI, [EBP+16]	
	dec ECX				
	finit


	; load score into FPU 
	fldz					; sum of multiply
	fld dword ptr [EDI]		; sum of scales
	fld dword ptr [EDI]		; load scale
	fld dword ptr [ESI]		; load score

							; score, scale, score, 0
	fmulp					; score*scale, score
	faddp st(2), st(0)		; sum(x*y), sum(y)
	
	calculate_loop:
		add ESI, 4			; next items
		add EDI, 4
		fld dword ptr [ESI]	; load items
		fld dword ptr [EDI]
		fadd st(2), st(0)	; add to scale sum
		fmulp				; score*scale
		faddp st(2), st(0)	; add to score*scale sum
	loop calculate_loop

	fdivp st(1), st(0)		; calculate average


	finish:
	pop ESI
	pop EDI
	pop EBP
	ret
_weighted_average ENDP
END
