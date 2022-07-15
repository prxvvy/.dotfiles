/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int gappih    = 10;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 10;       /* vert inner gap between windows */
static const unsigned int gappoh    = 10;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 10;       /* vert outer gap between windows and screen edge */
static const int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft = 0;   	/* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;     /* 0 means no systray */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char buttonbar[]       = "﩯";
static const int user_bh            = 26;        /* 0 means that dwm will calculate bar height, >= 1 means dwm will user_bh as bar height */
/* static const char *fonts[]          = { "CodeNewRoman Nerd Font:size=11.6:weight=regular:antialias=true:autohint:true" }; */
/* static const char *fonts[]          = { "FiraCode Nerd Font:size=10:weight=regular:antialias=true:autohint:true" }; */
static const char *fonts[]          = { "unscii-12" };
static const char dmenufont[]       = "Iosevka Nerd Font:size=10:weight=regular:antialias=true:autohint:true";

static const char col_gray0[]       = "#000000";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#586e75";
static const char col_gray3[]       = "#eee8d5";
static const char col_gray4[]       = "#fdf6e3";
static const char col_accen[]       = "#268bd2";

#include "gruvbox.h"

static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { "#d5c4a1", "#1d2021", "#1d2021" },
	[SchemeSel]  = { "#d5c4a1", "#282828",  "#d5c4a1"  },
	[SchemeTitle]  = { "#d5c4a1", "#282828",  "#d5c4a1"  },
	[SchemeUrg]  = { "#f5f5f5", "#ac4142",  "#ac4142"  },
};

/* tagging */
static const char *tags[] = { "cmd", "www", "dev", "doc", "chat", "med", "sys" };
static const char *alttags[] = { "[cmd]", "[www]", "[dev]", "[doc]", "[chat]", "[med]", "[sys]" };

static const char *tagsel[][2] = {
	{ "#d5c4a1", "#282828" },
	{ "#d5c4a1", "#282828" },
	{ "#d5c4a1", "#282828" },
	{ "#d5c4a1", "#282828" },
	{ "#d5c4a1", "#282828" },
	{ "#d5c4a1", "#282828" },
	{ "#d5c4a1", "#282828" },
	{ "#000000", "#ffffff" },
	{ "#ffffff", "#000000" },
};

static const unsigned int ulinepad	= 5;	/* horizontal padding between the underline and tag */
static const unsigned int ulinestroke	= 2;	/* thickness / height of the underline */
static const unsigned int ulinevoffset	= 0;	/* how far above the bottom of the bar the line should appear */
static const int ulineall 		= 0;	/* 1 to show underline on all tags, 0 for just the active ones */

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
// static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

#include "grid.c"
#include "fibonacci.c"
#include "tatami.c"
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
	{ NULL,       NULL },
	{ "HHH",      grid },
 	{ "[@]",      spiral },
 	{ "[\\]",      dwindle },
	{ "|+|",      tatami },
};

/* key definitions */
#define MODKEY Mod4Mask
#define Print 0x0000ff61
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
/* static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL }; */
static const char *dmenucmd[] = { "dmenu_run", NULL };
static const char *termcmd[]  = { "st", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	/* Screenshot */
	    {0, Print, spawn,
     SHCMD("maim \"/home/$USER/Pictures/screenshots/$(date +%s).jpg\"")},
    {MODKEY, Print, spawn,
     SHCMD("maim --window $(xdotool getactivewindow) "
           "\"/home/$USER/Pictures/screenshots/$(date +%s).jpg\"")},
    {0 | ShiftMask, Print, spawn,
     SHCMD(
         "maim --select \"/home/$USER/Pictures/screenshots/$(date +%s).jpg\"")},

    {ControlMask, Print, spawn,
     SHCMD("maim | xclip -selection clipboard -t image/png")},
    {ControlMask | MODKEY, Print, spawn,
     SHCMD("maim -i $(xdotool getactivewindow) | xclip -selection clipboard -t "
           "image/png")},
    {ControlMask | ShiftMask, Print, spawn,
     SHCMD("maim --select | xclip -selection clipboard -t image/png")},

	/* Open browser */
	{ MODKEY,                       XK_b,      spawn,          SHCMD("/usr/bin/brave-browser-stable") },
	/* Rofi menu */
	{ MODKEY,                       XK_d,      spawn,          {.v = dmenucmd } },
	/* Screen locker */
	{ MODKEY|ShiftMask,             XK_x,      spawn,          SHCMD("/usr/local/bin/slock") },
	/* Terminal */
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	/* Volume control */
	{ 0,                            XF86XK_AudioLowerVolume,   spawn, SHCMD("amixer -q set Master 5%- unmute") },
   { 0,                            XF86XK_AudioRaiseVolume,   spawn, SHCMD("amixer -q set Master 5%+ unmute") },
   { 0,                            XF86XK_AudioMute,          spawn, SHCMD("amixer -q set Master toggle") },
    /* Brightness control */
   { 0,                            XF86XK_MonBrightnessUp,    spawn, SHCMD("brightnessctl set +10%") },
   { 0,                            XF86XK_MonBrightnessDown,  spawn, SHCMD("brightnessctl set 10%-") },
	/* Toggle bar */
	{ MODKEY|ShiftMask,             XK_b,      togglebar,      {0} },
	/* Move windows in current stack */
	{ MODKEY|ShiftMask,             XK_j,      rotatestack,    {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,      rotatestack,    {.i = -1 } },
	/* Switch between windows */
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	/* Change window sizes */
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_i,      incnmaster,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY|ShiftMask,             XK_l,      setmfact,       {.f = +0.05} },

	/*
	{ MODKEY|Mod4Mask,              XK_h,      incrgaps,       {.i = +1 } },
	{ MODKEY|Mod4Mask,              XK_l,      incrgaps,       {.i = -1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_h,      incrogaps,      {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_l,      incrogaps,      {.i = -1 } },
	{ MODKEY|Mod4Mask|ControlMask,  XK_h,      incrigaps,      {.i = +1 } },
	{ MODKEY|Mod4Mask|ControlMask,  XK_l,      incrigaps,      {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_0,      togglegaps,     {0} },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_0,      defaultgaps,    {0} },
	{ MODKEY,                       XK_y,      incrihgaps,     {.i = +1 } },
	{ MODKEY,                       XK_o,      incrihgaps,     {.i = -1 } },
	{ MODKEY|ControlMask,           XK_y,      incrivgaps,     {.i = +1 } },
	{ MODKEY|ControlMask,           XK_o,      incrivgaps,     {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_y,      incrohgaps,     {.i = +1 } },
	{ MODKEY|Mod4Mask,              XK_o,      incrohgaps,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_y,      incrovgaps,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_o,      incrovgaps,     {.i = -1 } },
	*/
	
	{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	// { MODKEY,                       XK_y,      setlayout,      {.v = &layouts[3]} },
	{ MODKEY|ControlMask,		XK_comma,  cyclelayout,    {.i = -1 } },
	{ MODKEY|ControlMask,           XK_period, cyclelayout,    {.i = +1 } },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY|ShiftMask,             XK_f,      togglefullscr,  {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	/* Uncoment to add more tag keys */
	/*
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	*/
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
	{ MODKEY|ControlMask|ShiftMask, XK_q,      quit,           {1} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkButton,		0,		Button1,	spawn,		{.v = dmenucmd } },
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
