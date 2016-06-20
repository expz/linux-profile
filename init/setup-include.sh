#!/bin/sh

function confirm_run() {
  read -p ":: $2 (y/n)? " -n 1 yn; echo
	case "$yn" in
		y|Y ) 
      if ! $1 ; then
        echo "::  failed: $2"
        echo ":: aborting!"
        echo
        exit -1
      else
        echo
      fi
      ;;
		* ) 
      echo ":: skipping..."
      echo
      ;;
	esac
}
