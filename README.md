dotfiles
========

From scratch:

`git clone --recursive git@github.com:basie/dotfiles.git`

Backup, then:

`mv dotfiles/* dotfiles/.[^.]* .`

This will overwrite .git, .gitmodules, .gitignore, .vimrc, .vim, .bashrc. Adding submodules:

`git submodule add git://github.com/foo/bar.git .vim/bundle/bar`
