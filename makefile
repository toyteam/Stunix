VERSION = buildn0001



cc :=gcc
rm :=del

srctree := .
objtree		:= .
src		:= $(srctree)
obj		:= $(objtree)

SUB_DIR := arch/x86/ init/

export cc rm compile-header

arch/x86/:
	$(MAKE) -C arch/x86/

clean:
	$(MAKE) -C arch/x86/ clean
