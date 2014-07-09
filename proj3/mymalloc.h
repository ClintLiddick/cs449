#ifndef MYMALLOC
#define MYMALLOC

#ifndef NULL
#define NULL 0
#endif

void *my_worstfit_malloc(int size);

void my_free(void *ptr);

#endif
