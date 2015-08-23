case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias studio='studio.sh'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export GOPATH=$HOME/work
export JAVA_HOME=$HOME/work/jdk1.8.0_45
export PATH="$HOME/bin:$HOME/go/bin:$HOME/.rbenv/bin:$GOPATH/bin:$HOME/work/go_appengine:$HOME/google_appengine:$HOME/work/android-studio/bin:$PATH"
eval "$(rbenv init -)"
export NODE_ENV=development
export PYTHONPATH=$HOME/google_appengine

source ~/dotfiles/scripts/git-completion.bash
export GIT_PS1_SHOWCOLORHINTS=true
source ~/dotfiles/scripts/.git-prompt.sh
PROMPT_COMMAND='__git_ps1 "\[\e[1;34m\]\W\[\e[0m\]" "\$ "'

export NVM_DIR="/home/basie/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# The next line updates PATH for the Google Cloud SDK.
source '/home/basie/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/home/basie/google-cloud-sdk/completion.bash.inc'
