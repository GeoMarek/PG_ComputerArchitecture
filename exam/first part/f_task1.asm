.686
.model flat

public _convertUTF16toUTF8

.data
znak db  0D8h, 3Dh, 0DDh, 14h 
; pod koniec w EAX powinno byc F0 9F 94 94

.code

_convertUTF16toUTF8 PROC
	push EBP
	mov EBP, ESP

	; zapisanie znaku w rejestrze
	mov EAX, dword ptr znak		; wczytanie znaku do rejestru
	bswap EAX
	
	; konwersja UTF-16 na Unicode
	and EAX, 03FF03FFh			; usuwanie prefiksow
								; 000000aa bbbbbbbb 000000cc dddddddd
	shl AX, 6					; 000000aa bbbbbbbb ccdddddd dd000000
	shr EAX, 6					; 00000000 0000aabb bbbbbbcc dddddddd
	add EAX, 10000h				; dodanie odejmowanej wartosci

	; konwersja Unicode na UTF-8
	shl EAX, 4					; 9 bitow w starszje i 12 w mlodszej
	mov DX, AX					; mlodsza czesc w DX
	shr EAX, 16					; starsza czesc w AX

	; zamiana mlodszej czesci
	shr DX, 2
	or DH, 10000000b
	shr DL, 2
	or DL, 10000000b

	; zamiana starszej czesci
	shl AX, 2				
	shr AL, 2
	or AL, 10000000b
	or AH, 11110000b

	; merge obu czesci znaku

	shl EAX, 16
	mov AX, DX

	pop EBP
	ret
_convertUTF16toUTF8 ENDP
END

