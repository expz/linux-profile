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

# paths relative to home directory
extrapath='
bin
opt/crfpp
opt/packer/bin
.local/bin
opt/scala-2.12/bin
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

# gcloud tool completions
source "$HOME/opt/google-cloud-sdk/completion.bash.inc"
source "$HOME/opt/google-cloud-sdk/path.bash.inc"

export VAGRANT_DEFAULT_PROVIDER=virtualbox

# Enable history saving between REPL sessions.
export PYTHON_STARTUP="$HOME/.pystartup"

# Enabel Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export ENVIRONMENT=development

# Add RVM to PATH for scripting and enable it to activate ruby
export PATH="$PATH:$HOME/.rvm/bin"
if test -f ~/.rvm/scripts/rvm; then
  # Must be run when not using a login shell.
  [ "$(type -t rvm)" = "function" ] || source ~/.rvm/scripts/rvm;
fi

#################################################

# If not running interactively, don't do anything else
[ -z "$PS1" ] && return

#################################################
# Nothing below this line is executed for non-interactive shell!!!

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

# make a password with the characters 0-9, a-f
mkpasshex() {
  xxd -p /dev/urandom | dd bs="$1" count=1 status=none | xargs echo;
}

# make a password with alphanumeric characters excluding easily confusable ones
mkpass() {
  base64 /dev/urandom | tr -d "/+1lIo0Oq" | dd bs="$1" count=1 status=none | xargs echo;
}

# encrypt a file and print to stdout
encrypt() {
  openssl enc -aes-256-cbc -salt -in "$1";
}

# decrypt a file and print to stdout
decrypt() {
  openssl enc -d -aes-256-cbc -in "$1";
}

# encrypt a file using SSH key as password
encrypt_ssh() {
  openssl enc -aes-256-cbc -salt -kfile ~/.ssh/id_rsa -in "$1";
}

# decrypt a file using SSH key as password
decrypt_ssh() {
   openssl enc -d -aes-256-cbc -salt -kfile ~/.ssh/id_rsa -in "$1";
 } 

expz_tensorflow() {
  docker run --rm -it --name tensorflow -p 8888:8888 -v `pwd`:/home/jovyan:z -v /home/user/nosync/data:/mnt:z expz/tensorflow-notebook
}

tensorflow() {
  docker run --rm -it --name tensorflow -p 8888:8888 -v `pwd`:/home/jovyan:z -v /home/user/nosync/data:/mnt:z jupyter/tensorflow-notebook:latest
  # docker run --rm -it --name tensorflow -p 8888:8888 -v `pwd`:/notebooks:z tensorflow/tensorflow:latest-py3
}

# Recursively lookup IPs for a domain. Example usage for Google Cloud servers:
#
#   iplookup _cloud-netblocks.googleusercontent.com | tr -s ' ' | sed -e 's/^[ ]\+//g' | tr ' ' '\n'
#
iplookup() {
  TXT="$(nslookup -q=TXT $1 8.8.8.8 | grep "$1" | sed -e 's/^[^"]*"\([^"]*\)".*/\1/g' -e 's/ip6:[^ ]*//g')"
  DNS="$(echo $TXT | grep -o 'include:[^ ]*' | sed -e 's/include://g')"
  echo $TXT | sed -e 's/v=spf1//g' -e 's/\?all//g' -e 's/ip4://g' -e 's/include:[^ ]*//g'
  if [ -n "$DNS" ]; then
    for dn in $DNS; do
      iplookup "$dn"
    done
  fi
}

#################################################
# Shell Options

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

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

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
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
else
  alias ls='ls -A --color=auto --group-directories-first'
fi

##################################################
# XWindows Options

# Remap caps lock to escape key
setxkbmap -option caps:escape

##################################################
# Bash Completion

# prerequisite for completions
. /etc/bash_completion

# kubectl completions
source "$HOME/.kube/completion.bash.inc"
