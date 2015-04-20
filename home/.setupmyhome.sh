#!/bin/bash -ex
# wget -nc -P ~ https://raw.githubusercontent.com/katusk/dotfiles/master/home/.setupmyhome.sh

# Tries to pull repo $2, clones it from $1 otherwise
function git_pull_or_clone {
    if(! (cd $2 && git pull)); then git clone $1 $2; fi
}

# Install homeshick, my dotfiles, vundle, mc skin, and lynx colors
git_pull_or_clone git://github.com/andsens/homeshick.git ~/.homesick/repos/homeshick
git_pull_or_clone git://github.com/katusk/dotfiles.git ~/.homesick/repos/dotfiles
git_pull_or_clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
wget -nc -P ~/.mc/colors https://raw.githubusercontent.com/iwfmp/mc-solarized-skin/master/solarized.ini
wget -nc -P ~ https://raw.githubusercontent.com/willnorris/dotfiles/master/lynx/.lynx.lss

# Reminders
set +x
echo "*** Do not forget the following ***"
echo ". ~/.bashrc"
echo "homeshick link"
echo "vim +BundleInstall +qall"
echo "lynx http://ethanschoonover.com/solarized"
