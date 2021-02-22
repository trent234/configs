FILE:  
config.h  

DESCRIPTION:  
this is the config for dwm, a window manager by suckless that needs to be  
compiled to incorporate configs. i used i3 for a couple years before this so  
that influences some of the keybindings of which many have changed from their  
defaults. i've added many comments to outline what each keybinding does.  
other than that in addition to dmenu shortcut, i've added clipmenu shortcut  
that works in the same manner as dmenu. and i've changed the color scheme  
to jive with my overall solarized asthetic.  

COREQUISITE:  
* dmenu is a shortcut. install dmenu before using that.  
* clipmenu is a shortcut. install clipmenu before using that.  
* clipmenu wrapper script required. see clipmenu_run elsewhere in this repo.  

DEFAULT INSTALL LOCATION:  
/opt/dwm-6.2/config.h   

INSTALL:  
cd /opt  
git clone git://git.suckless.org/dwm  
cd dwm  
ln -sf /opt/configs/dwm/config.h ./  
make clean install  

