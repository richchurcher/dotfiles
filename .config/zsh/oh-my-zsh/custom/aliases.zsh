# Git
# alias gs='git status'
# alias gc='git checkout'
# alias gcb='git checkout -b'
# alias gm='git commit -m'
# alias gma='git commit -am'
# alias gp='git push'
# alias gl='git log'

# Network
alias ping8='ping 8.8.8.8'
alias myip='dig +short txt ch whoami.cloudflare @1.0.0.1'

# Vim
alias vim='nvim'
alias e='nvim'

# Display
alias home='xrandr --output eDP-1 --mode 2560x1440 --output DP-1-0 --mode 3840x2160 --left-of HDMI-1 --rate 60 --output HDMI-1 --mode 3840x2160 --rotate left --left-of eDP-1'
alias kvm='ddcutil setvcp 0x60 0x1b -d 1'

# Record
# (note literal quote syntax)
alias record=$'amixer set Capture 35% && \
  ffmpeg -s 1920x1080 \
  -f x11grab -thread_queue_size 512 -probesize 10MB -r 25 -i :0.0 \
  -f alsa -thread_queue_size 512 -ac 2 -i hw:0 \
  -preset ultrafast \'output.mkv\''

alias record-portrait=$'amixer set Capture 35% && \
  ffmpeg -s 2160x1920 \
  -f x11grab -thread_queue_size 512 -probesize 10MB -r 25 -i :0.0+3840 \
  -f alsa -thread_queue_size 512 -ac 2 -i hw:0 \
  -af "afftdn" \
  \'output.mkv\''

# With headset, landscape screen
# alias record4k=$'amixer set Capture 100% && \
#   ffmpeg -y \
#   -f alsa -thread_queue_size 512 -ac1 -i hw:1 \
#   -f x11grab -thread_queue_size 512 -probesize 10MB -framerate 30 -video_size 3840x2160 -i :0.0+0,0 \
#   -c:v libx264 -pix_fmt yuv420p -qp 0 \
#   -preset ultrafast \'output.mkv\''

# sqlite3
alias sqlite3='sqlite3 -init "${XDG_CONFIG_HOME}"/sqlite3/sqliterc'

# tmux
alias tmux='tmux -f "${XDG_CONFIG_HOME}"/tmux/tmux.conf'

# image optimisation
# https://www.smashingmagazine.com/2015/06/efficient-image-resizing-with-imagemagick/
smartresize() {
   mogrify -path $3 -filter Triangle -define filter:support=2 -thumbnail $2 -unsharp 0.25x0.08+8.3+0.045 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB $1
}

# volume
alias mute='amixer set Master 0'
alias unmute='amixer set Master 100%'

# docker compose
alias dc='docker compose'
alias dcu='dc up -d'
alias dcd='dc down'

# mail
alias mail=neomutt

# terraform
alias tf=terraform

# dynamo
alias dydev='aws2-wrap --profile dev dy'
alias dytest='aws2-wrap --profile test dy'
alias dyprod='aws2-wrap --profile prod dy'

# exa
alias ls='exa --long --icons --git --sort=modified --reverse'

# granted
alias assume="source assume"

# sensible block device list
alias lsblk='lsblk -fe 1,7'
