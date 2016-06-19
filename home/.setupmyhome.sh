#!/bin/bash -ex
# wget -nc -P ~ https://raw.githubusercontent.com/katusk/dotfiles/master/home/.setupmyhome.sh

# Tries to pull repo $2, clones it from $1 otherwise
function git_pull_or_clone {
    if(! (cd $2 && git pull)); then git clone $1 $2; fi
}

# Fetch $1 to directory $2 saved as $3
function wget_to_as {
    mkdir -p $2 && [ -e $2/$3 ] || wget -nc -O $2/$3 $1
}

# Install homeshick, my dotfiles, vim plugin manager, etc.
git_pull_or_clone git://github.com/andsens/homeshick.git ~/.homesick/repos/homeshick
git_pull_or_clone git://github.com/katusk/dotfiles.git ~/.homesick/repos/dotfiles
git_pull_or_clone git://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
wget -nc -P ~/.vim/autoload https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
wget -nc -P ~/.config/mc/colors https://raw.githubusercontent.com/iwfmp/mc-solarized-skin/master/solarized.ini
wget_to_as https://raw.githubusercontent.com/willnorris/dotfiles/master/lynx.lss ~ .lynx.lss
wget_to_as https://raw.githubusercontent.com/mavnn/mintty-colors-solarized/master/.minttyrc.dark ~/.mintty/themes solarized-dark.minttyrc &&
    sed -i -e 's/CursorColour=    220,  50,  47/CursorColour=    147, 161, 161/g' ~/.mintty/themes/solarized-dark.minttyrc
wget_to_as https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark ~ .dircolors
mkdir -p ~/.vim/undodir

# Set up environment
~/.homesick/repos/homeshick/bin/homeshick link
vim +PlugUpgrade +PlugUpdate +qall
~/.tmux/plugins/tpm/bin/install_plugins
~/.tmux/plugins/tpm/bin/update_plugins all

# Reminders
set +x
echo "*** Do not forget the following ***"
if [ ! -x `type -p xsel` ]; then echo "# xsel might be needed to be installed"; fi
echo ". ~/.bashrc"
echo "lynx http://ethanschoonover.com/solarized"
