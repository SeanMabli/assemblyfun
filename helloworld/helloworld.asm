section .text
  global _start

_start:
  mov	eax, 4    ; print command
  mov	ecx, data ; print data
  mov	edx, len  ; print length
  int	0x80      ; run in kernel

  mov	eax, 1    ; exit command
  int	0x80      ; run in kernel

data db 'Hello World!', 0xA
len equ $ - data