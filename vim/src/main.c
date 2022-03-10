#include <installer.h>
#include <stdio.h>
#include <stdlib.h>
#include <user-interaction.h>

int main() {
    List *p_pluginsFile = ReadLines("vim-plugins.txt");
    List *p_plugin = GetPlugins(p_pluginsFile);
    for (unsigned int i = 0; i < GetSize(p_plugin); ++i) {
        char *p_URL = __str__(GetNodeAt(p_plugin, i)->p_value);
        printf("%s\n", p_URL);
        free(p_URL);
    }
    DestroyEach(p_pluginsFile);
    DestroyList(p_pluginsFile);
    DestroyEach(p_plugin);
    DestroyList(p_plugin);
    return 0;
}
