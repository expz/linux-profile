#!/bin/sh
#
# Prerequisite
# 
#   cd ~
#   git clone --recursive https://expz@gitlab.com/expz/linux-profile .
#
# This script finishes installing vim after this recursive clone
#

ROOT_DIR="${0%/*}"

# create bin and tmp directories
mkdir -p ~/bin
mkdir -p ~/tmp

# copy bin and tmp 
cp -R "$ROOT_DIR"/bin/* ~/bin/
cp -R "$ROOT_DIR"/tmp/* ~/tmp/

# copy vim
cp -R "$ROOT_DIR"/.vim ~
cp -R "$ROOT_DIR"/.vundle ~
cp "$ROOT_DIR"/.vimrc ~

# copy bash profile, saving existing profile first
cp ~/.bashrc ~/.bashrc.old 
cp "$ROOT_DIR"/.bashrc ~

# install plugins using vundle
vim +BundleInstall +qall
