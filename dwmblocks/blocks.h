// Modify this file to change what commands output to your statusbar, and
// recompile using the make command.

#define SC(script) "$HOME/.dotfiles/dwmblocks/scripts/" #script

static const Block blocks[] = {
    /*Icon*/ /*Command*/ /*Update Interval*/ /*Update Signal*/
    {"", SC(net), 1, 1},
    {"", SC(volume), 1, 1},
    {"", SC(batt), 1, 0},
    {"", SC(datetime), 1, 0},
    {"", SC(updates), 120, 0},
};

// sets delimeter between status commands. NULL character ('\0') means no
// delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
