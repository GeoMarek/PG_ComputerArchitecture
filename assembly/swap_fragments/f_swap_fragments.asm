.686
.model flat
public _swap_fragments

.data
.code

_swap_fragments PROC
push EBP
mov EBP, ESP
push ESI
push EDI

; EBP+8		- text 
; EBP+12	- delete
; EBP+16	- insert
xor EAX, EAX	; EAX is for letter comparision
xor EBX, EBX	; EBX is match fragment counter
xor ECX, ECX	; ECX is flag, 0 < ECX - mean actual
				; check for fragmenst consistency


mov ESI, [EBP+8]
mov EDI, [EBP+12]

main_loop:
	mov AL, byte ptr [ESI]	; save char from text
	mov AH, byte ptr [EDI]	; save char from delete
	cmp AH, AL				; if equal check next char
	je equal_character

not_equal_character:
	mov ECX, 0				; set 0 to flag
	inc ESI					; go to next char from text
	mov EDI, [EBP+12]		; go to fisrt char from delete

check_end:
	cmp AL, 0				; check if its end of text
	je finish
	jmp main_loop

equal_character:
	cmp ECX, 0				; check flag
	ja not_save_index		; if above - we actual are checking 
	inc ECX					; set flag and save address of
	mov EDX, ESI			; first matching character

not_save_index:
	inc ESI					; go to next characters
	inc EDI
	cmp byte ptr [EDI], 0	; check for end of delete
	je equal_fragment		; equal mean matching fragments
	jmp main_loop

equal_fragment:	
	inc EBX						; inc counter
	mov ECX, [EBP+16]			; address of insert

insert_character:
	mov AL, byte ptr [ECX]		; character to input
	cmp AL, 0					; check for insert's end
	je end_insert		
	mov [EDX], AL				; insert character
	inc ECX						; go to next char
	inc EDX
	jmp insert_character		


end_insert:
	mov EDX, 0					; prepare for looking
	mov EDI, [EBP+12]			; another matching fragments
	jmp main_loop

finish:
	mov EAX, EBX

pop EDI
pop ESI
mov ESP, EBP
pop EBP
ret
_swap_fragments ENDP
END