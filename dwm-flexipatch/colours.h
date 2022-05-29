static char c000000[]                    = "#000000"; // placeholder value

static char normfgcolor[]                = "#EBDBB2";
static char normbgcolor[]                = "#1D2021";
static char normbordercolor[]            = "#1D2021";
static char normfloatcolor[]             = "#FBF1C7";

static char selfgcolor[]                 = "#F9F5D7";
static char selbgcolor[]                 = "#1D2021";
static char selbordercolor[]             = "#D5C4A1";
static char selfloatcolor[]              = "#D3869B";

static char titlenormfgcolor[]           = "#7C6F64";
static char titlenormbgcolor[]           = "#1D2021";
static char titlenormbordercolor[]       = "#1D2021";
static char titlenormfloatcolor[]        = "#FBF1C7";

static char titleselfgcolor[]            = "#EBDBB2";
static char titleselbgcolor[]            = "#3c3836";
static char titleselbordercolor[]        = "#d79921";
static char titleselfloatcolor[]         = "#D3869B";

static char tagsnormfgcolor[]            = "#7C6F64";
static char tagsnormbgcolor[]            = "#1D2021";
static char tagsnormbordercolor[]        = "#d79921";
static char tagsnormfloatcolor[]         = "#1d2021";

static char tagsselfgcolor[]             = "#32302F";
static char tagsselbgcolor[]             = "#B8BB26";
static char tagsselbordercolor[]         = "#896C9A";
static char tagsselfloatcolor[]          = "#1d2021";

static char hidnormfgcolor[]             = "#cc241d";
static char hidselfgcolor[]              = "#cc241d";
static char hidnormbgcolor[]             = "#282828";
static char hidselbgcolor[]              = "#282828";

static char urgfgcolor[]                 = "#bbbbbb";
static char urgbgcolor[]                 = "#222222";
static char urgbordercolor[]             = "#ff0000";
static char urgfloatcolor[]              = "#db8fd9";

#include "gruvbox.h"

