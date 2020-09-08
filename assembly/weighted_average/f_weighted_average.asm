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

; [EBP+8]	- size
; [EBP+12]	- address scores
; [EBP+16]	- address scales

mov ECX, [EBP+8]	; items count
mov ESI, [EBP+12]	; address scores
mov EDI, [EBP+16]	; address scales
dec ECX				; first iteration without loop
finit
; load score into FPU 
fldz					; sum of multiply
fld dword ptr [EDI]		; sum of scales
fld dword ptr [EDI]		; load scale
fld dword ptr [ESI]		; load score
; stack from top - score, scale, score, 0
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
mov ESP, EBP
pop EBP
ret
_weighted_average ENDP
END