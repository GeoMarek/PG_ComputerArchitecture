.686
.model flat
public _convert_to_byte_array

.data
.code

_convert_to_byte_array PROC
push EBP
mov EBP, ESP
push ESI
push EDI

; [ebp + 8]		- src
; [ebp + 12]	- x
; [ebp + 16]	- y
; [ebp + 20]	- dest

xor EAX, EAX
xor EBX, EBX	; index in dest
xor ECX, ECX	; line number
xor EDX, EDX	; item in line number

line_loop:
	mov ESI, [EBP+8]	; address of matrix
	shl ECX, 2			; convert line number to bytes
	add ESI, ECX		; move to next line
	shr ECX, 2			; rebuild line number
	mov ESI, [ESI]		; address of list
	xor EDX, EDX		; clear item number
	item_loop:
		push EDX
		xor EDX, EDX
		create_byte_from_src:
			mov AL, [ESI+EDX]	; AL is byte in src
			shl AH, 1			; move AH to left
			add AH, AL			; add AL bit to AH
			inc EDX		
			cmp EDX, 8			; check for byte end
			jb create_byte_from_src
			; rebuild item in line number  
			pop EDX
			add EDX, 8
			; save resulted byte in dest
			mov EDI, [EBP+20]
			add EDI, EBX
			mov [EDI], AH
		; check for next item in list
		inc EBX
		cmp EDX, dword ptr [EBP+12]
		jb item_loop

	; end of line, check for next line
	inc ECX								; inc line safety
	cmp ECX, dword ptr [EBP+16]
	jb line_loop
	jmp finish

finish:
pop EDI
pop ESI
mov ESP, EBP
pop EBP
ret
_convert_to_byte_array ENDP
END

