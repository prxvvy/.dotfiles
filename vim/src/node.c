//
// Created by prxvvy on 29-01-22.
//

#include <node.h>
#include <stdlib.h>
#include <string.h>

Node *CreateNode(void *p_value) {
    Node *self = calloc(1, sizeof(struct Node));

    self->p_value = p_value;

    self->p_next = NULL;
    self->p_previous = NULL;

    return self;
}

Bool DestroyNode(Node *p_node) {
    free(p_node->p_value);
    free(p_node);
    return TRUE;
}
