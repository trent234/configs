# trent wilson
# prereqs:
# install zsh, chsh, fzf is needed for zsh-interactive-cd
# install plugins via github. see next section below
# install bash-completion.. maybe? or does bashcompinit take care of it?
# install completion functions for special progs
### in bottom section-
# go needed for go envs to be useful, java, maven, pyenv tweaks too.

# sets prompt. has nice git functionality and vi mode indicator lumped in
# git clone https://github.com/woefe/git-prompt.zsh 
# wget https://raw.githubusercontent.com/woefe/vi-mode.zsh/master/vi-mode.zsh
source ~/.zsh/git-prompt.zsh/vi-mode.zsh
source ~/.zsh/git-prompt.zsh/git-prompt.zsh
source ~/.zsh/git-prompt.zsh/examples/wprompt.zsh

source ~/.zsh/zsh-interactive-cd/zsh-interactive-cd.plugin.zsh
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

# fpath = user defined function path expanded to include addtl completion funcs 
# docker: https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/zsh/_docker
# docker-compose: https://raw.githubusercontent.com/docker/compose/1.29.2/contrib/completion/zsh/_docker-compose
fpath=(~/.zsh/completion $fpath)

# history file improvements. some inspo from 
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

# zsh-autosuggestions (predictive, past cursor) settings
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"
# autosuggestions history on scroll
# see https://github.com/zsh-users/zsh-autosuggestions/issues/594 for source of 
# below solution code
zle-line-init() {}
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# tab autocompletion 
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' use-compctl false
zstyle :compinstall filename '/home/trent/.zshrc'
autoload -Uz +X compinit && compinit
autoload -Uz +X bashcompinit && bashcompinit
_comp_options+=(globdots) # Include hidden files.

################ more program specific mods below

# autocompletion for terraform
complete -o nospace -C /usr/local/bin/terraform terraform

# go env variables
GOPATH=$HOME/go
GOBIN=$GOPATH/bin

# maven@3.5 is keg-only, which means it was not symlinked into /opt/homebrew,
# because this is an alternate version of another formula.
MAVEN_PATH="/opt/homebrew/opt/maven@3.5/bin:$PATH"

# env variables
PATH=$MAVEN_PATH:$GOBIN:$HOME/bin:/usr/local/bin:$HOME/.pyenv/bin:$PATH
EDITOR='nvim'
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

alias vi="nvim"
alias ls="ls -shal"

# for pyenv aka pick your python version
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"

