# configs
config hub useful for getting personalization asap on new systems

# neovim 
## install:
```
wget https://github.com/neovim/neovim/releases/download/v0.4.4/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /home/vagrant/.local/bin/nvim
```

### set nvim config:
make symlink from this repo dir to where the config needs to go so all configs can remain in one spot for easy edits 
```
mkdir -p /home/${USER}/.config/nvim
ln -s /home/${USER}/configs/init.vim /home/${USER}/.config/nvim/init.vim 
```

## install vim-plug (package manager):
```
curl -fLo /home/${USER}/.local/share/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Reload init.vim and :PlugInstall to install plugins that are in init.vim

### vim-go sources and inspiration 
https://tpaschalis.github.io/vim-go-setup/       




# go
## this is the debugger. a prereq for one of the plugins in nvim above.
```
go get github.com/go-delve/delve/cmd/dlv
```
### go delve(debugger) cheatsheet
https://github.com/sebdah/vim-delve

### vim-go usage notes  
:cc # 		where # is the number of the error in the quickfix window  
:cclose 	closes the quickfix window  
:pc 		closes the preview window (this used to be auto but i didn't like that)  
:GoDoc 		goes to documentation close with :q!

ctrl+W plus directional letters to move between windows
 

