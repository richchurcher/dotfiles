#!/bin/bash
[ -f ~/dotfiles/.Xdefaults ] && xrdb -merge ~/dotfiles/.Xdefaults
exec i3
