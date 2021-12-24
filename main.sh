FILE="additiontest"
nasm -f elf32 $FILE.asm -o $FILE.o
ld -m elf_i386 $FILE.o -o $FILE.exe
time ./$FILE.exe
rm $FILE.o
rm $FILE.exe