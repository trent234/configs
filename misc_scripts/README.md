DESCRIPTION:  
screenshot.sh: uses scrot to take a screen, name it, and drop it in a specified dir  
screensaver_toggle.sh: toggles whether the screensaver timer is active  

COREQUISTES:  
screenshot.sh: scrot  
screensaver_toggle.sh: none really, but goblocks and xss_monitor.sh are relevant  

DEFAULT INSTALL LOCATION:  
/usr/local/bin/SCRIPT

INSTALL:  
sudo chmod u+x SCRIPT  
sudo ln -sf /opt/configs/misc_scripts/SCRIPT /usr/local/bin/SCRIPT
