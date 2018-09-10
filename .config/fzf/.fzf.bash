# Setup fzf
# ---------
if [[ ! "$PATH" == "*${XDG_CONFIG_HOME}/fzf/bin*" ]]; then
  export PATH="${PATH}:${XDG_CONFIG_HOME}/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${XDG_CONFIG_HOME}/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "${XDG_CONFIG_HOME}/fzf/shell/key-bindings.bash"

# Custom

#https://github.com/junegunn/fzf/wiki/Examples#opening-files
fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-nvim} "${files[@]}"
}
