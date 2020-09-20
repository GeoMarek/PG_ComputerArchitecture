.686
.model flat
extern _GetDiskFreeSpaceExA@16 : PROC
extern _malloc : PROC
public _free_disk_space
.data
.code

_free_disk_space PROC
push EBP
mov EBP, ESP

; https://docs.microsoft.com/en-us/windows/win32/api/sysinfoapi/ns-sysinfoapi-system_info
; we want to get -> DWORD_PTR dwActiveProcessorMask; 

push 8					; place for __int64
call _malloc			; alloc memory
add ESP, 4				; clear stack
mov EBX, [EBP+8]		; disk name

; call winapi function
push 0			; null
push EAX		; address
push 0			; null
push [EBP+8]	; disk name
call _GetDiskFreeSpaceExA@16

mov EAX, [EBP-8]	; get addres
mov EDX, [EAX+4]	; get second part
mov EAX, [EAX]		; get first part

; |EDX|EAX| - disk free space in bytes
shr EAX, 30			; convert bytes into gigabytes
shl EDX, 2			; 
add EAX, EDX







mov ESP, EBP
pop EBP
ret
_free_disk_space ENDP
END
