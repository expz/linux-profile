#!/bin/sh
#
# Created: 2014-12-03
#

if [ $# -eq 0 ]; then
  filenames='/dev/stdin'
else
  filenames="$@"
fi

cat $filenames \
| tr -dc '[:print:]\n' \
| sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"
