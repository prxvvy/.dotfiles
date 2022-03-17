//
// Created by prxvvy on 08/03/2022
//

#ifndef UTILS_H
#define UTILS_H

#define _XOPEN_SOURCE 500

#include <bool.h>
#include <ftw.h>

int IsEqualTo(char *p_input1, char *p_input2);

int UnlinkCallback(const char *fpath, const struct stat *sb, int typeflag,
                   struct FTW *ftwbuf);

int Rmrf(char *path);

Bool StartsWith(char *p_string, char *p_toFind);

Bool Includes(char *p_string, char *p_toFind);

char *ConcatenateGitCMD(char *p_githubURL, char *p_destDir, Bool special);

#endif  // UTILS_H
