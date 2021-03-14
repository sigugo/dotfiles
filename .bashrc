# ~/.bashrc

shopt -s autocd

## If not running interactively, don't do anything
[[ $- != *i* ]] && return


## Environment variables 
export LS_OPTIONS='--color=auto --group-directories-first'
export PACMAN_OPTIONS='--color=auto'
eval "`dircolors`"

## aliases
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
alias lspp='ls++ --potsf'
alias yay='yay $PACMAN_OPTIONS'
alias pacman='pacman $PACMAN_OPTIONS'
alias update='yay -Syu'
alias ccat='highlight --out-format=ansi'
alias emacs='emacs -nw'
alias sshinsecure='ssh -oKexAlgorithms=+diffie-hellman-group1-sha1'

### helpers
alias tstamp='date +%Y%m%d%H%M%S'

### git sync for dotfiles and todo
alias config='/usr/bin/git --git-dir=$DOTFILES --work-tree=$HOME'
alias config-commit='config add -u && config commit -m "Quick Commit $(date +%Y-%m-%d.%H:%M:%S)"'
alias config-push='config push -u origin'
alias tasks='nvim ~/todo.md'
alias todo='/usr/bin/git --git-dir=$HOME/.todo/ --work-tree=$HOME'
alias update-todo='todo add todo.md && todo commit -m "Update $(date +%Y-%m-%d.%H:%M:%S)" && todo push -u origin'

### manage wine
alias wineprocs='ps auxwww | egrep -iE "wine|\.exe" | grep -v grep'
alias wineprocids='wineprocs | tr -s " " | cut -d" " -f 2'
alias winekill='wineprocids | xargs kill -9 2>&1 > /dev/null || echo "No wine processes found"'
alias wineterm='wineprocids | xargs kill -15 2>&1 > /dev/null || echo "No wine processes found"'

### youtube
alias yt='youtube-dl --add-metadata -ic'
alias yta='youtube-dl --add-metadata -icc'
alias ytv='youtube-viewer'

### work
alias tssh='/usr/bin/ssh-keygen -R localhost && /usr/bin/ssh -oStrictHostKeyChecking=no kace_support@localhost'
alias trssh='/usr/bin/ssh-keygen -R localhost && /usr/bin/ssh -oStrictHostKeyChecking=no root@localhost'
alias readdocs='ranger $HOME/Documents/Text/Manuals'
alias iamgroot='cat $HOME/Documents/notes/kace/KnowHow/iamgroot.txt'
#alias iamgroot='cat $XDG_DOCUMENTS_DIR/notes/kace/KnowHow/iamgroot.txt'

### games
alias jorbs='/usr/bin/streamlink https://twitch.tv/joinrbs best'

## prompt
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u\[\033[01;37m\]@\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

unset color_prompt force_color_prompt

## exercism autocomplete
# if [ -f ~/.config/exercism/exercism_completion.bash ]; then
#       source ~/.config/exercism/exercism_completion.bash
# fi

bind 'set show-all-if-ambiguous on'
## bind 'TAB:menu-complete'

