; void message_box(char* text)
.686
.model flat
extern _MessageBoxA@16 : PROC
public _message_box
.data
header db 'W','A','R','N','I','N','G',0
.code

_message_box PROC
push EBP
mov EBP, ESP
push ESI

; [EBP+8] - address of array


mov ESI, dword ptr [EBP+8] ; save address in ESI
xor ECX, ECX				; ECX is char count


count_character:
	mov AL, [ESI]
	cmp AL, 0
	je push_params
	inc ECX
	inc ESI
	jmp count_character

push_params:
	push 0
	push offset header
	push [EBP+8]
	push 0
	call _MessageBoxA@16


pop ESI
mov ESP, EBP
pop EBP
ret
_message_box ENDP
END