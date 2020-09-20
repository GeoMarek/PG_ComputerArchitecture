.686
.model flat


public _join_words

.data


.code
_join_words PROc
push EBP
mov EBP, ESP
push ESI
push EDI

; [EBP+8] - separator
mov ESI, [EBP+12]	; address of list
mov ECX, [EBP+16]	; number of words
mov EDI, [EBP+20]	; address of result

xor EDX, EDX
xor EAX, EAX

read_table:
	push ESI
	mov ESI, [ESI]			; ESI is word address

; write word to result array
write_char_in_word:
	mov AL, [ESI]			; AL is char in word
	mov [EDI], AL			; save char in result
	inc ESI					; inc index in word
	inc EDI					; inc index in result
	cmp [ESI], byte ptr 0	; check if its end of word
	jne write_char_in_word

; check if it was last word 
end_input_word:
	pop esi
	cmp ecx,1				
	je write_end			; if equal - inputed last word
	add esi, 4				; move to next word in list
	push ESI				; ESI na stos, bo liczymy nim znaki listy
	mov ESI, [EBP + 8]		; ESI to adres separatora

; input separator to result array 
write_char_in_separator:
	cmp [ESI], byte ptr 0	; check if its end of separator
	je separator_end		; jak tak, to koniec separatora
	mov AL, [ESI]			; AL is char in separator
	mov [EDI], AL			; save char in result
	inc EDI					; inc index in result
	inc ESI					; inc index in separator
	jmp write_char_in_separator
	
; jmp to begin of loop
separator_end:
	pop esi					; ESI is address of list element
	loop read_table			; jump to input next word

; save result address in EAX
write_end:
	mov eax, [ebp + 20]

pop EDI
pop ESI
mov ESP, EBP
pop EBP
ret
_join_words ENDP  
END