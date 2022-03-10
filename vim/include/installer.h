//
// Created by prxvvy on 09/03/2022
//

#ifndef INSTALLER_H
#define INSTALLER_H

#include <bool.h>
#include <list.h>

#define AUTOCOMPLETION_PATH "./.vim/pack/autocompletion/start"
#define THEME_PATH "./.vim/pack/theme/start"
#define FILE_PLUGINS_TXT "./vim-plugins.txt"

static char *p_paths[] = {AUTOCOMPLETION_PATH, THEME_PATH, FILE_PLUGINS_TXT};

typedef struct Plugin {
    char *p_author;
    char *p_name;
    char *p_category;
} Plugin;

Plugin *CreatePlugin(char *p_author, char *p_name, char *p_category);

char *__str__(Plugin *p_plugin);

Bool InitStartDirs();

List *GetPlugins(List *p_pluginsList);

Bool AddPlugins(List *p_pluginsList);

#endif  // INSTALLER_H
