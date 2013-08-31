#!/bin/bash -ex

# Install homeshick, my dotfiles, and vundle
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
git clone git://github.com/katusk/dotfiles.git $HOME/.homesick/repos/dotfiles
git clone git://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

# Reminders
set +x; echo "Do not forget the following:"
echo "-- Run this: alias homeshick=\"$HOME/.homesick/repos/homeshick/home/.homeshick\""
echo "-- Put the homeshick alias into your bashrc"
echo "-- Symlink your homes by running \"homeshick link\""
echo "-- Install vim bundles (use :BundleInstall in vim)"

