
Curpath := $(src)/init
ObjCurpath :=$(obj)
Inc := $(src)/include
IncStunix := $(Inc)/stunix
IncAsmgeneric := $(Inc)/asm-generic

main.o: main.c $(IncStunix)/debugobjects.h $(IncStunix)/stackprotector.h $(IncAsmgeneric)/irqflags.h
	$(cc) -I $(Inc) -c main.c -o main.o
clean:
	$(rm) main.o