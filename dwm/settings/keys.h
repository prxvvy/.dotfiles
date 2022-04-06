#include <X11/XF86keysym.h>

static Key keys[] = {
	/* modifier                     key            function                argument */
    {0, XF86XK_AudioLowerVolume, spawn, SHCMD("amixer -q set Master 5%- unmute")},
    {0, XF86XK_AudioRaiseVolume, spawn, SHCMD("amixer -q set Master 5%+ unmute")},
    {0, XF86XK_AudioMute, spawn, SHCMD("amixer -q set Master toggle")},

    // Brightness
    {0, XF86XK_MonBrightnessUp, spawn, SHCMD("brightnessctl set +10%")},
    {0, XF86XK_MonBrightnessDown, spawn, SHCMD("brightnessctl set 10%-")},

    {MODKEY, XK_b, spawn, SHCMD("/usr/bin/brave")},
    {MODKEY, XK_e, spawn, SHCMD("/usr/bin/thunar")},

	#if KEYMODES_PATCH
	{ MODKEY,                       XK_Escape,     setkeymode,             {.ui = COMMANDMODE} },
	#endif // KEYMODES_PATCH
	{ MODKEY,                       XK_d,          spawn,                  {.v = dmenucmd } },
	{ MODKEY,             XK_Return,     spawn,                  {.v = termcmd } },
	#if RIODRAW_PATCH
	{ MODKEY|ControlMask,           XK_p,          riospawnsync,           {.v = dmenucmd } },
	{ MODKEY|ControlMask,           XK_Return,     riospawn,               {.v = termcmd } },
	{ MODKEY,                       XK_s,          rioresize,              {0} },
	#endif // RIODRAW_PATCH
	{ MODKEY|ShiftMask,                       XK_b,          togglebar,              {0} },
	#if TAB_PATCH
	{ MODKEY|ControlMask,           XK_b,          tabmode,                {-1} },
	#endif // TAB_PATCH
	#if FOCUSMASTER_PATCH
	{ MODKEY|ControlMask,           XK_space,      focusmaster,            {0} },
	#endif // FOCUSMASTER_PATCH
	#if STACKER_PATCH
	STACKKEYS(MODKEY,                              focus)
	STACKKEYS(MODKEY|ShiftMask,                    push)
	#else
	{ MODKEY,                       XK_h,          focusstack,             {.i = +1 } },
	{ MODKEY,                       XK_l,          focusstack,             {.i = -1 } },
	#endif // STACKER_PATCH
	#if FOCUSDIR_PATCH
	{ MODKEY,                       XK_Left,       focusdir,               {.i = 0 } }, // left
	{ MODKEY,                       XK_Right,      focusdir,               {.i = 1 } }, // right
	{ MODKEY,                       XK_Up,         focusdir,               {.i = 2 } }, // up
	{ MODKEY,                       XK_Down,       focusdir,               {.i = 3 } }, // down
	#endif // FOCUSDIR_PATCH
	#if SWAPFOCUS_PATCH && PERTAG_PATCH
	{ MODKEY,                       XK_s,          swapfocus,              {.i = -1 } },
	#endif // SWAPFOCUS_PATCH
	#if SWITCHCOL_PATCH
	{ MODKEY,                       XK_v,          switchcol,              {0} },
	#endif // SWITCHCOL_PATCH
	#if ROTATESTACK_PATCH
	{ MODKEY|ControlMask,              XK_j,          rotatestack,            {.i = +1 } },
	{ MODKEY|ControlMask,              XK_k,          rotatestack,            {.i = -1 } },
	#endif // ROTATESTACK_PATCH
	#if INPLACEROTATE_PATCH
	{ MODKEY|Mod4Mask,              XK_j,          inplacerotate,          {.i = +2 } }, // same as rotatestack
	{ MODKEY|Mod4Mask,              XK_k,          inplacerotate,          {.i = -2 } }, // same as reotatestack
	{ MODKEY|Mod4Mask|ShiftMask,    XK_j,          inplacerotate,          {.i = +1} },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_k,          inplacerotate,          {.i = -1} },
	#endif // INPLACEROTATE_PATCH
	#if PUSH_PATCH || PUSH_NO_MASTER_PATCH
	{ MODKEY|ControlMask,           XK_j,          pushdown,               {0} },
	{ MODKEY|ControlMask,           XK_k,          pushup,                 {0} },
	#endif // PUSH_PATCH / PUSH_NO_MASTER_PATCH
	{ MODKEY,                       XK_i,          incnmaster,             {.i = +1 } },
	{ MODKEY|ShiftMask,                       XK_i,          incnmaster,             {.i = -1 } },
	#if FLEXTILE_DELUXE_LAYOUT
	{ MODKEY|ControlMask,           XK_i,          incnstack,              {.i = +1 } },
	{ MODKEY|ControlMask,           XK_u,          incnstack,              {.i = -1 } },
	#endif // FLEXTILE_DELUXE_LAYOUT
	{ MODKEY|ShiftMask,                       XK_h,       setmfact,               {.f = -0.05} },
	{ MODKEY|ShiftMask,                       XK_l,      setmfact,               {.f = +0.05} },
	#if CFACTS_PATCH

	{ MODKEY|ShiftMask,             XK_k,         setcfact,               {.f = +0.25} },
	{ MODKEY|ShiftMask,             XK_j,       setcfact,               {.f = -0.25} },
	#endif // CFACTS_PATCH
	#if ASPECTRESIZE_PATCH
	{ MODKEY|ControlMask|ShiftMask, XK_e,          aspectresize,           {.i = +24} },
	{ MODKEY|ControlMask|ShiftMask, XK_r,          aspectresize,           {.i = -24} },
	#endif // ASPECTRESIZE_PATCH
	#if MOVERESIZE_PATCH
	{ MODKEY|Mod4Mask,              XK_Down,       moveresize,             {.v = "0x 25y 0w 0h" } },
	{ MODKEY|Mod4Mask,              XK_Up,         moveresize,             {.v = "0x -25y 0w 0h" } },
	{ MODKEY|Mod4Mask,              XK_Right,      moveresize,             {.v = "25x 0y 0w 0h" } },
	{ MODKEY|Mod4Mask,              XK_Left,       moveresize,             {.v = "-25x 0y 0w 0h" } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_Down,       moveresize,             {.v = "0x 0y 0w 25h" } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_Up,         moveresize,             {.v = "0x 0y 0w -25h" } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_Right,      moveresize,             {.v = "0x 0y 25w 0h" } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_Left,       moveresize,             {.v = "0x 0y -25w 0h" } },
	#endif // MOVERESIZE_PATCH
	#if MOVESTACK_PATCH
	{ MODKEY|ShiftMask,             XK_j,          movestack,              {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,          movestack,              {.i = -1 } },
	#endif // MOVESTACK_PATCH
	#if TRANSFER_PATCH
	{ MODKEY,                       XK_x,          transfer,               {0} },
	#endif // TRANSFER_PATCH
	#if TRANSFER_ALL_PATCH
	{ MODKEY|ControlMask,           XK_x,          transferall,            {0} },
	#endif // TRANSFER_ALL_PATCH
	#if REORGANIZETAGS_PATCH
	{ MODKEY|ControlMask,           XK_r,          reorganizetags,         {0} },
	#endif // REORGANIZETAGS_PATCH
	#if DISTRIBUTETAGS_PATCH
	{ MODKEY|ControlMask,           XK_d,          distributetags,         {0} },
	#endif // DISTRIBUTETAGS_PATCH
	#if INSETS_PATCH
	{ MODKEY|ShiftMask|ControlMask, XK_a,          updateinset,            {.v = &default_inset } },
	#endif // INSETS_PATCH
	{ MODKEY,                       XK_Return,     zoom,                   {0} },
	#if VANITYGAPS_PATCH
	{ MODKEY|Mod4Mask,              XK_u,          incrgaps,               {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_u,          incrgaps,               {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_i,          incrigaps,              {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_i,          incrigaps,              {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_o,          incrogaps,              {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_o,          incrogaps,              {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_6,          incrihgaps,             {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_6,          incrihgaps,             {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_7,          incrivgaps,             {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_7,          incrivgaps,             {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_8,          incrohgaps,             {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_8,          incrohgaps,             {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_9,          incrovgaps,             {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_9,          incrovgaps,             {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_0,          togglegaps,             {0} },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_0,          defaultgaps,            {0} },
	#endif // VANITYGAPS_PATCH
	{ MODKEY,                       XK_Tab,        view,                   {0} },
	#if SHIFTVIEW_PATCH
	{ MODKEY|ShiftMask,             XK_Tab,        shiftview,              { .i = -1 } },
	{ MODKEY|ShiftMask,             XK_backslash,  shiftview,              { .i = +1 } },
  	#endif // SHIFTVIEW_PATCH
  	#if SHIFTVIEW_CLIENTS_PATCH
	{ MODKEY|Mod4Mask,              XK_Tab,        shiftviewclients,       { .i = -1 } },
	{ MODKEY|Mod4Mask,              XK_backslash,  shiftviewclients,       { .i = +1 } },
  	#endif // SHIFTVIEW_CLIENTS_PATCH
	#if BAR_WINTITLEACTIONS_PATCH
	{ MODKEY|ControlMask,           XK_z,          showhideclient,         {0} },
	#endif // BAR_WINTITLEACTIONS_PATCH
	{ MODKEY,             XK_q,          killclient,             {0} },	
	#if KILLUNSEL_PATCH
	{ MODKEY|ShiftMask,             XK_x,          killunsel,              {0} },
	#endif // KILLUNSEL_PATCH
	#if SELFRESTART_PATCH
	{ MODKEY|ShiftMask,             XK_r,          self_restart,           {0} },
	#endif // SELFRESTART_PATCH
	{ MODKEY|ShiftMask,             XK_q,          quit,                   {0} },
	#if RESTARTSIG_PATCH
	{ MODKEY|ControlMask|ShiftMask, XK_q,          quit,                   {1} },
	#endif // RESTARTSIG_PATCH
	#if FOCUSURGENT_PATCH
	{ MODKEY,                       XK_u,          focusurgent,            {0} },
	#endif // FOCUSURGENT_PATCH
	#if BAR_HOLDBAR_PATCH
	{ 0,                            HOLDKEY,       holdbar,                {0} },
	#endif // BAR_HOLDBAR_PATCH
	#if WINVIEW_PATCH
	{ MODKEY,                       XK_o,          winview,                {0} },
	#endif // WINVIEW_PATCH
	#if XRDB_PATCH && !BAR_VTCOLORS_PATCH
	{ MODKEY|ShiftMask,             XK_F5,         xrdb,                   {.v = NULL } },
	#endif // XRDB_PATCH
	{ MODKEY,                       XK_t,          setlayout,              {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,          setlayout,              {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,          setlayout,              {.v = &layouts[2]} },
	#if COLUMNS_LAYOUT
	{ MODKEY,                       XK_c,          setlayout,              {.v = &layouts[3]} },
	#endif // COLUMNS_LAYOUT
	#if FLEXTILE_DELUXE_LAYOUT
	{ MODKEY|ControlMask,           XK_t,          rotatelayoutaxis,       {.i = +1 } },   /* flextile, 1 = layout axis */
	{ MODKEY|ControlMask,           XK_Tab,        rotatelayoutaxis,       {.i = +2 } },   /* flextile, 2 = master axis */
	{ MODKEY|ControlMask|ShiftMask, XK_Tab,        rotatelayoutaxis,       {.i = +3 } },   /* flextile, 3 = stack axis */
	{ MODKEY|ControlMask|Mod1Mask,  XK_Tab,        rotatelayoutaxis,       {.i = +4 } },   /* flextile, 4 = secondary stack axis */
	{ MODKEY|Mod5Mask,              XK_t,          rotatelayoutaxis,       {.i = -1 } },   /* flextile, 1 = layout axis */
	{ MODKEY|Mod5Mask,              XK_Tab,        rotatelayoutaxis,       {.i = -2 } },   /* flextile, 2 = master axis */
	{ MODKEY|Mod5Mask|ShiftMask,    XK_Tab,        rotatelayoutaxis,       {.i = -3 } },   /* flextile, 3 = stack axis */
	{ MODKEY|Mod5Mask|Mod1Mask,     XK_Tab,        rotatelayoutaxis,       {.i = -4 } },   /* flextile, 4 = secondary stack axis */
	{ MODKEY|ControlMask,           XK_Return,     mirrorlayout,           {0} },          /* flextile, flip master and stack areas */
	#endif // FLEXTILE_DELUXE_LAYOUT
	{ MODKEY,                       XK_space,      setlayout,              {0} },
	{ MODKEY|ShiftMask,             XK_space,      togglefloating,         {0} },
	#if MAXIMIZE_PATCH
	{ MODKEY|ControlMask|ShiftMask, XK_h,          togglehorizontalmax,    {0} },
	{ MODKEY|ControlMask|ShiftMask, XK_l,          togglehorizontalmax,    {0} },
	{ MODKEY|ControlMask|ShiftMask, XK_j,          toggleverticalmax,      {0} },
	{ MODKEY|ControlMask|ShiftMask, XK_k,          toggleverticalmax,      {0} },
	{ MODKEY|ControlMask,           XK_m,          togglemax,              {0} },
	#endif // MAXIMIZE_PATCH
	#if NO_MOD_BUTTONS_PATCH
	{ MODKEY|ShiftMask,             XK_Escape,     togglenomodbuttons,     {0} },
	#endif // NO_MOD_BUTTONS_PATCH
	#if SCRATCHPADS_PATCH
	{ MODKEY,                       XK_grave,      togglescratch,          {.ui = 0 } },
	{ MODKEY|ControlMask,           XK_grave,      setscratch,             {.ui = 0 } },
	{ MODKEY|ShiftMask,             XK_grave,      removescratch,          {.ui = 0 } },
	#endif // SCRATCHPADS_PATCH
	#if UNFLOATVISIBLE_PATCH
	{ MODKEY|Mod4Mask,              XK_space,      unfloatvisible,         {0} },
	{ MODKEY|ShiftMask,             XK_t,          unfloatvisible,         {.v = &layouts[0]} },
	#endif // UNFLOATVISIBLE_PATCH
	#if TOGGLEFULLSCREEN_PATCH
	{ MODKEY,                       XK_y,          togglefullscreen,       {0} },
	#endif // TOGGLEFULLSCREEN_PATCH
	#if !FAKEFULLSCREEN_PATCH && FAKEFULLSCREEN_CLIENT_PATCH
	{ MODKEY|ShiftMask,             XK_y,          togglefakefullscreen,   {0} },
	#endif // FAKEFULLSCREEN_CLIENT_PATCH
	#if FULLSCREEN_PATCH
	{ MODKEY|ShiftMask,             XK_f,          fullscreen,             {0} },
	#endif // FULLSCREEN_PATCH
	#if STICKY_PATCH
	{ MODKEY|ShiftMask,             XK_s,          togglesticky,           {0} },
	#endif // STICKY_PATCH
	#if SCRATCHPAD_ALT_1_PATCH
	{ MODKEY,                       XK_minus,      scratchpad_show,        {0} },
	{ MODKEY|ShiftMask,             XK_minus,      scratchpad_hide,        {0} },
	{ MODKEY,                       XK_equal,      scratchpad_remove,      {0} },
	#elif SCRATCHPADS_PATCH
	{ MODKEY,                       XK_0,          view,                   {.ui = ~SPTAGMASK } },
	{ MODKEY|ShiftMask,             XK_0,          tag,                    {.ui = ~SPTAGMASK } },
	#else
	{ MODKEY,                       XK_0,          view,                   {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,          tag,                    {.ui = ~0 } },
	#endif // SCRATCHPAD_ALT_1_PATCH
	{ MODKEY,                       XK_comma,      focusmon,               {.i = -1 } },
	{ MODKEY,                       XK_period,     focusmon,               {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,      tagmon,                 {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period,     tagmon,                 {.i = +1 } },
	#if FOCUSADJACENTTAG_PATCH
	{ MODKEY,                       XK_Left,       viewtoleft,             {0} }, // note keybinding conflict with focusdir
	{ MODKEY,                       XK_Right,      viewtoright,            {0} }, // note keybinding conflict with focusdir
	{ MODKEY|ShiftMask,             XK_Left,       tagtoleft,              {0} },
	{ MODKEY|ShiftMask,             XK_Right,      tagtoright,             {0} },
	{ MODKEY|ControlMask,           XK_Left,       tagandviewtoleft,       {0} },
	{ MODKEY|ControlMask,           XK_Right,      tagandviewtoright,      {0} },
	#endif // FOCUSADJACENTTAG_PATCH
	#if TAGALL_PATCH
	{ MODKEY|ShiftMask,             XK_F1,         tagall,                 {.v = "F1"} },
	{ MODKEY|ShiftMask,             XK_F2,         tagall,                 {.v = "F2"} },
	{ MODKEY|ShiftMask,             XK_F3,         tagall,                 {.v = "F3"} },
	{ MODKEY|ShiftMask,             XK_F4,         tagall,                 {.v = "F4"} },
	{ MODKEY|ShiftMask,             XK_F5,         tagall,                 {.v = "F5"} },
	{ MODKEY|ShiftMask,             XK_F6,         tagall,                 {.v = "F6"} },
	{ MODKEY|ShiftMask,             XK_F7,         tagall,                 {.v = "F7"} },
	{ MODKEY|ShiftMask,             XK_F8,         tagall,                 {.v = "F8"} },
	{ MODKEY|ShiftMask,             XK_F9,         tagall,                 {.v = "F9"} },
	{ MODKEY|ControlMask,           XK_F1,         tagall,                 {.v = "1"} },
	{ MODKEY|ControlMask,           XK_F2,         tagall,                 {.v = "2"} },
	{ MODKEY|ControlMask,           XK_F3,         tagall,                 {.v = "3"} },
	{ MODKEY|ControlMask,           XK_F4,         tagall,                 {.v = "4"} },
	{ MODKEY|ControlMask,           XK_F5,         tagall,                 {.v = "5"} },
	{ MODKEY|ControlMask,           XK_F6,         tagall,                 {.v = "6"} },
	{ MODKEY|ControlMask,           XK_F7,         tagall,                 {.v = "7"} },
	{ MODKEY|ControlMask,           XK_F8,         tagall,                 {.v = "8"} },
	{ MODKEY|ControlMask,           XK_F9,         tagall,                 {.v = "9"} },
	#endif // TAGALL_PATCH
	#if TAGALLMON_PATCH
	{ MODKEY|Mod4Mask|ShiftMask,    XK_comma,      tagallmon,              {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_period,     tagallmon,              {.i = -1 } },
	#endif // TAGALLMON_PATCH
	#if TAGSWAPMON_PATCH
	{ MODKEY|Mod4Mask|ControlMask,  XK_comma,      tagswapmon,             {.i = +1 } },
	{ MODKEY|Mod4Mask|ControlMask,  XK_period,     tagswapmon,             {.i = -1 } },
	#endif // TAGSWAPMON_PATCH
	#if BAR_ALTERNATIVE_TAGS_PATCH
	{ MODKEY,                       XK_n,          togglealttag,           {0} },
	#endif // BAR_ALTERNATIVE_TAGS_PATCH
	#if BAR_TAGGRID_PATCH
	{ MODKEY|ControlMask,           XK_Up,         switchtag,              { .ui = SWITCHTAG_UP    | SWITCHTAG_VIEW } },
	{ MODKEY|ControlMask,           XK_Down,       switchtag,              { .ui = SWITCHTAG_DOWN  | SWITCHTAG_VIEW } },
	{ MODKEY|ControlMask,           XK_Right,      switchtag,              { .ui = SWITCHTAG_RIGHT | SWITCHTAG_VIEW } },
	{ MODKEY|ControlMask,           XK_Left,       switchtag,              { .ui = SWITCHTAG_LEFT  | SWITCHTAG_VIEW } },
	{ MODKEY|Mod4Mask,              XK_Up,         switchtag,              { .ui = SWITCHTAG_UP    | SWITCHTAG_TAG | SWITCHTAG_VIEW } },
	{ MODKEY|Mod4Mask,              XK_Down,       switchtag,              { .ui = SWITCHTAG_DOWN  | SWITCHTAG_TAG | SWITCHTAG_VIEW } },
	{ MODKEY|Mod4Mask,              XK_Right,      switchtag,              { .ui = SWITCHTAG_RIGHT | SWITCHTAG_TAG | SWITCHTAG_VIEW } },
	{ MODKEY|Mod4Mask,              XK_Left,       switchtag,              { .ui = SWITCHTAG_LEFT  | SWITCHTAG_TAG | SWITCHTAG_VIEW } },
	#endif // BAR_TAGGRID_PATCH
	#if MOVEPLACE_PATCH
	{ MODKEY,                       XK_KP_7,       moveplace,              {.ui = WIN_NW }},   /* XK_KP_Home,  */
	{ MODKEY,                       XK_KP_8,       moveplace,              {.ui = WIN_N  }},   /* XK_KP_Up,    */
	{ MODKEY,                       XK_KP_9,       moveplace,              {.ui = WIN_NE }},   /* XK_KP_Prior, */
	{ MODKEY,                       XK_KP_4,       moveplace,              {.ui = WIN_W  }},   /* XK_KP_Left,  */
	{ MODKEY,                       XK_KP_5,       moveplace,              {.ui = WIN_C  }},   /* XK_KP_Begin, */
	{ MODKEY,                       XK_KP_6,       moveplace,              {.ui = WIN_E  }},   /* XK_KP_Right, */
	{ MODKEY,                       XK_KP_1,       moveplace,              {.ui = WIN_SW }},   /* XK_KP_End,   */
	{ MODKEY,                       XK_KP_2,       moveplace,              {.ui = WIN_S  }},   /* XK_KP_Down,  */
	{ MODKEY,                       XK_KP_3,       moveplace,              {.ui = WIN_SE }},   /* XK_KP_Next,  */
	#endif // MOVEPLACE_PATCH
	#if EXRESIZE_PATCH
	{ MODKEY,                       XK_KP_7,       explace,                {.ui = EX_NW }},   /* XK_KP_Home,  */
	{ MODKEY,                       XK_KP_8,       explace,                {.ui = EX_N  }},   /* XK_KP_Up,    */
	{ MODKEY,                       XK_KP_9,       explace,                {.ui = EX_NE }},   /* XK_KP_Prior, */
	{ MODKEY,                       XK_KP_4,       explace,                {.ui = EX_W  }},   /* XK_KP_Left,  */
	{ MODKEY,                       XK_KP_5,       explace,                {.ui = EX_C  }},   /* XK_KP_Begin, */
	{ MODKEY,                       XK_KP_6,       explace,                {.ui = EX_E  }},   /* XK_KP_Right, */
	{ MODKEY,                       XK_KP_1,       explace,                {.ui = EX_SW }},   /* XK_KP_End,   */
	{ MODKEY,                       XK_KP_2,       explace,                {.ui = EX_S  }},   /* XK_KP_Down,  */
	{ MODKEY,                       XK_KP_3,       explace,                {.ui = EX_SE }},   /* XK_KP_Next,  */

	{ MODKEY|ShiftMask,             XK_KP_8,       exresize,               {.v = (int []){   0,  25 }}},  /* XK_KP_Up,    */
	{ MODKEY|ShiftMask,             XK_KP_2,       exresize,               {.v = (int []){   0, -25 }}},  /* XK_KP_Down,  */
	{ MODKEY|ShiftMask,             XK_KP_6,       exresize,               {.v = (int []){  25,   0 }}},  /* XK_KP_Right, */
	{ MODKEY|ShiftMask,             XK_KP_4,       exresize,               {.v = (int []){ -25,   0 }}},  /* XK_KP_Left,  */
	{ MODKEY|ShiftMask,             XK_KP_5,       exresize,               {.v = (int []){  25,  25 }}},  /* XK_KP_Begin, */
	{ MODKEY|ShiftMask|ControlMask, XK_KP_5,       exresize,               {.v = (int []){ -25, -25 }}},  /* XK_KP_Begin, */

	{ MODKEY|ControlMask,           XK_KP_6,       togglehorizontalexpand, {.i = +1} },  /* XK_KP_Right, */
	{ MODKEY|ControlMask,           XK_KP_3,       togglehorizontalexpand, {.i =  0} },  /* XK_KP_Next,  */
	{ MODKEY|ControlMask,           XK_KP_4,       togglehorizontalexpand, {.i = -1} },  /* XK_KP_Left,  */
	{ MODKEY|ControlMask,           XK_KP_8,       toggleverticalexpand,   {.i = +1} },  /* XK_KP_Up,    */
	{ MODKEY|ControlMask,           XK_KP_1,       toggleverticalexpand,   {.i =  0} },  /* XK_KP_End,   */
	{ MODKEY|ControlMask,           XK_KP_2,       toggleverticalexpand,   {.i = -1} },  /* XK_KP_Down,  */
	{ MODKEY|ControlMask,           XK_KP_9,       togglemaximize,         {.i = -1} },  /* XK_KP_Prior, */
	{ MODKEY|ControlMask,           XK_KP_7,       togglemaximize,         {.i = +1} },  /* XK_KP_Home,  */
	{ MODKEY|ControlMask,           XK_KP_5,       togglemaximize,         {.i =  0} },  /* XK_KP_Begin, */
	#endif // EXRESIZE_PATCH
	#if FLOATPOS_PATCH
	/* Note that due to key limitations the below example kybindings are defined with a Mod3Mask,
	 * which is not always readily available. Refer to the patch wiki for more details. */
	/* Client position is limited to monitor window area */
	{ Mod3Mask,                     XK_u,            floatpos,               {.v = "-26x -26y" } }, // ↖
	{ Mod3Mask,                     XK_i,            floatpos,               {.v = "  0x -26y" } }, // ↑
	{ Mod3Mask,                     XK_o,            floatpos,               {.v = " 26x -26y" } }, // ↗
	{ Mod3Mask,                     XK_j,            floatpos,               {.v = "-26x   0y" } }, // ←
	{ Mod3Mask,                     XK_l,            floatpos,               {.v = " 26x   0y" } }, // →
	{ Mod3Mask,                     XK_m,            floatpos,               {.v = "-26x  26y" } }, // ↙
	{ Mod3Mask,                     XK_comma,        floatpos,               {.v = "  0x  26y" } }, // ↓
	{ Mod3Mask,                     XK_period,       floatpos,               {.v = " 26x  26y" } }, // ↘
	/* Absolute positioning (allows moving windows between monitors) */
	{ Mod3Mask|ControlMask,         XK_u,            floatpos,               {.v = "-26a -26a" } }, // ↖
	{ Mod3Mask|ControlMask,         XK_i,            floatpos,               {.v = "  0a -26a" } }, // ↑
	{ Mod3Mask|ControlMask,         XK_o,            floatpos,               {.v = " 26a -26a" } }, // ↗
	{ Mod3Mask|ControlMask,         XK_j,            floatpos,               {.v = "-26a   0a" } }, // ←
	{ Mod3Mask|ControlMask,         XK_l,            floatpos,               {.v = " 26a   0a" } }, // →
	{ Mod3Mask|ControlMask,         XK_m,            floatpos,               {.v = "-26a  26a" } }, // ↙
	{ Mod3Mask|ControlMask,         XK_comma,        floatpos,               {.v = "  0a  26a" } }, // ↓
	{ Mod3Mask|ControlMask,         XK_period,       floatpos,               {.v = " 26a  26a" } }, // ↘
	/* Resize client, client center position is fixed which means that client expands in all directions */
	{ Mod3Mask|ShiftMask,           XK_u,            floatpos,               {.v = "-26w -26h" } }, // ↖
	{ Mod3Mask|ShiftMask,           XK_i,            floatpos,               {.v = "  0w -26h" } }, // ↑
	{ Mod3Mask|ShiftMask,           XK_o,            floatpos,               {.v = " 26w -26h" } }, // ↗
	{ Mod3Mask|ShiftMask,           XK_j,            floatpos,               {.v = "-26w   0h" } }, // ←
	{ Mod3Mask|ShiftMask,           XK_k,            floatpos,               {.v = "800W 800H" } }, // ·
	{ Mod3Mask|ShiftMask,           XK_l,            floatpos,               {.v = " 26w   0h" } }, // →
	{ Mod3Mask|ShiftMask,           XK_m,            floatpos,               {.v = "-26w  26h" } }, // ↙
	{ Mod3Mask|ShiftMask,           XK_comma,        floatpos,               {.v = "  0w  26h" } }, // ↓
	{ Mod3Mask|ShiftMask,           XK_period,       floatpos,               {.v = " 26w  26h" } }, // ↘
	/* Client is positioned in a floating grid, movement is relative to client's current position */
	{ Mod3Mask|Mod1Mask,            XK_u,            floatpos,               {.v = "-1p -1p" } }, // ↖
	{ Mod3Mask|Mod1Mask,            XK_i,            floatpos,               {.v = " 0p -1p" } }, // ↑
	{ Mod3Mask|Mod1Mask,            XK_o,            floatpos,               {.v = " 1p -1p" } }, // ↗
	{ Mod3Mask|Mod1Mask,            XK_j,            floatpos,               {.v = "-1p  0p" } }, // ←
	{ Mod3Mask|Mod1Mask,            XK_k,            floatpos,               {.v = " 0p  0p" } }, // ·
	{ Mod3Mask|Mod1Mask,            XK_l,            floatpos,               {.v = " 1p  0p" } }, // →
	{ Mod3Mask|Mod1Mask,            XK_m,            floatpos,               {.v = "-1p  1p" } }, // ↙
	{ Mod3Mask|Mod1Mask,            XK_comma,        floatpos,               {.v = " 0p  1p" } }, // ↓
	{ Mod3Mask|Mod1Mask,            XK_period,       floatpos,               {.v = " 1p  1p" } }, // ↘
	#endif // FLOATPOS_PATCH
	#if SETBORDERPX_PATCH
	{ MODKEY|ControlMask,           XK_minus,      setborderpx,            {.i = -1 } },
	{ MODKEY|ControlMask,           XK_plus,       setborderpx,            {.i = +1 } },
	{ MODKEY|ControlMask,           XK_numbersign, setborderpx,            {.i = 0 } },
	#endif // SETBORDERPX_PATCH
	#if CYCLELAYOUTS_PATCH
	{ MODKEY,           XK_Tab,      cyclelayout,            {.i = -1 } },
	{ MODKEY|ShiftMask,           XK_Tab,     cyclelayout,            {.i = +1 } },
	#endif // CYCLELAYOUTS_PATCH
	#if MPDCONTROL_PATCH
	{ MODKEY,                       XK_F1,         mpdchange,              {.i = -1} },
	{ MODKEY,                       XK_F2,         mpdchange,              {.i = +1} },
	{ MODKEY,                       XK_Escape,     mpdcontrol,             {0} },
	#endif // MPDCONTROL_PATCH
	TAGKEYS(                        XK_1,                                  0)
	TAGKEYS(                        XK_2,                                  1)
	TAGKEYS(                        XK_3,                                  2)
	TAGKEYS(                        XK_4,                                  3)
	TAGKEYS(                        XK_5,                                  4)
	TAGKEYS(                        XK_6,                                  5)
	TAGKEYS(                        XK_7,                                  6)
	TAGKEYS(                        XK_8,                                  7)
	TAGKEYS(                        XK_9,                                  8)
};
