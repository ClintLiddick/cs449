#include <stdio.h>
#include <stdlib.h>
#include "mymalloc.h"

int main() {
    const int MAX_MEM = 100;
    const int TESTS = 5;
    char *data;
    int i, j;
    
    for (i=0; i<TESTS; ++i) {
        printf("allocating memory %d...\n",i);
        data = (char*) my_worstfit_malloc(MAX_MEM*sizeof(char));
        if (data == NULL) {
            printf("FAIL: unable to allocate memory %d\n",i);
            exit(1);
        }
        
        printf("beginning assignments for %d...\n",i);
        for (j=0; j<MAX_MEM; ++j) {
            data[j] = 'a';
        }
        printf("assignments for %d complete\n",i);
        
        printf("beginning freeing %d...\n",i);
        my_free(data);
    }
    
    
    
    return 0;
}
