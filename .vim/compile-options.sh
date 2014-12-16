# copy this file to the vim source directory and run
# then execute
#   $ make
#   $ sudo make install

# hangul input is not required to input hangul -- it is a workaround when other input methods don't work

# requires
# sudo apt-get install lua5.1 liblua5.1-0 liblua5.1-0-dev perl libperl5.18 libperl-dev python2.7 libpython2.7 libpython2.7-dev python3.4 libpython3.4 libpython3.4-dev ruby2.1 libruby2.1 ruby2.1-dev


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
