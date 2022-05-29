/* user and group to drop privileges to */
static const char *user  = "prxvvy";
static const char *group = "prxvvy";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "black",     /* after initialization */
	[INPUT] =  "#EBDBB2",   /* during input */
	[FAILED] = "#9D0006",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;

/* default message */
static const char * message = "Locked at  $(date \"+%a %d, %H:%M:%S\")";

/* text color */
static const char * text_color = "#ffffff";

/* text size (must be a valid size) */
static const char * font_name = "6x13";
