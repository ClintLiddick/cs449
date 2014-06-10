/*
 * lab3.c
 *
 *  Created on: Jun 10, 2014
 *      Author: Clinton Liddik
 */

#include <stdio.h>
#include <stdlib.h>

struct Node {
	int grade;
	struct Node *next;
};

struct Node *addNode(struct Node *head, int _grade) {
	struct Node *newHead = (struct Node*) malloc(sizeof(struct Node));
	newHead->grade = _grade;
	if (head != NULL)
		newHead->next = head;
	else
		newHead->next = NULL;
	return newHead;
}

// depends on next in last node in list pointing to NULL
void destroyList(struct Node *head) {
	struct Node *curr;
	struct Node *next;

	curr = head;
	head = NULL; // delete head pointer
	while (curr->next != NULL) {
		next = curr->next;
		free(curr);
		curr = next;
	}
	free(curr);
}

int averagegrade(struct Node *head) {
	int total = 0;
	int number = 0;
	while (head != NULL) {
		total += head->grade;
		number++;
		head = head->next;
	}
	return (total/number);
}

void printlist(struct Node *head) {
	while (head != NULL) {
		printf("%d ",head->grade);
		head = head->next;
	}

}

int main() {
	struct Node *head = NULL;
	int tempgrade;
	int parsedgrades;
	char tempstr[3];
	int average;

	printf("enter grades or -1 to finish: ");
	while (fgets(tempstr,sizeof(tempstr),stdin) != NULL) {
		parsedgrades = sscanf(tempstr,"%d",&tempgrade);
		if (parsedgrades == 1) {
			if (tempgrade == -1) {
				break;
			} else {
				head = addNode(head,tempgrade);
			}
		} else {
			printf("error reading grade");
		}
	}
	//printlist(head);
	average = averagegrade(head);
	printf("Average grade is: %d\n",average);
	destroyList(head);
	head = NULL;
	return 0;
}


