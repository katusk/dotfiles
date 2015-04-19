#!/bin/bash -ex
# wget -nc -P $HOME https://raw.githubusercontent.com/katusk/dotfiles/master/home/.setupmyhome.sh

# Tries to pull repo $2, clones it from $1 otherwise
function git_pull_or_clone {
    if(! (cd $2 && git pull)); then git clone $1 $2; fi
}

# Install homeshick, my dotfiles, vundle, and mc skin
git_pull_or_clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
git_pull_or_clone git://github.com/katusk/dotfiles.git $HOME/.homesick/repos/dotfiles
git_pull_or_clone git://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
wget -nc -P $HOME/.mc/colors https://raw.githubusercontent.com/iwfmp/mc-solarized-skin/master/solarized.ini

# Reminders
set +x
echo "*** Do not forget the following ***"
echo "source $HOME/.bashrc"
echo "homeshick link"
echo "vim +BundleInstall +qall"
echo "lynx http://ethanschoonover.com/solarized"
