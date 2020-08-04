.686
.model flat
public _encrypt
.data
.code

_encrypt PROC
push EBP
mov EBP, ESP
push ESI
push EDI

mov ESI, [EBP+8]	; input address
mov EDI, [EBP+12]	; output address

xor EAX, EAX
xor EBX, EBX

main_loop:
	mov AL, [ESI]				; AL is char from input
	cmp AL, 0					; check for text end
	je finish
	mov BL, byte ptr [EBP+16]	; BL is key
	sub BL, 65					; BL is letter index 
	add AL, BL					; AL is encrypt letter (can have to big code)
	cmp AL, 90					; 90 is 'Z', biggest ASCII code
	jbe not_reduct_ascii		
	sub AL, 26					; 26 is number of chars in ASCII 
	not_reduct_ascii:
	mov [EDI], AL				; insert encrypt char to output
	inc ESI						; inc input index
	inc EDI						; inc output index
	jmp main_loop

finish:
pop EDI
pop ESI
mov ESP, EBP
pop EBP
ret
_encrypt ENDP
END