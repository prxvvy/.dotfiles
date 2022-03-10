//
// Created by prxvvy on 09/03/2022
//

#include <installer.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <utils.h>

#include "list.h"

Plugin *CreatePlugin(char *p_author, char *p_name, char *p_category) {
    Plugin *self = calloc(1, sizeof(struct Plugin));
    self->p_author = p_author;
    self->p_name = p_name;
    self->p_category = p_category;
    return self;
}

Bool InitStartDirs() {
    int rmCode;

    printf("Removing existing plugins for a fresh installation...");

    rmCode = Rmrf(p_paths[0]);
    if (rmCode == -1) {
        printf("Something went wrong removing \"%s\". Exit code: %d\n",
               p_paths[0], rmCode);
        return FALSE;
    }
    printf("Successfully removed existing autocompletion plugins.");

    rmCode = Rmrf(p_paths[1]);
    if (rmCode == -1) {
        printf("Something went wrong removing \"%s\". Exit code: %d\n",
               p_paths[0], rmCode);
        return FALSE;
    }

    printf("Successfully removed existing theme plugins.");

    printf("Creating new start directory for plugins...");

    mkdir(AUTOCOMPLETION_PATH, 0700);

    printf(
        "Successfully created new start directory for autocompletion plugins.");

    mkdir(THEME_PATH, 0700);

    printf("Successfully created new start directory for theme plugins.");

    return TRUE;
}

List *GetPlugins(List *p_pluginsList) {
    List *p_plugins = CreateList();

    List *p_tmpList = CreateList();
    for (unsigned int i = 0; i < GetSize(p_pluginsList); ++i) {
        if (IsEqualTo(GetNodeAt(p_pluginsList, i)->p_value, "") == FALSE &&
            StartsWith(GetNodeAt(p_pluginsList, i)->p_value, "#") == FALSE) {
            char *p_toFree = calloc(
                strlen(GetNodeAt(p_pluginsList, i)->p_value) + 1, sizeof(char));
            strcpy(p_toFree, GetNodeAt(p_pluginsList, i)->p_value);
            char *p_line;
            // TO-DO: Get a way to free this one list.
            List *p_tmpL = CreateList();
            while ((p_line = strsep(&p_toFree, ";"))) {
                InsertAtEnd(p_tmpL, p_line);
            }
            InsertAtEnd(p_tmpList, p_tmpL);
            free(p_toFree);
        }
    }
    for (unsigned int j = 0; j < GetSize(p_tmpList); ++j) {
        char *p_author =
            GetNodeAt(GetNodeAt(p_tmpList, j)->p_value, 0)->p_value;
        char *p_name = GetNodeAt(GetNodeAt(p_tmpList, j)->p_value, 1)->p_value;
        char *p_category =
            GetNodeAt(GetNodeAt(p_tmpList, j)->p_value, 2)->p_value;

        InsertAtEnd(p_plugins, CreatePlugin(p_author, p_name, p_category));
    }

    DestroyEach(p_tmpList);
    DestroyList(p_tmpList);

    return p_plugins;
}

/**
 * Just like in Python, instead of getting the adress of an object, best it's
 * getting a string with some info about the object itself. In this case it'll
 * return the github URL where the plugin is hosted at. Do not forget to free!
 */

char *__str__(Plugin *p_plugin) {
    // https://github.com/author/pluginName.git
    char *p_githubURL = "https://github.com";
    size_t githubURLLen = strlen(p_githubURL);
    size_t authorLen = strlen(p_plugin->p_author);
    size_t nameLen = strlen(p_plugin->p_name);
    size_t slashLen = strlen("/");
    size_t dotGitLen = strlen(".git");
    size_t totalLen =
        githubURLLen + slashLen + authorLen + slashLen + nameLen + dotGitLen;
    char *p_gitRepoURL = calloc(totalLen, sizeof(char));
    strcpy(p_gitRepoURL, p_githubURL);
    strcpy(p_gitRepoURL + githubURLLen, "/");
    strcpy(p_gitRepoURL + githubURLLen + slashLen, p_plugin->p_author);
    strcpy(p_gitRepoURL + githubURLLen + slashLen + authorLen, "/");
    strcpy(p_gitRepoURL + githubURLLen + slashLen + authorLen + slashLen,
           p_plugin->p_name);
    strcpy(
        p_gitRepoURL + githubURLLen + slashLen + authorLen + slashLen + nameLen,
        ".git");
    return p_gitRepoURL;
}
