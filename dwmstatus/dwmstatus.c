/* trent wilson. originally by 20h. "dwmstatus"
 * very specific to my machine now, particularly where intel core temps are from
 * and the time/timezone. so mod as needed.
 * build:
 * 	- make
 * 	- make PREFIX=/usr install (with perms)
 * 	- add »dwmstatus 2>&1 >/dev/null &« to your .xinitrc
 * 	- make clean before reinstalling
 */

#define _BSD_SOURCE
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <strings.h>
#include <sys/time.h>
#include <time.h>
#include <sys/types.h>
#include <sys/wait.h>

#include <X11/Xlib.h>

char *tzpacific = "US/Pacific";

static Display *dpy;

char *
smprintf(char *fmt, ...)
{
	va_list fmtargs;
	char *ret;
	int len;

	va_start(fmtargs, fmt);
	len = vsnprintf(NULL, 0, fmt, fmtargs);
	va_end(fmtargs);

	ret = malloc(++len);
	if (ret == NULL) {
		perror("malloc");
		exit(1);
	}

	va_start(fmtargs, fmt);
	vsnprintf(ret, len, fmt, fmtargs);
	va_end(fmtargs);

	return ret;
}

void
settz(char *tzname)
{
	setenv("TZ", tzname, 1);
}

char *
mktimes(char *fmt, char *tzname)
{
	char buf[129];
	time_t tim;
	struct tm *timtm;

	settz(tzname);
	tim = time(NULL);
	timtm = localtime(&tim);
	if (timtm == NULL)
		return smprintf("");

	if (!strftime(buf, sizeof(buf)-1, fmt, timtm)) {
		fprintf(stderr, "strftime == 0\n");
		return smprintf("");
	}

	return smprintf("%s", buf);
}

void
setstatus(char *str)
{
	XStoreName(dpy, DefaultRootWindow(dpy), str);
	XSync(dpy, False);
}

char *
loadavg(void)
{
	double avgs[3];

	if (getloadavg(avgs, 3) < 0)
		return smprintf("");

	return smprintf("%.2f %.2f %.2f", avgs[0], avgs[1], avgs[2]);
}

char *
readfile(char *base, char *file)
{
	char *path, line[513];
	FILE *fd;

	memset(line, 0, sizeof(line));

	path = smprintf("%s/%s", base, file);
	fd = fopen(path, "r");
	free(path);
	if (fd == NULL)
		return NULL;

	if (fgets(line, sizeof(line)-1, fd) == NULL)
		return NULL;
	fclose(fd);

	return smprintf("%s", line);
}

char *
getbattery(char *base)
{
	char *co, status;
	int descap, remcap;

	descap = -1;
	remcap = -1;

	co = readfile(base, "present");
	if (co == NULL)
		return smprintf("");
	if (co[0] != '1') {
		free(co);
		return smprintf("not present");
	}
	free(co);

	co = readfile(base, "charge_full_design");
	if (co == NULL) {
		co = readfile(base, "energy_full_design");
		if (co == NULL)
			return smprintf("");
	}
	sscanf(co, "%d", &descap);
	free(co);

	co = readfile(base, "charge_now");
	if (co == NULL) {
		co = readfile(base, "energy_now");
		if (co == NULL)
			return smprintf("");
	}
	sscanf(co, "%d", &remcap);
	free(co);

	co = readfile(base, "status");
	if (!strncmp(co, "Discharging", 11)) {
		status = '-';
	} else if(!strncmp(co, "Charging", 8)) {
		status = '+';
	} else {
		status = '\0';
	}

	if (remcap < 0 || descap < 0)
		return smprintf("invalid");

	return smprintf("%.0f%%%c", ((float)remcap / (float)descap) * 100, status);
}

/* hacky fix until i want to follow the char* for everything convention */
int 
gettemperature()
{
	char *co;
	int t[3];
	int max = 0;

	co = readfile("/sys/devices/platform/coretemp.0/hwmon/hwmon6", "temp1_input");
	if (co == NULL)
		return '0';
	else
		t[0] = atoi(co) / 1000;
	free(co);
	
	co = readfile("/sys/devices/platform/coretemp.0/hwmon/hwmon6", "temp2_input");
	if (co == NULL)
		return '0';
	else
		t[1] = atoi(co) / 1000;
	free(co);

	co = readfile("/sys/devices/platform/coretemp.0/hwmon/hwmon6", "temp3_input");
	if (co == NULL)
		return '0';
	else
		t[2] = atoi(co) / 1000;
	free(co);


	for(int i = 0;  i < 3; i++){
		if(max < t[i])
			max = t[i];
	}
	return max;
}

int
main(void)
{
	char *status;
	char *avgs;
	char *bat;
	char *bat1;
	char *tmpacific;
	int t_max;

	if (!(dpy = XOpenDisplay(NULL))) {
		fprintf(stderr, "dwmstatus: cannot open display.\n");
		return 1;
	}

	for (;;sleep(5)) {
		avgs = loadavg();
		bat = getbattery("/sys/class/power_supply/BAT0");
		bat1 = getbattery("/sys/class/power_supply/BAT1");
		tmpacific = mktimes("%a %d %b %H:%M:%S %Z %Y", tzpacific);
		t_max = gettemperature();
		status = smprintf("T:%d°C L:%s B:%s|%s C:%s",
				t_max, avgs, bat, bat1, tmpacific);
		setstatus(status);

		free(avgs);
		free(bat);
		free(bat1);
		free(tmpacific);
		free(status);
	}

	XCloseDisplay(dpy);

	return 0;
}

