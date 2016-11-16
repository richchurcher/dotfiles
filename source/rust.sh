if [ -d "$HOME/.cargo" ] ; then
  export PATH="$PATH:$HOME/.cargo/bin"
fi

if [ -d "$HOME/.multirust/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src" ] ; then
  export RUST_SRC_PATH="$HOME/.multirust/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
fi
