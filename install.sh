#!/bin/sh
#
# Prerequisite
# 
#   cd ~
#   git clone --recursive https://expz@gitlab.com/expz/linux-profile .
#
# This script finishes installing vim after this recursive clone
#

cd ~

# create bin and tmp directories
mkdir -p ~/bin
mkdir -p ~/tmp

# copy bin and tmp 
cp -R linux-profile/bin/* ~/bin/
cp -R linux-profile/tmp/* ~/tmp/

# copy vim
cp -R linux-profile/.vim ~
cp -R linux-profile/.vundle ~
cp linux-profile/.vimrc ~

# copy bash profile, saving existing profile first
cp ~/.bashrc ~/.bashrc.old 
cp linux-profile/.bashrc ~

# install plugins using vundle
vim +BundleInstall +qall
