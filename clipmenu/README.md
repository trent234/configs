FILE:  
clipmenu_run

DESCRIPTION:  
this is a bash script wrapper for clipmenu. needed because dwm wont accept  
setting the env variable in its config. see how dwm handles dmenu. that was the  
inspiration for this. 

COREQUISITE:  
* clipmenu
* dwm

DEFAULT INSTALL LOCATION:  
/usr/local/bin/clipmenu_run  

INSTALL:  
sudo pacman -S clipmenu  
(below is purposely not sudo)  
systemctl --user enable clipmenud  
put <<Environment=CM_DIR=%h/.cache/>> in /usr/lib/systemd/user/clipmenud.service  
systemctl --user daemon-reload  
systemctl --user start clipmenud  
mkdir -p ~/.cache/clipmenu.6.trent  
touch ~/.cache/clipmenu.6.trent/line_cache  

there is still a bug. so this needs a little playing with to ensure  
the service is running well. tinker and test until clipmenu works like you expect.  

then make the symlink-  
sudo ln -sf /opt/configs/clipmenu/clipmeu_run /usr/local/bin/clipmenu_run  

and then the dwm keyboard shortut will call clipmenu as expected  

NOTES:  
other clip comments until i find a better place:  
init.vim has the required stuff to link vi clipboard and system.  
goal is to have clipboard convergence. zsh also has vi plugin for vi like  
usage and yy copies to clipboard too. as i find more sources, i will add them  
so everything is converged.. but i might be good now.  

update- get vi mode in zsh terminal to have its yanks sent to the copybuff  
also get a paste keyboard shortcut so we don't have to use mouse right click?  
and if we do do right click paste or any click for that matter in vi term mode  
it pulls us into a different mode... normal mode? disable that.. or change it  
somehow because pastes in with mouse are clunky  

also, look into $DISPLAY and how it needs to be loaded before clipmenud to run  
i futzed with it and got it going but didn't identify exactly the fix.  
in short-  

"For those using a systemd unit and not using a desktop environment which does  
it automatically, you must import $DISPLAY so that clipmenud knows which X server  
to use. For example, in your ~/.xinitrc do this prior to launching clipmenud:"

systemctl --user import-environment DISPLAY  
