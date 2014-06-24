/*
 * mystrings.c
 *
 *  Created on: Jun 12, 2014
 *      Author: Clinton Liddik
 */

#include <stdio.h>
#include <stdlib.h>

struct Node {
	char c;
	struct Node *next;
};

// TODO change to double pointer head
struct Node *add_node(struct Node *head, char _c) {
	struct Node *newHead = (struct Node*) malloc(sizeof(struct Node));
	newHead->c = _c;
	if (head != NULL)
		newHead->next = head;
	else
		newHead->next = NULL;
    
	return newHead;
}

// depends on next in last struct Node in list pointing to NULL
// TODO verify with valgrind
void destroylist(struct Node **head) {
	struct Node *curr;
	struct Node *next;
	
	if( *head == NULL)
		return;

	curr = *head;
	*head = NULL; // delete head pointer
	while (curr->next != NULL) {
		next = curr->next;
		free(curr);
		curr = next;
	}
	free(curr);
    *head = NULL;
}

void printlist(struct Node *head) {
	while (head != NULL) {
		printf("%c",head->c);
		head = head->next;
	}
	printf("\n");
}

void reverselist(struct Node **head) {
    struct Node *prev = NULL;
    struct Node *curr = *head;
    struct Node *next = NULL;
    
    if (head == NULL)
        return;
    
    while (curr != NULL) {
        next = curr->next;
        curr->next = prev;
        prev = curr;
        curr = next;
    }
    
    *head = prev;
}

int list_to_str(char **dest, struct Node *src, int len) {
    int i;
    *dest = (char*) malloc(len+1);
    if (*dest == NULL)
        return 1;
    
    for (i=0; src != NULL && i < len; ++i) {
        (*dest)[i] = src->c;
        src = src->next;
    }
    (*dest)[i] = '\0';
    return 0;
}

int iskeyboardchar(char c) {
	int result = 0;
	if (c >= ' ' && c <= '~')
		result = 1;
	
	return result;
}


int main(int argc, char **argv) {
	FILE *file;
	struct Node *list = NULL;
	char temp_c;
	int temp_read;
	int numofchars = 0;
    
    if (argc != 2) {
        printf("usage: mystrings <filename>\n");
        return 1;
    }
    
    file = fopen(argv[1],"rt");
    if (file == NULL) {
        printf("unable to open file: %s\n",argv[1]);
        return 1;
    }
    
    while (!feof(file)) {
        temp_read = fread(&temp_c,1,1,file); // read single char (byte)
		if (temp_read == 1 && iskeyboardchar(temp_c)) {
			list = add_node(list,temp_c);
			++numofchars;
		} else if ( numofchars >= 4) {
			reverselist(&list);
			printlist(list);
			destroylist(&list);
			numofchars = 0;
		}
    }
	
	if (numofchars >= 4) { // print remaining string at EOF
		reverselist(&list);
		printlist(list);
		destroylist(&list);
	}
	
	fclose(file);
	destroylist(&list);

    return 0;
}


