
Curpath := $(src)/arch/x86/boot
ObjCurpath :=$(obj)

bootsect.bin : bootsect.s bootsect-echo
	$(cc) -c bootsect.s -o bootsect.bin

bootsect-echo:
	@echo [Info]Compiling bootsect.bin

clean:
	$(rm) bootsect.bin

