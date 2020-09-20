.686
.model flat
public _number_pi

.data
.code

_number_pi PROc
push ebp					;; preamble
mov ebp, esp

;; load 2 on st(0) in x87

finit						;; init x87					
fld1						
fld1						
faddp						


;; try to merge elements in to pairs 
;; for example (2/1 * 2/3) or (4/3 * 4/5)

mov ECX, dword ptr [ebp+8]	;; save NUM in ECX
dec ECX						;; dec, because first is number 2
shr ECX, 1					;; c == 1 have ECX-1 pairs and last element
jnc main_ptl				;; c == 0 have ECX pairs, skip the last

;; add last element

mov EAX, 0					
add EAX, ECX
inc EAX
shl EAX, 1
push EAX					;; [EBP-4] is numerator
dec EAX
push EAX					;; [EBP-8] is denominator

fild dword ptr [EBP-4]		;; num, 2
fild dword ptr [EBP-8]		;; denom, num, 2
fdiv						;; last, 2
fmul						;; 2*last

;; main loop
main_ptl:
	mov EAX, ECX
	shl EAX, 1

	;; numerator x
	mov dword ptr [EBP-12], EAX
	fild dword ptr [EBP-12]
	;; denomDEC x-1
	dec EAX
	mov dword ptr [EBP-16], EAX
	fild dword ptr [EBP-16]		
	;; denomINC x+1
	add EAX, 2
	mov dword ptr [EBP-20], EAX
	fild dword ptr [EBP-20]

	;; multiplying (num^2) / (denomDEC * denomINC)
	;; stack: num, denomDEC, denomINC, 2 or 2*last

	fmulp st(1), st(0)	
	fxch st(1)
	fmul st(0), st(0)
	fdiv st(0), st(1)
	fxch st(1)
	fstp st(0)
	fmulp st(1), st(0)

loop main_ptl

;; return 
mov esp, ebp				
pop ebp
ret
_number_pi ENDP
END