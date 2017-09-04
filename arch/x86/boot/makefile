
Curpath := $(src)/arch/x86/boot
Objpath :=$(obj)/arch/x86/boot

all: $(Objpath)/bootsect.bin $(Objpath)/main.bin
	@echo [Info]x86 boot completed.

$(Objpath)/bootsect.bin: $(Curpath)/bootsect.s bootsect-echo
	$(cc) -nostdinc -I. -c $(Curpath)/bootsect.s -o $(Objpath)/bootsect.o
	$(ld) -T $(Curpath)/bootsect.ld -N -e start -Ttext 0x7C00 $(Objpath)/bootsect.o -o $(Objpath)/bootsect.elf 
	$(objcopy) -R .note -R .comment -S -O binary $(Objpath)/bootsect.elf $(Objpath)/bootsect.bin

bootsect-echo:
	@echo [Info]Compiling bootsect.bin


$(Objpath)/header.o: $(Curpath)/header.s
	$(as) -c $(Curpath)/header.s -o $(Objpath)/header.o
	@echo [Info]Compiling header.s

$(Objpath)/main.o: $(Curpath)/main.c
	$(cc) -nostdinc -c $(Curpath)/main.c -o $(Objpath)/main.o
	@echo [Info]Compiling main.o

$(Objpath)/main.bin: $(Objpath)/main.o $(Objpath)/header.o
	$(ld) -N -e start -Ttext 0x1000000 $(Objpath)/header.o $(Objpath)/main.o -o $(Objpath)/main.elf 
	$(objcopy) -R .note -R .comment -S -O binary $(Objpath)/main.elf $(Objpath)/main.bin
	@echo [Info]Compiling main.bin
	

clean:
	$(rm) $(Objpath)/bootsect.o
	$(rm) $(Objpath)/bootsect.elf
	$(rm) $(Objpath)/bootsect.bin
	$(rm) $(Objpath)/main.o
	$(rm) $(Objpath)/header.o
	$(rm) $(Objpath)/main.elf
	$(rm) $(Objpath)/main.bin

