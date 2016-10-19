#!/bin/bash
############################
# This script installs all the requirements for developing in go
############################

############## GO CORE ##############
# Install go if not installed
if ! hash go 2>/dev/null; then
  echo "Installing go"
  # I'm the safest, I always run the safest things
  brew install go
  echo "Done installing go"
fi

############## GO DOTFILES ##############

# Get the dir where this script is located (for symlinking files)
go_pkg_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install bash & zsh setup scripts (packages in shellrcs are automatically run)
mkdir -p ~/.dotfile-packages/shellrcs
ln -f -s $go_pkg_dir/go.sh ~/.dotfile-packages/shellrcs/go.sh
