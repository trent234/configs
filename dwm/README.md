FILE:  
config.h  
(mod needed to drw.c for emoji see below)

DESCRIPTION:  
this is the config for dwm, a window manager by suckless that needs to be  
compiled to incorporate configs. the keybindings are chosen by symetry not 
what a letter might stand for. it is also designed for a corne-like kb layout.
i've added many comments to outline what each keybinding does.  
other than that in addition to dmenu shortcut, i've added clipmenu shortcut  
that works in the same manner as dmenu. the terminal shortcut is now urxvt.
and i've changed the color scheme to jive with my overall solarized asthetic.  

COREQUISITE:  
* dmenu is a shortcut. install dmenu before using that.  
* clipmenu is a shortcut. install clipmenu before using that.  
* clipmenu wrapper script required. see clipmenu_run elsewhere in this repo.  
* urxvt is the terminal shortcut.
* goblocks is the statusbar. it uses emoji (icons) and that font set i've since
	put in the config, so those 2 fonts are coreqs now. also, there is a bug
	need to delete some code out of drw.c see link below for more info.
	if the bug still exists, you will need a downstream libxft-bgra from the
	AUR. yes lots of hassle for my fancy google noto weather icons...
	https://www.youtube.com/watch?v=0QkByBugq_4

DEFAULT INSTALL LOCATION:  
/opt/dwm-6.2/config.h   

TODO:
install patch to have are-you-sure popup on dwm exit.

INSTALL:  
cd /opt  
git clone git://git.suckless.org/dwm  
cd dwm  
ln -sf /opt/configs/dwm/config.h ./  
sudo make clean install  

