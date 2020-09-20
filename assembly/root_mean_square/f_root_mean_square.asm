.686
.model flat
public _root_mean_square
.data
.code

_root_mean_square PROC
push EBP
mov EBP, ESP

mov EAX, EBP
add EAX, 8
mov ECX, 3

finit 

square_loop:
	fld dword ptr [EAX]	
	fmul st(0), st(0)
	add EAX, 4
	loop square_loop
sum_elem:
	faddp st(1), st(0)
	faddp st(1), st(0)
	fsqrt 

mov ESP, EBP
pop EBP
ret
_root_mean_square ENDP
END