VERSION = buildn0001


System := windows

ifeq ($(System),windows)
srctree 	:= $(shell cd)
objtree		:= $(shell cd)

cc := gcc
ld := ld
objcopy := objcopy
# rm
rm := del 
# mkdir -p
md := md

endif

ifeq ($(System),linux)
srctree 	:= $(shell pwd)
objtree		:= $(shell pwd)

cc := cc
ld := ld
objcopy := objcopy

rm := rm
md := mkdir -p
endif

src		:= $(srctree)
obj		:= $(objtree)

# SUB_DIR := arch/x86 init
Quiet :=

export cc ld objcopy rm md
export src obj


all: $(src)/arch/x86/ $(src)/init/
	@echo Complete compile.

$(src)/arch/x86/:
	$(MAKE) -C $(src)/arch/x86/

$(src)/init/:
	$(MAKE) -C $(src)/init/

clean:
	$(MAKE) -C $(src)/arch/x86/ clean
	$(MAKE) -C $(src)/init/ clean
