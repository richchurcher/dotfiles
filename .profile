export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"

export ANDROID_HOME="${XDG_DATA_HOME}/android/sdk"
export BASE16_SHELL="${XDG_CONFIG_HOME}/base16-shell/"
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden --no-ignore --glob "!{.git,node_modules,tags}"'
export NVM_DIR="${XDG_CONFIG_HOME}/nvm"

PATH="${HOME}/bin:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/emulator:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${HOME}/.cargo/bin:${PATH}"
