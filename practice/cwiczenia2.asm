.686
.model flat

public _main
extern  _ExitProcess@4	: proc
extern  _MessageBoxW@16 : proc

.data
input	db	50H, 6FH, 0C5H, 82H, 0C4H, 85H, 63H, 7AH, 65H, 6EH, 69H, 61H, 20H 
		db	0F0H, 9FH, 9AH, 82H  
		db	20H, 20H, 6BH, 6FH, 6CH, 65H, 6AH, 6FH, 77H, 6FH, 20H
		db	0E2H, 80H, 93H			
		db	20H, 61H, 75H, 74H, 6FH, 62H, 75H, 73H, 6FH, 77H, 65H, 20H, 20H
		db	0F0H,  9FH,  9AH,  8CH 
		db	0
output  dw	48 dup (0), 0
tytul   dw 'K','o','d','o','w','a','n','i','e',' ','U','T','F', 0


.code

_main PROC
	mov ECX, 48		; indeks w buforze output
	mov ESI, 0		; indeks bajtu w buforze input
	mov EDI, 0		; indeks bajtu w buforze output


main_loop:

	; sprawdzenie czy jest to znak 1 bajtowy
	mov AL, input[ESI] 
	cmp AL, 7Fh
	jbe znak_1bajt

	; sprawdzenie czy jest to znak 2 bajtowy													 
	and  al, 0E0h					; maska, zostawia tylko 3 pierwsze bity
	cmp  al, 0C0h					; porownanie z prefiksem 2 bajtowego znaku - 1100			
	je   znak_2bajt
	
	; sprawdzenie czy jest to znak 3 bajtowy
	mov AL,input[esi]
	and AL, 0F0h					; maska, zostawia tylko 4 pierwsze bity
	cmp AL, 0E0h					; porownanie z prefiksem 3 bajtowego znaku - 1110	
	je   znak_3bajt
	
	; sprawdzenie czy jest to znak 4 bajtowy
	mov AL,input[esi]
	and AL, 0F0h					; maska, zostawia tylko 4 pierwsze bity
	cmp AL, 0F0h					; porownanie z prefiksem 4 bajtowego znaku - 1111	
	je znak_4bajt
	
	; nieznany prefiks bajtu, skaczemy dalej
	jmp increment

	; interpretacja znaku z jednym bajtem
	znak_1bajt: 
		movzx AX, AL				; dopisanie 8 zer z przodu
		inc ESI						; nastêpny znak do interpretacji
		mov	output[EDI], AX			; zapis znaku do napisu
		add EDI, 2
	jmp increment

	; interpretacja znaku z dwoma bajtami
	znak_2bajt:
		
		mov  AX, word ptr input[ESI]; wpisujemy do AX 2 bajty
		xchg AL,AH 					; 110xxxxx 10yyyyyy
		shl  AL, 2					; 110xxxxx yyyyyy00 
		shl  AX, 3					; xxxxxyyy yyy00000
		shr  AX, 5					; 00000xxx xxyyyyyy		      
		add  ESI, 2					; przesuniecie na nastepny znak w input
		mov	output[EDI], AX			; zapis znaku do napisu
		add EDI, 2					; zwiekszenie licznika w output
	jmp increment

	; interpretacja znaku z trzema bajtami
	znak_3bajt:
		movzx  EAX, input[ESI+2]			; zapisanie 3 bajtu w EAX
		xchg   AL, AH						; 
		bswap  EAX							; 
		mov    AX, word ptr input[ESI]		;
		bswap  EAX							;
		shr    EAX, 8						;

		shl AL, 2					; 00000000 0000xxxx yyyyyyzz 00zzzz00
		shl AX, 2					; 00000000 0000xxxx yyyyyyzz zzzz0000
		shr EAX, 4					; 00000000 00000000 xxxxyyyy yyzzzzzz

		add  ESI, 3					; przesuniêcie na nastêpny znak w input
		mov	output[EDI], AX			; zapis znaku do napisu
		add EDI, 2					; zwiekszenie licznika w output
	jmp increment


	znak_4bajt:
		mov EAX, dword ptr input [ESI]   ; odczytanie 4 bajtowego utf-8
   
		xchg AL, AH					; 11110xxx 10yyyyyy 10zzzzzz 10vvvvvv
		shl al,2					; 
		shl ax,5					; ax = xxx xxxxxx 0000000
		shr ax,7					; ax = 0000 000x xxxx xxxx
		xchg al,ah					;   eax =  dd cc aa bb -> dd cc bb aa
		bswap eax					;  eax = aa bb cc dd   0000 000x xxxx xxxx  10xx xxxx 10xx xxxx
		shl al,2					; 0000 000x xxxx xxxx  10xx xxxx xx xxxx 00
		shl ax,2					;  0000 000x xxxx xxxx  xx xxxx xx xxxx 0000
		shr eax,4					;  0000 0000 000x xxxx xxxx  xx xxxx xx xxxx
		
		
		sub eax,10000h				; konwersja punktu kodowego na utf-16
		shl eax,6					; 00 000x xxxx xxxx  xx  xxxx xxxx xx00 0000
		shr ax,6					; 00 000x xxxx xxxx  xx  0000 00 xxxx xxxx xx
		or ax,1101110000000000b		; 00 000x xxxx xxxx  xx     110111 xxxx xxxx xx
		mov output[edi+2],ax
		shr eax,16					; 0000 0000 0000 00000 00 000x xxxx xxxx  xx 
		or ax,1101100000000000b		; 110 110 xxxx xxxx  xx
		
		mov output[EDI], AX			; zapis znaku do napisu
		add ESI, 4					; przesuniêcie na nastêpny znak w input
		add EDI, 4					; zwiekszenie licznika w output
		sub ECX, 3					; indeks w buforze output

	jmp increment


increment:
	sub ecx,1
	cmp ecx,0
	jne main_loop

show_results:
	push 4				    
	push OFFSET tytul		
	push OFFSET output	
	push 0					
	call _MessageBoxW@16

exit_program:
	push  0			
	call _ExitProcess@4

_main ENDP

END

