VERSION = buildn0001


System := linux

ifeq ($(System),windows)
srctree 	:= $(shell cd)
objtree		:= $(shell cd)
buildtree	:= $(shell cd)

as := as
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
objtree		:= $(shell pwd)/obj

as := as
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

export as cc ld objcopy rm md
export src obj build


all: $(obj)/arch/ $(obj)/init/
	@echo Complete compile.

$(obj):
	mkdir $(obj) 

$(obj)/arch/:$(obj)
	$(shell mkdir $(obj)/arch)
	$(MAKE) -C $(src)/arch/

$(obj)/init/:$(obj)
	$(shell mkdir $(obj)/init)
	$(MAKE) -C $(src)/init/

clean:
	$(MAKE) -C $(src)/arch/ clean
	$(MAKE) -C $(src)/init/ clean
	rm -rf $(obj)
