FILE:  
dwmstatus.c

DESCRIPTION:  
this is a c program to generate the taskbar info. its only been tested on my  
lenovo x260 so far and i'm sure its not flexible enough for all systems  
currently. that is WIP. changed from the original to just take max cpu temp.  
removed some sections, changed time to PST with seconds, updated update interval.  


COREQUISITE:  
* be sure to install gcc and the xlibs potentially. and xorg/x11 of course.

DEFAULT INSTALL LOCATION:  
/opt/dwmstatus/dwmstatus.c  

INSTALL: 
cd /opt  
git clone git://git.suckless.org/dwmstatus  
cd dwmstatus  
ln -sf /opt/configs/dwmstatus/dwmstatus.c ./  
make  
make PREFIX=/usr install (with perms)  
add »dwmstatus 2>&1 >/dev/null &« to your .xinitrc  
make clean before reinstalling  

