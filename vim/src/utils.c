//
// Created by prxvvy on 08/03/2022
//

#define _XOPEN_SOURCE 500
#include <bool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <utils.h>

int IsEqualTo(char *p_input1, char *p_input2) {
    /* If the len of both strings are not equal, well they are not the same */

    if (strlen(p_input1) != strlen(p_input2)) return FALSE;

    unsigned int index = 0;

    while (p_input1[index] != '\0' && p_input2[index] != '\0') {
        if ((p_input1[index] != p_input2[index])) return FALSE;
        index++;
    }
    return TRUE;
}

int UnlinkCallback(const char *fpath, const struct stat *sb, int typeflag,
                   struct FTW *ftwbuf) {
    int rv = remove(fpath);

    if (rv) perror(fpath);

    return rv;
}

int Rmrf(char *path) {
    return nftw(path, UnlinkCallback, 64, FTW_DEPTH | FTW_PHYS);
}

Bool StartsWith(char *p_string, char *p_toFind) {
    for (unsigned int i = 0; i < strlen(p_string); ++i) {
        if (i == 0) {
            if (IsEqualTo((char[2]){p_string[i], '\0'}, p_toFind) == FALSE)
                return FALSE;
            else
                return TRUE;
        }
    }
    return FALSE;
}

Bool Includes(char *p_string, char *p_toFind) {
    size_t sLen = strlen(p_string);
    size_t toFindLen = strlen(p_toFind);

    unsigned int timesFound = 0;

    if (sLen > toFindLen) {
        for (unsigned int i = 0, j = 0; i < sLen; ++i) {
            do {
                if (p_string[i] == p_toFind[j]) { /* If stars with same char */
                    if (++timesFound == toFindLen)
                        return TRUE; /* If got same len */
                    i++;
                    j++;
                } else {
                    i -= timesFound;
                    timesFound = 0;
                    j = 0;
                }
            } while (timesFound);
        }
        return FALSE;
    } else {
        printf("\"%s\" is longer than \"%s\"\n", p_toFind, p_string);
        return FALSE;
    }
}

char *ConcatenateGitCMD(char *p_githubURL, char *p_destDir, Bool special) {
    char *p_1stPartCloneCmd =
        special == TRUE ? "git clone --branch release " : "git clone ";
    size_t firstPartcloneCmdSize = strlen(p_1stPartCloneCmd);
    size_t githubURLSize = strlen(p_githubURL);
    size_t desDirSize = strlen(p_destDir);
    size_t someSpaceSize = strlen(" ");
    size_t totalSize =
        special == TRUE
            ? firstPartcloneCmdSize + githubURLSize + someSpaceSize +
                  desDirSize + strlen(" --depth=1") + 1
            : firstPartcloneCmdSize + githubURLSize + desDirSize + 1;
    char *p_cmd = calloc(totalSize, sizeof(char));
    if (special == TRUE) {
        strcpy(p_cmd, "git clone --branch release ");
        strcpy(p_cmd + firstPartcloneCmdSize, p_githubURL);
        strcpy(p_cmd + firstPartcloneCmdSize + githubURLSize, " ");
        strcpy(p_cmd + firstPartcloneCmdSize + githubURLSize + someSpaceSize,
               p_destDir);
        strcpy(p_cmd + firstPartcloneCmdSize + githubURLSize + someSpaceSize +
                   desDirSize,
               " --depth=1");
    } else {
        strcpy(p_cmd, "git clone ");
        strcpy(p_cmd + firstPartcloneCmdSize, p_githubURL);
        strcpy(p_cmd + firstPartcloneCmdSize + githubURLSize, " ");
        strcpy(p_cmd + firstPartcloneCmdSize + githubURLSize + someSpaceSize,
               p_destDir);
    }
    return p_cmd;
}