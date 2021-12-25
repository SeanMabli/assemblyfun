section	.text
  global _start

_start:
  mov	al, [num1]
  mov bl, [num2]

  div bl
  add	al, 0x30
  mov [res], al

  mov	ecx, res
  mov	edx, 1
  mov	eax, 4
  int	0x80

  mov	eax, 1
  int	0x80

section .data
  num1 db 16
  num2 db 2

segment .bss
  res resb 1