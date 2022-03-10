//
// Created by prxvvy on 10/03/2022
//

#include <iostream>

extern "C" {
#include <installer.h>
#include <stdlib.h>
#include <utils.h>
}

using namespace std;

Bool AddPlugins(List *p_pluginsList) {
   for (unsigned int i = 0; i < GetSize(p_pluginsList); ++i) {
      char *p_name = ((Plugin *)GetNodeAt(p_pluginsList, i)->p_value)->p_name;
      string command;
      char *p_githubURL =
          __str__((Plugin *)GetNodeAt(p_pluginsList, i)->p_value);
      string str(p_githubURL);
      if (IsEqualTo(p_name, (char *)"coc.nvim") == TRUE) {
         command = "git clone --branch release " + (string)p_githubURL;
      }
   }
}
