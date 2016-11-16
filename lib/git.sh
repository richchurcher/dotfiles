function git_in_path() {
  return [[ "$(type -P foo)" ]]
}

# Clone
if [[ ! -d $DOTFILES ]]; then
  new_dotfiles_install=1
  prompt_delay=15
  e_header "Downloading dotfiles"
  git clone https://github.com/${github_user:-richchurcher}/dotfiles.git $DOTFILES
  cd $DOTFILES
elif [[ "$1" != "restart" ]]; then
  # Make sure we have the latest files.
  e_header "Updating dotfiles"
  cd $DOTFILES
  prev_head="$(git rev-parse HEAD)"
  git pull
  if [[ "$(git rev-parse HEAD)" != "$prev_head" ]]; then
    e_header "Changes detected, restarting script"
    exec "$0" "restart"
  fi
fi

