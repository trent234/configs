## extended neovim notes on install, usage, and anything really.
for arch linux, install neovim from pacman.    

### make symlink from this repo dir to where the config needs to go so all configs can remain in one spot for easy edits and updates 
```
mkdir -p /home/${USER}/.config/nvim
ln -sf /home/${USER}/configs/init.vim /home/${USER}/.config/nvim/init.vim 
```

### install vim-plug (package manager):
```
curl -fLo /home/${USER}/.local/share/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Reload init.vim and :PlugInstall to install plugins that are in init.vim  

### language client/servers
servers- currently have json, go, c, and bash setup. c needs tlc.  
the client is coc which is in init.vim.  

servers needed for each language. json is installed at first opening of CocConfig.  
asks to do something along the lines of :CocInstall coc-json
yaml is installed in nvim with :CocInstall coc-yaml.  
see here for k8s yaml setup:  
https://octetz.com/docs/2020/2020-01-06-vim-k8s-yaml-support/  
go is gopls and installed via yarn / installed when vim-go in installed
see here for details on that:
https://octetz.com/docs/2019/2019-04-24-vim-as-a-go-ide/  
the c server is still WIP . npm? rein in all the package managers? no.   
see here for a good place to start to add new lang servers:  
https://github.com/neoclide/coc.nvim/wiki/Language-servers#bash

need go for vim-go plugin. note some required go envs set in .zshrc
delve install steps before plugin install? any? add here.

to apply the theme set in the init.vim run :AirlineTheme solarized

### usage notes based on things i've needed to use. a favs list  

### vim general usage notes  
ctrl+w plus directional letter to move between windows
: + Tab will give command options

### vim-go usage notes  
add the config stuff for the go lang server. see init.vim section.  
for instance ctrl+space to start the dropdown. and gd for godoc.  

:cc # 		where # is the number of the error in the quickfix window  
:cclose 	closes the quickfix window  
:GoDoc 		goes to documentation close with :q!  
:pc 		closes the preview window (this used to be auto but i didn't like that)  
		This is the window that pops up when you hover over code a  
		completion recommendation.  
**docs and full command list**  
https://github.com/fatih/vim-go/blob/master/doc/vim-go.txt

### delve(go debugger) usage notes cheatsheet
**docs and full command list**  
https://github.com/sebdah/vim-delve

### fugitive usage notes
:Git + git command

### to use the markdown plugin
:MarkdownPreview  
the file must have the .md file extension  

### other sources & inspiration
most everything has probably changed since i read this article.  
https://tpaschalis.github.io/vim-go-setup/       

### st notes
looking for a urxvt replacement because its font issues are frustrating
so i found whats probably the only more frustrating terminal to configure
lets do it!


gdm needs config someplace add notes. although gdm is probs temporary.
coc.nvim is doing something weird with its config folder. fix that. find
root cause.



