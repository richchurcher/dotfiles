dotfiles
========

From scratch:

`git clone --recursive https://github.com/richchurcher/dotfiles.git`
`ln -s dotfiles/.vimrc .vimrc`
`ln -s dotfiles/.vim .vim`

Adding submodules:

`git submodule add https://github.com/author/submodule.git`

Note also:

`mv dotfiles/* dotfiles/.[^.]* .`
