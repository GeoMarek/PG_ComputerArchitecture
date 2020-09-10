.686
.model flat
extern _GetSystemInfo@4 : PROC
extern _malloc : PROC
public _processors_number
.data
.code

_processors_number PROC
push EBP
mov EBP, ESP

; https://docs.microsoft.com/en-us/windows/win32/api/sysinfoapi/ns-sysinfoapi-system_info
; we want to get -> DWORD_PTR dwActiveProcessorMask; 

push 36					; GetSystemInfo need 36 bytes
call _malloc			; alloc memory for SystemInfo handler
add ESP, 4				; clear stack
push EAX				; place address in stack
call _GetSystemInfo@4	; call WinApi function
mov EAX, [EBP-4]		; get address
add EAX, 20				; go to proper byte
add ESP, 4				; clear stack
mov EAX, [EAX]			; get value from address

mov ESP, EBP
pop EBP
ret
_processors_number ENDP
END
