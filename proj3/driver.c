#include <stdio.h>
#include <stdlib.h>
#include "mymalloc.h"

int main() {
    const int MAX_MEM = 5000;
    const int TESTS = 10;
    char *data[TESTS];
    char freed[TESTS];
    int i, j, mem;

    srand((unsigned) time(NULL));
    for (i=0;i<TESTS;i++)
    	freed[i] = 1;
    
    for (i=0; i<TESTS; ++i) {
    	mem = rand() % MAX_MEM;
        printf("allocating memory %d: %d bytes...\n",i,mem);
        data[i] = (char*) my_worstfit_malloc(mem*sizeof(char));
        if (data[i] == NULL) {
            printf("FAIL: unable to allocate memory %d\n",i);
            exit(1);
        }
        freed[i] = 0;
        
        printf("beginning assignments for %d...\n",i);
        for (j=0; j<mem; ++j) {
            data[i][j] = 'a';
        }
        printf("assignments for %d complete\n",i);
        if (mem%2 == 0) {
    		printf("freeing %d...\n",i);
    		my_free(data[i]);
    		freed[i] = 1;
        }
    }

    for (i=TESTS-1; i>=0; --i) {
    	if (!freed[i]) {
    		printf("freeing %d...\n",i);
    		my_free(data[i]);
    		freed[i] = 1;
    	}
    }



    return 0;
}
