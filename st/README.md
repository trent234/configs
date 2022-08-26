FILE:  
run_st
nvim/init.vim

DESCRIPTION:  
who doesn't want to run their terminal in vim? its genius! and also there 
were so many patches for st that i realized recreated behavior that vi already
had. pretty stoked about experimenting with this.

run_st:
setting a environment variable for st as a one liner and setting that in dwm
doesn't work when setting the termcmd. So the next best thing is to have this
little two line scrip that sets the var. note that the init.vim will then 
reset the var for more normal vim usage.

nvim/init.vim:
this is a barebones config with a couple special tweaks to make the vi windows
used as terminals as unobtrusive and minimal as possible. the big note here
is that delete gets you to normal mode.

config.h:
this is the config to get st like how i want it. add details here.

COREQUISITE:  
* st
* nvim

PATCHES:
st-no_bold_colors-20170623-b331da5.diff
st-solarized-dark-0.8.5.diff
st-anysize-20220718-baa9357.diff
:

DEFAULT INSTALL LOCATION:  

INSTALL:  
cd /opt  
git clone git://git.suckless.org/st
cd st 
ln -sf /opt/configs/st/config.h ./  
sudo make clean install  
chmod u+x run_st

