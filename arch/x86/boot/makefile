
Curpath := $(src)/arch/x86/boot
ObjCurpath :=$(obj)

bootsect.bin bootsect.o bootsect.elf : bootsect.s bootsect-echo
	$(cc) -nostdinc -I. -c bootsect.s
	$(ld) -T bootsect.ld -N -e start -Ttext 0x7C00 bootsect.o -o bootsect.elf 
	$(objcopy) -R .note -R .comment -S -O binary bootsect.elf bootsect.bin

bootsect-echo:
	@echo [Info]Compiling bootsect.bin

clean:
	$(rm) bootsect.o
	$(rm) bootsect.elf
	$(rm) bootsect.bin

