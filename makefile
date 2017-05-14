VERSION = buildn0001



cc := gcc
# rm
rm := del 
# mkdir -p
md := md

srctree := .
objtree		:= build
src		:= $(srctree)
obj		:= $(objtree)

SUB_DIR := arch/x86 init
Quiet :=

export cc rm md
export src obj


all: arch/x86/ init/
	@echo Complete compile.

arch/x86/:
	$(MAKE) -C $(srctree)/arch/x86/

init/:
	$(MAKE) -C $(srctree)/init/

clean:
	$(MAKE) -C $(srctree)/arch/x86/ clean
	$(MAKE) -C $(srctree)/init/ clean
