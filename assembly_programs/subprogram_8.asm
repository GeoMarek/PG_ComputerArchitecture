.686
.model flat
public _copy_even_from_array

.data
.code

_copy_even_from_array PROC
push EBP
mov EBP, ESP
push ESI
push EDI

; [EBP+8]	address of input
; [EBP+12]	address of output
; [EBP+16]	size of array

mov ECX, [EBP+16]
mov ESI, 0				; iter on input
mov EDI, 0				; iter on output

main_loop:
	mov EAX, [EBP+8] 
	add EAX, ESI		; EAX is address of input[ESI]
	mov EAX, [EAX]		; EAX is elem in input
	shr EAX, 1			; shift right to check carry flag
	jc nieparzysty
	mov EBX, [EBP+12]	
	add EBX, EDI		; EBX is address of output[EDI]
	mov EAX, [EBP+8]
	add EAX, ESI		; EAX is address of input[ESI]
	mov EAX, [EAX]		; EAX is elem in input
	mov [EBX], EAX		; save input[ESI] to output[EDI]
	add EDI, 4
	nieparzysty:
	add ESI, 4
loop main_loop

; calculate how many -1 need to insert
sub ESI, EDI			; diff index in output and input	
mov ECX, ESI			
shr ECX, 2				; change bytes to missing number
cmp ECX, 0				; if zero then finish
je finish_fun

complete_array:
	mov EAX, [EBP+12]
	add EAX, EDI				; EAX is address of output[EDX]
	mov [EAX], dword ptr -1		; insert -1
	add EDI, 4					; inremenct index
	loop complete_array

finish_fun:
	

pop EDI
pop ESI
mov ESP, EBP
pop EBP
ret
_copy_even_from_array ENDP
ENd