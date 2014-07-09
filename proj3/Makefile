# Clint Liddick makefile for CS0449 Project 3
CC:=gcc
CFLAGS:=-m32 -Wall
SRCFILES:=driver.c mymalloc.c mallocdrv.c
OBJS := $(patsubst %.c,%.o,$(SRCFILES))
OUT_EXE := driver mallocdrv

all: $(OUT_EXE)

debug: CFLAGS += -DDEBUG -g
debug: $(OUT_EXE)

driver: driver.o mymalloc.o
	$(CC) $(CFLAGS) $^ -o $@

driver.o: driver.c mymalloc.h
	$(CC) $(CFLAGS) -c $<

mallocdrv: mallocdrv.o mymalloc.o
	$(CC) $(CFLAGS) $^ -o $@

mallocdrv.o: mallocdrv.c mymalloc.h
	$(CC) $(CFLAGS) -c $<
	
mymalloc.o: mymalloc.c
	$(CC) $(CFLAGS) -c $<

clean:
	-rm -f *.o
	-rm -f $(OUT_EXE) 

