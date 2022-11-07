//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"",	"sb-nettraf",	1,	16},
	{"",	"sb-cpu",	10,	18}, 
	{"",    "sb-memory",	10,	14}, 
 	{"",    "sb-df",	30,		0},
	{"",	"sb-internet",	5,	4},
	{"",	"sb-battery",	5,	3},
	{"",	"sb-clock",	60,	1},
/*
	{"",	"sb-volume",	0,	10},
	{"",	"sb-pacpackages",	0,	8}, 
	{"",	"sb-torrent",	20,	7},  
	{"",	"sb-doppler",	0,	13},
	{"",	"sb-forecast",	18000,	5},
	{"",	"sb-help-icon",	0,	15},
*/
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
