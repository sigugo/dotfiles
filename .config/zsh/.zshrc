source $HOME/.profile
fpath=($ZDOTDIR/.zfunc $fpath)

HISTFILE=$ZDOTDIR/.zhistory
HISTSIZE=10000
SAVEHIST=10000

autoload -Uz compinit && compinit
zstyle :compinstall filename
zmodload -i zsh/complist
zstyle ':completion:*' menu select

setopt HIST_SAVE_NO_DUPS
setopt autocd extendedglob
unsetopt beep nomatch

bindkey -v

bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

eval "$(starship init zsh)"
