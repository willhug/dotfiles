#!/bin/bash
############################
# This script installs all the requirements for developing in rust
############################

############## RUST CORE ##############
# Install rustc if not installed
if ! hash rustc 2>/dev/null; then
  echo "Installing rust"
  # I'm the safest, I always run the safest things
  curl -sSf https://static.rust-lang.org/rustup.sh | sh
  echo "Done installing rust"
fi

# If cargo is not installed panic! we should have just installed it
if ! hash cargo 2>/dev/null; then
  echo "ERROR! Cargo is not installed"
  exit 1
fi

############## RUST VIM CTAGS ##############

# Install rusty-tags for generating ctags for editing rust files
if ! hash rusty-tags 2>/dev/null && [ ! -e ~/.cargo/bin/rusty-tags ]; then
  echo "Installing Rusty-tags"
  cargo install rusty-tags
  echo "done installing rusty-tags"
fi

# Create a directory for storing extra rust download information
mkdir -p ~/.dotfile-packages/rust

# Install the rust src so we can go to function definitions in the rust source
if [ ! -d ~/.dotfile-packages/rust/rust-src ]; then
  echo "Downloading rust source code"
  git clone https://github.com/rust-lang/rust.git -b stable ~/.dotfile-packages/rust/rust-src
  echo "Finished downloading rust source code"
fi

############## RUST DOTFILES ##############

# Get the dir where this script is located (for symlinking files)
rust_pkg_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install bash & zsh setup scripts (packages in shellrcs are automatically run)
mkdir -p ~/.dotfile-packages/shellrcs
ln -f -s $rust_pkg_dir/rust.sh ~/.dotfile-packages/shellrcs/rust.sh

# Install rust vim configuration
mkdir -p ~/.vim/after/ftplugin
ln -f -s $rust_pkg_dir/rust.vim ~/.vim/after/ftplugin/rust.vim
