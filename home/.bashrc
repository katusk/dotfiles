# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific environment, startup programs, aliases, and functions
set -o vi

alias homeshick="~/.homesick/repos/homeshick/bin/homeshick"
alias la='ls --color=auto -la'

export EDITOR=vim
export HISTSIZE=8192
export CLICOLOR=1
export PATH=$PATH:~/.local/bin:~/bin
export MC_SKIN=~/.mc/colors/solarized.ini
export LYNX_LSS=~/.lynx.lss
