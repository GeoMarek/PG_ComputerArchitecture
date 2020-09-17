.686
.model flat
extern _malloc	: PROC
extern __write	: PROC
public _int_to_string
.data
.code

_int_to_string PROC
push EBP
mov EBP, ESP
push ESI

; reserve memory
push 12
call _malloc
mov ESI, EAX
push EAX

mov EBX, 10
mov ECX, 11
mov EAX, [EBP+8]


take_absolute:
	bt EAX, 31
	jnc positiv
	neg EAX
	positiv:

divide_by_ten:
	mov EDX, 0
	div EBX				; result - eax, rest - edx
	add DL, 30h			; rest num to character
	mov [ESI+ECX], DL	; save character
	dec ECX
	cmp EAX, 0
	jne divide_by_ten

input_sign:
	bt dword ptr[EBP+8], 31			; check sign bit
	jnc positiv_num
	mov byte ptr [ESI+ECX], 2Dh		; if set, save minus
	dec ECX							; dec counter and got to spaces
	jmp fill_empty					
	positiv_num:				
	mov byte ptr [ESI+ECX], 2Bh		; if not set, save plus
	dec ECX							; dec counter and got to spaces

fill_empty:
	mov byte ptr [ESI+ECX], 20h		; save space in memory
	dec ECX							; control flow
	cmp ECX, -1				
	je write_num				
	jmp fill_empty

write_num:
	pop EAX							
	push dword ptr 12				; size of array
	push EAX						; beginning address 
	push dword ptr 1				
	call __write
			

pop ESI
mov ESP, EBP
pop EBP
ret
_int_to_string ENDP
END