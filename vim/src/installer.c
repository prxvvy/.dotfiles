//
// Created by prxvvy on 09/03/2022
//

#include <installer.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <utils.h>

Plugin *CreatePlugin(char *p_author, char *p_name, char *p_category) {
    Plugin *self = calloc(1, sizeof(struct Plugin));
    self->p_author = p_author;
    self->p_name = p_name;
    self->p_category = p_category;
    return self;
}

Bool InitStartDirs() {
    int rmCode, mkdirCode;

    printf("Removing existing plugins for a fresh installation...\n");

    rmCode = Rmrf(p_paths[0]);
    if (rmCode == -1) {
        printf("Something went wrong removing \"%s\". Exit code: %d\n",
               p_paths[0], rmCode);
        return FALSE;
    }
    printf("Successfully removed existing autocompletion plugins.\n");

    rmCode = Rmrf(p_paths[1]);
    if (rmCode == -1) {
        printf("Something went wrong removing \"%s\". Exit code: %d\n",
               p_paths[1], rmCode);
        return FALSE;
    }

    printf("Successfully removed existing theme plugins.\n");

    printf("Creating new start directory for plugins...\n");

    mkdirCode = mkdir(p_paths[0], 0700);

    if (mkdirCode == -1) {
        printf("Something went wrong trying to create \"%s\". Exit code: %d\n",
               p_paths[0], mkdirCode);
        return FALSE;
    }

    printf(
        "Successfully created new start directory for autocompletion "
        "plugins.\n");

    mkdirCode = mkdir(p_paths[1], 0700);

    if (mkdirCode == -1) {
        printf("Something went wrong trying to create \"%s\". Exit code: %d\n",
               p_paths[1], mkdirCode);
        return FALSE;
    }

    printf("Successfully created new start directory for theme plugins.\n");

    return TRUE;
}

List *BundlePlugins(List *p_pluginsList) {
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

Bool InstallPlugins(List *p_pluginsList) {
    for (unsigned int i = 0; GetSize(p_pluginsList); ++i) {
        char *p_name = ((Plugin *)GetNodeAt(p_pluginsList, i)->p_value)->p_name;
        char *p_category =
            ((Plugin *)GetNodeAt(p_pluginsList, i)->p_value)->p_category;
        if (IsEqualTo(p_name, "coc.nvim") == TRUE) {
            char *p_pathInstallation =
                calloc(strlen(p_paths[0]) + strlen("/") + strlen(p_name) + 1,
                       sizeof(char));
            strcpy(p_pathInstallation, p_paths[0]);
            strcpy(p_pathInstallation + strlen(p_paths[0]), "/");
            strcpy(p_pathInstallation + strlen(p_paths[0]) + strlen("/"),
                   p_name);
            printf("Adding special plugin \"%s\" to %s category directory...\n",
                   p_name, p_category);
            system(ConcatenateGitCMD(
                __str__((Plugin *)GetNodeAt(p_pluginsList, i)->p_value),
                p_pathInstallation, TRUE));
            printf("Added special plugin \"%s\" to %s category directory.\n",
                   p_name, p_category);
            free(p_pathInstallation);
        }
        if (IsEqualTo(p_category, "autocompletion") == TRUE) {
            char *p_pathInstallation =
                calloc(strlen(p_paths[0]) + strlen("/") + strlen(p_name) + 1,
                       sizeof(char));
            strcpy(p_pathInstallation, p_paths[0]);
            strcpy(p_pathInstallation + strlen(p_paths[0]), "/");
            strcpy(p_pathInstallation + strlen(p_paths[0]) + strlen("/"),
                   p_name);
            printf("Adding plugin \"%s\" to %s category directory...\n", p_name,
                   p_category);
            system(ConcatenateGitCMD(
                __str__((Plugin *)GetNodeAt(p_pluginsList, i)->p_value),
                p_pathInstallation, FALSE));
            printf("Added plugin \"%s\" to %s category directory.\n", p_name,
                   p_category);

            free(p_pathInstallation);

        } else if (IsEqualTo(p_category, "theme") == TRUE) {
            char *p_pathInstallation =
                calloc(strlen(p_paths[1]) + strlen("/") + strlen(p_name) + 1,
                       sizeof(char));
            strcpy(p_pathInstallation, p_paths[1]);
            strcpy(p_pathInstallation + strlen(p_paths[1]), "/");
            strcpy(p_pathInstallation + strlen(p_paths[1]) + strlen("/"),
                   p_name);
            printf("Adding plugin \"%s\" to %s category directory...\n", p_name,
                   p_category);

            system(ConcatenateGitCMD(
                __str__((Plugin *)GetNodeAt(p_pluginsList, i)->p_value),
                p_pathInstallation, FALSE));

            free(p_pathInstallation);
            printf("Added plugin \"%s\" to %s category directory.\n", p_name,
                   p_category);

        } else {
            printf("Invalid category.\n");
            return FALSE;
        }
    }
    return TRUE;
}
