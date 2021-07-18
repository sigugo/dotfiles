# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

zstyle :compinstall filename '/home/thorsten/config/zsh/.zshrc'
autoload -Uz compinit
# compinit
HISTFILE=$ZDOTDIR/.zhistory
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_SAVE_NO_DUPS
setopt autocd extendedglob
unsetopt beep nomatch
bindkey -v
ZSH_SHARED_PLUGIN_DIR=/usr/share/zsh/plugins
ZVM_VI_EDITOR=nvim

## Key Bindings
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

## Plugins
source $ZSH_SHARED_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="underline"

source $ZSH_SHARED_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

_Z_DATA=$ZDOTDIR/.zdb
_Z_TILDE=1
_Z_CASE=smart

plugins=(bgnotify catimg git per-directory-history z)

## Oh My Zsh init
ZSH=/usr/share/oh-my-zsh
ZSH_THEME="../../zsh-theme-powerlevel10k/powerlevel10k"
ZSH_CACHE_DIR=$XDG_CACHE_HOME/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
$ZSH_CUSTOM
source $ZSH/oh-my-zsh.sh

## Load Aliases
source $HOME/.config/aliases

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
