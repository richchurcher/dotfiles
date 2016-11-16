if [ -d "$HOME/work/go_appengine" ] ; then
  export PATH="$HOME/work/go_appengine:$PATH"
fi

if [ -d "$HOME/google_appengine" ] ; then
  export PYTHONPATH="$HOME/google_appengine:$PATH"
  export PATH="$HOME/google_appengine:$PATH"
fi

# For reference:
# if [ -d "$HOME/google_appengine" ] ; then
#   case "$PATH" in
#     *google_appengine*)
#       ;;
#     *)
#       export PYTHONPATH="$HOME/google_appengine:$PATH"
#       export PATH="$HOME/google_appengine:$PATH"
#       ;;
#   esac
# fi

