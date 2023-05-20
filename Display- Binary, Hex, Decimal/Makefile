HW9p2: main.o hexToAscii.o binaryToAscii.o io.o
	ld -g -o HW9p2 main.o hexToAscii.o binaryToAscii.o io.o
main.o: main.asm
	nasm -g -felf64 main.asm
io.o: io.asm
	nasm -g -felf64 io.asm
hexToAscii.o: hexToAscii.asm
	nasm -g -felf64 hexToAscii.asm
binaryToAscii.o: binaryToAscii.asm
	nasm -g -felf64 binaryToAscii.asm