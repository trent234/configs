# trent wilson
# prereqs:
# install zsh, chsh, oh my zsh, fzf needed for zsh-interactive-cd
# install custom plugins
# 	- fast-syntax-highlighting
# 	- zsh-autosuggestions
# 	- vi/git addon see below
# go needed for go envs to be useful
# pyenv line below requires pyenv

# Path to your oh-my-zsh installation.
export ZSH="/home/trent/.oh-my-zsh"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(	 
#		vi-mode
		zsh-interactive-cd
		fast-syntax-highlighting
		zsh-autosuggestions
#		git-prompt
		gitfast
	)

# is ohmyzsh pointless if i'm getting most my plugins from gh anyway? refactor
source $ZSH/oh-my-zsh.sh
# sets prompt has nice git functionality and vi mode indicator lumped in
# https://github.com/woefe/git-prompt.zsh 
# and wget https://raw.githubusercontent.com/woefe/vi-mode.zsh/master/vi-mode.zsh
# ..beautiful..
source ~/.zsh/git-prompt.zsh/vi-mode.zsh
source ~/.zsh/git-prompt.zsh/git-prompt.zsh
source ~/.zsh/git-prompt.zsh/examples/wprompt.zsh

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

# prompt. color on, hostname , pwd, color off, if sudo # else $
# disabled to make way for git prompt
#PS1='%F{blue}%m %1/%f%(!.#.$) '

# go env variables
GOPATH=$HOME/go
GOBIN=$GOPATH/bin

# generic env variables
PATH=$GOBIN:$HOME/bin:/usr/local/bin:$HOME/.pyenv/bin:$PATH
EDITOR='nvim'

alias vi="nvim"

# for pyenv aka pick your python version
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# vi-mode settings
# superseeded by woefe git prompt above
#VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
#VI_MODE_SET_CURSOR=true
#MODE_INDICATOR="%F{magenta}[NORMAL]%f"

# zsh-autosuggestions settings
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3"

# arrow scroll through suggestions per
# https://github.com/zsh-users/zsh-autosuggestions/issues/303
# it doesn't work exactly like i want. will auto accept and go to eol. (fyi)
if [[ "${terminfo[kcuu1]}" != "" ]]; then
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi

if [[ "${terminfo[kcud1]}" != "" ]]; then
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# autocompletion 
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' use-compctl false
zstyle :compinstall filename '/home/trent/.zshrc'
autoload -Uz compinit
compinit

# autocompletion for terraform
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
