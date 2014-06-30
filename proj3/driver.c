#include <stdio.h>
#include <stdlib.h>
#include "mymalloc.h"

int main() {
    const int MAX_MEM = 1000;
    const int TESTS = 5;
    char *data[TESTS];
    int i, j;
    
    for (i=0; i<TESTS; ++i) {
        printf("allocating memory %d...\n",i);
        data[i] = (char*) my_worstfit_malloc(MAX_MEM*sizeof(char));
        if (data[i] == NULL) {
            printf("FAIL: unable to allocate memory %d\n",i);
            exit(1);
        }
        
        printf("beginning assignments for %d...\n",i);
        for (j=0; j<MAX_MEM; ++j) {
            data[i][j] = 'a';
        }
        printf("assignments for %d complete\n",i);
        
    }
    for (i=0; i<TESTS; ++i) {
        printf("beginning freeing %d...\n",i);
        my_free(data[i]);
    }
    
    
    
    return 0;
}
