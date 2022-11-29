#!/bin/sh -e
[[ ~/.Xresources ]] && xrdb -merge ~/.Xresources 
setxkbmap -option compose:prsc
exec i3 --shmlog-size=26214400
