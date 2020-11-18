# configs
config hub useful for getting personalization asap on new systems

# neovim 
### prereqs (additional software that plugins support)
####git  
you probably want to get it from your package manager  
https://github.com/git/git  
####go  
https://github.com/golang/go  
####delve  
go get github.com/go-delve/delve/cmd/dlv  
https://github.com/go-delve/delve  

### install:
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

### install vim-plug (package manager):
```
curl -fLo /home/${USER}/.local/share/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Reload init.vim and :PlugInstall to install plugins that are in init.vim  

# usage notes

### vim general usage notes  
ctrl+w plus directional letter to move between windows
: + Tab will give command options

### vim-go usage notes  
:cc # 		where # is the number of the error in the quickfix window  
:cclose 	closes the quickfix window  
:GoDoc 		goes to documentation close with :q!
:pc 		closes the preview window (this used to be auto but i didn't like that)  
		This is the window that pops up when you hover over code a
		completion recommendation.
#### docs and full command list
https://github.com/fatih/vim-go/blob/master/doc/vim-go.txt

### delve(go debugger) usage notes cheatsheet
#### docs and full command list
https://github.com/sebdah/vim-delve

### fugitive usage notes
:Git + git command


### sources & inspiration
https://tpaschalis.github.io/vim-go-setup/       


