section .text
  global _start

_start:
  mov	eax, 4    ; print command
  mov	ecx, data ; print data
  mov	edx, len  ; print length
  int	0x80      ; run in kernel

  mov	eax, 1    ; exit command
  int	0x80      ; run in kernel

section .data
  data dd 22.3241328947812934
  len equ $ - data