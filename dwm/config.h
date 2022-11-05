/* trent wilson
 * config for dwm 
 * See LICENSE file for copyright and license details. 
 */

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "DejaVu Sans Mono:size=24",
					"Noto Color Emoji:size=22" };
static const char dmenufont[]       = "DejaVu Sans Mono:size=24";
static const char col_gray1[]       = "#002b36";
static const char col_gray2[]       = "#073642";
static const char col_gray3[]       = "#586e75";
static const char col_gray4[]       = "#eee8d5";
static const char col_violet[]      = "#6c71c4";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_gray2, col_violet  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5"};

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
static const float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "t",      tile },    /* first entry is default */
	{ "x",      NULL },    /* no layout function means floating behavior */
	{ "f",      monocle },
};

/* key definitions */
#define MODKEY Mod1Mask

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_violet, "-sf", col_gray4, NULL };
static const char *clipmenucmd[] = { "clipmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_violet, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "/opt/configs/st/run_st", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	/********************************************************************/

	/* launch dmenu */
	{ MODKEY,                       XK_space,  spawn,          {.v = dmenucmd } },
	/* launch clipmenu */
	{ MODKEY,                       XK_Tab,    spawn,          {.v = clipmenucmd } },
	/* launch terminal */
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },

	/* focus down */
	{ MODKEY,                       XK_l,      focusstack,     {.i = +1 } },
	/* move vertical seperator left */
	{ MODKEY,                       XK_j,      setmfact,       {.f = -0.05} },
	/* move vertical seperator right */
	{ MODKEY,                       XK_k,      setmfact,       {.f = +0.05} },
	/* increase amount of windows on left side */
	{ MODKEY,                       XK_d,      incnmaster,     {.i = +1 } },
	/* decrease amount of windows on left side */
	{ MODKEY,                       XK_f,      incnmaster,     {.i = -1 } },
	/* move window left. if already left, move down?  */
	{ MODKEY,                       XK_s,      zoom,           {0} },
	/* switch to fullscreen  */
	{ MODKEY,                       XK_g,      setlayout,      {.v = &layouts[2]} },
	/* switch to tile mode  */
	{ MODKEY,                       XK_h,      setlayout,      {.v = &layouts[0]} },
	/* switch to floating mode  */
	{ MODKEY,                       XK_n,      setlayout,      {.v = &layouts[1]} },
        /* hide topbar */
        { MODKEY,                       XK_b,      togglebar,      {0} },
	/* kill targeted window  */
	{ MODKEY|ShiftMask,             XK_q,      killclient,     {0} },
	/* quit dwm  */
	{ MODKEY|ShiftMask,             XK_e,      quit,           {0} },

        /* view desktop */
	{ MODKEY,                       XK_p,      view,           {.ui = 1 << 0 } }, 
	{ MODKEY,                       XK_o,      view,           {.ui = 1 << 1 } }, 
	{ MODKEY,                       XK_i,      view,           {.ui = 1 << 2 } }, 
	{ MODKEY,                       XK_u,      view,           {.ui = 1 << 3 } }, 
	{ MODKEY,                       XK_y,      view,           {.ui = 1 << 4 } }, 
        /* throw to desktop */
	{ MODKEY,                       XK_q,      tag,            {.ui = 1 << 0 } }, 
	{ MODKEY,                       XK_w,      tag,            {.ui = 1 << 1 } }, 
	{ MODKEY,                       XK_e,      tag,            {.ui = 1 << 2 } }, 
	{ MODKEY,                       XK_r,      tag,            {.ui = 1 << 3 } }, 
	{ MODKEY,                       XK_t,      tag,            {.ui = 1 << 4 } }, 
        /* multi monitor */
        { MODKEY,                       XK_apostrophe, focusmon,   {.i = +1 } },
        { MODKEY,                       XK_a, tagmon,              {.i = +1 } },

};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
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
