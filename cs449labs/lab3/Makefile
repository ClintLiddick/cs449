# Clint Liddick's reusable makefile
CC=gcc
CFLAGS=-Wall -o
FILES=lab3.c
OUT_EXE=lab3

build: $(FILES)
	$(CC) $(CFLAGS) $(OUT_EXE) $(FILES)

debug: $(FILES)
	$(CC) -g $(CFLAGS) $(OUT_EXE) $(FILES)


c: $(FILES)
	$(CC) $(FILES)

clean:
	-rm -f *.o # - means ignore status

rebuild: clean build

# make <exe_file>
%: $*.c
	$(CC) -Wall -o $* $*.c


