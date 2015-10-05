#!/bin/bash
[[ -f ~/.Xdefaults ]] && xrdb -merge ~/.Xdefaults
exec urxvt
