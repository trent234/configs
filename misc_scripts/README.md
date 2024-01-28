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

MISC

for wireguard-
sudo pacman -S wireguard-tools
...download config
nmcli connection import type wireguard file wg0.conf
and bam its in nmtui
go edit your connections and pick what autoconnects.
see dwmblocks for monitoring that its active
