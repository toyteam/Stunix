
Curpath := $(src)/arch/x86/boot
Objpath :=$(obj)/arch/x86/boot

all: $(Objpath)/main.elf
	@echo [Info]x86 boot completed.

$(Objpath)/setup.o: $(Curpath)/setup.s
	$(cc) -m32 -c $(Curpath)/setup.s -o $(Objpath)/setup.o
	@echo [Info]Compiling setup.s

$(Objpath)/main.o: $(Curpath)/main.c
	$(cc) -m32 -nostdinc -c $(Curpath)/main.c -o $(Objpath)/main.o
	@echo [Info]Compiling main.o

$(Objpath)/main.elf: $(Objpath)/main.o $(Objpath)/setup.o
	$(ld) -T $(Curpath)/main.ld -m elf_i386 $(Objpath)/setup.o $(Objpath)/main.o -o $(Objpath)/main.elf 
	@echo [Info]Compiling main.elf
	

clean:
	$(rm) $(Objpath)/main.o
	$(rm) $(Objpath)/setup.o
	$(rm) $(Objpath)/main.elf

