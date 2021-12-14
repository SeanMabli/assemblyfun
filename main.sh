FILE="float"
nasm -f elf32 $FILE/$FILE.asm -o $FILE/$FILE.o
ld -m elf_i386 $FILE/$FILE.o -o $FILE/$FILE.exe
./$FILE/$FILE.exe