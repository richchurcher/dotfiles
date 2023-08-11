zshaddhistory() {
  if [[ $1 =~ ^(..|ls|lsa|fe|fcd)$'\n' ]]; then
    fc -p
    return 1
  fi
}

bindkey -s '^P' 'fe\n'
bindkey -s '^O' 'fcd\n'
