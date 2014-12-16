#!/sbin/bash
#
# Must be run as root
#
# Prerequisite
# 
#   cd ~
#   git clone --recursive https://expz@gitlab.com/expz/linux-profile .
#
# This script finishes installing vim after this recursive clone
#

#create backup directories
su user <<EOF
mkdir -p ~/temp/vim/undo
mkdir -p ~/temp/vim/backup
mkdir -p ~/temp/vim/swap
vim +BundleInstall +qall
EOF

#add the Mono Project GPG signing key as trusted
apt-key adv --keyserver pgp.mit.edu --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

#add their pacages repository to apt sources
echo "deb http://download.mono-project.com/repo/debian wheezy main" > /etc/apt/sources.list.d/mono-xamarin.list

#refresh package list
apt-get update

#install newer mono & friends
apt-get install mono-devel

su user <<EOF
cd ~/.vim/bundles/YouCompleteMe
./install.sh --clang-completer --omnisharp-completer
EOF

