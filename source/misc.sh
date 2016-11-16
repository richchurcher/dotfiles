function titlebar() {
  echo -n $'\e]0;'"$*"$'\a'
}

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -d "$HOME/bin" ] ; then
  export PATH="$PATH:$HOME/bin"
fi

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-solarized.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Waffler
export WTR_ACCESS_TOKEN=34425b42b07f802b25c6d920753c1859f1b88a4a

