.686
.model flat
public _compress
.data
.code

_compress PROC
push EBP
mov EBP, ESP
push EDI
push ESI

; prepare registers
xor EAX, EAX		
xor EBX, EBX
xor ECX, ECX
xor EDX, EDX

mov ESI, [EBP+8]	; ESI is address of input
mov EDI, [EBP+12]	; EDI is address of output

insert_char:
	mov EBX, 1			; EBX is char count
	mov AL, [ESI]		; AL is char
	cmp AL, 0			; check if its end
	je finish
	mov [EDI], AL		; char into output
	inc EDI				; inc index in output
	inc ECX				; inc count of output elements
count_number:
	inc ESI				; mov to next char in input
	cmp AL, [ESI]		; cmp with actual 
	jne insert_number	; if not equal insert char_count
	inc EBX				; if equal char_count++
	jmp count_number	
insert_number:
	cmp EBX, 1			; check single char
	je insert_char		
	mov DL, 30h			; DL is ASCII '0'
	add EDX, EBX		; DL is ASCII 'count'
	mov [EDI], DL		; save DL in output
	inc EDI				; inc index in output
	inc ECX				; inc count of output elements
	jmp insert_char

finish:
mov EAX, ECX

; clean the stack
pop ESI
pop EDI
mov ESP, EBP
pop EBP
ret
_compress ENDP
END