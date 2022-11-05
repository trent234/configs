FILE:  
init.vim  
coc-settings.json

DESCRIPTION:  
init.vim is the neovim config.  
coc-settings.json specifies info about the language server the lang client is  
looking for.  

COREQUISITE:  
* node(npm) and yarn required for coc and markdown preview
* install vim-plug first then follow directions to install plugins to fulfill  
  the plugin dependencies.  
* language server needed for coc.nvim languange CLIENT for each lang.  
* lots of things integrated, read the config file to see.. e.g. go specific stuff.  

DEFAULT INSTALL LOCATION:  
/home/trent/.config/nvim/init.vim  

INSTALL:  
sudo pacman -S neovim  
ln -sf /opt/configs/init.nvim /home/trent/.config/nvim/init.vim  
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \  
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'  
:PlugInstall  
see airline theme for directions to set the solarized theme (thats already  
configured) just need to run the command one time to set it.  
nvim:  
  * :CocInstall coc-pyright  

TO DO:  
learn and set up language servers further  
go is setup, bash too. c langs is tbd & complicated. python tbd.  

FAVS:  
  * gd = go to docs for that function  
  * gh = go hover for docs for that function  

