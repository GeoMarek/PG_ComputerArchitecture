.686
.model flat
public _merge

.data
wynik dd 32 dup (0)
max dd 5

.code
_merge PROC
	push EBP
	mov EBP, ESP	
	push ESI
	push EDI
	push EBX

	mov ecx, [ebp+16]
	cmp ECX, max			; sprawdzenie N
	jae ret_null

	mov esi, [ebp+8]		; adres tab1[ecx]
	mov edi, [ebp+12]		; adres tab2[ecx]
	mov EAX, 0
	mov ecx, [ebp+16]

petla1:
	mov EBX, [ESI]
	mov wynik[EAX], EBX
	ADD EAX, 4
	add ESI, 4
	loop petla1


	
	mov ecx, [ebp+16]


petla2:
	mov EBX, [EDI]
	mov wynik[EAX], EBX
	ADD EAX, 4
	add EDI, 4
	loop petla2


ret_ptr:

	mov EAX, offset wynik
	jmp koniec

ret_null:
	mov EAX, 0
	jmp koniec

koniec:
	pop EBX
	pop EDI
	pop ESI
	pop EBP
	ret
_merge ENDP
END