.686
.model flat
public _min_array
.data
.code

_min_array PROC
push EBP
mov EBP, ESP

; [EBP+8]  - address of array
; [EBP+12] - size of array

mov ECX, [EBP+12]	; ECX is counter
mov EBX, EBP		; EBX is address of comparing item
add EBX, 8
mov EBX, [EBX]
mov EAX, [EBX]		; EAX is actual minimum

main_loop:
	cmp EAX, [EBX]
	jl dont_change
	mov EAX, [EBX]
	dont_change:
	add EBX, 4
	loop main_loop

finish:
mov ESP, EBP
pop EBP
ret
_min_array ENDP
END