FILE:  

DESCRIPTION:   
This is WIP notes. installing this power manager for quick fix for power needs.  
sudo pacman -S xfce4-power-manager  
/etc/systemd/system/xfce4-power-manager.service  

find out why it refuses to conform with tiling and always launches in float mode?  

COREQUISITE:  

DEFAULT INSTALL LOCATION:  
/etc/systemd/system/xfce4-power-manager.service  

INSTALL:  
sudo ln -sf /opt/configs/xfce4-power-manager/pwr-cfg /usr/local/bin/pwr-cfg   
enable/start the service  

