// Modify this file to change what commands output to your statusbar, and
// recompile using the make command.

#define SC(script) "$HOME/.dotfiles/dwmblocks/scripts/" #script

static const Block blocks[] = {
    /*Icon*/ /*Command*/ /*Update Interval*/ /*Update Signal*/
    {"<\x02 ", SC(updates), 300, 0},
    {"\x03 ", SC(net), 2, 1},
    {"\x04 ", SC(datetime), 2, 0},
    {"\x05 ", SC(batt), 3, 0},
    {"\x06 ", SC(volume), 1, 0},
};

// sets delimeter between status commands. NULL character ('\0') means no
// delimeter.
static char delim[] = "<";
static unsigned int delimLen = 5;
