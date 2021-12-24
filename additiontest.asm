.model small
.stack 100h

.data
msg1 db "Enter First Number: $"
msg2 db 0xA, 0DH, "Enter Second Number: $"
msg3 db 0xA, 0DH, "Result: $"

a db 0
b db 0

.code
  main proc
  mov ax, @data
  mov ds, ax

  mov ah, 9
  lea dx, msg1
  int 21h

  moc ah, 1
  int 21h
  mov a, al

  mov ah, 9
  lea dx, msg2
  int 21h
  
  moc ah, 1
  int 21h
  mov b, al

  add al, a
  mov ah, 0
  aaa

  add al, 48
  add ah, 48

  mov bx, ax

  mov ah, 9
  lea dx, msg3
  int 21

  mov ah, 2
  mov dl, bh
  int 21h

  mov ah, 2
  mov dl, b1
  int 21h

  mov ah, 4ch
  int 21h
  main endp
end main