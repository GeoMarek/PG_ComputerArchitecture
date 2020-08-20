.686
.model flat
public _float_by_float
.data
.code

_float_by_float PROC
push ebp
mov ebp, esp
push ebx
push ecx
push edx
push esi
push edi

; [EBP+8] - first float
; [EBP+12] - second float

mov EAX, dword ptr [EBP+8]
mov EBX, dword ptr [EBP+12]

; calculate exponent of arguments

xor ECX, ECX
xor EDX, EDX

; first exponent
rol EAX, 9			; |fraction(23)|sign(1)|exp(8)|
mov CL, AL			; save exp in CL
ror EAX, 9			; rebuild first float
; second exponent
rol EBX, 9			; |fraction(23)|sign(1)|exp(8)|
mov DL, BL			; save exp in DL
ror EBX, 9			; rebuild second float

; result exponent (sum)
sub CL, 127			
add CL, DL			; save final exp in CL

; clear from sign adn exponent
and EAX, 7FFFFFh
and EBX, 7FFFFFh

; add hidden one	
bts EAX, 23			
bts EBX, 23

; multiply mantises
xor EDX, EDX
mul EBX				; EAX * EBX = EDX:EAX
bt EDX, 15			; 15 -> fraction(23+23) - 32(EAX) + 1(2^0) + 1(2^1)
jnc same_exponent	; if integer part is bigger than 2
inc CL				; then increase exponent

same_exponent:
	move_bits:
	shl EAX, 1	
	rcl EDX, 1
	jnc move_bits

; update result number
shr EDX, 9			; mantis
shl ECX, 23			; esponent
or EDX, ECX			; result without sign is in EDX

; sign bit preparations
mov EAX, [EBP+8]
mov EBX, [EBP+12]
xor ECX, ECX

; first sign bit
bt EAX, 31
adc ECX, 0

; second sign bit
bt EBX, 31
adc ECX, 0

; save sign bit
shl ECX, 31
or EDX, ECX

; save result to fpu
push EDX
finit 
fld dword ptr [ESP]
add ESP, 4 

; clear the stack		
pop edi
pop esi
pop edx
pop ecx
pop ebx
pop ebp
ret
_float_by_float ENDP
END