.686
.model flat
public _is_inside

.data
.code
_is_inside PROc
push EBP
mov EBP, ESP

;; x - dword ptr [EBP+8]	
;; y - dword ptr [EBP+12]	
;; z - dword ptr [EBP+16]	
;; r - dword ptr [EBP+20]	
;; h - dword ptr [EBP+24]	

;; r^2 - (x^2 + y^2) > 0 -> if false return 0

mov EAX, dword ptr[EBP+8]		; eax = x
imul EAX, dword ptr[EBP+8]		; eax = x^2 
push EAX						; x^2 is in [EBP-4]

mov EAX, dword ptr[EBP+12]		; eax = y
imul EAX, dword ptr[EBP+12]		; eax = y^2
add EAX, dword ptr [EBP-4]		; eax = x^2 + y^2
mov dword ptr [EBP-4], EAX		; x^2 + y^2 is in [EBP-4]

mov EAX, dword ptr[EBP+20]
imul EAX, dword ptr[EBP+20]		; eax = r^2
sub EAX, dword ptr[EBP-4]		; eax = delta	
cmp EAX, 0						; 
jl outside						; eax < 0 -> return 0

;; z < 0 -> if true return 0
mov EAX, dword ptr [EBP+16]		
cmp EAX, 0						; z < 0
jl outside
;; z > h -> if true return 0
cmp EAX, dword ptr [EBP+24]		; z > 10
jg outside

mov EAX, 1
mov ESP, EBP
pop EBP
ret

outside:
mov EAX, 0
mov ESP, EBP
pop EBP
ret
_is_inside ENDP
END