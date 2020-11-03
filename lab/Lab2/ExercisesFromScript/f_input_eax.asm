.686
.model flat
extern __read : PROC
public _input_eax

.data
read_buff db 12 dup (?)
dyszka dd 10 

.code
_input_eax PROC

push ECX
push EBX

reading:
	push dword PTR 12
	push dword PTR OFFSET read_buff 
	push dword PTR 0
	call __read 
	add ESP, 12

	mov EAX, 0
	mov EBX, OFFSET read_buff

pobieraj_znaki:
	mov CL, [EBX] 
	inc EBX 
	cmp CL, 10 
	je was_enter 
	sub CL, 30h 
	movzx ECX, CL 

	mul dword PTR dyszka
	add EAX, ECX 
	jmp pobieraj_znaki 

was_enter:
	pop EBX
	pop ECX
	ret
_input_eax ENDP
END