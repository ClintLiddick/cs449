#include <stdio.h>
#include <pthread.h>

void *print_msg1(void *ptr);
void *print_msg2(void *ptr);

int main() {
    pthread_t thread1, thread2;
    int ret1, ret2;
    
    ret1 = pthread_create(&thread1, NULL, print_msg1, NULL);
    if (ret1) {
        fprintf(stderr, "error creating thread 1\n");
        exit(1);
    }
    
    ret2 = pthread_create(&thread2, NULL, print_msg2, NULL);
    if (ret2) {
        fprintf(stderr, "error creating thread 2\n");
        exit(1);
    }

    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);
    
    return 0;
}

void *print_msg1(void *ptr) {
    while(1) {
        printf("Hello from thread 1 - A\n");
        pthread_yield();
        printf("Hello from thread 1 - B\n");
    }
    return NULL;
}

void *print_msg2(void *ptr) {
    while(1) {
        printf("Hello from thread 2 - A\n");
        pthread_yield();
        printf("Hello from thread 2 - B\n");
    }
    return NULL;
}

