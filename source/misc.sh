function titlebar() {
  echo -n $'\e]0;'"$*"$'\a'
}

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -d "$HOME/bin" ] ; then
  export PATH="$PATH:$HOME/bin"
fi

# Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/base16-solarized.dark.sh"
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# Waffler
export WTR_ACCESS_TOKEN=34425b42b07f802b25c6d920753c1859f1b88a4a

