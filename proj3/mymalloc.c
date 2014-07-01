#include <unistd.h>
#include <errno.h>
#include "mymalloc.h"

#define PTR_ADD(p,x) ((char*)(p) + (x))
#define PTR_SUB(p,x) ((char*)(p) - (x))

#define DEBUG

static void *mymalloc_memstart = NULL; // original brk position cache
static int mymalloc_nodes = 0; // current number of memory nodes

typedef struct node {
    size_t size;
    char free;
    struct node *next;
} NODE; // sizeof(NODE) and gdb say = 12

void *my_worstfit_malloc(int size) {
    NODE *ptr;
    NODE newNode;
    NODE freeNode;
    NODE *worstfit_ptr = NULL;
    NODE *traversal = (NODE*)mymalloc_memstart;
    int i;
    
    if (mymalloc_memstart == NULL) { // not yet cached
        mymalloc_memstart = sbrk(0);
#ifdef DEBUG
        printf("---beginning of heap: %d---\n",mymalloc_memstart);
#endif
    }

    
    ptr = (NODE*)mymalloc_memstart;
    worstfit_ptr = (NODE*)mymalloc_memstart;
    
    // find biggest NODE
    for(i=0; i<mymalloc_nodes; ++i) {
        if (ptr->free == 1 && ptr->size > worstfit_ptr->size) {
            // possible match
            worstfit_ptr = ptr;
        }
        ptr = ptr->next;
    }
    
    // make sure there was at least a single valid free node
    if (mymalloc_nodes > 0 && worstfit_ptr->free == 1 && worstfit_ptr->size >= size) {
        // break node into 2 pieces and assign
        
        // store new free node info
        if (worstfit_ptr->size - size > sizeof(NODE)) { 
        // new free node would have free space
            ++mymalloc_nodes;
            freeNode.size = worstfit_ptr->size - size - sizeof(NODE);  // leftover is free
            freeNode.free = 1;
            freeNode.next = worstfit_ptr->next; // preserve next pointer
            // assign to next space after new alloc
            *(worstfit_ptr + sizeof(NODE) + size) = freeNode;
            
            newNode.size = worstfit_ptr->size - freeNode.size - sizeof(NODE); 
            newNode.next = PTR_ADD(PTR_ADD(worstfit_ptr,sizeof(NODE)),size); // freeNode
        } else {
            newNode.size = worstfit_ptr->size;
            newNode.next = worstfit_ptr->next;
        }
        newNode.free = 0;
        *worstfit_ptr = newNode;
        ptr = worstfit_ptr; // set return value
    } else { // need new sbrk allocation
        newNode.size = size;
        newNode.free = 0;
        newNode.next = NULL;
        ptr = (NODE*)sbrk(size + sizeof(NODE));
        if (ptr == -1) {
            printf("error alloc mem\n");
            exit(1);
        }
        
        *ptr = newNode;
        
        // assign last NODE of any current list to point to new node
        if (mymalloc_nodes > 0) {
            // find end of list
            while (traversal->next != NULL) {
                traversal = traversal->next;
            }
            traversal->next = ptr;
        }
        ++mymalloc_nodes;
    }
    return PTR_ADD(ptr,sizeof(NODE));
}

void my_free(void *ptr) {
    NODE *prev = NULL;
    NODE *curr = (NODE*)mymalloc_memstart;
    NODE *next = NULL;

#ifdef DEBUG
    printf("free test: %p == %p, %d\n",curr,PTR_SUB(ptr,sizeof(NODE)),curr==PTR_SUB(ptr,sizeof(NODE)));
#endif

    // traverse list to find previous node
    while (curr != (PTR_SUB(ptr,sizeof(NODE))) && curr != NULL) {
        prev = curr;
        curr = curr->next;
#ifdef DEBUG
        printf("free test: %p == %p, %d\n",curr,PTR_SUB(ptr,sizeof(NODE)),curr==PTR_SUB(ptr,sizeof(NODE)));
#endif
    }
    
    if (curr == NULL) { // failed to find ptr in list
        printf("ERROR: failed to find ptr in list\n");
        exit(1); // diehard TODO better?
    }
    
    next = curr->next;
    
    if (prev != NULL && prev->free) {
        // combine prev and curr
        prev->size = curr->size + prev->size + sizeof(NODE);
        prev->next = curr->next;
        curr = prev;
        --mymalloc_nodes;
    }
    
    if (next != NULL && next->free) {
        // combine next and curr
        curr->size = curr->size + next->size + sizeof(NODE);
        curr->next = next->next;
        --mymalloc_nodes;
    }
    
    curr->free = 1;

    // find end of list
    while (curr->next != NULL) {
    	prev = curr;
    	curr = curr->next;
    }

#ifdef DEBUG
    printf("end of heap: %d\n",curr);
#endif
    if (curr->free) {
    	if (prev != NULL)
    		prev->next = NULL;
    	--mymalloc_nodes;
    	sbrk(-(curr->size + sizeof(NODE)));
    }
}
