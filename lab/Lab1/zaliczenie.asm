.686
.model flat
extern _ExitProcess@4 : PROC
extern _MessageBoxW@16 : PROc
extern __read : PROC
extern __write : PROc
public _mainZ

.data

text			db	80 dup (?)
ikurczak		dw 'K','u','r','c','z','a','k', 0
ikonik			dw 'K', 'o','n','i','k', 0
kurczak			dw	0D83Dh, 0DC14h, 0
konik			dw	0D83Dh, 0DC34h, 0
character		db  0
latin_a	db 165
latin_c db 134
latin_e db 169
latin_l db 136
latin_n db 228
latin_o db 162
latin_s db 152
latin_z db 171
latin_z2 db 190
unicode_a dw 105h
unicode_c dw 263
unicode_e dw 281
unicode_l dw 322
unicode_n dw 324
unicode_o dw 243
unicode_s dw 347
unicode_z dw 378
unicode_z2 dw 380


; Program do porownania czy dany punkt kodowy jest przeznaczony 
; dla danego znaku. Najpierw podajemy punkt kodowy w formie 
; dziesietnej, potem po spacji znak, ktory chcemy sprawdzic. 
; Jesli wynik jeest zgodny to w MessageBox pokaze sie kurczak, 
; jesli nie to pokaze sie tam wowczas kon.
.code
_mainZ PROC


input_text:
	push 80 
	push OFFSET text
	push 0 
	call __read
	add esp, 12

get_unicode:
	xor EAX, EAX
	mov AL, text[0]
	sub AL, '0'
	mov EBX, 10
	mul EBX
	xor ECX, ECX
	mov CL, text[1]
	sub CL, '0'
	add AL, CL
	mul EBX
	xor ECX, ECX
	mov CL, text[2]
	sub CL, '0'
	add EAX, ECX

get_character:
	mov BL, text[4]
; EBX ma nasza literke, EAX ma nasz unikod


; sprawdzam czy kod ascii
cmp EAX, EBX
je kurczak_et

; a ogonek
cmp BL, latin_a
jne a_ogonek
cmp AX, unicode_a
je kurczak_et
a_ogonek:

; c kreska
cmp BL, latin_c
jne c_kreska
cmp AX, unicode_c
je kurczak_et
c_kreska:

; e ogonek
cmp BL, latin_e
jne e_ogonek
cmp AX, unicode_e
je kurczak_et
e_ogonek:

; l kreska
cmp BL, latin_l
jne l_kreska
cmp AX, unicode_l
je kurczak_et
l_kreska:

; n kreska
cmp BL, latin_n
jne n_kreska
cmp AX, unicode_n
je kurczak_et
n_kreska:

; o kreska
cmp BL, latin_o
jne o_kreska
cmp AX, unicode_o
je kurczak_et
o_kreska:

; s kreska
cmp BL, latin_s
jne s_kreska
cmp AX, unicode_s
je kurczak_et
s_kreska:

; z kreska
cmp BL, latin_z
jne z_kreska
cmp AX, unicode_z
je kurczak_et
z_kreska:


; z kropka
cmp BL, latin_z2
jne z_kropka
cmp AX, unicode_z2
je kurczak_et
z_kropka:

konik_et:
	push 0
	push OFFSET ikonik
	push OFFSET konik
	push 0
	call _MessageBoxW@16
	jmp end_function

kurczak_et:
	push 0
	push OFFSET ikurczak
	push OFFSET kurczak
	push 0
	call _MessageBoxW@16

end_function:
	push dword PTR 0
	call _ExitProcess@4
_mainZ ENDP
END

