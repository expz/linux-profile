#
# ~/.bashrc: executed by bash(1) for non-login shells.
#
# Called by ~/.profile when the bash version environment variable exists
#
# Author: Jonathan Skowera
#
# Currenty configured with JAVA_HOME for Oracle JDK 7
#

##################################################
# Environment Variables

extrapath='
bin
opt/packer/bin
'

for dn in $extrapath; do
  if [ -e "$HOME/$dn" ]; then
    export PATH="$PATH:$HOME/$dn"
  fi
done

extrasource='
'

for fn in $extrasource; do
  if [ -e "$HOME/$fn" ]; then
    source "$HOME/$fn"
  fi
done

#export GOPATH=$HOME/src/gocode

#export JAVA_HOME=/usr/lib/jvm/oracle-jdk1.7.0_67

export VAGRANT_DEFAULT_PROVIDER=virtualbox

#################################################

# If not running interactively, don't do anything else
[ -z "$PS1" ] && return

#################################################
# Nothing below executed for non-interactive prompts!!!

# search online cmdfu shell command repository
cmdfu() {
  searchstr=$(echo -n "$@" | sed 's/ /-/g')
  searchstr64=$(echo -n "$@" | base64)
  searchurl="www.commandlinefu.com/commands/matching"
  curl --silent \
    "http://$searchurl/$searchstr/$searchstr64/plaintext" \
    | sed -u 's/^\(#.*\)$/\o033[32;1m\1\o033[0m/g' \
    | less -r -X
}

# sync $1 to $2 using ssh and compression preserving file attributes
ssync() {
  rsync -avz -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" --progress "$1" "$2"
}

# get the absolute path of a file or directory
absolute_path() {
  if [ -d "$@" ]; then
    echo $(cd "$@" && pwd -P)
  else
    echo $(cd $(dirname "$@") && pwd -P)/$(basename "$@")
  fi
}

# escape a string so it will be treated as a literal in a regex
# http://stackoverflow.com/a/2705678/120999
unregex() {
  sed -e 's/[]\/()$*.^|[]/\\&/g' <<< "$1"
}

# make a password with 20 alphanumeric characters excluding A, B, C, x, y and z:
#   mkpassa 20 'ABCxyz'
mkpassa() {
  base64 /dev/urandom | tr -d "/+$2" | dd bs="$1" count=1 status=none | xargs echo;
}

# make a password with 20 characters 0-9, a-f:
#   mkpassb 20
mkpassb() {
  xxd -p /dev/urandom | dd bs="$1" count=1 status=none | xargs echo;
}

# make a password with 20 alphanumeric characters excluding easily confusable ones:
mkpassc() {
  base64 /dev/urandom | tr -d "/+1lIo0Oq" | dd bs="$1" count=1 status=none | xargs echo;
}

# encrypt a file and print to stdout
encrypt() {
  openssl enc -e -aes-256-cbc -in "$1" -out -;
}

# decrypt a file and print to stdout
decrypt() {
  openssl enc -d -aes-256-cbc -d -in "$1" -out -;
}

#################################################
# Shell Options

# Stop less from clearing screen after quitting
# WARNING: This breaks color coding
# export LESS=X

# Set prompt
#  \e[0m anywhere => Makes the newline not work
PS1="\u@\h:\w > "

# Set vim as default command line editor
# Edit a command line by pressing CTRL+x CTRL+e
VISUAL=/usr/bin/vim

# Make the * match hidden files
shopt -s dotglob

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

########## History

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=100000

##################################################
# Command: less

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

##################################################
# Command: ls, grep, apt-get install

# Colors
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls -A --color=auto --group-directories-first'
  alias lss='(export LC_ALL="C"; ls -A --color=auto --group-directories-first)'
  alias lst='(export LC_ALL="C"; ls -Aal --color=auto --group-directories-first)'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# Aliases
alias ll='ls -AlF'
alias la='ls -A'
alias ii='sudo apt-get install'

##################################################
# XWindows Options

# Remap caps lock to escape key
setxkbmap -option caps:escape

# Remap CAPS_LOCK to SUPER (Mac/Windows Key)
# WARNING: This changes the XWindows key mapping in all applications
#cat | xmodmap - <<DELIM
#remove Lock = Caps_Lock
#remove mod3 = Super_L
#keysym 0x42 = Super_L
#add mod3 = Super_L
#DELIM

#xmodmap -e "clear Lock" -e "keycode 0x42 = Super_L"

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;\u@\h:\w\]"
#    ;;
#*)
#    ;;
#esac

