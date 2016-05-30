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
export WTR_ACCESS_TOKEN=b4c52c445d63581d3d9a49c5cc6e869de46e6f8e 
