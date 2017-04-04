if [[ -d ~/.config/dotfiles ]]; then
  export DOTFILES="$HOME/.config/dotfiles";
else
  export DOTFILES="$HOME/.dotfiles";
fi

PATH="$DOTFILES/bin:$PATH"
export PATH

function src() {
  local file
  for file in $DOTFILES/lib/*; do
    source "$file"
  done
  for file in $DOTFILES/source/*; do
    source "$file"
  done
}

# Run dotfiles script, then source.
function dotfiles() {
  $DOTFILES/bin/dotfiles "$@" && src
}

src

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
