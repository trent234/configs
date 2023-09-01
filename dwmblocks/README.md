FILE:  
blocks.h

DESCRIPTION:  
blocks.h is the config file. simpler than goblocks and no need for go deps.  
most of the scripts are from here-
https://github.com/LukeSmithxyz/voidrice/.local/bin/statusbar
the only script i did myself that seemed to be missing & was important was  
to check for free disk space (running on 64gb total here so its important..)  
Although I've tweaked them all so adding a dir here to save changes...  
They need some pc specific changes for things like disk drive name to watch size.  

COREQUISITE:  
* dwm for the status bar that dwmblocks will populate

DEFAULT INSTALL LOCATION:  

INSTALL:  
clone dwmblocks  
ln -sf /opt/configs/blocks.h /opt/dwmblocks/config.h  
ln -sf /home/trent/repos/configs/dwmblocks/sb-df /home/trent/.local/bin/sb-df  
cd /opt/dwmblocks  
sudo make install  
.xinitrc has the necessary call to run dwmblocks at startup  
test by simply running:  
dwmblocks  
and update scripts on the fly to test their changes.  
