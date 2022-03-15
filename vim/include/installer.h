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

/**
 * Represent a Vim plugin in terms of a Github repo as it's got an author
 * of the repo and the name of the plugin itself.
 * Treat this struct as a class
 * as it'll got its own dedicated "methods".
 */

typedef struct Plugin {
    /* The name of the author of the Github repo. */
    char *p_author;
    /* The name of the Github repo where the Vim plugin is hosted at. It's
     * usually the same one as the plugin name*/
    char *p_name;
    /* The directory where the Vim plugin should get installed. */
    char *p_category;
} Plugin;

/**
 * Construct a new Vim plugin "object".
 * Look at this method as the constructor of the class.
 * Instance (call).
 */

Plugin *CreatePlugin(char *p_author, char *p_name, char *p_category);

/**
 * Just like in Python, instead of getting the adress of an object, best it's
 * getting a string with some info about the object itself. In this case it'll
 * return the github URL where the plugin is hosted at. Do not forget to free!
 */

char *__str__(Plugin *p_plugin);

/**
 * This one function gets called when the installer starts.
 * Why? Because should first remove existing directories, in specified, the
 * "pack/category/start/..." subsubdir.
 */

Bool InitStartDirs();

/**
 * Take a list of strs which are meant to be the plugins' info (the ones in the
 * .txt file), read it, iterate through it, get some relevant info, format it so
 * that's left in the following list format "["author", "plugin'sName",
 * "category"]" and return a list[list[str]].
 * I'd not look at the implementation of this definition if I were you.
 */

List *GetPlugins(List *p_pluginsList);

Bool AddPlugins(List *p_pluginsList);

#endif  // INSTALLER_H
