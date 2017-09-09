
Curpath := $(src)/arch/x86/boot
Objpath :=$(obj)/arch/x86/boot

all: $(Objpath)/main.bin
	@echo [Info]x86 boot completed.

$(Objpath)/header.o: $(Curpath)/header.s
	$(cc) -m32 -c $(Curpath)/header.s -o $(Objpath)/header.o
	@echo [Info]Compiling header.s

$(Objpath)/main.o: $(Curpath)/main.c
	$(cc) -m32 -nostdinc -c $(Curpath)/main.c -o $(Objpath)/main.o
	@echo [Info]Compiling main.o

$(Objpath)/main.bin: $(Objpath)/main.o $(Objpath)/header.o
	$(ld) -T $(Curpath)/main.ld -m elf_i386 $(Objpath)/header.o $(Objpath)/main.o -o $(Objpath)/main.elf 
	@echo [Info]Compiling main.bin
	

clean:
	$(rm) $(Objpath)/main.o
	$(rm) $(Objpath)/header.o
	$(rm) $(Objpath)/main.elf

