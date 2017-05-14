
Curpath := init
ObjCurpath :=$(obj)

main.o: main.c stunix/debugobjects.h ../stunix/stackprotecter.h ../stunix/irqflags.h
	$(cc) -I ../include -c main.c -o main.o
clean:
	$(rm) main.o