source $HOME/.profile

autoload -Uz compinit && compinit

zstyle :compinstall filename

zmodload -i zsh/complist
zstyle ':completion:*' menu select

# compinit
## HISTFILE=$ZDOTDIR/.zhistory
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_SAVE_NO_DUPS
setopt autocd extendedglob
unsetopt beep nomatch
bindkey -v

#ZSH_SHARED_PLUGIN_DIR=/usr/share/zsh/plugins
# ZVM_VI_EDITOR=nvim

## Key Bindings
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

## Plugins

eval "$(starship init zsh)"
