.686
.model flat
extern _malloc : PROC
extern _free : PROC
public _array_copy

.data
.code

_array_copy PROC
push EBP
mov EBP, ESP
push ESI

; call malloc  
mov EAX, [EBP+12]
push EAX
call _malloc
add ESP, 4
			
; prepare for loop
mov ESI, EAX		; ESI is destination
mov ECX, [EBP+12]	; ECX is number of items
mov EDI, [EBP+8]	; EDI is source
mov EBX, EAX		; save adress new array

main_loop:
	mov EAX, [EDI]
	mov [ESI], EAX
	add ESI, 4
	add EDI, 4
	loop main_loop

finish:
mov EAX, EBX
pop ESI
mov ESP, EBP
pop EBP
ret
_array_copy ENDP
END