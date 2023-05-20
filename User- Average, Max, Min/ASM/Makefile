avgMaxMin: main.o maxMin.o computeAvg.o io.o
	ld -g -o avgMaxMin main.o io.o maxMin.o computeAvg.o
main.o: main.asm
	nasm -g -felf64 main.asm
io.o: io.asm
	nasm -g -felf64 io.asm
maxMin.o: maxMin.asm
	nasm -g -felf64 maxMin.asm
computeAvg.o: computeAvg.asm
	nasm -g -felf64 computeAvg.asm