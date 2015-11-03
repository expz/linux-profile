#!/bin/bash
#
# This file should be in a *recursive* clone of the git repo:
# 
#   git clone --recursive https://github.com/expz/linux-profile.git
#
# This script installs the linux profile into the current user's home directory.
#

ROOT_DIR="${0%/*}"
HOME_DIR=$(cd ~; pwd)

# cp -b --suffix didn't work with directories, so make this function
function save_original() {
  if [ -e "$1" ]; then
    mv "$1" "$1"-replaced-$(date +%Y-%m-%d-%H-%M-%S)
  fi
}

# could make rm -i confirm deletion of *every* file, 
# but not just top-level folders
function delete_originals() {
  for fn in $(find "$1" -maxdepth 1 -name '*-replaced-*'); do
    read -p "delete '$fn' (y/n)? " -n 1 yn; echo
    case "$yn" in
      y|Y ) rm -rf "$fn";;
      * ) ;;
    esac
  done
}

function safe_copy() {
  save_original "$2"/"$1"
  cp -R "$ROOT_DIR"/"$1" "$2"
}


INSTALL=true
CLEAN=false

case "$1" in
  '--clean')
    CLEAN=true
    ;;
  '--only-clean')
    INSTALL=false
    CLEAN=true
    ;;
  '--help')
    INSTALL=false
    CLEAN=false
    printf "installs profile and saves existing files to backups copies in the same
directory with the suffix '-replaced-[DATE]'.

If there are errors, make sure you executed a recursive clone of the git repo:

  git clone --recursive https://github.com/expz/linux-profile.git
  (or retroactively: git submodule update --init --recursive)

usage: install.sh [--clean|--only-clean|--help]

--clean       install and delete backup copies
--only-clean  only delete backup copies (confirm each deletion)
--help        display this message
"
    exit 0 
    ;;
esac

if "$INSTALL"; then
  # create bin and tmp directories
  mkdir -p ~/bin
  mkdir -p ~/tmp/vim/{backup,swap,undo}
  chmod -R 700 ~/tmp/vim

  # copy bin without overwriting
  cp -nR "$ROOT_DIR"/bin/* ~/bin/

  # copy vim plugins and settings
  safe_copy '.vim' "$HOME_DIR"
  safe_copy '.vundle' "$HOME_DIR"
  safe_copy '.vimrc' "$HOME_DIR"

  # copy bashrc
  safe_copy '.bashrc' "$HOME_DIR"

  # install plugins using vundle
  vim +BundleInstall +qall
fi

if "$CLEAN"; then
  delete_originals "$HOME_DIR"
fi
