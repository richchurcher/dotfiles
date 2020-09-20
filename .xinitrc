#!/bin/sh -e
[[ ~/.Xresources ]] && xrdb -merge ~/.Xresources 
setxkbmap -option compose:prsc
# Only required if dGPU is driving the display (for external monitor support)
xrandr --setprovideroutputsource modesetting NVIDIA-0; xrandr --auto
exec i3
