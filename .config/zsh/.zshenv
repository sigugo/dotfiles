#!/bin/zsh

###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################


source $HOME/.profile

export TERM='rxvt-256color'
export DOTFILES="$HOME/src/dotfiles.git"

# [ -f $DOTFILES/install_config ] && source $DOTFILES/install_config

# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$XDG_CONFIG_HOME/local/share
export XDG_CACHE_HOME=$XDG_CONFIG_HOME/cache

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

# other software
export TMUXP_CONFIGDIR="$XDG_CONFIG_HOME/tmuxp"
export I3_CONFIG="$XDG_CONFIG_HOME/i3"
export VIMCONFIG="$XDG_CONFIG_HOME/nvim"
# export SCREENSHOT="$HOME/Documents/images/screenshots"

# fzf
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# X11
# export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"

# golang
export GOPATH="$HOME/go"
export GOBIN="$HOME/go/bin"
export GOCACHE="$XDG_CACHE_HOME/go-build"

