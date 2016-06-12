export DOTFILES=~/.dotfiles
PATH="$DOTFILES/bin:$PATH"
export PATH

function src() {
  local file
  if [[ "$1" ]]; then
    source "$DOTFILES/source/$1.sh"
  else
    for file in $DOTFILES/source/*; do
      source "$file"
    done
  fi
}

# Run dotfiles script, then source.
function dotfiles() {
  $DOTFILES/bin/dotfiles "$@" && src
}

src
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export WTR_ACCESS_TOKEN=67f611660557d0753de95f99c6d735c6416f544c
