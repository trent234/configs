# trent wilson
# prereqs:
# install zsh, fzf needed for zsh-interactive-cd
# install custom plugins listed below starting with PLUGIN

# PLUGIN git-prompt / vi-mode
# sets prompt has nice git functionality and vi mode indicator lumped in
# https://github.com/woefe/git-prompt.zsh 
# and wget https://raw.githubusercontent.com/woefe/vi-mode.zsh/master/vi-mode.zsh
source ~/.zsh/git-prompt.zsh/vi-mode.zsh
source ~/.zsh/git-prompt.zsh/git-prompt.zsh
source ~/.zsh/git-prompt.zsh/examples/wprompt.zsh

# PLUGIN zsh-system-clipboard
# https://github.com/kutsan/zsh-system-clipboard 
source ~/.zsh/zsh-system-clipboard/zsh-system-clipboard.zsh
ZSH_SYSTEM_CLIPBOARD_METHOD=xsc

# PLUGIN zsh-autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"

# PLUGIN zsh-interactive-cd
# https://github.com/changyuheng/zsh-interactive-cd
source ~/.zsh/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh

# PLUGIN fast-syntax-highlighting
# https://github.com/zdharma/F-Sy-H
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# User configuration
# some inspo from 
# https://callstack.com/blog/supercharge-your-terminal-with-zsh/
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
#setopt share_history # share history between different instances of the shell

setopt correct_all # autocorrect commands
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match

# generic env variables
export PATH=~/.local/bin:~/.local/bin/statusbar:$PATH
EDITOR='nvim'
TOMCAT_HOME="/home/trent/repos/ao/docker-compose/deploy/legacy/tomcat"

alias vi="/opt/trent/nvim-linux64/bin/nvim"
alias "git-log"="git log --graph --decorate --pretty=oneline --abbrev-commit"
alias ls="ls -shal"

# arrow scroll through suggestions per
# https://github.com/zsh-users/zsh-autosuggestions/issues/303
# zle defs here- https://github.com/zsh-users/zsh/blob/master/Functions/Zle/up-line-or-beginning-search
# how can i mod this and incorporate it into vi-mode so vi up goes through
# but doesn't move cursor. THEN it already has "forward-word" widget to 
# partially accept it until i want to diverge...

# Cycle through history based on characters already typed on the line
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "$key[Up]" up-line-or-beginning-search
bindkey "$key[Down]" down-line-or-beginning-search

# autocompletion 
#zstyle ':completion:*' completer _expand _complete _ignored _approximate
#zstyle ':completion:*' format 'Completing %d'
#zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**'
#zstyle ':completion:*' use-compctl false
#zstyle :compinstall filename '/home/trent/.zshrc'
#autoload -Uz compinit

export ACTON_SSH_USER=trent.wilson
export ACTON_SSH_ID_FILE=/home/trent/.ssh/id_rsa
export ACTON_ANSIBLE_INVENTORY=/home/trent/repos/ao/ansible-inventory

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
