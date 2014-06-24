# Clint Liddick's reusable makefile
CC=gcc
CFLAGS=-Wall -o
FILES=mystrings.c
OUT_EXE=mystrings

build: $(FILES)
	$(CC) $(CFLAGS) $(OUT_EXE) $(FILES)

debug: $(FILES)
	$(CC) -g $(CFLAGS) $(OUT_EXE) $(FILES)


c: $(FILES)
	$(CC) $(FILES)

clean:
	-rm -f *.o # - means ignore status

rebuild: clean build


