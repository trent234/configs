FILE:  
.xinitrc  
.Xresources  
vconsole.conf  

DESCRIPTION:   
.xinitrc file is run by startx along with whatever plumbing xorg needs to start the  
x server. this is my opportunity to set configs for x. a lot of this is defaults.  

.Xresources is one of the files pulled in by .xinitrc (this is default behavior    
and not added to .xinitrc by me. .Xresources sets the solarized theme for terminals.   

vconsole.conf sets a huge font for the virtual console that we see on login.  
its normally way to tiny, so this will fix that.  
in the future, find or dev a dm that runs as close to this process but with a FE  

Clean up this dir. I added an .xprofile copy for use with ubuntus desktop manager.  
Consolidate changes  

COREQUISITE:  
* dwm and dwmstatus are run from .xinitrc. the expectation is that running startx  
  will start a WM/DE and for me its dwm. be sure its installed before running  
  startx otherwise startx will instantly return and things will seem broken.  
* note that i don't use a desktop manager (DM) and so the login will be from the  
  tty and you have to run startx yourself (add that to .xinitrc if you so wish).  

DEFAULT INSTALL LOCATION:  
/home/trent/.xinitrc  
/home/trent/.Xresources  

INSTALL:  
ln -sf /opt/configs/xorg/.xinitrc /home/trent/.xinitrc  
ln -sf /opt/configs/xorg/.Xresources /home/trent/.Xresources  
ln -sf /opt/configs/xorg/vconsole.conf /etc/vconsole.conf  

