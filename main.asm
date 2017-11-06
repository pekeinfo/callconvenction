  BITS 32
  GLOBAL main
  SECTION .text

  suma__cdecl:
  	push ebp
  	mov ebp,esp
  	add ebp,8
	mov eax,[ebp]
	add eax,[ebp+4]
	pop ebp
	ret 

suma__stdcall:
	push ebp
	mov ebp, esp
	mov ebx,[ebp+8]
	add ebx,[ebp+12]
	pop ebp
	ret 8

suma__fastcall:
	push ebp
	mov ebp, esp 
	add eax, ebx 
	pop ebp
	ret

main:
  	xor eax,eax
  	push 0x11111111
  	push 0x22222222
  	call suma__cdecl
  	add esp,8
  	push 0x11111111
  	push 0x22222222
  	call suma__stdcall
  	mov eax,0x11111111
  	mov ebx,0x22222222
  	call suma__fastcall

exit:
	mov al,1
	mov ebx,0
	int 80h
