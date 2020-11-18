.686
.model flat
public _podmien
.code
_podmien PROC
	push EBP 
	mov EBP, ESP 
	push EBX 

	mov EBX, [EBP+8]	; adres tablicy tabl
	mov ECX, [EBP+12]	; liczba elementów tablicy
	dec ECX
	; wpisanie kolejnego elementu tablicy do rejestru EAX
	petla: 
		; porownanie dwoch kolejnych elementow 
		mov EAX, [EBX]
		cmp EAX, [EBX+4]
		jle nie_zmieniaj 
		; zamiana s¹siednich elementów tablicy
		mov EDX, [EBX+4]
		mov [EBX], EDX
		mov [EBX+4], EAX
		; skok do nastepnego obiegu petli
		nie_zmieniaj:
		add EBX, 4 ; adres kolejnego elementu
		loop petla 
	
	pop EBX
	pop EBP
	ret 
_podmien ENDP
 END