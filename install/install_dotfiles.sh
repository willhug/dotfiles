#!/bin/bash
############################
# install_dotfiles.sh
# This script creates symlinks from the home directory to any desired dotfiles
############################

########## VARIABLES ##########

# Gets the directory this script is stored in (with the other dotfiles)
dotfile_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd ../dotfiles && pwd )"

# old dotfiles backup directory
olddir=~/.dotfiles_backup

# list of files/folders to symlink in homedir
dotfiles="bash_profile bashrc gitconfig gitignore_global inputrc tmux.conf vimrc zshrc"

########## INSTALLATION ##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~/"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dotfile_dir directory"
cd $dotfile_dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for dotfile in $dotfiles; do
  echo "Moving any existing dotfiles from ~ to $olddir"
  mv ~/.$dotfile $olddir/.$dotfile
  echo "Creating symlink to $dotfile in home directory."
  ln -s $dotfile_dir/$dotfile ~/.$dotfile
done
