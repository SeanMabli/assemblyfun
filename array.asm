section	.text
  global _start

_start:	
  mov  eax, len
  mov  ebx, 0
  mov  ecx, array

  loop:
    add  ebx, [ecx]
    add  ecx, 1
    dec  eax
    jnz  loop

  add ebx, 0x30
  mov [sum], ebx
  
  mov  edx, 1
  mov  ecx, sum
  mov  ebx, 1
  mov  eax, 4
  int  0x80

  mov	eax, 1
  int	0x80

section	.data
  array db 2, 1, 2, 3
  len equ $ - array

segment .bss
  sum resb 1