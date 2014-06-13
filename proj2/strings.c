/*
 * strings.c
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

struct Node *addNode(struct Node *head, char _c) {
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
}

void reverselist(struct Node **head) {
    struct Node *prev = NULL;
    struct Node *curr = *head;
    struct Node *next;
    
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

int runtest() {
    struct Node *head = NULL;
	char tempgrade;
	char parsedgrades;
	char tempstr[3];
    char *str;
    
    int succ;
    
	printf("enter grades or ! to finish: ");
	while (fgets(tempstr,sizeof(tempstr),stdin) != NULL) {
		parsedgrades = sscanf(tempstr,"%c",&tempgrade);
		if (parsedgrades == 1) {
			if (tempgrade == '!') {
				break;
			} else {
				head = addNode(head,tempgrade);
			}
		} else {
			printf("error reading grade");
		}
	}
	printlist(head);
    printf("\n");
    reverselist(&head);
    printlist(head);
    printf("\n");
    succ = list_to_str(&str,head,4);
    if (succ != 0)
        printf("failure!");
    printf("%s",str);
	destroylist(&head);
	head = NULL;
	return 0;
}


int main(int argc, char **argv) {
    /* FILE file;
    char temp;
    struct Node *list;
    
    if (argc != 2) {
        printf("usage: strings <filename>");
        return 1;
    }
    
    file = fopen(argv[1],"rt");
    if (file == NULL) {
        printf("unable to open file: %s",argv[1]);
        return 1;
    } */
    runtest();
    return 0;
    
    
}


