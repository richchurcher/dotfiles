[[ $- != *i* ]] && return

[ -s "${HOME}/.bash_aliases" ] && \. "${HOME}/.bash_aliases"
[ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh"
[ -s "${NVM_DIR}/bash_completion" ] && \. "${NVM_DIR}/bash_completion"
[ -n "${PS1}" ] && [ -s ${BASE16_SHELL}/profile_helper.sh ] && eval "$(${BASE16_SHELL}/profile_helper.sh)"

# GIT_PROMPT_ONLY_IN_REPO=1
# GIT_PROMPT_THEME=Single_line_Solarized_Lamda
source "${XDG_CONFIG_HOME}/bash-git-prompt/gitprompt.sh"

set -o vi

# bow to muscle memory and use Ctrl-P (FZF) from terminal
bind -x '"\C-p":fe'

# fzf

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${XDG_CONFIG_HOME}/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "${XDG_CONFIG_HOME}/fzf/shell/key-bindings.bash"

#https://github.com/junegunn/fzf/wiki/Examples#opening-files
fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-nvim} "${files[@]}"
}

# fh - repeat history
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -r 's/ *[0-9]*\*? *//' | sed -r 's/\\/\\\\/g')
}

# fkill - kill process
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

# fbr - checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
fbr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# X
if [ $(tty) == "/dev/tty1" ]; then
  startx
  exit 0
fi

