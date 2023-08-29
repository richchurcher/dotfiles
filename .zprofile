export XDG_BIN_HOME=$HOME/.local/bin
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_LIB_HOME=$HOME/.local/lib
export XDG_PICTURES_DIR=$HOME/pictures
export XDG_SCREENSHOTS_DIR=$HOME/pictures/screenshots

# Required for some Android Studio screns not to appear blank
export _JAVA_AWT_WM_NONREPARENTING=1

# Enforce RADV to stop default to AMDVLK: https://wiki.archlinux.org/title/Vulkan#Selecting_via_environment_variable
export AMD_VULKAN_ICD=RADV
export ANDROID_HOME=${XDG_LIB_HOME}/android-sdk
export BROWSER=google-chrome-stable
export CARGO_HOME=$XDG_DATA_HOME/cargo
export CHROME_EXECUTABLE=google-chrome-stable
export EDITOR=nvim
export FZF=$XDG_CONFIG_HOME/fzf
export FZF_DEFAULT_COMMAND='fd -t f -H -I -E "{.git,node_modules,tags,dist,target,.wine,__pypackages__,_tmp,_postgres/data,.dartServer,build}"'
# export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
#   --color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1
#   --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
#   --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
#   --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'
export GOPATH=$XDG_LIB_HOME/go
export JAVA_HOME=/opt/android-studio/jbr
export JQ_COLORS='0;37:0;37:0;37:0;37:0;32:0;37:0;37' 
export NVM_DIR=$XDG_CONFIG_HOME/nvm
export RTX_SHELL=zsh
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export TERMINAL=kitty
export ZSH=$XDG_CONFIG_HOME/zsh/oh-my-zsh

PATH=$CARGO_HOME/bin:$PATH
PATH=$XDG_BIN_HOME:$PATH
PATH=$FZF/bin:$PATH
PATH=/usr/local/texlive/2023/bin/x86_64-linux/:$PATH
PATH=/usr/local/go/bin:$PATH
PATH=$JAVA_HOME/bin:$PATH
PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/cmdline-tools/latest/bin:$PATH
PATH=$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/tools:$PATH
PATH=$GOPATH/bin:$PATH
export PATH
