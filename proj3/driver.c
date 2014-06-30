#include <stdio.h>
#include <stdlib.h>
#include "mymalloc.h"

int main() {
    const int MAX = 10;
    char *data;
    int i;
    printf("allocating memory...\n");
    data = (char*) malloc(MAX*sizeof(char));
    if (data == NULL) {
        printf("FAIL: unable to allocate memory\n");
        exit(1);
    }
    
    printf("beginning assignments...\n");
    for (i=0; i<MAX; ++i) {
        data[i] = 'a';
    }
    printf("assignments complete\n");
    printf("beginning free...\n");
    
    return 0;
}
