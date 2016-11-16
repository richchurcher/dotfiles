if [ -d "$HOME/work" ] ; then
  export GOPATH="$HOME/work"
  export PATH="$GOPATH/bin:$HOME/go/bin:$PATH"
fi
