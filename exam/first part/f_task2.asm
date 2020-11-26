.686
.model flat

public _convertUTF8toUTF16


.data
znak db  0F0h, 9Fh, 94h, 94h
; pod koniec w EAX powinno byc D8 3D DD 14

.code

_convertUTF8toUTF16 PROC
	push EBP
	mov EBP, ESP

	; zapisanie znaku w rejestrze
	mov EAX, dword ptr znak		; wczytanie znaku do rejestru
	bswap EAX
	
	; konwersja UTF-8 na Unicode
	and EAX, 073F3F3Fh		; 00000aaa 00bbbbbb 00cccccc 00dddddd

	shl AL, 2				; 00000aaa 00bbbbbb 00cccccc dddddd00
	shl AX, 2				; 00000aaa 00bbbbbb ccccccdd dddd0000
	ror EAX, 16				; zamiana mlodszej i starszej czesci
							; ccccccdd dddd0000 00000aaa 00bbbbbb 
	shl AL, 2				; 00000aaa bbbbbb00
	shr AX, 2				; 0000000a aabbbbbb
	rol EAX, 16				; powrot polowek na swoje miejsce
							; 0000000a aabbbbbb ccccccdd dddd0000
	shr EAX, 4

	; konwersja Unicode na UTF-16
	sub EAX, 10000h
	shl EAX, 6				; starsza i mlodsza maja po 10 bitow
	mov DX, AX				; mlodsza czesc w DX
	shr EAX, 16				; starsza czesc w AX

	; zamiana mlodszej czesci
	shr DX, 6
	or DX, 1101110000000000b

	; zamiana starszej czesci
	or AX, 1101100000000000b

	; merge obu polowek
	shl EAX, 16
	mov AX, DX

	pop EBP
	ret
_convertUTF8toUTF16 ENDP
END

