export CONFMAN=$HOME/src/configurations
export DOTFILES=$CONFMAN/dotfiles.git
export KBPATH=$HOME/Documents/notes/brain

export EDITOR="nvim"
export VISUAL="nvim"
export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE="10000"
export HISTFILESIZE="10000"
export HISTTIMEFORMAT="%y-%m-%d.%T"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"
source $XDG_CONFIG_HOME/user-dirs.dirs

export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0"
export WINEPREFIX=$XDG_CONFIG_HOME/wine

export TMUX_CONFIG_HOME="$XDG_CONFIG_HOME/tmux"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export CARGO_HOME="$XDG_CONFIG_HOME/cargo"
export RUSTBIN="$CARGO_HOME/bin"
export RUSTUP_HOME="$XDG_CONFIG_HOME/rustup"

export GOPROXY="https://proxy.golang.org,direct"
export GOPATH="$HOME/src/go"
export GOPATHBIN="$GOPATH/bin"
export GOBIN="$HOME/bin/go"
export GOCACHE="$XDG_CACHE_HOME/go-build"

export RANGER_LOAD_DEFAULT_RC=false
export IDEA_JDK=/usr/lib/jvm/jdk-jetbrains

export PACMAN_OPTIONS=""
export LSD_OPTIONS=""

export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/config.toml
export STARSHIP_CACHE=$XDG_CACHE_HOME/starship

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$XDG_CONFIG_HOME/local/lib"


export DEBUGINFOD_URLS="https://debuginfod.elfutils.org/"


export PATH=$PATH:$HOME/bin:$HOME/.config/bin:$HOME/.local/bin:$HOME/.config/local/bin:$GOBIN:$GOPATHBIN:$RUSTBIN

source $XDG_CONFIG_HOME/aliases
source $XDG_CONFIG_HOME/secrets
