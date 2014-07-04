# Clint Liddick makefile for CS0449 Project 3
CC:=gcc
CFLAGS:=-m32 -Wall
SRCFILES:=driver.c mymalloc.c
OBJS := $(patsubst %.c,%.o,$(SRCFILES))
OUT_EXE := driver
# := means immediate assignment, = means delayed assignment

all: $(OUT_EXE)

debug: CFLAGS += -DDEBUG -g
debug: $(OUT_EXE)

driver: driver.o mymalloc.o
	$(CC) $(CFLAGS) $^ -o $@
	@# $^ means prereqs already appeared for target, without reppetition
	@# $@ means the target itself

driver.o: driver.c mymalloc.h
	$(CC) $(CFLAGS) -c $<
	
mymalloc.o: mymalloc.c
	$(CC) $(CFLAGS) -c $<

clean:
	-rm -f *.o
	-rm -f $(OUT_EXE) 
	@# "-" means ignore status, @ here means don't echo this line