static char *colors[][ColCount] = {
	/*                       fg                bg                border                float */
	[SchemeNorm]         = { light1,      dark0_hard,      light4,      gray_245 },
	[SchemeSel]          = { light0_hard,       dark0_hard,       bright_aqua,       bright_green },

	[SchemeTitleNorm]    = { light1, dark0_hard, light4, gray_245 },
	[SchemeTitleSel]     = { bright_green,  dark0,  bright_aqua,  bright_green },

	[SchemeTagsNorm]     = { gray_245,  dark0_hard,  light4,  gray_245 },
	[SchemeTagsSel]      = { gray_245,   dark0,   bright_aqua,   bright_green },

	[SchemeHidNorm]      = { hidnormfgcolor,   hidnormbgcolor,   c000000,              c000000 },
	[SchemeHidSel]       = { hidselfgcolor,    hidselbgcolor,    c000000,              c000000 },

	[SchemeUrg]          = { light1,       bright_red,       bright_red,       bright_red },

	#if BAR_FLEXWINTITLE_PATCH
	[SchemeFlexActTTB]   = { titleselfgcolor,  actTTBbgcolor,    actTTBbgcolor,        c000000 },
	[SchemeFlexActLTR]   = { titleselfgcolor,  actLTRbgcolor,    actLTRbgcolor,        c000000 },
	[SchemeFlexActMONO]  = { titleselfgcolor,  actMONObgcolor,   actMONObgcolor,       c000000 },
	[SchemeFlexActGRID]  = { titleselfgcolor,  actGRIDbgcolor,   actGRIDbgcolor,       c000000 },
	[SchemeFlexActGRD1]  = { titleselfgcolor,  actGRD1bgcolor,   actGRD1bgcolor,       c000000 },
	[SchemeFlexActGRD2]  = { titleselfgcolor,  actGRD2bgcolor,   actGRD2bgcolor,       c000000 },
	[SchemeFlexActGRDM]  = { titleselfgcolor,  actGRDMbgcolor,   actGRDMbgcolor,       c000000 },
	[SchemeFlexActHGRD]  = { titleselfgcolor,  actHGRDbgcolor,   actHGRDbgcolor,       c000000 },
	[SchemeFlexActDWDL]  = { titleselfgcolor,  actDWDLbgcolor,   actDWDLbgcolor,       c000000 },
	[SchemeFlexActSPRL]  = { titleselfgcolor,  actSPRLbgcolor,   actSPRLbgcolor,       c000000 },
	[SchemeFlexActFloat] = { titleselfgcolor,  actfloatbgcolor,  actfloatbgcolor,      c000000 },
	[SchemeFlexInaTTB]   = { titlenormfgcolor, normTTBbgcolor,   normTTBbgcolor,       c000000 },
	[SchemeFlexInaLTR]   = { titlenormfgcolor, normLTRbgcolor,   normLTRbgcolor,       c000000 },
	[SchemeFlexInaMONO]  = { titlenormfgcolor, normMONObgcolor,  normMONObgcolor,      c000000 },
	[SchemeFlexInaGRID]  = { titlenormfgcolor, normGRIDbgcolor,  normGRIDbgcolor,      c000000 },
	[SchemeFlexInaGRD1]  = { titlenormfgcolor, normGRD1bgcolor,  normGRD1bgcolor,      c000000 },
	[SchemeFlexInaGRD2]  = { titlenormfgcolor, normGRD2bgcolor,  normGRD2bgcolor,      c000000 },
	[SchemeFlexInaGRDM]  = { titlenormfgcolor, normGRDMbgcolor,  normGRDMbgcolor,      c000000 },
	[SchemeFlexInaHGRD]  = { titlenormfgcolor, normHGRDbgcolor,  normHGRDbgcolor,      c000000 },
	[SchemeFlexInaDWDL]  = { titlenormfgcolor, normDWDLbgcolor,  normDWDLbgcolor,      c000000 },
	[SchemeFlexInaSPRL]  = { titlenormfgcolor, normSPRLbgcolor,  normSPRLbgcolor,      c000000 },
	[SchemeFlexInaFloat] = { titlenormfgcolor, normfloatbgcolor, normfloatbgcolor,     c000000 },
	[SchemeFlexSelTTB]   = { titleselfgcolor,  selTTBbgcolor,    selTTBbgcolor,        c000000 },
	[SchemeFlexSelLTR]   = { titleselfgcolor,  selLTRbgcolor,    selLTRbgcolor,        c000000 },
	[SchemeFlexSelMONO]  = { titleselfgcolor,  selMONObgcolor,   selMONObgcolor,       c000000 },
	[SchemeFlexSelGRID]  = { titleselfgcolor,  selGRIDbgcolor,   selGRIDbgcolor,       c000000 },
	[SchemeFlexSelGRD1]  = { titleselfgcolor,  selGRD1bgcolor,   selGRD1bgcolor,       c000000 },
	[SchemeFlexSelGRD2]  = { titleselfgcolor,  selGRD2bgcolor,   selGRD2bgcolor,       c000000 },
	[SchemeFlexSelGRDM]  = { titleselfgcolor,  selGRDMbgcolor,   selGRDMbgcolor,       c000000 },
	[SchemeFlexSelHGRD]  = { titleselfgcolor,  selHGRDbgcolor,   selHGRDbgcolor,       c000000 },
	[SchemeFlexSelDWDL]  = { titleselfgcolor,  selDWDLbgcolor,   selDWDLbgcolor,       c000000 },
	[SchemeFlexSelSPRL]  = { titleselfgcolor,  selSPRLbgcolor,   selSPRLbgcolor,       c000000 },
	[SchemeFlexSelFloat] = { titleselfgcolor,  selfloatbgcolor,  selfloatbgcolor,      c000000 },
	#endif // BAR_FLEXWINTITLE_PATCH
};
