
Curpath := $(src)/arch
Objpath := $(obj)/arch

all:$(Objpath)/x86/

$(Objpath)/x86/:
	$(shell mkdir $(Objpath)/x86/)
	$(MAKE) -C $(Curpath)/x86/

clean:
	$(MAKE) -C $(Curpath)/x86/ clean
