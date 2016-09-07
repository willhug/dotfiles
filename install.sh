#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles
############################

########## Variables

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" # Gets the directory this script is stored in (with the other dotfiles)
olddir=~/dotfiles_backup  # old dotfiles backup directory
dotfiles="bash_profile gitconfig gitignore inputrc tmux.conf vim vimrc zshrc"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for dotfile in $dotfiles; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$dotfile $olddir/.$dotfile
    echo "Creating symlink to $dotfile in home directory."
    ln -s $dir/.$dotfile ~/.$dotfile
done
