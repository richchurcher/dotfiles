if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias maxvm='xrandr --output VGA-1 --mode 1366x768'
alias mute='amixer -q -D pulse sset Master 0%'
alias vim='nvim'
alias volhalf='amixer -q -D pulse sset Master 50%'
alias volfull='amixer -q -D pulse sset Master 100%'
alias netctl="sudo netctl"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

