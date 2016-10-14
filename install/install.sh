#!/bin/bash
############################
# install.sh
# This script runs aaaaaall the install scripts for setting up my dev env
############################

# Gets the directory this script is stored in (with the other scripts)
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $dir/install_dotfiles.sh
source $dir/install_packages.sh
source $dir/install_vim_packages.sh
