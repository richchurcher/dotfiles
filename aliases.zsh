# Git
# alias gs='git status'
# alias gc='git checkout'
# alias gcb='git checkout -b'
# alias gm='git commit -m'
# alias gma='git commit -am'
# alias gp='git push'
# alias gl='git log'

# Wifi
alias 2g='sudo netctl-auto switch-to home2g'
alias 5g='sudo netctl-auto switch-to home5g'
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
alias home='xrandr --output DP-0.8 --mode 3840x2160 --output DP-0.1 --mode 3840x2160 --rate 30 --rotate right --right-of DP-0.8 --output eDP-1-1 --mode 2560x1440 --right-of DP-0.1'
alias generator='xrandr --output DP-4 --mode 1920x1080 --left-of DP-2'

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

# places
alias hex='cd ~/w/hexjam/'
alias bsui='cd ~/w/bs/ui && nvm use'
alias bsapi='cd ~/w/bs/api && nvm use'
alias foo='cd ~/w/foo && nvm use'
alias aoc='cd ~/w/advent-of-code-2019'
alias blog='cd ~/w/blog'
alias vly='cd ~/w/vly2 && nvm use'
alias rt='cd ~/w/reno-tracker && nvm use && export AWS_PROFILE=renotracker'
alias ef:dp='cd ~/w/ef/eventfinda/docker-prototype && export AWS_PROFILE=eventfinda'
alias ef:e='cd ~/w/ef/ef-e2e && export AWS_PROFILE=eventfinda'
alias ef:t='cd ~/w/ef/ef-infrastructure && export AWS_PROFILE=eventfinda-terraform'

# docker-compose
alias dc='docker-compose'
alias dcu='dc up -d'
alias dcd='dc down'

# mail
alias notmuch='notmuch --config="${XDG_CONFIG_HOME}"/notmuch/config'
alias getmail='getmail -g "${XDG_CONFIG_HOME}"/getmail'
alias alot='alot -n "${XDG_CONFIG_HOME}"/notmuch/config'

# databases
alias bsdb='pgcli postgres://qstoolbox@localhost/qstoolbox_dev'
alias bsdb-prod='pgcli postgres://qstoolbox@pg-1688156c.field-7958.aivencloud.com:10412/qstoolbox?ssl=true'
alias rtdb='pgcli postgres://renotracker:renotracker@localhost/renotracker'

# terraform
alias tf=terraform

# eventfinda
alias efdc='dc -f ~/w/ef/eventfinda/docker-prototype/docker-compose.yml --env-file ~/w/ef/eventfinda/docker-prototype/.env'
alias efu='efdc up -d'
alias efd='efdc down'
alias efr='efdc restart'
alias efra='efdc up -d --no-deps --force-recreate apache-php'
alias efl='efdc logs -f'
alias efm='efdc exec database mysql'
