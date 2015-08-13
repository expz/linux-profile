#!/bin/sh
#
# How to compile vim with all desired options
#
# Install prerequisites
#
#   sudo apt-get install lua5.2 liblua5.2-0 liblua5.2-dev perl libperl-dev python libpython-all-dev python3 libpython3-all-dev ruby ruby-dev libruby
#
# Worked for me with versions:
#
#   lua5.1 liblua5.1-0 liblua5.1-0-dev \
#   perl libperl5.18 libperl-dev \
#   python2.7 libpython2.7 libpython2.7-dev \
#   python3.4 libpython3.4 libpython3.4-dev \
#   ruby2.1 libruby2.1 ruby2.1-dev
#
# Install vim source
#
#   sudo apt-get install mercurial
#   cd ~/opt
#   hg clone https://vim.googlecode.com/hg/ vim
#   cd vim
#   hg pull
#   hg update
#   cd src
#   make distclean  # if you built vim before
#
# copy this file to the vim source directory and run:
#
#   cp ~/.vim/compile-options.sh .
#   chmod a+x compile-options.sh
#   ./compile-options.sh
#   make
#   sudo make install

# hangul input is not desirable -- it is a workaround when other input methods don't work


./configure \
  --with-features=huge \
  --enable-fail-if-missing \
  --enable-luainterp \
  --enable-perlinterp \
  --enable-pythoninterp \
  --enable-python3interp \
  --enable-rubyinterp \
  --enable-multibyte \
  --disable-xterm_clipboard

