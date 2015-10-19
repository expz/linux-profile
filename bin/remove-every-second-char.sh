#!/bin/bash
# remove the first of every two characters. Useful if you've messed up a file by converting it to UTF-16 and then back to UTF-8
while read LINE
do
  editedline=''
  second=false;
  echo -n $LINE | \
  while read -n 1 c;
  do
    first=!($first)
    if $second ; do 
      editedline=$editedline + c
    done
  done
  echo $editedline
done < $1