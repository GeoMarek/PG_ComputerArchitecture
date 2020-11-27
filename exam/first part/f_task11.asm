.686
.model flat

public _whatWillBeEAX2

.data
czw		dd 0, 1, 2
ptk		dw 3, 4, 5, 6
sob		dw 7, 8, 9, 10, 11, 12, 13
ndl		db 14, 15, 16, 17
.code

_whatWillBeEAX2 PROC				
	push EBP						
	mov EBP, ESP					
	push EDI	

	; roznica offsetow to liczba bajtow jakie zajmuje CZW
	; EDI + 2 = 3 * 4 + 2 = 14 
	; liczymy 14 bajtow od poczatku sob i bierzemy 4
	; odwracamy ich kolejnosc bo little endian
	; 17 16 15 14 co daje 11100F0E

	mov EDI, offset ptk - offset czw
	mov EAX, dword ptr sob[EDI+2]
	mov ECX, offset sob
	
	
	pop EDI
	pop EBP
	ret
_whatWillBeEAX2 ENDP
END