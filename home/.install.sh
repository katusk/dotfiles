#!/bin/bash -ex
# wget -nc -P ~ https://raw.githubusercontent.com/katusk/dotfiles/master/home/.install.sh

# Tries to pull repo $2, clones it from $1 otherwise
function git_pull_or_clone {
    if(! (cd $2 && git pull)); then git clone $1 $2; fi
}

# Advise installing $i binary
function advise_install {
    for i in "$@"; do
        if ! type $i &> /dev/null; then echo "# $i should be installed"; fi
    done
}

# Install homeshick, my dotfiles, tmux plugin manager, and do a bit more
git_pull_or_clone git@github.com:andsens/homeshick.git ~/.homesick/repos/homeshick
git_pull_or_clone git@github.com:katusk/dotfiles.git ~/.homesick/repos/dotfiles
git_pull_or_clone git@github.com:tmux-plugins/tpm.git ~/.tmux/plugins/tpm
mkdir -p ~/.vim/undodir
if type pip &> /dev/null; then
    pip install --user flake8 jedi ropevim || echo "*** Errors occurred during pip install ***"
else
    echo "*** Skipping pip installs as pip is not found ***"
fi

# Set up environment
~/.homesick/repos/homeshick/bin/homeshick link
vim +PlugUpgrade +PlugInstall +qall || echo "*** Errors occurred during vim plugin install ***" # +PlugUpdate +PlugClean
~/.tmux/plugins/tpm/bin/install_plugins # ~/.tmux/plugins/tpm/bin/update_plugins all

# Reminders
set +x
echo "*** Do not forget the following ***"
advise_install ctags cmake xsel
echo ". ~/.bashrc"
