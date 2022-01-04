# OS="linux"
FILE="helloworld"
# 
# if [$OS -eq "linux"]
# then
#   nasm -f elf32 linux/$FILE.asm -o linux/$FILE.o
#   ld -m elf_i386 linux/$FILE.o -o linux/$FILE.exe
#   time ./$FILE.exe
# fi
# if [$OS -eq "win32"]
# then
nasm -f win32 -o win/helloworld.o win/helloworld.asm
ld -o win/helloworld.exe win/helloworld.o
helloworld.exe
# fi

rm $OS/$FILE.o
rm $OS/$FILE.exe