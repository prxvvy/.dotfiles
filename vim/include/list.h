//
// Created by prxvvy on 29-01-22.
//

#ifndef CLINKEDLIST_LIST_H
#define CLINKEDLIST_LIST_H

#include <node.h>

typedef struct List {
    unsigned int size;
    Node *p_head;
    Node *p_tail;
} List;

List *CreateList();

unsigned int GetSize(List *p_list);

Bool InsertAtBeginning(List *p_list, void *p_value);

Bool InsertAtEnd(List *p_list, void *p_value);

Bool RemoveAtBeginning(List *p_list);

Bool RemoveAtEnd(List *p_list);

Bool FirstEntry(List *p_list, Node *p_node);

Bool DestroyList(List *p_list);

Bool DestroyEach(List *p_list);

Node *GetNodeAt(List *p_list, unsigned int index);

Bool UnlinkNode(List *p_list, Node *p_node);

int Insert(List *p_list, void *p_value, unsigned int index);

List *Split(char *p_toSplit, char *sep);

#endif  // CLINKEDLIST_LIST_H
