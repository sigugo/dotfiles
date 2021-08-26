export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"
source $XDG_CONFIG_HOME/user-dirs.dirs

export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0"
export WINEPREFIX=$XDG_CONFIG_HOME/wine

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export DOTFILES=$HOME/src/dotfiles.git
export EDITOR="nvim"
export VISUAL="nvim"
export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE="10000"
export HISTFILESIZE="10000"
export HISTTIMEFORMAT="%y-%m-%d.%T"


export GOPATH="$HOME/go"
export GOBIN="$HOME/go/bin"
export GOCACHE="$XDG_CACHE_HOME/go-build"


export RANGER_LOAD_DEFAULT_RC=false
export IDEA_JDK=/usr/lib/jvm/jdk-jetbrains

export PACMAN_OPTIONS=""
export LSD_OPTIONS=""


export PATH=$HOME/bin:$HOME/.config/local/bin:$HOME/.emacs.d/bin:$GOBIN:$PATH
