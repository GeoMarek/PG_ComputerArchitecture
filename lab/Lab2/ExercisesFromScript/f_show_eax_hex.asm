.686
.model flat
extern __write : PROC

.data
hex_decoder db ' 123456789ABCDEF'

.code
_show_eax_hex PROC

	pusha 
	SUB ESP, 12
	mov EDI, ESP
	MOV ECX, 8
	MOV ESI, 1

	ptl3hex:
		; pobranie cyfry z dekodera na podstawie 4 bitow
		rol eax, 4
		mov ebx, eax
		and ebx, 0000000FH
		mov dl, hex_decoder[ebx]

		; zapisanie cyfr w buforze
		mov [edi][esi], dl
		inc esi 

	loop ptl3hex ; sterowanie pêtl¹

	; znaki nowej linii
	mov byte PTR [edi][0], 10
	mov byte PTR [edi][9], 10

	; wyswietlenie liczb
	push 10
	push edi 
	push 1 
	call __write 
	add esp, 24

	; return 
	popa 
	ret 
_show_eax_hex ENDP
END