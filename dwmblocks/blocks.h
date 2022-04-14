// Modify this file to change what commands output to your statusbar, and
// recompile using the make command.

#define SC(script) "$HOME/.dotfiles/dwmblocks/scripts/" #script

static const Block blocks[] = {
    /*Icon*/ /*Command*/ /*Update Interval*/ /*Update Signal*/
    {"", SC(updates), 300, 0},
    {"", SC(net), 2, 1},
    {"", SC(datetime), 2, 0},
    {"", SC(batt), 3, 0},
    {"", SC(volume), 1, 0},
};

// sets delimeter between status commands. NULL character ('\0') means no
// delimeter.
static char delim[] = " ";
static unsigned int delimLen = 5;
