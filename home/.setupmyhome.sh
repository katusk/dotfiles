#!/bin/bash -ex
# wget -nc -P ~ https://raw.githubusercontent.com/katusk/dotfiles/master/home/.setupmyhome.sh

# Tries to pull repo $2, clones it from $1 otherwise
function git_pull_or_clone {
    if(! (cd $2 && git pull)); then git clone $1 $2; fi
}

# Install homeshick, my dotfiles, vundle, etc.
git_pull_or_clone git://github.com/andsens/homeshick.git ~/.homesick/repos/homeshick
git_pull_or_clone git://github.com/katusk/dotfiles.git ~/.homesick/repos/dotfiles
git_pull_or_clone git://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git_pull_or_clone git://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
wget -nc -P ~/.mc/colors https://raw.githubusercontent.com/iwfmp/mc-solarized-skin/master/solarized.ini
wget -nc -P ~ https://raw.githubusercontent.com/willnorris/dotfiles/master/lynx/.lynx.lss
mkdir -p ~/.vim/undodir

# Set up environment
~/.homesick/repos/homeshick/bin/homeshick link
vim +PluginInstall +qall
tmux start \; new -d \;                                       \
    run "~/.tmux/plugins/tpm/scripts/install_plugins.sh"   \; \
    run "~/.tmux/plugins/tpm/scripts/update_plugin.sh all" \; \
    kill-session

# Reminders
set +x
echo "*** Do not forget the following ***"
if [ ! -x `type -p xsel` ]; then echo "# xsel might be needed to be installed"; fi
echo ". ~/.bashrc"
echo "lynx http://ethanschoonover.com/solarized"
