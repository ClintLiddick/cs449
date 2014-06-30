#include <unistd.h>

static void *mymalloc_memstart = 0;
static int mymalloc_nodes = 0;

typedef struct node {
    size_t size;
    char free;
    struct node *next;
} NODE;

void *my_worstfit_malloc(int size) {
    NODE *ptr;
    NODE newNode;
    NODE freeNode;
    NODE *worstfit_ptr = 0;
    NODE *traversal = (NODE*)mymalloc_memstart;
    int i;
    
    if (mymalloc_memstart == 0) // not allocated
        mymalloc_memstart = sbrk(0);
    
    ptr = (NODE*)mymalloc_memstart;
    worstfit_ptr = (NODE*)mymalloc_memstart;
    
    
    for(i=0; i<mymalloc_nodes; ++i) {   // foreach NODE
        if (ptr->free == 1 && ptr->size > worstfit_ptr->size) {
            // possible match
            worstfit_ptr = ptr;
        }
        ptr = ptr->next;
    }
    
    if (mymalloc_nodes > 0 && worstfit_ptr->free == 1 && worstfit_ptr->size >= size) {
        // break node into 2 pieces and assign
        
        // store new free node info
        if (worstfit_ptr->size - size > sizeof(NODE)) { 
        // new free node would have free space
            freeNode.size = worstfit_ptr->size - size - sizeof(NODE);  // leftover is free
            freeNode.free = 1;
            freeNode.next = worstfit_ptr->next; // preserve next pointer
            // assign to next space after new alloc
            *(worstfit_ptr + sizeof(NODE) + size) = freeNode;
            
            newNode.size = worstfit_ptr->size - freeNode.size - sizeof(NODE); 
            newNode.next = worstfit_ptr + sizeof(NODE) + size; // freeNode
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
        newNode.next = 0;
        ptr = (NODE*)sbrk(size + sizeof(NODE));
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
    
    return (ptr + sizeof(NODE));
}

void my_free(void *ptr) {
    NODE *prev = NULL;
    NODE *curr = (NODE*)(ptr-sizeof(NODE)); // read node from allocated block
    
}
