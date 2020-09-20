.686
.model flat
public _shift_left_96bit
.data
.code

_shift_left_96bit PROC
push EBP
mov EBP, ESP

; get addresses of arguments
mov EAX, dword ptr [EBP+8]
mov EBX, dword ptr [EBP+12]
mov EDX, dword ptr [EBP+16]
; get values of arguments
mov EAX, [EAX]
mov EBX, [EBX]
mov EDX, [EDX]
xor ECX, ECX

; main algorithm
bt EDX, 31				; check most left in EDX
adc ECX, 0				; save this bit in ECX
shl EDX, 1				; shift first register

bt EBX, 31				; check most left in EBX
jnc jump_1				; if set - add 1 to first register
inc EDX					; if not - pass
jump_1:	
shl EBX, 1				; shift second register

bt EAX, 31				; check most left in EAX
jnc jump_2				; if set - add 1 to second register
inc EBX					; if not - pass
jump_2:		
shl EAX, 1				; shift third register
add EAX, ECX			; add first flying bit

; write calculated values into addresses
mov ECX, [EBP+8]
mov [ECX], EAX
mov ECX, [EBP+12]
mov [ECX], EBX
mov ECX, [EBP+16] 
mov [ECX], EDX

end_function:
mov ESP, EBP
pop EBP
ret
_shift_left_96bit ENDP
END