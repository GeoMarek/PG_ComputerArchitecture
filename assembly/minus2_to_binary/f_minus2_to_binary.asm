.686
.model flat
public _minus2_to_binary

.data
.code

_minus2_to_binary PROC
push EBP
mov EBP, ESP
push EDI
push ESI

mov EAX, [EBP+8]	; EAX is minus2 number
mov EBX, 0
mov ESI, 0
mov EDI, 0
mov ECX, 0

main_loop:

	shr EAX, 1			; last bit into CF
	jnc bit_not_set		; if CF==0 not add to result

	; prepare to calculate 2^exponent
	mov ECX, ESI		; save exponent in ECX to loop
	mov EDI, 1			; EDI will be result
	cmp ECX, 0			; check for first loop
	je check_even	

	; calculate two to the power of the exponent
	two_power_esi:		
		shl EDI, 1			; EDI = EDI*2
		loop two_power_esi	; jump while ECX>0

	; if exponent is even, then add
	check_even:
		mov EDX, ESI			; save temporary ESI in EDX
		shr ESI, 1				; last bit into CF
		jnc add_value			; if CF=0 then add
		minus_value:			; if CF=1 then sub
			sub EBX, EDI
			mov ESI, EDX		; rebuild ESI
			jmp bit_not_set
		add_value:
			add EBX, EDI
			mov ESI, EDX		; rebuild ESI
			jmp bit_not_set

	; increment exponent and check if its end 
	bit_not_set:
	inc ESI				; exponent
	cmp EAX, 0			; check if value is zero
	jne main_loop		; if is not, then jump

; save final result in EAX
mov EAX, EBX

pop ESI
pop EDI
mov ESP, EBP
pop EBP
ret
_minus2_to_binary ENDP
END