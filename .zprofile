export XDG_BIN_HOME=$HOME/.local/bin
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_LIB_HOME=$HOME/.local/lib
export XDG_PICTURES_DIR=$HOME
export XDG_SCREENSHOTS_DIR=$HOME

export ANDROID_HOME=/opt/android-sdk
export BROWSER=google-chrome-unstable
export CARGO_HOME=$HOME/.cargo
export CHROME_EXECUTABLE=google-chrome-unstable
export EDITOR=nvim
export FZF=$XDG_CONFIG_HOME/fzf
export FZF_DEFAULT_COMMAND='rg --column --files --line-number --no-heading --color=never --smart-case --hidden --no-ignore --glob "!{.git,node_modules,tags,package-lock.json,yarn.lock,coverage,dist,.aws-sam,.wine,__pypackages__,cdk.out}"'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1
  --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
  --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
  --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'
export GOPATH=$XDG_LIB_HOME/go
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
export LOCAL_BIN=$HOME/.local/bin
export NVM_DIR=$XDG_CONFIG_HOME/nvm
export PYTHONPATH=$HOME/.local/pipx/venvs/pdm/lib/python3.10/site-packages/pdm/pep582
export STEAM_SDK_LOCATION=/opt/steamworks-sdk
export TERMINAL=kitty
export ZSH=$XDG_CONFIG_HOME/zsh/oh-my-zsh

PATH=$CARGO_HOME/bin:$PATH
PATH=$XDG_BIN_HOME:$PATH
PATH=$FZF/bin:$PATH
PATH=/usr/local/go/bin:$PATH
PATH=$JAVA_HOME/bin:$PATH
PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH
PATH=$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/tools:$PATH
PATH=$GOPATH/bin:$PATH
export PATH
