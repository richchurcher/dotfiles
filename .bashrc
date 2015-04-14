export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export GOPATH="$HOME/work"
export PATH="$GOPATH/bin:$PATH"
eval "$(rbenv init -)"

export GIT_PS1_SHOWCOLORHINTS=true
source ~/.git-prompt.sh
#PS1='\e[33;1m\W\e[0m$( __git_ps1 " (\e[1;37m%s\e[0m)")\e[0m\$ '
PROMPT_COMMAND='__git_ps1 "\e[1;34m\W\e[0m" "\\\$ "'
