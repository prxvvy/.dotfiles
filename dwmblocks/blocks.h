// Modify this file to change what commands output to your statusbar, and
// recompile using the make command.

#define SC(script) "$HOME/.dotfiles/dwmblocks/scripts/" #script

static const Block blocks[] = {
    /*Icon*/ /*Command*/ /*Update Interval*/ /*Update Signal*/
    {"", SC(wifi), 5, 2},
    {"", SC(network), 5, 2},
    {"", SC(pacman-updates), 60, 2},
    {"", SC(aur-updates), 60, 2},
    {"", SC(memory), 10, 0},
    {"", SC(date), 5, 0},
    {"", SC(time), 5, 0}
};

// sets delimeter between status commands. NULL character ('\0') means no
// delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
