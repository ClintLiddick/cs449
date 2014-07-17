/*
 * e_digits
 * CS0449 - Project 4
 * Clinton Liddick
 * 07/16/14
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>

int main(int argc, char **args) {
	int off;
	int num;
	int digits_req;
	FILE* e_file;
	char *buf;
	int i;
	int bytes_read;
	int file_no;

	if (argc != 3) {
		printf("usage: e_digits <off> <num>\n");
		return 1;
	}

	// determine # digits to request
	off = atoi(args[1]);
	num = atoi(args[2]);
	digits_req = num + off;

	e_file = fopen("/dev/e", "r");

	if (e_file == NULL) {
		perror("error opening file");
		return 1;
	}

	// in following code, an off-by-one somewhere requires use
	// of +1 when requesting digits
	
	// get space for digits
	buf = (char*) malloc((digits_req+1)*sizeof(char));

	// get file number (file descriptor) and use syscall to read all bytes at once
	file_no = fileno(e_file);
	bytes_read = read(file_no, buf, (digits_req+1));

	// verify received enough data
	if (bytes_read != (digits_req+1)) {
		printf("error reading numbers\n");
		return 1;
	}

	// print digits
	for (i=off; i<digits_req; i++) {
		printf("%c",buf[i]);
	}
	printf("\n");

	// free resources
	free(buf);
	fclose(e_file);
	return 0;
}
