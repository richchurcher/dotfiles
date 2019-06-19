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
alias ping8='ping 8.8.8.8'

# Vim
alias vim='nvim'
alias e='nvim'

# Display
alias dell='xrandr --output DP-0.2.8 --right-of DP-2'
alias portrait='xrandr --output DP-0 --mode 3840x2160 --rotate left --above DP-2'
alias landscape='xrandr --output DP-0.8 --mode 3840x2160 --right-of DP-2'
alias thinkpad='xrandr --output DP-2 --mode 1920x1080 --panning 1920x1080'
alias plandscape='xrandr --output DP-0.8 --mode 3840x2160 --above DP-2 --output DP-0.1 --mode 3840x2160 --rotate left --left-of DP-2'
alias home='xrandr --output DP-0.8 --mode 3840x2160 --left-of DP-0.1 --output DP-0.1 --mode 3840x2160 --rotate right --left-of DP-2' 
alias generator='xrandr --output DP-4 --mode 1920x1080 --left-of DP-2'

# Record
# (note literal quote syntax)
alias record=$'amixer set Capture 35% && \
  ffmpeg -s 1920x1080 \
  -f x11grab -thread_queue_size 512 -probesize 10MB -r 25 -i :0.0 \
  -f alsa -thread_queue_size 512 -ac 2 -i hw:0 \
  -preset ultrafast \'output.mkv\''

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

# places
alias apollo='cd /w/lic/apollo-ui && nvm use'
alias loffty='cd /w/loffty/ui && nvm use'
alias lapi='cd /w/loffty/api && nvm use'
alias lunchbunch='cd /w/lunchbunch/'

# docker-compose
alias dc='docker-compose'
alias dcf='dc -f dev/docker-compose.yml'
alias dcu='dcf run -d --service-ports -T --name loffty-api-dev-container api npm run api'
alias dcd='dcf down'
alias dcr='dcd && dcu'
alias dct='docker exec -it loffty-api-dev-container npm run test:watch'
alias dcc='docker exec -it loffty-api-dev-container bash'
alias dcdeploy='dcf run --rm --no-deps api npm run deploy:accp'
alias dldb='docker logs -f -t loffty-dynamodb'
alias dlapi='docker logs -f -t loffty-api-dev-container'
