#!/bin/bash
############################
# This script installs external packages that we want to use
############################

# If brew is installed, use brew to install packages
if hash brew 2>/dev/null; then
  brew install fasd
fi
