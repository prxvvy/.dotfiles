#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Bash colors
NORMAL=$(echo -e "\001\033[00m\002")
GREEN=$(echo -e "\001\033[01;32m\002")
RED=$(echo -e "\001\033[01;31m\002")
BLUE=$(echo -e "\001\033[01;94m\002")
YELLOW=$(echo -e "\001\033[01;33m\002")
PURPLE=$(echo -e "\001\033[01;35m\002")
CYAN=$(echo -e "\001\033[01;36m\002")

# Customiz terminal prompt
PS1="${RED}[\w] ${GREEN}-> ${NORMAL}"

alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
