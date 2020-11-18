public suma_liczb

.code

suma_liczb PROC
	mov RAX, 0

	; argumenty z rejestrow
	add RAX, RCX
	add RAX, RDX
	add RAX, R8
	add RAX, R9
	
	; argumenty ze stosu 
	; 32 shadow space + index
	add RAX, [RSP+32+1*8]
	add RAX, [RSP+32+2*8]
	add RAX, [RSP+32+3*8]

	ret
suma_liczb ENDP
END