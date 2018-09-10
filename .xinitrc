#!/bin/sh -e
[[ ~/.Xresrouces ]] && xrdb -merge ~/.Xresources 
setxkbmap -option compose:prsc
exec i3
