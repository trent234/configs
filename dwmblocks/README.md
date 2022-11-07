FILE:  
blocks.h

DESCRIPTION:  
blocks.h is the config file. simpler than goblocks and no need for go deps.  
most of the scripts are from here-
https://github.com/LukeSmithxyz/voidrice/.local/bin/statusbar
the only script i did myself that seemed to be missin & was important was  
to check for free disk space (running on 64gb total here so its important..)

COREQUISITE:  
* dwm for the status bar that dwmblocks will populate

DEFAULT INSTALL LOCATION:  

INSTALL:  
find and install dwmblocks
ln -sf /opt/configs/blocks.h /opt/dwmblocks/config.h
cd /opt/dwmblocks
sudo make install
.xinitrc has the necessary call to run goblocks at startup

