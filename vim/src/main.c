#include <installer.h>
#include <stdio.h>
#include <stdlib.h>
#include <user-interaction.h>

int main() {
    InitStartDirs();
    List *p_pluginsFileList = ReadLines("./vim-plugins.txt");
    List *p_plugins = BundlePlugins(p_pluginsFileList);
    Bool installed = InstallPlugins(p_plugins);
    if (installed == TRUE) printf("Added all plugins found in txt file!\n");
    DestroyEach(p_pluginsFileList);
    DestroyList(p_pluginsFileList);
    DestroyEach(p_plugins);
    DestroyList(p_plugins);
    return 0;
}
