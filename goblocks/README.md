FILE:  
goblocks.json  
xss_monitor.sh

DESCRIPTION:  
goblocks.json is the config file for the project hosted here:  
https://github.com/Stargarth/Goblocks  
xss_monitor.sh is the script to get the status of the DPMS   

COREQUISITE:  
* go to build
* dwm for the status bar that goblocks will populate

DEFAULT INSTALL LOCATION:  
/home/trent/.config/goblocks.json

INSTALL:  
follow goblocks install instructions  
ln -sf /opt/configs/goblocks.json /home/trent/.config/goblocks.json  
sudo ln -sf /opt/configs/xss_monitor.sh /usr/local/bin/xss_monitor.sh
.xinitrc has the necessary call to run goblocks at startup

TO DO:  
add battery monitor. use dwm's default c program for inspo.
