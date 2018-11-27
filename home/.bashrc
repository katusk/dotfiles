# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific environment, startup programs, aliases, functions etc.
set -o vi
shopt -s histappend

function tmux_list_vi_binds {
    tmux -f $1 start\; new -d\; lsk\; lsk -t vi-copy\; \
    lsk -t vi-edit\; lsk -t vi-choice\; kill-session | less
}

alias homeshick="~/.homesick/repos/homeshick/bin/homeshick"
alias dotfiles="cd ~/.homesick/repos/dotfiles/home"
alias tmux-current-vi-binds="tmux_list_vi_binds ~/.tmux.conf"
alias tmux-default-vi-binds="tmux_list_vi_binds /dev/null"

alias la='ls --color=auto -A'
alias ll='ls --color=auto -l'
alias lla='ls --color=auto -la'
alias l1='ls --color=auto -1'
alias l1a='ls --color=auto -1A'
alias grepc='grep --color=always'
alias lessc='less -R'

export PS1='[\u@\h \W]\$ '
export EDITOR=vim
export CLICOLOR=1

export HISTSIZE=8192
export HISTFILESIZE=65536
export HISTCONTROL=$HISTCONTROL:ignoredups

export PATH=`echo $PATH|sed -e 's/:\/cygdrive\/[^:]*//g'`:~/.local/bin:~/bin
export MC_SKIN=~/.config/mc/colors/solarized.ini
export LYNX_LSS=~/.lynx.lss

if type dircolors &> /dev/null; then eval `dircolors ~/.dircolors`; fi
