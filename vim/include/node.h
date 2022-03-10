//
// Created by prxvvy on 29-01-22.
//

#ifndef CLINKEDLIST_NODE_H
#define CLINKEDLIST_NODE_H

#include <bool.h>
#include <stddef.h>

typedef struct Node {
    void *p_value;
    struct Node *p_next;
    struct Node *p_previous;
} Node;

Node *CreateNode(void *p_value);

Bool DestroyNode(Node *p_node);

#endif  // CLINKEDLIST_NODE_H
