
Curpath := $(src)/init
Objpath :=$(obj)/init
Inc := $(src)/include
IncStunix := $(Inc)/stunix
IncAsmgeneric := $(Inc)/asm-generic

$(Objpath)/main.o: $(Curpath)/main.c $(IncStunix)/debugobjects.h $(IncStunix)/stackprotector.h $(IncAsmgeneric)/irqflags.h
	$(cc) -I $(Inc) -c main.c -o $(Objpath)/main.o
clean:
	$(rm) $(Objpath)/main.o
