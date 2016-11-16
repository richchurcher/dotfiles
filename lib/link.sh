function link_test() {
  [[ "$1" -ef "$2" ]] && echo "same file"
}

function link() {
  echo " : ${3}/${1} -> ${2}"
  #ln -sf ${2} ${3}
}

function backup() {
  [[ -e "$1" ]] || mkdir -p "$1"
  echo " : ${2} backed up"
  #mv "$3" "$1"
}

function link_all() {
  local base backup_dir dest skip target
  local backup_dir="$DOTFILES/backups/$(date "+%Y_%m_%d-%H_%M_%S")/"

  if [[ "$1" = "config" ]]; then
    target="$HOME/.config"
  else
    target="$HOME"
  fi

  local files=($DOTFILES/link${1}/*)
  if (( ${#files[@]} == 0 )); then return; fi

  for file in "${files[@]}"; do
    base="$(basename $file)"
    dest="$target/$base"

    skip="$("link_test" "$file" "$dest")"
    if [[ "$skip" ]]; then
      echo "Skipping $base, $skip."
      continue
    fi

    if [[ -e "$dest" ]]; then
      "backup" "$backup_dir" "$base" "$dest"
    fi

    "link" "$base" "$file" "$target"
  done
}

