.686
.XMM					
.model flat
public _sumuj_SSE
.code

_sumuj_SSE PROC
	push EBP
	mov EBP, ESP
	push EBX
	push ESI
	push EDI

	mov esi, [ebp+8]		; adres liczby_A[]
	mov edi, [ebp+12]		; adres liczby_B[]
	mov ebx, [ebp+16]		; adres wyniki[]

	movups xmm5, [esi]		; wrzucamy liczby_A jako wektor 16 liczb 8-bitowych
	movups xmm6, [edi]		; wrzucamy liczby_B jako wektor 16 liczb 8-bitowych
	paddsb xmm5, xmm6		; sumujemy oba wektory
	movups [ebx], xmm5		; zapisujemy wynik do adresu

	pop EDI
	pop ESI
	pop EBX
	pop EBP
	ret
_sumuj_SSE ENDP

END