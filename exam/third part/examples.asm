; ZESTAW 1
ptl: mov cx, dx
     in al, 73H
     sub ebx, 1
     loop ptl
     add edx, 3

; ZESTAW 2
     jc cos
ptl: mov [ebx+ecx], dl
     and si, bx
     loop ptl
cos:

; ZESTAW 3
ptl: mov al, bh
     out 70H, al
     in al, 64h
     sub bh, [esi][edi]
     inc ebx
     loop ptl

; ZESTAW 4
ppp: rol eax, 4       
     and eax, 0Fh     
     inc edx          
     mov [ebx+edx], al
     loop ppp          

; ZESTAW 5
ptl: add eax, 4
     neg eax
     mov [esi], eax
     add esi, 4
     loop ptl

; ZESTAW 6
ppp: shr bx, 3
     mov [edx + ebx], dl
     push edx
     cmp edx, 12
     je ppp

; ZESTAW 7
ptl: mov cx, dx 
     sub ebx, 1 
     loop ptl  
     add edx, 3 

; ZESTAW 8
ptl: mov al, bh         
     sub bh, [esi][edi] 
     inc ebx            
     loop ptl          

; ZESTAW 9
ptl: add eax, 4    
     mov [esi],eax 
     add esi, 4   
     loop ptl     

; ZESTAW 10
ppp: mov [edx+ebx], dl 
     push edx          
     cmp edx, 12       
     je ppp            
	 
; ZESTAW 11
	jc dalej
ptl_1:	
	sub bx, 256
	mov [edx+ebx]
	loop ptl_1
next_1:
	xor si, bi

; ZESTAW 12
ptl_2:
	mov dl, bl
	mov ebx, [esi+1234h]
	call edi
	mov [eax+ecx]
	loop ptl_2

; ZESTAW 13
ptl_3:
	shld [edx + 4*esi], eax, 3
	and cl, 0Fh
	div ddword ptr [esi][ecx]
	mov cx, [ebx+120h]
	loop ptl_3

; ZESTAW 14
maly dd 30h ; offset = 0BC1ACh
div byte ptr maly
ptl_4:
	mov maly[2*esi], 0Ah
	shrd edx, eax, 1
	add esp, 0BEEFh
	jo ptl_4
	
; ZESTAW 15
ata db 2 ; offset = 0DDECh
fmul qword ptr ata
ptl_5:
	mov [eax][2*esi]+ata, 0ACh
	je ptl_5
	mul ata
	cmp esp, 0BEEFh





