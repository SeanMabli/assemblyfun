section	.text
  global _start
	
_start:
  mov al, [num1]
  mov ah, [num2]
  sub al, 0x30
  sub ah, 0x30

  add al, ah
  add	al, 0x30
  mov [sum], al

  mov	ax, 4     ; print command
  mov	ebx, 1    ; 
  mov	ecx, sum  ; sum
  mov	edx, 1    ; length of sum
  int	0x80

  mov	eax, 1
  mov ebx, 0
  int	0x80
	
section .data
  num1 db '7'
  num2 db '2'
  segment .bss
  sum resb 1