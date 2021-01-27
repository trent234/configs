# configs
config hub useful for getting personalization asap on new systems  
this is simply my preferred setup  
corequisites for each file listed at the top of each file (software thats expected to be installed because its being configured)  
suggested symlink location also listed at the top of each file for "installing"  

### list of configs and purpose
config.h -> the config file for dwm- the window manager i use.  
init.vim -> the config file for neovim- the text editor i use- and its plugins.  
.xinitrc -> the config for Xorg initialization. this takes the place of a display manager. login is through tty and running startx.  
.Xresources -> the config for Xorg and urxvt visual customizations and plugins.  
.zshrc -> the config for zsh- the shell i use- and its plugins.  

### the scripts folder holds scripts that are essential in making the working environment work correctly
clipmenu_run -> called by dwm via config.h - part of the clipboard functionality.  
