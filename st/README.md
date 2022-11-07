FILE:  
run_st
nvim/init.vim

DESCRIPTION:  
who doesn't want to run their terminal in vim? its genius! and also there  
were so many patches for st that i realized recreated behavior that vi already  
had. pretty stoked about experimenting with this.  

term_init.vim:  
this is a barebones config with a couple special tweaks to make the vi windows  
used as terminals as unobtrusive and minimal as possible. the big note here  
is that delete gets you to it's normal mode mainly used for scroll and yank  
and clipboard support.  

config.h:  
this is the config to get st like how i want it. add details here.  

COREQUISITE:  
* st  
* nvim  
* dwm  

PATCHES:
st-no_bold_colors-20170623-b331da5.diff  
st-solarized-dark-0.8.5.diff  
st-anysize-20220718-baa9357.diff  

DEFAULT INSTALL LOCATION:  

INSTALL:  
cd /opt  
git clone git://git.suckless.org/st  
cd st  
sudo make clean install  
ln -sf /opt/configs/st/st_run /usr/local/bin/st_run  
ln -sf /opt/configs/st/term_init.vim ~/.config/nvim/term_init.vim  
(no config.h for st. its standard. minus patches.)
