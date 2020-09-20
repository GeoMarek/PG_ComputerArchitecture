.686
.model flat
public _random_encrypt
.data
.code

_random_encrypt PROC
push EBP
mov EBP, ESP
push ESI



mov ESI, EBP
add ESI, 8			; ESI is address
mov ESI, [ESI]
mov EBX, 52525252h	; EBX is key

main_loop:
	; encrypt character 
	mov AL, [ESI]	; AL is char
	cmp AL, 0		; check for end of message
	je finish		; if zero, then finish function
	xor AL, BL		; encrypt char
	mov [ESI], AL	; save encrypted char
		
	; xor bit 30 and 31
	xor ECX, ECX	; clear for 30bit load
	xor EDX, EDX	; clear for 31bit load
	bt EBX, 30		
	adc ECX, 0		; save bit in ECX
	bt EBX, 31
	adc EDX, 0		; save bit in EDX
	xor ECX, EDX	; xor result is in ECX

	; modify key
	shl EBX, 1		; shift key one left
	add EBX, ECX	; add to key xor result
	inc ESI			; go to next character
	jmp main_loop

finish:
pop ESI
mov ESP, EBP
pop EBP
ret
_random_encrypt ENDP
END