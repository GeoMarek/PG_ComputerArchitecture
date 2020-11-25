.686
.model flat

public _dot_product

.data

.code
_dot_product PROC
	push EBP
	mov EBP, ESP	
	push ESI
	push EDI
	push EBX

	mov ESI, 0
	mov EDI, 0
	mov ecx, 0
	mov ebx, [ebp+8]		; adres tab1[ecx]
	mov edx, [ebp+12]		; adres tab2[ecx]


petla:
	mov edx,[ebp+12]		; EDX to tab1[0] 
	mov eax,[ebx+ecx*4]		; EAX to tab2[ecx]
	mov EDI,[edx+ecx*4]		; EDI to tab1[ecx]
	imul EDI				; wynik EAX*EDI w EAX
	add ESI, eax			; sumowanie elementow
	inc ecx					
	cmp ecx, [ebp+16]
	jne petla


koniec:
	mov eax,ESI

	pop EBX
	pop EDI
	pop ESI
	pop EBP
	ret
_dot_product ENDP
END