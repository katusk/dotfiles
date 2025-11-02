#!/bin/bash -ex

# Fetch $1 to directory $2 saved as $3
function wget_to_as {
    mkdir -p $2 && [ -e $2/$3 ] || wget -nc -O $2/$3 $1
}

# Fetch vendored scripts
wget -nc -P ~/.homesick/repos/dotfiles/home/.vim/autoload https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
wget -nc -P ~/.homesick/repos/dotfiles/home/.config/mc/colors https://raw.githubusercontent.com/iwfmp/mc-solarized-skin/master/solarized.ini
wget_to_as https://raw.githubusercontent.com/willnorris/dotfiles/refs/heads/main/config/lynx/lynx.lss ~/.homesick/repos/dotfiles/home .lynx.lss
wget_to_as https://raw.githubusercontent.com/mavnn/mintty-colors-solarized/master/.minttyrc.dark ~/.homesick/repos/dotfiles/home/.mintty/themes solarized-dark.minttyrc &&
    sed -i -e 's/CursorColour=    220,  50,  47/CursorColour=    147, 161, 161/g' ~/.homesick/repos/dotfiles/home/.mintty/themes/solarized-dark.minttyrc
wget_to_as https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark ~/.homesick/repos/dotfiles/home .dircolors
