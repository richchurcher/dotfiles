dotfiles
========

From scratch:

    git clone --recursive https://github.com/richchurcher/dotfiles.git
    ln -s dotfiles/.vimrc .vimrc
    ln -s dotfiles/.vim .vim

Possibly:

	ln -s ~/dotfiles/Preferences.sublime-settings ~/.config/sublime-text-3/Preferences/User/Preferences.sublime-settings
	ln -s ~/dotfiles/Default.sublime-keymap ~/.config/sublime-text-3/Preferences/User/Default.sublime-keymap

Adding submodules:

    git submodule add https://github.com/author/submodule.git

Note also:

    mv dotfiles/* dotfiles/.[^.]* .
