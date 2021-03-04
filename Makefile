all: build

build:main.c logic.o
	gcc -m32 main.c logic.o

logic.o:logic.asm
	nasm -g -f elf -o logic.o logic.asm

clean:
	rm -f a.out
	rm -f logic.o