function link_test() {
  [[ "$1" -ef "$2" ]] && echo "same file"
}

function link() {
  echo "Linking ${0} -> ${1}"
  #ln -sf ${2#$HOME/} ~/
}

function link_all() {
  local base backup_dir dest skip target

  if [[ "$1" == "config" ]]; then
    target="$HOME/.config";
  else
    target="$HOME";
  fi

  local files=($DOTFILES/link${1}/*)
  if (( ${#files[@]} == 0 )); then return; fi

  echo "Linking to ${1:-home}"
  for file in "${files[@]}"; do
    base="$(basename $file)"
    dest="$target/$base"

    skip="$("link_test" "$file" "$dest")"
    if [[ "$skip" ]]; then
      echo "Skipping $base, $skip."
      continue
    fi

    local backup_dir="$DOTFILES/backups/$(date "+%Y_%m_%d-%H_%M_%S")/"
    if [[ -e "$dest" ]]; then
      echo "Backing up $base."
      [[ -e "$backup_dir" ]] || mkdir -p "$backup_dir"
      mv "$dest" "$backup_dir"
    fi

    "link" "$base" "$file"
  done
}

