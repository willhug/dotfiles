#! /bin/sh
# Shared bash and ZSH commands for rust

# Setup rust executables
export PATH=$PATH:~/.cargo/bin

# Allow rusty-tags to be able to determine the location of the rust source
export RUST_SRC_PATH=~/.dotfile-packages/rust/rust-src/src
