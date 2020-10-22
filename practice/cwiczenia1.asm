.686
.model flat

public _main
extern  _ExitProcess@4 : proc
extern  _MessageBoxA@16 : proc

.data
dana	db 'Czy lubisz AKO?',0
napis	db 'AKO',0

.code

_main PROC
	
test_label:
	push 4				   
	push OFFSET napis		
	push OFFSET dana		
	push 0					
	call _MessageBoxA@16
	cmp EAX, 6
	jne test_label

exit_label:
	push dword PTR 0
	call _ExitProcess@4

_main ENDP

END