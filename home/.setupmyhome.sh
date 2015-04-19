#!/bin/bash -ex

# Tries to pull repo $2, clones it from $1 otherwise
function git_pull_or_clone {
    if(! (cd $2 && git pull)); then git clone $1 $2; fi
}

# Install homeshick, my dotfiles, vundle, and mc skin
git_pull_or_clone git://github.com/katusk/dotfiles.git $HOME/.homesick/repos/dotfiles
git_pull_or_clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
git_pull_or_clone git://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
wget -nc -P $HOME/.mc/colors https://raw.github.com/iwfmp/mc-solarized-skin/master/solarized.ini

# Reminders
set +x
echo "Do not forget the following:"
echo "-- alias homeshick=\"$HOME/.homesick/repos/homeshick/bin/homeshick\""
echo "-- Symlink your homes by running \"homeshick link\""
echo "-- Install vim bundles by running :BundleInstall in vim"
echo "-- Set up your colors; see http://ethanschoonover.com/solarized"
