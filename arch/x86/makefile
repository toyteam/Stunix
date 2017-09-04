
Curpath := $(src)/arch/x86
Objpath := $(obj)/arch/x86

all:$(Objpath)/boot/

$(Objpath)/boot/:
	$(shell mkdir $(Objpath)/boot/)
	$(MAKE) -C $(Curpath)/boot/

clean:
	$(MAKE) -C $(Curpath)/boot/ clean
