[[ $- != *i* ]] && return

[ -s "${HOME}/.bash_aliases" ] && \. "${HOME}/.bash_aliases"
[ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh"
[ -s "${NVM_DIR}/bash_completion" ] && \. "${NVM_DIR}/bash_completion"
[ -f "${XDG_CONFIG_HOME}/fzf/.fzf.bash" ] && source "${XDG_CONFIG_HOME}/fzf/.fzf.bash"
[ -n "${PS1}" ] && [ -s ${BASE16_SHELL}/profile_helper.sh ] && eval "$(${BASE16_SHELL}/profile_helper.sh)"

# GIT_PROMPT_ONLY_IN_REPO=1
# GIT_PROMPT_THEME=Single_line_Solarized_Lamda
source "${XDG_CONFIG_HOME}/bash-git-prompt/gitprompt.sh"

set -o vi

if [ $(tty) == "/dev/tty1" ]; then
  startx
  exit 0
fi

