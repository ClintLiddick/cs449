# Clint Liddick makefile for CS0449 Project 3
CC:=gcc
CFLAGS:=-m32 -Wall
SRCFILES:=driver.c mymalloc.c
OBJS := $(patsubst %.c,%.o,$(SRCFILES))
OUT_EXE := driver

build: $(OBJS) $(OUT_EXE)

%: %.o
	$(CC) $(CFLAGS) $< -o $@

driver.o: driver.c mymalloc.h
	$(CC) $(CFLAGS) -c $<
	
mymalloc.o: mymalloc.c
	$(CC) $(CFLAGS) -c $<

clean:
	-rm -f *.o 
	@# "-" means ignore status, @ here means don't echo this line

rebuild: clean build



