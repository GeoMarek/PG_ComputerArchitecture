.686
.model flat

public _main

.code

_main:

	push 0 ; BREAKPOINT, Prawym -> Go to Dissasemby; Jeœli nie widzisz tego w kodzie 16tkowym, prawym na zdissasemblowany kod -> zaznacz "Show Code Bytes"

	_asdff PROC
		push ebp
		mov ebp, esp
		pop ebp
		ret
	_asdff ENDP

	OMG:
	mov eax, 10
	mov ebx, 1234H
	mov dl, 1
	mov dx, 1
	mov ecx, edx
	mov esi, [edi]
	mov [edi], esi
	mov eax, [ebp + 4*eax + 8]
	mov eax, ss
	mov [ebx], word PTR 12H
	movsx ebx, bx
	xchg al, bh
	lea eax, [ebx]
	lea eax, [ecx + eax + 12]
	push edi
	pop eax
	add eax, 1
	add eax, 0DEADBEEFH
	add bx, dx
	add al, al
	add eax, [ecx + 12]
	add [ecx + 4*ebp + 16], ax
	sub al, 7H
	sub ebp, 1234H
	sub al, al
	cmp ecx, 123H
	cmp al, 0
	inc eax
	dec ebx
	mul ecx
	mul dword PTR [ebp]
	div ecx
	div dword PTR [eax + 12]
	div dword PTR [256H + ecx*4]
	and eax, ebx
	and eax, 12H
	xor al, 12H
	or eax, ebx
	xor bx,dx
	lol:
	rol eax, 15
	ror ax, 6
	loop lol
	jmp asd
	asd:
	je xxx
	jb xxx
	ja xxx
	xxx:
	call _asdff
	jmp OMG
	mov eax, [ebx*4 + 8]
	mov eax, [esp + 8]
	mov eax, [ecx + 4*ebx]
	mov eax, [esp + 4*edi + 12]
	mov eax, [edi + 4*edi + 8]


END