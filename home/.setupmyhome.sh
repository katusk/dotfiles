#!/bin/bash -ex
# wget -nc -P ~ https://raw.githubusercontent.com/katusk/dotfiles/master/home/.setupmyhome.sh

# Tries to pull repo $2, clones it from $1 otherwise
function git_pull_or_clone {
    if(! (cd $2 && git pull)); then git clone $1 $2; fi
}

# Install homeshick, my dotfiles, vim plugin manager, etc.
git_pull_or_clone git://github.com/andsens/homeshick.git ~/.homesick/repos/homeshick
git_pull_or_clone git://github.com/katusk/dotfiles.git ~/.homesick/repos/dotfiles
git_pull_or_clone git://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
wget -nc -P ~/.vim/autoload https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
wget -nc -P ~/.config/mc/colors https://raw.githubusercontent.com/iwfmp/mc-solarized-skin/master/solarized.ini
[ -e ~/.lynx.lss  ] ||
    wget -nc -O ~/.lynx.lss https://raw.githubusercontent.com/willnorris/dotfiles/master/lynx.lss
mkdir -p ~/.mintty/themes && [ -e ~/.mintty/themes/solarized-dark.minttyrc  ] ||
    wget -nc -O ~/.mintty/themes/solarized-dark.minttyrc https://raw.githubusercontent.com/mavnn/mintty-colors-solarized/master/.minttyrc.dark
[ -e ~/.dircolors  ] ||
    wget -nc -O ~/.dircolors https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark
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
