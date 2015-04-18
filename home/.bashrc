# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
set -o vi

alias homeshick="$HOME/.homesick/repos/homeshick/bin/homeshick"

export EDITOR=vi
export HISTSIZE=8192
export CLICOLOR=1
export PATH=$PATH:$HOME/.local/bin:$HOME/bin
export MC_SKIN=$HOME/.mc/colors/solarized.ini

