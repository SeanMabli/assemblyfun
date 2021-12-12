section	.text
  global _start
	
_start:
  mov eax, [num1]
  mov ebx, [num2]
  sub eax, '0'
  sub ebx, '0'

  add eax, ebx
  add	eax, '0'
  mov [sum], eax

  mov	eax, 4
  mov	ebx, 1
  mov	ecx, msg	
  mov	edx, len
  int	0x80

  mov	eax, 4    ; print command
  mov	ebx, 1    ; 
  mov	ecx, sum  ; sum
  mov	edx, 1    ; length of sum
  int	0x80

  mov	eax, 1
  mov ebx, 0
  int	0x80
	
section .data
  msg db "The sum is: " 
  len equ $ - msg
  num1 db '3'
  num2 db '4'
  segment .bss
  sum resb 1