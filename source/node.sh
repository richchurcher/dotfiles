# No node for Cygwin
if is_cygwin ; then 
  return 1 
else

  if [ ! -f "$HOME/.nvm/nvm.sh" ]; then
    git clone https://github.com/creationix/nvm.git "$HOME/.nvm"
    ( cd "$HOME/.nvm" ; git checkout `git describe --abbrev=0 --tags` )
  fi

  export NVM_DIR="$HOME/.nvm"
  . "$NVM_DIR/nvm.sh"

fi

# Global npm modules to install.
npm_globals=(
  babel
  bower
  gulp
  http-server
)

# Update npm and install global modules.
function npm_install() {
  local installed modules
  e_header "Updating npm"
  npm update -g npm
  { pushd "$(npm config get prefix)/lib/node_modules"; installed=(*); popd; } >/dev/null
  modules=($(setdiff "${npm_globals[*]}" "${installed[*]}"))
  if (( ${#modules[@]} > 0 )); then
    e_header "Installing Npm modules: ${modules[*]}"
    npm install -g "${modules[@]}"
  fi
}

