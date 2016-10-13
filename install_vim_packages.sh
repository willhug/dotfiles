#!/bin/sh

# make the vim package directory if it doesn't exist
if [ ! -d ~/.vim ]; then
  mkdir ~/.vim
fi
if [ ! -d ~/.vim/bundle ]; then
  mkdir ~/.vim/bundle
fi

# clone the vundle package manager
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim +PluginInstall +qall
