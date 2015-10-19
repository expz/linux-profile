#!/bin/bash

function mem_per_user {

  # take username as only parameter
  local user=$1

  # get all pid's of a specific user
  # you may elaborate the if statement in awk obey your own rules
  pids=`ps aux | awk -v username=$user '{if ($1 == username) {print $2}}'`
  
  local totalmem=0

  for pid in $pids; do

    mem=`pmap $pid | tail -1 | \
         awk '{pos = match($2, /([0-9]*)K/, mem); if (pos > 0) print mem[1]}'`
    
    # when variable properly set
    if [ ! -z $mem ]; then
      totalmem=$(( totalmem + $mem))
    fi
  
  done

  echo $totalmem

}

total_mem=0
for username in `ps aux | awk '{ print $1 }' | tail -n +2 | sort | uniq`
do
  per_user_memory=0
  per_user_memory=$(mem_per_user $username)
  if [ "$per_user_memory" -gt 0 ]; then

    total_mem=$(( $total_mem + $per_user_memory))
    echo "$username: $per_user_memory KB"

  fi
done

echo "Total: $total_mem KB"
