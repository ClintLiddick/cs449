#include <unistd.h>
#include <stdlib.h>
#include "mymalloc.h"

#define PTR_ADD(p,x) ((char*)(p) + (x))
#define PTR_SUB(p,x) ((char*)(p) - (x))

typedef struct node {
    size_t size;
    char free;
    struct node *next;
} NODE;

static NODE *prev_node(NODE*);
static NODE *coalesce(NODE*);
static NODE *biggest_node();

static void *mymalloc_memstart = NULL; // original brk position cache
static int mymalloc_nodes = 0; // current number of memory nodes

void *my_worstfit_malloc(int size) {
    NODE *ptr;
    NODE newNode;
    NODE freeNode;
    NODE *worstfit_ptr = NULL;
    NODE *traversal = (NODE*)mymalloc_memstart;
    
    if (mymalloc_memstart == NULL) { // not yet cached
        mymalloc_memstart = sbrk(0);
#ifdef DEBUG
        printf("---beginning of heap: %d---\n",(int)mymalloc_memstart);
#endif
    }

    
    ptr = (NODE*)mymalloc_memstart;
    worstfit_ptr = biggest_node();
    
    // make sure there was at least a single valid free node
    if (mymalloc_nodes > 0 && worstfit_ptr != NULL && worstfit_ptr->free == 1 && worstfit_ptr->size >= size) {
        // break node into 2 pieces and assign
        
        // store new free node info
        if ((worstfit_ptr->size - size > sizeof(NODE)) > 0) {
        // check if new free node would have usable free space
            ++mymalloc_nodes;
            freeNode.size = worstfit_ptr->size - size - sizeof(NODE);  // leftover is free
            freeNode.free = 1;
            freeNode.next = worstfit_ptr->next; // preserve next pointer
            // assign to next space after new alloc
            *(worstfit_ptr + sizeof(NODE) + size) = freeNode;
            
            newNode.size = worstfit_ptr->size - freeNode.size - sizeof(NODE); 
            newNode.next = (NODE*)PTR_ADD(PTR_ADD(worstfit_ptr,sizeof(NODE)),size); // freeNode
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
        if ((int)ptr == -1) {
#ifdef DEBUG
            printf("error allocating memory\n");
#endif
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
    NODE *curr = NULL;

    if (ptr == NULL)
    	return;

    curr = (NODE*) PTR_SUB(ptr,sizeof(NODE));

    curr->free = 1;
    curr = coalesce(curr);

    if (curr->next == NULL) { // end of heap list
    	prev = prev_node(curr);
    	if (prev != NULL)
    		prev->next = NULL; // term list at prev if there is more than one node

    	sbrk(-(curr->size + sizeof(NODE)));
    	--mymalloc_nodes;
    }

#ifdef DEBUG
    printf("end of heap: %d\n",(int)curr);
#endif
}

static NODE *biggest_node() {
	NODE * curr = (NODE*) mymalloc_memstart;
	NODE * biggest = (NODE *) mymalloc_memstart;

	if (mymalloc_memstart == NULL)
		return NULL;

	if (mymalloc_nodes < 1)
		return NULL;

	while (curr != NULL) {
		if (curr->size > biggest->size) {
			biggest = curr;
		}
		curr = curr->next;
	}
	return biggest;
}

static NODE *coalesce(NODE *ptr) {
	NODE *prev = NULL;
	NODE *next = NULL;

	if (ptr == NULL)
		return NULL;

	// nothing to coalesce
	if (!ptr->free)
		return ptr;

	next = ptr->next;

	prev = prev_node(ptr);

	if (prev != NULL && prev->free) {
		prev->size += sizeof(NODE) + ptr->size; // coalesce both free spaces and separating node
		prev->next = ptr->next;
		ptr = prev;
		--mymalloc_nodes;
	}

	if (next != NULL && next->free) {
		ptr->size += sizeof(NODE) + next->size;
		ptr->next = next->next;
		--mymalloc_nodes;
	}
	// TODO add shrinking
	return ptr;
}

static NODE *prev_node(NODE *ptr) {
	NODE *prev = mymalloc_memstart;

	if (ptr == NULL || prev == NULL)
		return NULL;

	while (prev != NULL && prev->next != ptr)
		prev = prev->next;

	return prev;
}
