#!/bin/python

"""
        Filename: vim-install

    Description:

        Created: 05/03/2022

        Author:  prxvvy (qsk55464@gmail.com)
"""

from os import rmdir, mkdir, system

AUTOCOMPLETION_PATH = "./.vim/pack/autocompletion/start"

THEME_PATH = "./.vim/pack/theme/start"

FILE_PLUGINS_TXT = "./vim-plugins.txt"


class Plugin:
    def __init__(self, git_repo_URL, category):
        self.git_repo_URL = git_repo_URL
        self.category = category


def init_start_dirs():
    print("Removing existing plugins for a fresh installation...")

    rmdir(AUTOCOMPLETION_PATH)

    print("Successfully removed existing autocompletion plugins.")

    rmdir(THEME_PATH)

    print("Successfully removed existing theme plugins.")

    print("Creating new start directory for plugins...")

    mkdir(AUTOCOMPLETION_PATH)

    print("Successfully created new start directory for autocompletion plugins.")

    mkdir(THEME_PATH)

    print("Successfully created new start directory for theme plugins.")

    return True


def read_plugins_file(sep="|"):
    plugins = []
    with open(FILE_PLUGINS_TXT, "r", encoding="utf-8") as plugins_file:
        for line in plugins_file:
            line = line.strip("\n")
            if not line.startswith("#") and line != "":
                line = line.split(sep)
                plugins.append(Plugin(line[0], line[1]))
    return plugins


def add_plugins(plugins_list):
    for plugin in plugins_list:
        if plugin.category.lower() == "autocompletion":
            print(
                f"Adding {plugin.git_repo_URL} to {plugin.category} category directory..."
            )
            system(f"git clone {plugin.git_repo_URL} {AUTOCOMPLETION_PATH}")
            print(
                f"Added {plugin.git_repo_URL} to {plugin.category} category directory."
            )

        elif plugin.category.lower() == "theme":
            print(
                f"Adding {plugin.git_repo_URL} to {plugin.category} category directory..."
            )

            system(f"git clone {plugin.git_repo_URL} {THEME_PATH}")
            print(
                f"Added {plugin.git_repo_URL} to {plugin.category} category directory."
            )

        else:
            raise Exception("Invalid category.")


def main():
    init_start_dirs()
    plugins = read_plugins_file()
    add_plugins(plugins)


main()
