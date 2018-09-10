# Listin' stuff
alias ls='ls --color'
alias ll='ls -la'

# Proton VPN
alias vpn='sudo openvpn /etc/openvpn/client/protonvpn-ca4.conf'

# Git
alias gs='git status'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gm='git commit -m'
alias gma='git commit -am'
alias gp='git push'
alias gl='git log'

# Wifi
alias 2g='sudo netctl-auto switch-to 2g'
alias 5g='sudo netctl-auto switch-to 5g'
alias eda='sudo netctl-auto switch-to EDA-5G'
alias mobile='sudo netctl-auto switch-to mobile'

# Vim
alias vim='nvim'
alias e='nvim'

# Display
alias dell='xrandr --output DP-0.2.8 --right-of DP-2'
alias portrait='xrandr --output DP-0 --mode 3840x2160 --rotate left --above DP-2'
alias landscape='xrandr --output DP-0 --mode 3840x2160 --right-of DP-2'
alias thinkpad='xrandr --output DP-2 --mode 1920x1080 --panning 1920x1080'

# Record
# (note literal quote syntax)
alias record=$'ffmpeg -s 1920x1080 \
  -f x11grab -thread_queue_size 512 -probesize 10MB -r 25 -i :0.0 \
  -f alsa -thread_queue_size 512 -ac 2 -i hw:0 \
  -preset ultrafast \'output.mkv\''
