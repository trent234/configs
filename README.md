# configs/scripts
config hub useful for getting personalization & workflow asap on new arch installs

### list of configs and purpose
* xorg -> the x11 server configuration needed to start my wm of choice and statusbar and set initial configs.   
* dwm -> the window manager  
* dwmblocks -> the window manager status bar  
* grub -> boot manager  
* zsh -> the shell  
* st -> the terminal emulator (launches a vim terminal emulator)
* nvim -> the text editor  
* clipmenu -> configs to converge clipboards throughout the system and make it usable and convenient.  
* misc_scripts are one-offs that don't deserve a folder, but they are useful shortcuts  

#### TODO:  
* fix udev monitor swap. not done with that.  
* would be great to fix fonts. all emoji from one, all others from another, and also include patched powerline fonts so all vim-airline characters render. 

## font notes
st will crash without emoji. do this:  
download font here:  
https://fonts.google.com/noto/specimen/Noto+Color+Emoji  
sudo cp /usr/share/fonts/truetype  
fc-cache -f -v  
validate with:  
fc-list | grep Emoji  
more on this in the st readme but watch out for the font2 patch. 
Read the diff and see the array. dl powerline etc and add like above.  
