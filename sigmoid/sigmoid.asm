section	.text
  global _start
	
_start:
  mov	eax,'3'
  sub eax, '0'

  mov ebx, '6'
  sub ebx, '0'
  add eax, ebx
  add	eax, '0'

  mov [sum], eax
  mov	ecx, msg
  mov	edx, len
  mov	ebx, 1
  mov	eax, 4
  int	0x80

  mov	ecx, sum
  mov	edx, 1
  mov	ebx, 1
  mov	eax, 4
  int	0x80
	
  mov eax, 0x1
  mov ebx, 0
  int	0x80
	
section .data
  msg db "The sum is:", 0xA
  len equ $ - msg   
  segment .bss
  sum resb 4