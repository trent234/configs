FILE:  
config.h  
(mod needed to drw.c for emoji see below)

DESCRIPTION:  
this is the config for dwm, a window manager by suckless that needs to be  
compiled to incorporate configs. i used i3 for a couple years before this so  
that influences some of the keybindings of which many have changed from their  
defaults. i've added many comments to outline what each keybinding does.  
other than that in addition to dmenu shortcut, i've added clipmenu shortcut  
that works in the same manner as dmenu. the terminal shortcut is now termite.
and i've changed the color scheme to jive with my overall solarized asthetic.  

COREQUISITE:  
* dmenu is a shortcut. install dmenu before using that.  
* clipmenu is a shortcut. install clipmenu before using that.  
* clipmenu wrapper script required. see clipmenu_run elsewhere in this repo.  
* termite is the terminal shortcut.
* goblocks is the statusbar. it uses emoji (icons) and that font set i've since
	put in the config, so those 2 fonts are coreqs now. also, there is a bug
	need to delete some code out of drw.c see link below for more info.
	if the bug still exists, you will need a downstream libxft-bgra from the
	AUR. yes lots of hassle for my fancy google noto weather icons...

DEFAULT INSTALL LOCATION:  
/opt/dwm-6.2/config.h   

INSTALL:  
cd /opt  
git clone git://git.suckless.org/dwm  
cd dwm  
ln -sf /opt/configs/dwm/config.h ./  
make clean install  

