.686
.model flat
public _circle_area
.data
.code

_circle_area PROC
push EBP
mov EBP, ESP


finit
fld dword ptr [EBP+8]
fmul st(0), st(0)
fldpi
fmulp st(1), st(0)

mov ESP, EBP
pop EBP
ret
_circle_area ENDP
END

