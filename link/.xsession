#!/bin/bash
[ -f ~/.dotfiles/link/.Xdefaults ] && xrdb -merge ~/.dotfiles/link/.Xdefaults
exec i3
