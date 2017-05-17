
Curpath := $(src)/arch/x86/boot
ObjCurpath :=$(obj)


all: bootsect.bin main.bin
	@echo [Info]x86 boot completed.


bootsect.bin: bootsect.s bootsect-echo
	$(cc) -nostdinc -I. -c bootsect.s
	$(ld) -T bootsect.ld -N -e start -Ttext 0x7C00 bootsect.o -o bootsect.elf 
	$(objcopy) -R .note -R .comment -S -O binary bootsect.elf bootsect.bin

bootsect-echo:
	@echo [Info]Compiling bootsect.bin


header.o: header.s
	$(as) -c header.s -o header.o
	@echo [Info]Compiling header.s

main.o: main.c
	$(cc) -nostdinc -c main.c -o main.o
	@echo [Info]Compiling main.o

main.bin: main.o header.o
	$(ld) -N -e start -Ttext 0x1000000 header.o main.o -o main.elf 
	$(objcopy) -R .note -R .comment -S -O binary main.elf main.bin
	@echo [Info]Compiling main.bin
	

clean:
	$(rm) bootsect.o
	$(rm) bootsect.elf
	$(rm) bootsect.bin
	$(rm) main.o
	$(rm) header.o
	$(rm) main.elf
	$(rm) main.bin

