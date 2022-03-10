//
// Created by prxvvy on 08/03/2022
//

#include <stdio.h>
#include <stdlib.h>
#include <user-interaction.h>

char *ReadLine(FILE *p_file) {
    char c;

    char *p_line = calloc(1, sizeof(char));

    int index = 0;

    unsigned int len = 0;

    while ((c = fgetc(p_file)) != '\n' && c != EOF) {
        len++;
        p_line = realloc(p_line, (len + 1));
        p_line[index] = c;
        index++;
    }
    p_line[index] = '\0';
    if (len == 0 && c == EOF) {
        free(p_line);
        p_line = NULL;
    };
    return p_line;
}

List *ReadLines(char *p_fileName) {
    List *p_linesList = CreateList();
    char *p_line = NULL;
    FILE *p_file = fopen(p_fileName, "r");

    while ((p_line = ReadLine(p_file))) {
        InsertAtEnd(p_linesList, p_line);
    }

    fclose(p_file);
    free(p_line);
    p_line = NULL;
    return p_linesList;
}
