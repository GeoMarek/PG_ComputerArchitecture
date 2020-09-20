.686
.model flat
extern _GetSystemTime@4 : PROC
extern _malloc : PROC
public _actual_hour
.data
.code

_actual_hour PROC
push EBP
mov EBP, ESP
push ESI
push EDI

; reserve memory to output
push 9
call _malloc
mov ESI, EAX

; reserve memory to WinApi handler
push 16			
call _malloc

; fill WinApi handler
push EAX
call _GetSystemTime@4
mov EDI, [EBP-20]

; ESI is output address
; EDI is time struct address 

mov ECX, 3
get_hour:
	mov AX, [EDI+8]	
	mov BL, 10
	div BL			; first digit is in AL, second in AH
	add AL, 30h		; number to character
	add AH, 30h
	mov [ESI], AL	; save first digit
	inc ESI
	mov [ESI], AH	; save second figit
	inc ESI
	cmp ECX, 1		; check for last colon
	je finish
	mov AL, 58		; colon
	mov [ESI], AL	; save colon
	inc ESI
	add EDI, 2
	loop get_hour

finish:
mov [ESI], byte ptr 0
sub ESI, 8
mov EAX, ESI
add ESP, 12

pop EDI
pop ESI
mov ESP, EBP
pop EBP
ret
_actual_hour ENDP
END
