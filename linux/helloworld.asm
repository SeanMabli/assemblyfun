section .text
  global _start

_start:
  mov	eax, 4
  mov	ecx, data
  mov	edx, len
  int	0x80

  mov	eax, 1
  int 0x80

data db 'Hello World!', 0xA
len equ $ - data