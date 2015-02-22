dotfiles
========

From scratch:

    git clone --recursive https://github.com/richchurcher/dotfiles.git
    ln -s dotfiles/.vimrc .vimrc
	ln -s dotfiles/.nvimrc .nvimrc
    ln -s dotfiles/.vim .vim
	ln -s dotfiles/.vim .nvim

In Vim:

    :PlugInstall

Possibly:

	ln -s ~/dotfiles/Preferences.sublime-settings ~/.config/sublime-text-3/Preferences/User/Preferences.sublime-settings
	ln -s ~/dotfiles/Default.sublime-keymap ~/.config/sublime-text-3/Preferences/User/Default.sublime-keymap

Note also:

    mv dotfiles/* dotfiles/.[^.]* .
