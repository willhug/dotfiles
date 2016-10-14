#!/bin/bash
############################
# This script installs external packages that we want to use
############################

# If brew is installed, use brew to install packages
if hash brew 2>/dev/null; then
  brew install fasd
fi

# Install rustc if not installed
if ! hash rustc 2>/dev/null; then
  # I'm the safest, I always run the safest things
  curl -sSf https://static.rust-lang.org/rustup.sh | sh
fi
