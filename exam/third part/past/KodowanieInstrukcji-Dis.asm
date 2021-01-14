    12: 	_asdff PROC
    13: 		push ebp
00E266A2 55                   push        ebp
    14: 		mov ebp, esp
00E266A3 8B EC                mov         ebp,esp
    15: 		pop ebp
00E266A5 5D                   pop         ebp
    16: 		ret
00E266A6 C3                   ret
    17: 	_asdff ENDP
    18:
    19: 	OMG:
    20: 	mov eax, 10
00E266A7 B8 0A 00 00 00       mov         eax,0Ah
    21: 	mov ebx, 1234H
00E266AC BB 34 12 00 00       mov         ebx,1234h
    22: 	mov dl, 1
00E266B1 B2 01                mov         dl,1
    23: 	mov dx, 1
00E266B3 66 BA 01 00          mov         dx,1
    24: 	mov ecx, edx
00E266B7 8B CA                mov         ecx,edx
    25: 	mov esi, [edi]
00E266B9 8B 37                mov         esi,dword ptr [edi]
    26: 	mov [edi], esi
00E266BB 89 37                mov         dword ptr [edi],esi
    27: 	mov eax, [ebp + 4*eax + 8]
00E266BD 8B 44 85 08          mov         eax,dword ptr [ebp+eax*4+8]
    28: 	mov eax, ss
00E266C1 8C D0                mov         eax,ss
    29: 	mov [ebx], word PTR 12H
00E266C3 66 C7 03 12 00       mov         word ptr [ebx],12h
    30: 	movsx ebx, bx
00E266C8 0F BF DB             movsx       ebx,bx
    31: 	xchg al, bh
00E266CB 86 C7                xchg        al,bh
    32: 	lea eax, [ebx]
00E266CD 8D 03                lea         eax,[ebx]
    33: 	lea eax, [ecx + eax + 12]
00E266CF 8D 44 08 0C          lea         eax,[eax+ecx+0Ch]
    34: 	push edi
00E266D3 57                   push        edi
    35: 	pop eax
00E266D4 58                   pop         eax
    36: 	add eax, 1
00E266D5 83 C0 01             add         eax,1
    37: 	add eax, 0DEADBEEFH
00E266D8 05 EF BE AD DE       add         eax,0DEADBEEFh
    38: 	add bx, dx
00E266DD 66 03 DA             add         bx,dx
    39: 	add al, al
00E266E0 02 C0                add         al,al
    40: 	add eax, [ecx + 12]
00E266E2 03 41 0C             add         eax,dword ptr [ecx+0Ch]
    41: 	add [ecx + 4*ebp + 16], ax
00E266E5 66 01 44 A9 10       add         word ptr [ecx+ebp*4+10h],ax
    42: 	sub al, 7H
00E266EA 2C 07                sub         al,7
    43: 	sub ebp, 1234H
00E266EC 81 ED 34 12 00 00    sub         ebp,1234h
    44: 	sub al, al
00E266F2 2A C0                sub         al,al
    45: 	cmp ecx, 123H
00E266F4 81 F9 23 01 00 00    cmp         ecx,123h
    46: 	cmp al, 0
00E266FA 3C 00                cmp         al,0
    47: 	inc eax
00E266FC 40                   inc         eax
    48: 	dec ebx
00E266FD 4B                   dec         ebx
    49: 	mul ecx
00E266FE F7 E1                mul         eax,ecx
    50: 	mul dword PTR [ebp]
00E26700 F7 65 00             mul         eax,dword ptr [ebp]
    51: 	div ecx
00E26703 F7 F1                div         eax,ecx
    52: 	div dword PTR [eax + 12]
00E26705 F7 70 0C             div         eax,dword ptr [eax+0Ch]
    53: 	div dword PTR [256H + ecx*4]
00E26708 F7 34 8D 56 02 00 00 div         eax,dword ptr [ecx*4+256h]
    54: 	and eax, ebx
00E2670F 23 C3                and         eax,ebx
    55: 	and eax, 12H
00E26711 83 E0 12             and         eax,12h
    56: 	xor al, 12H
00E26714 34 12                xor         al,12h
    57: 	or eax, ebx
00E26716 0B C3                or          eax,ebx
    58: 	xor bx,dx
00E26718 66 33 DA             xor         bx,dx
    59:
    60: lol:
    61: 	rol eax, 15
00E2671B C1 C0 0F             rol         eax,0Fh
    62: 	ror ax, 6
00E2671E 66 C1 C8 06          ror         ax,6
    63: 	loop lol
00E26722 E2 F7                loop        lol (0E2671Bh)
    64: 	jmp asd
00E26724 EB 00                jmp         asd (0E26726h)
    65:
    66: asd:
    67: 	je xxx
00E26726 74 04                je          xxx (0E2672Ch)
    68: 	jb xxx
00E26728 72 02                jb          xxx (0E2672Ch)
    69: 	ja xxx
00E2672A 77 00                ja          xxx (0E2672Ch)
    70:
    71: xxx:
    72: 	call _asdff
00E2672C E8 71 FF FF FF       call        _asdff (0E266A2h)
    73: 	jmp OMG
00E26731 E9 71 FF FF FF       jmp         OMG (0E266A7h)
    74: 	mov eax, [ebx*4 + 8]
00E26736 8B 04 9D 08 00 00 00 mov         eax,dword ptr [ebx*4+8]
    75: 	mov eax, [esp + 8]
00E2673D 8B 44 24 08          mov         eax,dword ptr [esp+8]
    76: 	mov eax, [ecx + 4*ebx]
00E26741 8B 04 99             mov         eax,dword ptr [ecx+ebx*4]
    77: 	mov eax, [esp + 4*edi + 12]
00E26744 8B 44 BC 0C          mov         eax,dword ptr [esp+edi*4+0Ch]
    78: 	mov eax, [edi + 4*edi + 8]
00E26748 8B 44 BF 08          mov         eax,dword ptr [edi+edi*4+8]
