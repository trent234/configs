FILE:  
clipmenu_run.sh

DESCRIPTION:  
this is a bash script wrapper for clipmenu. needed because dwm wont accept  
setting the env variable in its config. see how dwm handles dmenu. that was the  
inspiration for this. 

COREQUISITE:  
* clipmenu
* dwm

DEFAULT INSTALL LOCATION:  
/usr/local/bin/clipmenu_run.sh  

INSTALL:  
sudo pacman -S clipmenu  
systemctl --user enable clipmenud  
put <<Environment=CM_DIR=%h/.cache/>> in /usr/lib/systemd/user/clipmenud.service  
systemctl --user start clipmenud  

there is still a bug. so this needs a little playing with to ensure  
the service is running well. tinker and test until clipmenu works like you expect.

then make the symlink-  
ln -sf /opt/configs/clipmenu_run/clipmeu_run.sh /usr/local/bin/clipmenu_run.sh  

and then the dwm keyboard shortut will call clipmenu as expected  

NOTES:  
other clip comments until i find a better place:  
init.vim has the required stuff to link vi clipboard and system.  
goal is to have clipboard convergence. zsh also has vi plugin for vi like  
usage and yy copies to clipboard too. as i find more sources, i will add them  
so everything is converged.. but i might be good now.  

